package app.wordfeudwordfinder.extension.ui;

import app.wordfeudwordfinder.extension.game.BoardLayout;
import app.wordfeudwordfinder.extension.game.GameState;
import app.wordfeudwordfinder.extension.game.Ruleset;
import app.wordfeudwordfinder.extension.solver.Move;
import app.wordfeudwordfinder.extension.solver.MoveGenerator;
import app.wordfeudwordfinder.extension.solver.MoveSorter;
import app.wordfeudwordfinder.extension.solver.SortMode;
import app.wordfeudwordfinder.extension.words.WordGraph;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.UnaryOperator;

/** The overlay's move list: generate, drop rejected words, sort. Pure; runs on a background thread. */
public final class MovePipeline {
    private MovePipeline() {}

    /**
     * @param rejectedFilter drops moves with a rejected word (in production {@code RejectedWords.filter})
     * @return the sorted moves; empty when an input is missing; null when cancelled
     */
    public static List<Move> compute(GameState st, BoardLayout layout, Ruleset rs, WordGraph wg,
                                     UnaryOperator<List<Move>> rejectedFilter, SortMode mode, AtomicBoolean cancel) {
        if (cancel.get()) return null;
        if (st == null || layout == null || wg == null) return Collections.emptyList();
        List<Move> moves = MoveGenerator.generate(st.board(), st.rack(), layout, rs, wg, cancel);
        if (cancel.get()) return null;
        if (rejectedFilter != null) moves = rejectedFilter.apply(moves);
        if (cancel.get()) return null;
        return sort(moves, mode, cancel);
    }

    /** A new sorted list, or null when cancelled. */
    public static List<Move> sort(List<Move> moves, SortMode mode, AtomicBoolean cancel) {
        if (cancel.get()) return null;
        List<Move> out = MoveSorter.sort(moves, mode);
        return cancel.get() ? null : out;
    }

    /** Index of the first move with the highest score, or -1 for an empty list. */
    public static int bestIndex(List<Move> moves) {
        if (moves == null) return -1;
        int best = -1;
        for (int i = 0; i < moves.size(); i++) {
            if (best < 0 || moves.get(i).score > moves.get(best).score) best = i;
        }
        return best;
    }

    /** Index of this exact move instance, or -1. */
    public static int indexOf(List<Move> moves, Move m) {
        if (moves == null || m == null) return -1;
        for (int i = 0; i < moves.size(); i++) if (moves.get(i) == m) return i;
        return -1;
    }

    /**
     * True when two states give the same move list and overlay (same game, board, rack, turn and error), so a
     * games/detail refresh that changed nothing does not restart the computation.
     */
    public static boolean sameInput(GameState a, GameState b) {
        if (a == b) return a != null;
        if (a == null || b == null) return false;
        if (a.gameId() != b.gameId() || a.myTurn() != b.myTurn() || a.ended() != b.ended()) return false;
        String ea = a.unreadable() == null ? null : a.unreadable().code();
        String eb = b.unreadable() == null ? null : b.unreadable().code();
        if (ea == null ? eb != null : !ea.equals(eb)) return false;
        return a.rack().equals(b.rack()) && Arrays.deepEquals(a.board(), b.board());
    }
}
