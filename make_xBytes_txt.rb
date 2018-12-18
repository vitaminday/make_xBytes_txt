#!/usr/bin/ruby

#DESCRIPTION:

#This script is designed to create multilingual text files 
#that help in testing and developing some programs.
#Create a file of the required size, including line completion characters,
#based on an arbitrary user-defined text string.


#Reference Information:
# 1MiB (mebibyte) = 1024KiB (kibibyte) = 1048576 bytes
# 1MB  (megabyte) = 1000KB  (kilobyte) = 1000000 bytes

#==================================================================

# YOU CAN SET UP TARGET PARAMETERS IN THIS BLOCK >>>


#Set file size in bytes here:
goal_file_length_bytes = 10000

#Select or set target file directory
#file_folder = "" #Current directory
#file_folder = "./" #Current Ruby working directory (for example: C:/Users/iUser/)
file_folder = "d:/work/textcleaner/" #User directory


#Set file name
#For example: Name_ + FILESIZE + bytes.txt
file_name = "subtitle_" + "#{goal_file_length_bytes}" + "bytes.txt"

#Select or set your own text string to fill

#Multilingual exemples:
#text_str = "My super cool text line!"
#text_str = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
#text_str = "Test test test test test test. Test test test test test test? Test test test test test test! Test test test test test test"
text_str = "Люблю грозу в начале мая, когда весенний, первый гром, как бы резвяся и играя, грохочет в небе голубом. (Фёдор Тютчев)"

#SET RARAMETERS:
extra_char_symb = "\r" #Set wildcard character
encoding_setup = "UTF-8" #Set multilingual encoding type

#===================================================================


#Set variables:
text = "".encode(encoding_setup) #Setup empty string
text_str_n = text_str + "\n" #Add line ending
text_str_enc = text_str_n.encode(encoding_setup) #Encoding text string
file_name_absolute = file_folder + file_name #Setup file name
extra_char_symb_enc = extra_char_symb.encode(encoding_setup)
text_str_end_enc = "".encode(encoding_setup)

#Calculate text line size in bytes + one byte for "\n"-symbol
text_str_length_bytes = text_str_enc.bytesize + 1

#Calculate multiplier
multiplier = goal_file_length_bytes / text_str_length_bytes
multiplier = multiplier.to_i

#Prepare the text
multiplier.times do
	text = text + text_str_enc
end

#Calculate the number of extra characters
extra_char = goal_file_length_bytes - (multiplier * text_str_length_bytes)

extra_char.times do #Prepare the extra symbols line
	text_str_end_enc = text_str_end_enc + extra_char_symb_enc
end

#Warning: additional characters must be added before the main text!
text = text_str_end_enc + text

#Write txt file
File.open(file_name_absolute,"w") do |file|
file.puts text
end

#Check file size
len = File.new(file_name_absolute).size 


#DEBUG INFORMATION:

#Print final text
# WARNING!
#Enable / disable - optional:
#puts "text = \n", text

#Print debug information
print " \n"
print "Created file: ", file_name
print "\n\nINFO:"
print "\nFile size: ", len, " bytes."
print "\nNumber of extra characters: ", extra_char
print "\nLength of the text line to fill: ", text_str_length_bytes, " bytes."
print "\nNumber of lines: ", multiplier, " + 1\n"