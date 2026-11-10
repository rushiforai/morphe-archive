package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.TAG;

import android.content.SharedPreferences;
import android.util.Log;

/**
 * Morphe Patches' Hide Trending shelves switch split in two: the Trending unit in feeds, and the trending queries and
 * communities in search suggestions. Reddit's reads of Morphe's switch come here; each place starts from Morphe's
 * switch until its own switch is set.
 */
@SuppressWarnings("unused")
public final class TrendingPlaces {

    static final String HIDE_IN_FEEDS = "hide_trending_feeds";
    static final String HIDE_IN_SEARCH = "hide_trending_search";
    private static final String MORPHE_TRENDING = "app.morphe.extension.reddit.patches.HideTrendingShelvesPatch";

    private TrendingPlaces() {
    }

    /** Injection point: whether to hide the Trending unit in a feed. */
    public static boolean feed() {
        return hidden(HIDE_IN_FEEDS);
    }

    /** Injection point: whether to hide trending queries and communities in search suggestions. */
    public static boolean search() {
        return hidden(HIDE_IN_SEARCH);
    }

    static boolean hidden(String key) {
        SharedPreferences preferences = FilterSettings.preferences();
        if (preferences != null && preferences.contains(key)) return preferences.getBoolean(key, false);
        return morpheSwitch();
    }

    static void setHidden(String key, boolean hidden) {
        FilterSettings.putBoolean(key, hidden);
    }

    /** Morphe Patches' own switch, the starting value of both places. */
    private static boolean morpheSwitch() {
        try {
            return (Boolean) Class.forName(MORPHE_TRENDING).getMethod("hideTrendingShelf").invoke(null);
        } catch (Throwable ex) {
            Log.w(TAG, "Morphe's Trending switch is missing", ex);
            return false;
        }
    }
}
