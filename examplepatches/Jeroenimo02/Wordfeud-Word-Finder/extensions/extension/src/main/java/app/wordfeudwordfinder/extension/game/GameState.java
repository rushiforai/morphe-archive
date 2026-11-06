package app.wordfeudwordfinder.extension.game;

import app.wordfeudwordfinder.extension.core.WfError;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Reconstructed state of one game (spec section 5). Board is indexed [y][x]; '\0' is an empty square. */
public final class GameState {
    public static final int SIZE = 15;

    private final long gameId;
    private final char[][] board;
    private final List<String> rack;
    private final boolean myTurn;
    private final boolean ended;
    private final WfError unreadable;
    private final List<String> playedWords;

    public GameState(long gameId, char[][] board, List<String> rack, boolean myTurn, boolean ended,
                     WfError unreadable) {
        this(gameId, board, rack, myTurn, ended, unreadable, Collections.<String>emptyList());
    }

    public GameState(long gameId, char[][] board, List<String> rack, boolean myTurn, boolean ended,
                     WfError unreadable, List<String> playedWords) {
        this.gameId = gameId;
        this.playedWords = Collections.unmodifiableList(new ArrayList<>(playedWords));
        this.board = copy(board);
        this.rack = Collections.unmodifiableList(new ArrayList<>(rack));
        this.myTurn = myTurn;
        this.ended = ended;
        this.unreadable = unreadable;
    }

    public long gameId() { return gameId; }

    /** Returns a copy of the board, indexed [y][x]. */
    public char[][] board() { return copy(board); }

    public List<String> rack() { return rack; }
    public boolean myTurn() { return myTurn; }
    public boolean ended() { return ended; }

    /**
     * Every word formed by the moves in the game log (main and cross words, 2+ letters, upper case, blanks as
     * their letter, no duplicates, in order of play). The server accepted them all, so they are valid words.
     */
    public List<String> playedWords() { return playedWords; }

    /** Null when the game could be reconstructed. */
    public WfError unreadable() { return unreadable; }

    private static char[][] copy(char[][] b) {
        char[][] c = new char[b.length][];
        for (int y = 0; y < b.length; y++) c[y] = b[y].clone();
        return c;
    }
}
