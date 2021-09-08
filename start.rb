if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts 'Здраствуйте, эта программа разработана для рандомзации пар среди группы людей'
puts 'Введите колличество людей'

number_of_members = gets.chomp.to_i
base_members_number = number_of_members
members = []
next_number = 1

while next_number != number_of_members + 1
  members.push(next_number)
  next_number += 1
end

def pair_randomize(members, number_of_members)
  used_members = []
  while members.length != 0
    first_member = rand(number_of_members) + 1
    second_member = rand(number_of_members) + 1
    until first_member == second_member or used_members.include?(first_member) or used_members.include?(second_member)
      members.delete(first_member)
      members.delete(second_member)
      used_members.push(first_member)
      used_members.push(second_member)
      puts "#{first_member} и #{second_member} будут в паре"
    end
    break if members.length == 1
  end
  if members.empty?
    abort
  else
    puts "А #{members[0]} будет один :("
  end
end

pair_randomize(members, base_members_number)