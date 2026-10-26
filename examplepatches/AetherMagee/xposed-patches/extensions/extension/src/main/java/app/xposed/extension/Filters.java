package app.xposed.extension;

import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Country and region filters, like X-Posed's Countries and X regions rules. */
final class Filters {
    enum Action {NONE, HIDE, HIGHLIGHT}

    /** Display names as saved, and their canonical keys. Replaced wholesale, read without locking. */
    private static volatile Set<String> locations = Collections.emptySet();
    private static volatile Set<String> keys = Collections.emptySet();
    private static volatile boolean loaded;
    // Held strongly: SharedPreferences only keeps weak references to listeners.
    private static final SharedPreferences.OnSharedPreferenceChangeListener listener = (p, key) -> {
        if (Settings.FILTER_LOCATIONS.equals(key)) reload();
    };

    private Filters() {
    }

    /** Called for every post header and client event item, so it avoids locks and allocation. */
    static Action actionFor(AccountInfo info) {
        if (info == null || info.location == null) return Action.NONE;
        if (!loaded) load();
        Set<String> k = keys;
        if (k.isEmpty() || !k.contains(Countries.canonicalKey(info.location))) return Action.NONE;
        return Settings.highlightMode() ? Action.HIGHLIGHT : Action.HIDE;
    }

    /** True when any filter is set; lets callers skip per-item work. */
    static boolean any() {
        if (!loaded) load();
        return !keys.isEmpty();
    }

    static boolean isFiltered(String location) {
        if (!loaded) load();
        return location != null && keys.contains(Countries.canonicalKey(location));
    }

    /** Filtered locations, sorted for display. */
    static List<String> locations() {
        if (!loaded) load();
        List<String> list = new ArrayList<>(locations);
        Collections.sort(list, String.CASE_INSENSITIVE_ORDER);
        return list;
    }

    static synchronized void save(Set<String> newLocations, boolean highlight) {
        SharedPreferences prefs = Settings.prefs();
        if (prefs == null) return;
        prefs.edit()
                .putStringSet(Settings.FILTER_LOCATIONS, new HashSet<>(newLocations))
                .putString(Settings.FILTER_MODE, highlight ? Settings.MODE_HIGHLIGHT : Settings.MODE_HIDE)
                .apply();
        reload();
    }

    private static synchronized void load() {
        if (loaded) return;
        SharedPreferences prefs = Settings.prefs();
        if (prefs == null) return;
        prefs.registerOnSharedPreferenceChangeListener(listener);
        loaded = true;
        reload();
    }

    private static synchronized void reload() {
        SharedPreferences prefs = Settings.prefs();
        if (prefs == null) return;
        Set<String> l = new HashSet<>();
        Set<String> k = new HashSet<>();
        for (String location : prefs.getStringSet(Settings.FILTER_LOCATIONS, Collections.emptySet())) {
            // One entry per country, whichever spelling was saved first.
            if (k.add(Countries.canonicalKey(location))) l.add(location);
        }
        locations = Collections.unmodifiableSet(l);
        keys = Collections.unmodifiableSet(k);
    }
}
