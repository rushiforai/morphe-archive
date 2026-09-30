package app.template.extension.extension;

import android.app.Application;
import android.content.SharedPreferences;
import android.os.SystemClock;

/**
 * User toggles for the response-rewriting apps (Flipkart, Meesho, Myntra):
 * "Most rated" sorting and "Hide ads", both off until the user turns them on
 * with the floating buttons, remembered across launches.
 */
final class SortState {

    private SortState() {}

    private static final String PREFS = "morphe_sort";
    private static final long LISTING_WINDOW_MS = 3 * 60 * 1000L;

    // null until loaded (or forced by a test)
    private static volatile Boolean sSort;
    private static volatile Boolean sAds;
    private static volatile long sListingAt;

    static boolean sortOn() {
        load();
        return Boolean.TRUE.equals(sSort);
    }

    static boolean hideAds() {
        load();
        return Boolean.TRUE.equals(sAds);
    }

    static void setSort(boolean on) {
        sSort = on;
        save("sort", on);
    }

    static void setAds(boolean on) {
        sAds = on;
        save("ads", on);
    }

    /** Called when a response that looks like a product listing goes by. */
    static void noteListing() {
        sListingAt = SystemClock.elapsedRealtime();
        SortOverlay.install();
    }

    static boolean listingRecent() {
        long at = sListingAt;
        return at != 0 && SystemClock.elapsedRealtime() - at < LISTING_WINDOW_MS;
    }

    /** Unit tests: force both toggles without touching preferences. */
    static void forTest(boolean sort, boolean ads) {
        sSort = sort;
        sAds = ads;
    }

    private static synchronized void load() {
        if (sSort != null && sAds != null) return;
        Application app = SortOverlay.app();
        if (app == null) return;
        try {
            SharedPreferences p = app.getSharedPreferences(PREFS, Application.MODE_PRIVATE);
            if (sSort == null) sSort = p.getBoolean("sort", false);
            if (sAds == null) sAds = p.getBoolean("ads", false);
        } catch (Throwable ignored) {
            // keep defaults (off)
        }
    }

    private static void save(String key, boolean value) {
        Application app = SortOverlay.app();
        if (app == null) return;
        try {
            app.getSharedPreferences(PREFS, Application.MODE_PRIVATE)
                .edit().putBoolean(key, value).apply();
        } catch (Throwable ignored) {
            // best effort
        }
    }
}
