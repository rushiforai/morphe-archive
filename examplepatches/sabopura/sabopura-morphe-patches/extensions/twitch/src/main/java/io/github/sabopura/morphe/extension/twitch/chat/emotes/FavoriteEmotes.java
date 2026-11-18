// Key design follows ryykitty/twitch-patched (GPL-3.0); see NOTICE.
package io.github.sabopura.morphe.extension.twitch.chat.emotes;

import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONException;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.function.Function;
import java.util.regex.Pattern;

/**
 * Favourite emotes in the order they were added. A key is {@code t:<id>} for a Twitch emote or
 * {@code c:<provider>:<id>} for a third-party one, so another channel's emote with the same name
 * stays separate. A name from the old unordered set keeps an {@code n:<name>} key until the
 * catalog that knows it is loaded, then takes the id-based key in place.
 */
final class FavoriteEmotes {
    static final int LIMIT = 200;
    private static final String KEY = "favorite_emotes_v2";
    private static final String LEGACY_KEY = "favorite_emotes";
    private static final Pattern VALID = Pattern.compile("[tcn]:\\S{1,128}");

    static final class Entry {
        final String key, name;

        Entry(String key, String name) {
            this.key = key;
            this.name = name;
        }
    }

    final List<Entry> entries;

    private FavoriteEmotes(List<Entry> entries) {
        this.entries = entries;
    }

    static FavoriteEmotes load(SharedPreferences prefs) {
        String json = prefs.getString(KEY, null);
        if (json != null) return parse(json);
        FavoriteEmotes migrated = fromNames(prefs.getStringSet(LEGACY_KEY, Collections.emptySet()));
        prefs.edit().putString(KEY, migrated.toJson()).remove(LEGACY_KEY).apply();
        return migrated;
    }

    void save(SharedPreferences prefs) {
        prefs.edit().putString(KEY, toJson()).apply();
    }

    /** The old set had no order; it comes over alphabetically and untruncated, even past the limit. */
    static FavoriteEmotes fromNames(Collection<String> names) {
        List<String> sorted = new ArrayList<>(names);
        sorted.sort(String.CASE_INSENSITIVE_ORDER);
        List<Entry> entries = new ArrayList<>(sorted.size());
        for (String name : sorted) entries.add(new Entry("n:" + name, name));
        return new FavoriteEmotes(entries);
    }

    static FavoriteEmotes parse(String json) {
        List<Entry> entries = new ArrayList<>();
        try {
            JSONArray array = new JSONArray(json);
            for (int i = 0; i < array.length(); i++) {
                JSONArray pair = array.optJSONArray(i);
                if (pair == null) continue;
                String key = pair.optString(0);
                if (VALID.matcher(key).matches()) entries.add(new Entry(key, pair.optString(1)));
            }
        } catch (JSONException ignored) {
            // A damaged store starts empty rather than failing every picker open.
        }
        return new FavoriteEmotes(entries);
    }

    String toJson() {
        JSONArray array = new JSONArray();
        for (Entry entry : entries) array.put(new JSONArray().put(entry.key).put(entry.name));
        return array.toString();
    }

    int indexOf(Emote emote) {
        if (emote == null) return -1;
        String key = emote.favoriteKey();
        for (int i = 0; i < entries.size(); i++) if (entries.get(i).key.equals(key)) return i;
        return -1;
    }

    /** Adds or removes the emote. False only when adding would pass {@link #LIMIT}. */
    boolean toggle(Emote emote) {
        int at = indexOf(emote);
        if (at >= 0) {
            entries.remove(at);
            return true;
        }
        if (entries.size() >= LIMIT) return false;
        entries.add(new Entry(emote.favoriteKey(), emote.name));
        return true;
    }

    /** Gives name-only entries their id-based key, in place. True when anything changed. */
    boolean resolve(Function<String, Emote> catalog) {
        boolean changed = false;
        for (int i = 0; i < entries.size(); i++) {
            Entry entry = entries.get(i);
            if (!entry.key.startsWith("n:")) continue;
            Emote emote = catalog.apply(entry.name);
            if (emote == null) continue;
            entries.set(i, new Entry(emote.favoriteKey(), entry.name));
            changed = true;
        }
        return changed;
    }
}
