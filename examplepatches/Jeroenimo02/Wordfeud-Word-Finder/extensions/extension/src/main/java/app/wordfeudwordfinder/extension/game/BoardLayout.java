package app.wordfeudwordfinder.extension.game;

public final class BoardLayout {
    private final int id;
    private final int[][] squares;

    /** squares[y][x] in 0..4. */
    public BoardLayout(int id, int[][] squares) {
        this.id = id;
        int[][] copy = new int[squares.length][];
        for (int y = 0; y < squares.length; y++) {
            copy[y] = squares[y].clone();
        }
        this.squares = copy;
    }

    public int getId() { return id; }

    /** Returns a copy of the grid, indexed [y][x]. */
    public int[][] getSquares() {
        int[][] copy = new int[squares.length][];
        for (int y = 0; y < squares.length; y++) {
            copy[y] = squares[y].clone();
        }
        return copy;
    }
}
