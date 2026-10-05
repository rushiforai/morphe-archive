package app.template.extension.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Single {@link SharedPreferences} store shared by every patch's runtime code and by
 * {@link ModSettingsFragment}. Keys are namespaced per feature.
 *
 * <p>{@link #load(Context)} is called from {@code LetterboxdApplication.onCreate} (by the
 * "Mod settings" patch) and, defensively, from feature code that has a {@link Context} to hand.
 * Every accessor is null- and exception-safe: if the store never loaded, callers get their
 * supplied default and the patch behaves as if there were no settings screen at all.
 */
public final class Prefs {

    public static final String NAME = "morphe_letterboxd";

    // "Hide ratings until watched"
    public static final String KEY_HIDE_RATINGS_ENABLED = "hide_ratings_enabled";
    public static final String KEY_HIDE_RATINGS_STYLE = "hide_ratings_style";
    public static final String KEY_HIDE_RATINGS_ANIMATION = "hide_ratings_animation";
    public static final String KEY_HIDE_RATINGS_CONFETTI_COLOR = "hide_ratings_confetti_color";
    public static final String KEY_HIDE_RATINGS_HAPTIC = "hide_ratings_haptic";

    // "Hide Video Store on home"
    public static final String KEY_HIDE_VIDEO_STORE = "hide_video_store";

    // "Home tabs"
    public static final String KEY_HOME_TABS = "home_tabs";

    // "Hide Where to Watch"
    public static final String KEY_HIDE_WHERE_TO_WATCH = "hide_where_to_watch";

    // "Runtime as 1h 47m"
    public static final String KEY_RUNTIME_HHMM = "runtime_hhmm";

    // "Open in player"
    public static final String KEY_OPEN_IN_PLAYER = "open_in_player";
    public static final String KEY_STREAMING_APP = "streaming_app"; // stremio | nuvio | cloudstream

    // "Match bottom nav to top bar color"
    public static final String KEY_MATCH_BOTTOM_NAV = "match_bottom_nav";

    // Bottom nav selected style
    public static final String KEY_NAV_INDICATOR = "nav_indicator";

    // "Bottom navigation"
    public static final String KEY_NAV_ITEMS = "nav_items";
    public static final String KEY_LAUNCH_TAB = "launch_tab";

    // "Mod theme"
    public static final String KEY_THEME_SURFACE = "theme_surface"; // stock | oled | purple | midnight
    public static final String KEY_THEME_OLED = "theme_oled";       // legacy boolean mirror
    public static final String KEY_THEME_ACCENT = "theme_accent";
    public static final String KEY_THEME_ACCENT_HEX = "theme_accent_hex";

    // "Custom poster (local)" — JSON map of filmSlug -> posterUrl
    public static final String KEY_CUSTOM_POSTERS = "custom_posters";

    // "Custom poster (local)" — JSON map of filmSlug -> backdropUrl (separate from posters)
    public static final String KEY_CUSTOM_BACKDROPS = "custom_backdrops";

    // Profile banner image URL (single value, not per-film)
    public static final String KEY_PROFILE_BACKDROP = "profile_backdrop";

    // TMDB API key for the poster picker (user-supplied, free from themoviedb.org)
    public static final String KEY_TMDB_API_KEY = "tmdb_api_key";

    /**
     * Resolves the surface style: {@code stock}, {@code oled}, {@code purple}, or {@code midnight}.
     *
     * <p>Backward compatible with the old boolean-only pref: if {@code KEY_THEME_SURFACE} is unset
     * but {@code KEY_THEME_OLED} is true, still resolves to {@code oled}.
     */
    public static String surface() {
        String s = getString(KEY_THEME_SURFACE, "");
        if (s.isEmpty() && getBoolean(KEY_THEME_OLED, false)) return "oled";
        return s.isEmpty() ? "stock" : s;
    }

    private static SharedPreferences sp;

    private Prefs() {}

    public static void load(Context context) {
        try {
            if (sp == null && context != null) {
                Context app = context.getApplicationContext();
                sp = (app != null ? app : context)
                        .getSharedPreferences(NAME, Context.MODE_PRIVATE);
            }
        } catch (Throwable ignored) {
        }
    }

    public static boolean has(String key) {
        try {
            return sp != null && sp.contains(key);
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean getBoolean(String key, boolean fallback) {
        try {
            return sp != null ? sp.getBoolean(key, fallback) : fallback;
        } catch (Throwable t) {
            return fallback;
        }
    }

    public static String getString(String key, String fallback) {
        try {
            if (sp == null) return fallback;
            String value = sp.getString(key, fallback);
            return (value == null || value.isEmpty()) ? fallback : value;
        } catch (Throwable t) {
            return fallback;
        }
    }

    public static void putString(String key, String value) {
        try {
            if (sp != null) sp.edit().putString(key, value).apply();
        } catch (Throwable ignored) {
        }
    }

    public static void putBoolean(String key, boolean value) {
        try {
            if (sp != null) sp.edit().putBoolean(key, value).apply();
        } catch (Throwable ignored) {
        }
    }

    public static boolean hideVideoStore() {
        return getBoolean(KEY_HIDE_VIDEO_STORE, false);
    }

    public static boolean hideWhereToWatch() {
        return getBoolean(KEY_HIDE_WHERE_TO_WATCH, false);
    }

    public static boolean openInPlayer() {
        return getBoolean(KEY_OPEN_IN_PLAYER, false);
    }

    public static String streamingApp() {
        return getString(KEY_STREAMING_APP, "stremio");
    }

    public static String revealAnimation() {
        return getString(KEY_HIDE_RATINGS_ANIMATION, "confetti");
    }

    public static String confettiColor() {
        return getString(KEY_HIDE_RATINGS_CONFETTI_COLOR, "letterboxd");
    }

    public static boolean hapticOnReveal() {
        return getBoolean(KEY_HIDE_RATINGS_HAPTIC, true);
    }

    // --- Custom poster (local) ------------------------------------------

    /** True if the user has configured a TMDB API key for the custom-poster picker. */
    public static boolean hasTmdbKey() {
        String k = getString(KEY_TMDB_API_KEY, "");
        return k != null && !k.trim().isEmpty();
    }

    /** The user's TMDB API key, or empty string. */
    public static String tmdbKey() {
        return getString(KEY_TMDB_API_KEY, "");
    }

    /** Stores the user's TMDB API key. Empty clears it. */
    public static void setTmdbKey(String key) {
        putString(KEY_TMDB_API_KEY, key == null ? "" : key.trim());
    }
}
