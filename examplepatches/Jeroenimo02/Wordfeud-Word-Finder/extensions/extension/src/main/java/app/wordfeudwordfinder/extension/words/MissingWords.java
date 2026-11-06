package app.wordfeudwordfinder.extension.words;

import app.wordfeudwordfinder.extension.core.Tiles;
import app.wordfeudwordfinder.extension.core.Storage;
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
 * Finds words that were played in a game (so the server accepted them) but are missing from our word list, and
 * reports them once per device as additions ({@link WordReporter#reportAdditions}). The words reported per ruleset
 * are remembered in {@code reported-add/<ruleset>.txt}, so a word is never sent twice.
 */
public final class MissingWords {
    /** At most this many words are reported per check (the rest follows with a later check). */
    static final int MAX_PER_CHECK = 24;

    private final Storage storage;
    private final WordReporter reporter;
    private final Map<Integer, Set<String>> reported = new HashMap<>();

    public MissingWords(Storage storage, WordReporter reporter) {
        this.storage = storage;
        this.reporter = reporter;
    }

    private static String path(int rulesetId) {
        return "reported-add/" + rulesetId + ".txt";
    }

    /** Must hold the lock. The words already reported for this ruleset (empty when nothing was stored). */
    private Set<String> load(int id) {
        Set<String> s = reported.get(id);
        if (s != null) return s;
        s = new HashSet<>();
        try {
            String text = storage.readText(path(id));
            if (text != null) {
                for (String line : text.split("\n")) {
                    String w = line.trim();
                    if (!w.isEmpty()) s.add(w);
                }
            }
        } catch (IOException | RuntimeException e) {
            // unreadable: start empty; at worst a word is reported again
        }
        reported.put(id, s);
        return s;
    }

    /**
     * Reports the played words of one game that {@code graph} (the list of {@code rulesetId}) does not contain.
     * Returns the words reported now. Never throws; does nothing when reporting is off.
     */
    public synchronized List<String> check(int rulesetId, WordGraph graph, Collection<String> playedWords) {
        List<String> fresh = new ArrayList<>();
        if (reporter == null || !reporter.enabled() || graph == null || playedWords == null) return fresh;
        try {
            Set<String> done = load(rulesetId);
            for (String w : playedWords) {
                String u = w == null ? "" : w.trim().toUpperCase(Locale.ROOT);
                if (u.length() < 2 || done.contains(u) || fresh.contains(u) || graph.contains(u)) continue;
                fresh.add(u);
                if (fresh.size() >= MAX_PER_CHECK) break;
            }
            if (fresh.isEmpty()) return fresh;
            done.addAll(fresh);
            StringBuilder sb = new StringBuilder();
            for (String w : new TreeSet<>(done)) sb.append(w).append('\n');
            try {
                storage.writeTextAtomic(path(rulesetId), sb.toString());
            } catch (IOException | RuntimeException e) {
                // remembered in memory for this session
            }
            reporter.reportAdditions(rulesetId, Tiles.spell(fresh)); // digraph tiles spelled out
        } catch (RuntimeException e) {
            // never affect the game
        }
        return fresh;
    }
}
