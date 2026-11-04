package app.wordfeudwordfinder.extension.solver;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** One legal move with its score (spec section 7). Coordinates: x = column, y = row. */
public final class Move {
    /** Main word, in dictionary (upper-case) letters. */
    public final String word;
    /** Square of the first letter of the main word (may be an existing board tile). */
    public final int x;
    public final int y;
    public final boolean horizontal;
    /** {x, y} of each newly placed tile, in word order. */
    public final List<int[]> placed;
    /** Letter of each newly placed tile, parallel to {@link #placed}; a blank is its letter in lower case. */
    public final List<String> placedLetters;
    public final int score;
    /** Every word formed: the main word first, then the cross words in word order. */
    public final List<String> allWords;
    /** "TYPE:letter" for each new tile on a bonus square, e.g. "DL:W". */
    public final List<String> bonuses;
    /** True when the main word contains at least one tile that was already on the board. */
    public final boolean usesBoardLetter;

    public Move(String word, int x, int y, boolean horizontal, List<int[]> placed, List<String> placedLetters,
                int score, List<String> allWords, List<String> bonuses, boolean usesBoardLetter) {
        this.word = word;
        this.x = x;
        this.y = y;
        this.horizontal = horizontal;
        List<int[]> p = new ArrayList<>(placed.size());
        for (int[] xy : placed) p.add(new int[] {xy[0], xy[1]});
        this.placed = Collections.unmodifiableList(p);
        this.placedLetters = Collections.unmodifiableList(new ArrayList<>(placedLetters));
        this.score = score;
        this.allWords = Collections.unmodifiableList(new ArrayList<>(allWords));
        this.bonuses = Collections.unmodifiableList(new ArrayList<>(bonuses));
        this.usesBoardLetter = usesBoardLetter;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(word).append(" (").append(x).append(',').append(y).append(") ")
                .append(horizontal ? 'H' : 'V').append(' ').append(score).append(" [");
        for (int i = 0; i < placed.size(); i++) {
            if (i > 0) sb.append(' ');
            sb.append(placedLetters.get(i)).append('@').append(placed.get(i)[0]).append(',').append(placed.get(i)[1]);
        }
        return sb.append("] ").append(allWords).append(' ').append(bonuses).toString();
    }
}
