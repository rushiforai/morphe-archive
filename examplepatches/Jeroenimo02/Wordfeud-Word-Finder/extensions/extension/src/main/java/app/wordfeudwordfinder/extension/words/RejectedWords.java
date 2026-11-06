package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.Tiles;
import app.wordfeudwordfinder.extension.core.Storage;
import app.wordfeudwordfinder.extension.solver.Move;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Words the server rejected, per ruleset (spec section 6.3). Stored in {@code rejected/<id>.txt}: one upper-case
 * word per line, UTF-8, written atomically. Loaded lazily into memory per ruleset. The list is never cleared
 * automatically (it survives word list updates). Thread-safe.
 *
 * <p>A failed write keeps the words in memory for this session only. A failed read is never cached: it is retried
 * on the next call. Words added while the file cannot be read are kept in memory ({@code pending}) and nothing is
 * written, so a temporarily unreadable file is never overwritten with only the new words; once a read succeeds
 * they are merged in and written.
 */
public final class RejectedWords {
    private final Storage storage;
    private final Map<Integer, Set<String>> cache = new HashMap<>();
    /** Words added while the ruleset's file could not be read (not yet persisted). */
    private final Map<Integer, Set<String>> pending = new HashMap<>();

    public RejectedWords(Storage storage) {
        this.storage = storage;
    }

    private static String path(int rulesetId) {
        return "rejected/" + rulesetId + ".txt";
    }

    /** Upper case and spelled out (digraph tiles as CH, LL, RR), so server words and move words compare. */
    private static String norm(String w) {
        return w == null ? "" : Tiles.spell(w.trim()).toUpperCase(Locale.ROOT);
    }

    /**
     * Must be called with the lock held. Returns null when the file exists but cannot be read (not cached, so the
     * next call reads again). On the first successful read, pending words are merged in and persisted.
     */
    private Set<String> load(int id) {
        Set<String> s = cache.get(id);
        if (s != null) return s;
        s = new HashSet<>();
        try {
            String text = storage.readText(path(id));
            if (text != null) {
                for (String line : text.split("\n")) {
                    String w = norm(line);
                    if (!w.isEmpty()) s.add(w);
                }
            }
        } catch (IOException | RuntimeException e) {
            return null;
        }
        cache.put(id, s);
        Set<String> p = pending.remove(id);
        if (p != null && s.addAll(p)) persist(id, s);
        return s;
    }

    private void persist(int id, Set<String> s) {
        StringBuilder sb = new StringBuilder();
        for (String w : new TreeSet<>(s)) sb.append(w).append('\n');
        try {
            storage.writeTextAtomic(path(id), sb.toString());
        } catch (IOException | RuntimeException e) {
            // best effort: stays in memory for this session
        }
    }

    /** Must be called with the lock held: the loaded words plus pending ones; null when there are none at all. */
    private Set<String> view(int id) {
        Set<String> s = load(id);
        if (s != null) return s;
        return pending.get(id);
    }

    /** Adds words (normalised to upper case; blanks ignored) and persists the list (when it could be read). */
    public synchronized void add(int rulesetId, Collection<String> words) {
        if (words == null) return;
        Set<String> s = load(rulesetId);
        boolean readable = s != null;
        if (!readable) {
            s = pending.get(rulesetId);
            if (s == null) {
                s = new HashSet<>();
                pending.put(rulesetId, s);
            }
        }
        boolean changed = false;
        for (String w : words) {
            String n = norm(w);
            if (!n.isEmpty() && s.add(n)) changed = true;
        }
        // Never write after a failed read: that would replace the existing file with only the new words.
        if (changed && readable) persist(rulesetId, s);
    }

    /** Case-insensitive (upper case via Locale.ROOT). */
    public synchronized boolean contains(int rulesetId, String word) {
        Set<String> s = view(rulesetId);
        return s != null && s.contains(norm(word));
    }

    /**
     * Returns a new list without every move that has ANY rejected word among its {@code allWords}: the server
     * may reject a cross word rather than the main word, and such a move would be refused again.
     */
    public synchronized List<Move> filter(int rulesetId, List<Move> moves) {
        Set<String> s = view(rulesetId);
        List<Move> out = new ArrayList<>(moves.size());
        for (Move m : moves) {
            boolean bad = false;
            if (s != null && !s.isEmpty()) {
                for (String w : m.allWords) {
                    if (s.contains(norm(w))) {
                        bad = true;
                        break;
                    }
                }
            }
            if (!bad) out.add(m);
        }
        return out;
    }
}
