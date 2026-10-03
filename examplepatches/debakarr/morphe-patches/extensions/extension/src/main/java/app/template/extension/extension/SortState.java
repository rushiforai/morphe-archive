package app.template.extension.extension;

import android.app.Application;
import android.content.SharedPreferences;
import android.os.SystemClock;

/**
 * User toggles for the response-rewriting apps (Flipkart, Meesho, Myntra):
 * the sort mode (off / most rated / top rated), the 4★+ filter and "Hide ads".
 * Everything starts off and is remembered across launches.
 */
final class SortState {

    private SortState() {}

    /** How a listing is ordered. */
    enum Mode {
        OFF,
        /** Most ratings first (ties: higher average). */
        COUNT,
        /** Highest average rating first (ties: more ratings). */
        RATING;

        /** The next mode when the user taps the sort button: off, most rated, top rated, off… */
        Mode next() {
            switch (this) {
                case OFF: return COUNT;
                case COUNT: return RATING;
                default: return OFF;
            }
        }

        static Mode parse(String name) {
            if (name == null) return null;
            try {
                return valueOf(name);
            } catch (IllegalArgumentException e) {
                return null;
            }
        }
    }

    private static final String PREFS = "morphe_sort";
    private static final long LISTING_WINDOW_MS = 3 * 60 * 1000L;

    // null until loaded (or forced by a test)
    private static volatile Mode sMode;
    private static volatile Boolean sMinFour;
    private static volatile Boolean sAds;
    private static volatile long sListingAt;

    static Mode mode() {
        load();
        return sMode == null ? Mode.OFF : sMode;
    }

    static boolean sortOn() {
        return mode() != Mode.OFF;
    }

    static boolean minFour() {
        load();
        return Boolean.TRUE.equals(sMinFour);
    }

    static boolean hideAds() {
        load();
        return Boolean.TRUE.equals(sAds);
    }

    static void setMode(Mode mode) {
        sMode = mode;
        save("mode", mode.name());
    }

    static void setMinFour(boolean on) {
        sMinFour = on;
        save("minFour", on);
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

    /** Unit tests: force the toggles without touching preferences. */
    static void forTest(Mode mode, boolean minFour, boolean ads) {
        sMode = mode;
        sMinFour = minFour;
        sAds = ads;
    }

    /** Unit tests (legacy shape): sort on means "most rated". */
    static void forTest(boolean sort, boolean ads) {
        forTest(sort ? Mode.COUNT : Mode.OFF, false, ads);
    }

    private static synchronized void load() {
        if (sMode != null && sMinFour != null && sAds != null) return;
        Application app = SortOverlay.app();
        if (app == null) return;
        try {
            SharedPreferences p = app.getSharedPreferences(PREFS, Application.MODE_PRIVATE);
            if (sMode == null) {
                Mode saved = Mode.parse(p.getString("mode", null));
                // Before modes existed there was a single on/off "sort" flag meaning most rated.
                if (saved == null) saved = p.getBoolean("sort", false) ? Mode.COUNT : Mode.OFF;
                sMode = saved;
            }
            if (sMinFour == null) sMinFour = p.getBoolean("minFour", false);
            if (sAds == null) sAds = p.getBoolean("ads", false);
        } catch (Throwable ignored) {
            // keep defaults (off)
        }
    }

    private static void save(String key, Object value) {
        Application app = SortOverlay.app();
        if (app == null) return;
        try {
            SharedPreferences.Editor e = app.getSharedPreferences(PREFS, Application.MODE_PRIVATE).edit();
            if (value instanceof Boolean) e.putBoolean(key, (Boolean) value);
            else e.putString(key, String.valueOf(value));
            e.apply();
        } catch (Throwable ignored) {
            // best effort
        }
    }
}
