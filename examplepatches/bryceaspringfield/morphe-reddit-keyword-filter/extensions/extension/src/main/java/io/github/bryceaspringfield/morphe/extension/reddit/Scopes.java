package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

/**
 * Filters of one community ("r/name") or one account ("u/name"), the scope. Keyword rules of a scope stay lines of the
 * rule lists, written "r/name: rule"; post types, flairs, and ranges of each scope are kept as JSON under {@link #KEY}.
 * An account's filters apply to that account's posts anywhere.
 */
final class Scopes {

    static final String KEY = "scopes";
    static final String SEEN_FLAIRS = "seen_flairs";
    private static final int MAX_FLAIRS = 80;
    private static final int MAX_COMMUNITIES = 400;

    static final String TYPES = "types";
    static final String FLAIRS = "flairs";
    static final String BOUNDS = "bounds";

    /**
     * One scope's settings. A type or flair absent from its map is shown; ranges are stored as typed.
     */
    static final class Entry {
        final Map<String, String> types = new TreeMap<>();
        final Map<String, String> flairs = new TreeMap<>();
        final Map<String, String> bounds = new TreeMap<>();

        String mode(String typeKey) {
            String mode = types.get(typeKey);
            return mode == null ? MODE_SHOW : mode;
        }

        String flairMode(String flair) {
            String mode = flairs.get(flair);
            return mode == null ? MODE_SHOW : mode;
        }

        static void setMode(Map<String, String> map, String key, String mode) {
            if (mode == null || MODE_SHOW.equals(mode)) map.remove(key);
            else map.put(key, mode);
        }

        Long bound(String key) {
            String value = bounds.get(key);
            if (value == null) return null;
            try {
                return Long.parseLong(value.trim().replace(",", ""));
            } catch (NumberFormatException ex) {
                return null;
            }
        }

        void setBound(String key, String value) {
            if (value == null || value.trim().isEmpty()) bounds.remove(key);
            else bounds.put(key, value.trim());
        }

        JSONObject toJson() throws Exception {
            JSONObject json = new JSONObject();
            json.put(TYPES, new JSONObject(types));
            json.put(FLAIRS, new JSONObject(flairs));
            json.put(BOUNDS, new JSONObject(bounds));
            return json;
        }

        static Entry fromJson(JSONObject json) {
            Entry entry = new Entry();
            read(json.optJSONObject(TYPES), entry.types);
            Map<String, String> flairs = new TreeMap<>();
            read(json.optJSONObject(FLAIRS), flairs);
            // Flairs saved before 1.1.3 kept their case and emoji.
            for (Map.Entry<String, String> flair : flairs.entrySet()) {
                String key = Rules.flairKey(flair.getKey());
                if (!key.isEmpty()) entry.flairs.put(key, flair.getValue());
            }
            read(json.optJSONObject(BOUNDS), entry.bounds);
            return entry;
        }

        private static void read(JSONObject json, Map<String, String> into) {
            if (json == null) return;
            for (Iterator<String> keys = json.keys(); keys.hasNext(); ) {
                String key = keys.next();
                into.put(key, json.optString(key));
            }
        }

        Entry copy() {
            Entry entry = new Entry();
            entry.types.putAll(types);
            entry.flairs.putAll(flairs);
            entry.bounds.putAll(bounds);
            return entry;
        }
    }

    private static volatile String source;
    private static volatile Map<String, Entry> entries = Collections.emptyMap();

    private Scopes() {
    }

