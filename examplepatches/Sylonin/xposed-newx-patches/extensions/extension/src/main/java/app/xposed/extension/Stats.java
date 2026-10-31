package app.xposed.extension;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/** Local statistics, like the extension's: posts seen and filtered per location, lookups, contributions. */
final class Stats {
    private static final String PREFS = "xposed_stats";
    private static final long SAVE_DELAY_MS = 10_000;
    /** Posts already counted this session; X reports the same post in several events. */
    private static final int SEEN_LIMIT = 20_000;

    static final class Entry {
        final String location;
        final int count;

        Entry(String location, int count) {
            this.location = location;
            this.count = count;
        }
    }

    private static volatile SharedPreferences prefs;
    private static final Set<Long> counted = new LinkedHashSet<>();
    private static final Map<String, Integer> seen = new HashMap<>();
    private static final Map<String, Integer> filtered = new HashMap<>();
    private static final Map<String, Long> counters = new HashMap<>();
    private static boolean saveScheduled;

    static final String POSTS = "posts";
    static final String POSTS_UNKNOWN = "posts_unknown";
    static final String CLOUD_REQUESTED = "cloud_requested";
    static final String CLOUD_HITS = "cloud_hits";
    static final String X_LOOKUPS = "x_lookups";
    static final String X_FOUND = "x_found";
    static final String X_FAILED = "x_failed";
    static final String CONTRIBUTED = "contributed";
    static final String CONTRIBUTED_ACCEPTED = "contributed_accepted";

    private Stats() {
    }

    static void init(Context context) {
        if (prefs == null) load(context);
    }

    private static synchronized void load(Context context) {
        if (prefs != null) return;
        prefs = context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        readMap(prefs.getString("seen", null), seen);
        readMap(prefs.getString("filtered", null), filtered);
        for (Map.Entry<String, ?> e : prefs.getAll().entrySet()) {
            if (e.getValue() instanceof Long) counters.put(e.getKey(), (Long) e.getValue());
        }
    }

    /** A post shown on screen, with its author's info if known. */
    static synchronized void postShown(long postId, AccountInfo author) {
        if (prefs == null || !counted.add(postId)) return;
        if (counted.size() > SEEN_LIMIT) {
            Iterator<Long> it = counted.iterator();
            it.next();
            it.remove();
        }
        add(POSTS, 1);
        if (author == null || author.location == null) {
            add(POSTS_UNKNOWN, 1);
        } else {
            seen.merge(author.location, 1, Integer::sum);
            if (Filters.actionFor(author) != Filters.Action.NONE) filtered.merge(author.location, 1, Integer::sum);
        }
        scheduleSave();
    }

    static synchronized void add(String counter, long amount) {
        if (prefs == null || amount == 0) return;
        counters.merge(counter, amount, Long::sum);
        scheduleSave();
    }

    static synchronized long get(String counter) {
        Long v = counters.get(counter);
        return v == null ? 0 : v;
    }

    /** Locations by how many posts were seen (or filtered) from them, most first. */
    static synchronized List<Entry> top(boolean filteredOnly) {
        List<Entry> list = new ArrayList<>();
        for (Map.Entry<String, Integer> e : (filteredOnly ? filtered : seen).entrySet()) {
            list.add(new Entry(e.getKey(), e.getValue()));
        }
        Collections.sort(list, (a, b) -> Integer.compare(b.count, a.count));
        return list;
    }

    static synchronized void reset() {
        if (prefs == null) return;
        seen.clear();
        filtered.clear();
        counters.clear();
        counted.clear();
        prefs.edit().clear().apply();
    }

    private static void scheduleSave() {
        if (saveScheduled) return;
        saveScheduled = true;
        Lookup.schedule(Stats::save, SAVE_DELAY_MS);
    }

    private static synchronized void save() {
        saveScheduled = false;
        SharedPreferences.Editor editor = prefs.edit()
                .putString("seen", new JSONObject(seen).toString())
                .putString("filtered", new JSONObject(filtered).toString());
        for (Map.Entry<String, Long> e : counters.entrySet()) editor.putLong(e.getKey(), e.getValue());
        editor.apply();
    }

    private static void readMap(String json, Map<String, Integer> into) {
        if (json == null) return;
        try {
            JSONObject o = new JSONObject(json);
            for (Iterator<String> it = o.keys(); it.hasNext(); ) {
                String k = it.next();
                into.put(k, o.getInt(k));
            }
        } catch (Exception ignored) {
        }
    }
}
