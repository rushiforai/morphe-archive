package io.github.sazap10.extension.sync;

import android.content.SharedPreferences;
import android.util.Pair;

/**
 * Makes Best the default posts sort on the front page.
 * <p>
 * Sync has one global default posts sort, the `post_sort_preference` setting (default `sort_0`, Hot), which also
 * applies to subreddits. Reddit only supports Best on the front page, so this only changes the front page, and only
 * while the user has not picked a default posts sort in settings. Sorts saved for a single feed are looked up before
 * this default and still win.
 */
@SuppressWarnings("unused")
public final class DefaultPostSort {
    private static final String POST_SORT_PREFERENCE = "post_sort_preference";
    private static final String FRONT_PAGE = "frontpage";

    // Same value Sync uses for "Best": Pair("Best", null).
    private static final String BEST = "Best";

    private static volatile boolean userChoseDefault = true;

    private DefaultPostSort() {
    }

    /** Called whenever Sync loads its settings. */
    public static void remember(SharedPreferences preferences) {
        try {
            userChoseDefault = preferences.contains(POST_SORT_PREFERENCE);
        } catch (Throwable ignored) {
            userChoseDefault = true;
        }
    }

    /**
     * @return Best for the front page when the user has not chosen a default posts sort, otherwise null so
     * Sync's own default is used.
     */
    public static Pair<String, String> frontPageDefault(String feed) {
        if (userChoseDefault || !FRONT_PAGE.equalsIgnoreCase(feed)) return null;
        return new Pair<>(BEST, null);
    }
}
