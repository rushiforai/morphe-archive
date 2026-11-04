package app.wordfeudwordfinder.extension.solver;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

/**
 * Sorts moves (spec section 7). The order is total and deterministic: after the rules of the mode the final
 * tie-breakers are y, x and horizontal-before-vertical, so the list never jumps between recalculations.
 *
 * <p>Words are compared with {@link String#compareTo}, which is locale-neutral; dictionary words are upper case,
 * so this is plain A-Z (accented letters sort by code point, after Z).
 */
public final class MoveSorter {
    private MoveSorter() {}

    private static final Comparator<Move> BY_WORD = Comparator.comparing((Move m) -> m.word);
    private static final Comparator<Move> BY_SCORE_DESC = (a, b) -> Integer.compare(b.score, a.score);
    private static final Comparator<Move> BY_LENGTH_DESC = (a, b) -> Integer.compare(b.word.length(), a.word.length());
    private static final Comparator<Move> BY_POSITION = (a, b) -> {
        int c = Integer.compare(a.y, b.y);
        if (c != 0) return c;
        c = Integer.compare(a.x, b.x);
        if (c != 0) return c;
        return Boolean.compare(b.horizontal, a.horizontal); // horizontal first
    };

    /** Score mode's order (best first); also what {@link MoveGenerator} keeps when it caps its output. */
    static final Comparator<Move> BEST_FIRST = BY_SCORE_DESC.thenComparing(BY_WORD).thenComparing(BY_POSITION);

    /** Returns a new sorted list; the input is not modified. */
    public static List<Move> sort(List<Move> moves, SortMode mode) {
        Comparator<Move> c;
        switch (mode == null ? SortMode.SCORE : mode) {
            case LENGTH:
                c = BY_LENGTH_DESC.thenComparing(BY_SCORE_DESC).thenComparing(BY_WORD);
                break;
            case ALPHA:
                c = BY_WORD.thenComparing(BY_SCORE_DESC);
                break;
            case SCORE:
            default:
                c = BY_SCORE_DESC.thenComparing(BY_WORD);
                break;
        }
        List<Move> out = new ArrayList<>(moves);
        out.sort(c.thenComparing(BY_POSITION));
        return out;
    }
}