    /**
     * Every scope with stored settings (an added scope with none included), sorted by key.
     */
    static Map<String, Entry> all() {
        String raw = getString(KEY, "{}");
        if (raw.equals(source)) return entries;
        Map<String, Entry> parsed = new TreeMap<>();
        try {
            JSONObject json = new JSONObject(raw);
            for (Iterator<String> keys = json.keys(); keys.hasNext(); ) {
                String key = keys.next();
                JSONObject value = json.optJSONObject(key);
                if (value != null) parsed.put(key, Entry.fromJson(value));
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the community and account filters", ex);
        }
        entries = Collections.unmodifiableMap(parsed);
        source = raw;
        return entries;
    }

    /**
     * A copy of a scope's settings to edit, empty when it has none.
     */
    static Entry edit(String scope) {
        Entry entry = all().get(scope);
        return entry == null ? new Entry() : entry.copy();
    }

    /**
     * Saves a scope's settings; null removes the scope.
     */
    static void save(String scope, Entry entry) {
        Map<String, Entry> copy = new TreeMap<>(all());
        if (entry == null) copy.remove(scope);
        else copy.put(scope, entry);
        try {
            JSONObject json = new JSONObject();
            for (Map.Entry<String, Entry> item : copy.entrySet()) json.put(item.getKey(), item.getValue().toJson());
            putString(KEY, json.toString());
        } catch (Exception ex) {
            Log.e(TAG, "Could not save the filters of " + scope, ex);
        }
    }

    // region Filtering

    /**
     * The reason a post is hidden by the filters of its communities or its poster, or null.
     */
    static String hidePost(PostInfo post, boolean[] has) {
        Map<String, Entry> all = all();
        if (all.isEmpty()) return null;
        for (String community : post.communities) {
            String reason = check(all.get("r/" + community), post, has);
            if (reason != null) return reason + " (r/" + community + ")";
        }
        for (String account : post.authors) {
            String reason = check(all.get("u/" + account), post, has);
            if (reason != null) return reason + " (u/" + account + ")";
        }
        return null;
    }

    private static String check(Entry entry, PostInfo post, boolean[] has) {
        if (entry == null) return null;
        boolean anyOnly = false;
        boolean matchesOnly = false;
        for (int i = 0; i < TYPE_KEYS.length; i++) {
            String mode = entry.mode(TYPE_KEYS[i]);
            if (MODE_HIDE.equals(mode) && has[i]) return "type " + TYPE_KEYS[i];
            if (MODE_ONLY.equals(mode)) {
                anyOnly = true;
                if (has[i]) matchesOnly = true;
            }
        }
        if (anyOnly && !matchesOnly) return "not an only type";

        anyOnly = false;
        matchesOnly = false;
        for (Map.Entry<String, String> flair : entry.flairs.entrySet()) {
            boolean hasFlair = post.hasFlair(flair.getKey());
            if (MODE_HIDE.equals(flair.getValue()) && hasFlair) return "flair " + flair.getKey();
            if (MODE_ONLY.equals(flair.getValue())) {
                anyOnly = true;
                if (hasFlair) matchesOnly = true;
            }
        }
        if (anyOnly && !matchesOnly) return "not an only flair";

        if (Filter.outside(post.score, entry.bound(POST_SCORE_MIN), entry.bound(POST_SCORE_MAX))) {
            return "score " + post.score;
        }
        if (Filter.outside(post.comments, entry.bound(POST_COMMENTS_MIN), entry.bound(POST_COMMENTS_MAX))) {
            return "comments " + post.comments;
        }
        return null;
    }

    // endregion

    // region Flairs seen

    private static volatile Map<String, Set<String>> seenFlairs;

    private static Map<String, Set<String>> seenFlairs() {
        Map<String, Set<String>> current = seenFlairs;
        if (current != null) return current;
        Map<String, Set<String>> loaded = new LinkedHashMap<>();
        try {
            JSONObject json = new JSONObject(getString(SEEN_FLAIRS, "{}"));
            for (Iterator<String> keys = json.keys(); keys.hasNext(); ) {
                String key = keys.next();
                JSONArray array = json.optJSONArray(key);
                Set<String> flairs = new LinkedHashSet<>();
                for (int i = 0; array != null && i < array.length(); i++) flairs.add(array.optString(i));
                loaded.put(key, flairs);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the flairs seen", ex);
        }
        seenFlairs = loaded;
        return loaded;
    }

    /**
     * Records the flairs of a post's community, for the community's settings screen.
     */
    static void noteFlairs(PostInfo post) {
        if (post.flairs.isEmpty() || post.communities.isEmpty()) return;
        String community = post.communities.get(0);
        Map<String, Set<String>> all = seenFlairs();
        synchronized (Scopes.class) {
            Set<String> flairs = all.get(community);
            if (flairs != null && flairs.containsAll(post.flairs)) return;
            if (flairs == null) {
                if (all.size() >= MAX_COMMUNITIES) all.remove(all.keySet().iterator().next());
                flairs = new LinkedHashSet<>();
                all.put(community, flairs);
            }
            for (String flair : post.flairs) {
                if (flairs.add(flair) && flairs.size() > MAX_FLAIRS) flairs.remove(flairs.iterator().next());
            }
            try {
                JSONObject json = new JSONObject();
                for (Map.Entry<String, Set<String>> item : all.entrySet()) {
                    json.put(item.getKey(), new JSONArray(item.getValue()));
                }
                putString(SEEN_FLAIRS, json.toString());
            } catch (Exception ex) {
                Log.e(TAG, "Could not save the flairs seen", ex);
            }
        }
    }

    /**
     * The flairs seen in a community and those with a setting, sorted.
     */
    static List<String> flairsOf(String community, Entry entry) {
        Set<String> flairs = new TreeSet<>(entry.flairs.keySet());
        Set<String> seen = seenFlairs().get(community);
        if (seen != null) {
            synchronized (Scopes.class) {
                flairs.addAll(seen);
            }
        }
        return new ArrayList<>(flairs);
    }

    // endregion

    // region Rule lines by scope

    /**
     * A rule list split by scope: key "" holds the lines without a scope, "r/name" and "u/name" the lines of each
     * scope without its prefix. A line naming several scopes goes to each.
     */
    static Map<String, List<String>> splitRules(String text) {
        Map<String, List<String>> parts = new LinkedHashMap<>();
        parts.put("", new ArrayList<>());
        for (String raw : (text == null ? "" : text).split("\n")) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            Rules.Prefix prefix = Rules.prefix(line);
            if (prefix == null || prefix.rest.isEmpty()) {
                parts.get("").add(line);
                continue;
            }
            for (String scope : prefix.scopes) {
                List<String> lines = parts.get(scope);
                if (lines == null) parts.put(scope, lines = new ArrayList<>());
                if (!lines.contains(prefix.rest)) lines.add(prefix.rest);
            }
        }
        return parts;
    }

    static String joinRules(Map<String, List<String>> parts) {
        List<String> lines = new ArrayList<>(parts.containsKey("") ? parts.get("") : Collections.emptyList());
        for (Map.Entry<String, List<String>> part : parts.entrySet()) {
            if (part.getKey().isEmpty()) continue;
            for (String line : part.getValue()) lines.add(part.getKey() + ": " + line);
        }
        return String.join("\n", lines);
    }

    static List<String> rulesOf(String listKey, String scope) {
        List<String> lines = splitRules(getString(listKey, "")).get(scope);
        return lines == null ? Collections.emptyList() : lines;
    }

    /**
     * Replaces a scope's lines (scope "" for the lines without one); a typed line naming its own scope goes there.
     */
    static void setRulesOf(String listKey, String scope, String text) {
        Map<String, List<String>> parts = splitRules(getString(listKey, ""));
        parts.put(scope, new ArrayList<>());
        for (String raw : text.split("\n")) {
            String line = raw.trim();
            if (line.isEmpty()) continue;
            Rules.Prefix prefix = Rules.prefix(line);
            if (prefix == null || prefix.rest.isEmpty()) {
                parts.get(scope).add(line);
            } else {
                for (String other : prefix.scopes) {
                    List<String> lines = parts.get(other);
                    if (lines == null) parts.put(other, lines = new ArrayList<>());
                    if (!lines.contains(prefix.rest)) lines.add(prefix.rest);
                }
            }
        }
        putString(listKey, joinRules(parts));
    }

    /**
     * Whether the global post rules hide the whole community or account ("r/name" or "u/name" alone).
     */
    static boolean hiddenWhole(String scope) {
        for (String line : rulesOf(POST_RULES, "")) {
            if (line.equalsIgnoreCase(scope)) return true;
        }
        return false;
    }

    static void setHiddenWhole(String scope, boolean hidden) {
        List<String> lines = new ArrayList<>();
        for (String line : rulesOf(POST_RULES, "")) {
            if (!line.equalsIgnoreCase(scope)) lines.add(line);
        }
        if (hidden) lines.add(scope);
        setRulesOf(POST_RULES, "", String.join("\n", lines));
    }

    /**
     * Every scope of a kind ("r/" or "u/") with any filter: stored settings, rule lines, or a whole-scope rule.
     */
    static Set<String> scopes(String kind) {
        Set<String> scopes = new TreeSet<>();
        for (String scope : all().keySet()) if (scope.startsWith(kind)) scopes.add(scope);
        for (String listKey : new String[]{POST_RULES, COMMENT_RULES}) {
            for (Map.Entry<String, List<String>> part : splitRules(getString(listKey, "")).entrySet()) {
                if (part.getKey().startsWith(kind)) scopes.add(part.getKey());
            }
        }
        for (String line : rulesOf(POST_RULES, "")) {
            String lower = line.toLowerCase(java.util.Locale.ROOT);
            if (lower.startsWith(kind) && lower.length() > 2 && !lower.contains(" ")) scopes.add(Rules.scopeKey(lower));
        }
        return scopes;
    }

    /**
     * Removes every filter of a scope.
     */
    static void clear(String scope) {
        setRulesOf(POST_RULES, scope, "");
        setRulesOf(COMMENT_RULES, scope, "");
        setHiddenWhole(scope, false);
        save(scope, null);
    }

    // endregion
}
