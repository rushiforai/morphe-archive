package app.wordfeudwordfinder.extension.solver;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

/**
 * Keeps the best {@code cap} moves while they are generated, so the full list (with blanks easily 100k+ moves) is
 * never held in memory. "Best" is {@link MoveSorter#BEST_FIRST} (score, then word, then position), so the kept set
 * does not depend on the generation order.
 *
 * <p>One move per word and placement ({@code word, x, y, direction}): the same squares can often be filled with or
 * without a blank (or with the blank on another of the equal letters); only the highest-scoring variant is kept, on a
 * tie the one with fewer blanks.
 */
final class MoveCollector {
    private final int cap;
    /** Worst first, so {@link TreeSet#first()} is the one to evict. */
    private final TreeSet<Move> kept;
    private final Map<String, Move> byPlacement = new HashMap<>();

    MoveCollector(int cap) {
        this.cap = Math.max(1, cap);
        Comparator<Move> worstFirst = MoveSorter.BEST_FIRST.reversed();
        this.kept = new TreeSet<>(worstFirst);
    }

    /** Score below which a new move cannot get in (when full); {@link Integer#MIN_VALUE} while not full. */
    int minScore() {
        return kept.size() < cap ? Integer.MIN_VALUE : kept.first().score;
    }

    void add(Move m) {
        String key = key(m);
        Move old = byPlacement.get(key);
        if (old != null) {
            if (!better(m, old)) return;
            kept.remove(old);
            kept.add(m);
            byPlacement.put(key, m);
            return;
        }
        if (kept.size() >= cap) {
            Move worst = kept.first();
            if (MoveSorter.BEST_FIRST.compare(m, worst) >= 0) return; // not better than the worst kept
            kept.pollFirst();
            byPlacement.remove(key(worst));
        }
        kept.add(m);
        byPlacement.put(key, m);
    }

    /** Best first. */
    List<Move> result() {
        return new ArrayList<>(kept.descendingSet());
    }

    private static boolean better(Move a, Move b) {
        if (a.score != b.score) return a.score > b.score;
        return blanks(a) < blanks(b);
    }

    static int blanks(Move m) {
        int n = 0;
        for (String l : m.placedLetters) if (!l.isEmpty() && Character.isLowerCase(l.charAt(0))) n++;
        return n;
    }

    private static String key(Move m) {
        return m.word + '@' + m.x + ',' + m.y + (m.horizontal ? 'H' : 'V');
    }
}
