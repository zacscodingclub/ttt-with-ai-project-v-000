class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts div_line
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts div_line
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def div_line
    "-----------"
  end

  def position(index)
    @cells[index.to_i - 1]
  end

  def full?
    @cells.all? { |cell| cell != " "}
  end

  def taken?(index)
    @cells[index.to_i - 1 ] == " " ? false : true
  end

  def valid_move?(index)
    index.to_i.between?(1,9) && !taken?(index)
  end

  def empty_cell_count
    10 - turn_count
  end

  def turn_count
    @cells.count { |cell| cell != " " }
  end

  def update(index, player)
    @cells[index.to_i - 1] = player.token
  end
end