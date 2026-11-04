package app.wordfeudwordfinder.extension.play;

import app.wordfeudwordfinder.extension.solver.Move;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 * Exact moves the server refused while it did not say which of their words was wrong (V6, spec section 8.3). Such a
 * move is hidden for the rest of this process for its game only; none of its words is rejected permanently, so
 * other moves with the same words stay listed. A move is identified by its placement (square and letter of every
 * new tile, blanks lower case) plus all the words it forms. In memory only; thread-safe.
 */
public final class HiddenMoves {
    private final Map<Long, Set<String>> byGame = new HashMap<>();

    /** Hides {@code m} in game {@code gameId}. */
    public synchronized void hide(long gameId, Move m) {
        if (m == null) return;
        Set<String> s = byGame.get(gameId);
        if (s == null) {
            s = new HashSet<>();
            byGame.put(gameId, s);
        }
        s.add(key(m));
    }

    public synchronized boolean isHidden(long gameId, Move m) {
        Set<String> s = byGame.get(gameId);
        return m != null && s != null && s.contains(key(m));
    }

    /** A new list without the moves hidden for {@code gameId}. */
    public synchronized List<Move> filter(long gameId, List<Move> moves) {
        Set<String> s = byGame.get(gameId);
        if (s == null || s.isEmpty()) return new ArrayList<>(moves);
        List<Move> out = new ArrayList<>(moves.size());
        for (Move m : moves) if (!s.contains(key(m))) out.add(m);
        return out;
    }

    static String key(Move m) {
        StringBuilder b = new StringBuilder();
        for (int i = 0; i < m.placed.size(); i++) {
            int[] p = m.placed.get(i);
            b.append(p[0]).append(',').append(p[1]).append('=').append(m.placedLetters.get(i)).append(';');
        }
        b.append('|');
        for (String w : m.allWords) b.append(w.toUpperCase(Locale.ROOT)).append(';');
        return b.toString();
    }
}
