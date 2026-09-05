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
    public static final String KEY_HIDE_RATINGS_STYLE = "hide_ratings_style"; // cover: panel|link|shimmer|burst
    public static final String KEY_HIDE_RATINGS_ANIMATION = "hide_ratings_animation"; // default|crumble|confetti
    public static final String KEY_HIDE_RATINGS_CONFETTI_COLOR = "hide_ratings_confetti_color"; // accent|letterboxd
    public static final String KEY_HIDE_RATINGS_HAPTIC = "hide_ratings_haptic";

    // "Hide Video Store on home" — bundled into "Mod settings" itself, not its own patch.
    public static final String KEY_HIDE_VIDEO_STORE = "hide_video_store";

    // "Hide Where to Watch"
    public static final String KEY_HIDE_WHERE_TO_WATCH = "hide_where_to_watch";

    // "Open in player"
    public static final String KEY_OPEN_IN_PLAYER = "open_in_player";
    public static final String KEY_STREAMING_APP = "streaming_app"; // stremio | nuvio

    // "Match bottom nav to top bar color"
    public static final String KEY_MATCH_BOTTOM_NAV = "match_bottom_nav";

    // Bottom nav selected style: stock | nopill | white | accent | accentPill
    public static final String KEY_NAV_INDICATOR = "nav_indicator";

    // "Mod theme"
    public static final String KEY_THEME_SURFACE = "theme_surface"; // stock | oled
    public static final String KEY_THEME_OLED = "theme_oled";       // boolean mirror of the above
    public static final String KEY_THEME_ACCENT = "theme_accent";
    public static final String KEY_THEME_ACCENT_HEX = "theme_accent_hex";

    /** Resolves the surface style ({@code stock} or {@code oled}). */
    public static String surface() {
        String s = getString(KEY_THEME_SURFACE, "");
        if ("oled".equals(s)) return "oled";
        if (s.isEmpty() && getBoolean(KEY_THEME_OLED, false)) return "oled";
        return "stock";
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

    /** True only if the store loaded and the user has explicitly set this key. */
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

    /** Whether the "Video Store on home" row should be hidden. Off by default. */
    public static boolean hideVideoStore() {
        return getBoolean(KEY_HIDE_VIDEO_STORE, false);
    }

    /** Whether the film page's "Where to watch" section should be hidden. Off by default. */
    public static boolean hideWhereToWatch() {
        return getBoolean(KEY_HIDE_WHERE_TO_WATCH, false);
    }

    /** Whether the "Open in player" button should be shown. Off by default. */
    public static boolean openInPlayer() {
        return getBoolean(KEY_OPEN_IN_PLAYER, false);
    }

    /** Which app the "Open in player" button targets ({@code stremio} or {@code nuvio}). */
    public static String streamingApp() {
        return getString(KEY_STREAMING_APP, "stremio");
    }

    /** Tap-to-reveal transition ({@code default}, {@code crumble} or {@code confetti}). */
    public static String revealAnimation() {
        return getString(KEY_HIDE_RATINGS_ANIMATION, "confetti");
    }

    /** Confetti's palette source ({@code accent}, {@code letterboxd} or {@code red}). */
    public static String confettiColor() {
        return getString(KEY_HIDE_RATINGS_CONFETTI_COLOR, "letterboxd");
    }

    /** Whether a short vibration plays when the rating is revealed. On by default. */
    public static boolean hapticOnReveal() {
        return getBoolean(KEY_HIDE_RATINGS_HAPTIC, true);
    }
}
