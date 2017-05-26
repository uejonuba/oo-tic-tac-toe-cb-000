class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],

    [0,3,6],
    [1,4,7],
    [2,5,8],

    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    return index.to_i - 1
  end

  def move(index, player)
    @board[index] = player if @board[index] == " "
  end

  def position_taken?(index)
    return @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    result = false
    result = true if !position_taken?(index) &&  index.between?(0,8)
    return result
  end

  def turn_count
    return @board.count{ |i| (i == "X" || i == "O") }
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    input_char = gets.strip
    input_char = input_to_index(input_char)
    if valid_move?(input_char)
      move(input_char,current_player)
      display_board
    else
      puts "invalid"
      turn
    end
  end

  def won?
    for combo in WIN_COMBINATIONS
      winspot1 = @board[combo[0]]
      winspot2 = @board[combo[1]]
      winspot3 = @board[combo[2]]

      checkX = winspot1 == "X" && winspot2 == "X" && winspot3 == "X"
      checkO = winspot1 == "O" && winspot2 == "O" && winspot3 == "O"


      return combo if checkX || checkO
    end
    return false
  end

  def full?
    return turn_count > 8
  end

  def draw?
    result = false
    result = true if full? && !won?
    return result
  end

  def over?
    return (full? || draw? || won?)
  end

  def winner
    result = nil
    unless won? == false
      result = @board[won?[0]]
    end
    return result
  end


  def play
    puts "Please enter a number 1-9"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


#END OF CLASS
end
