package app.revanced.extension.rif;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Reads the ReVanced settings the patches expose in rif's settings UI.
 *
 * The checkboxes live in a "ReVanced" preference screen that inherits rif's base
 * settings fragment, so they write booleans to rif's "settings" SharedPreferences
 * file. The app Context comes from a hook in rif's Application.onCreate
 * ({@link #init}); reads are safe from any thread (e.g. the comment-render worker).
 */
public final class Settings {

    public static final String KEY_BLOCK_ADS = "BLOCK_ADS";
    public static final String KEY_INLINE_IMAGES = "INLINE_IMAGES";
    public static final String KEY_INLINE_IMAGES_SCALE = "INLINE_IMAGES_SCALE";
    public static final String KEY_INLINE_IMAGES_LIMIT_WIDTH = "INLINE_IMAGES_LIMIT_WIDTH";
    public static final String KEY_INLINE_IMAGES_MAX_WIDTH = "INLINE_IMAGES_MAX_WIDTH";
    public static final String KEY_INLINE_IMAGES_LIMIT_HEIGHT = "INLINE_IMAGES_LIMIT_HEIGHT";
    public static final String KEY_INLINE_IMAGES_MAX_HEIGHT = "INLINE_IMAGES_MAX_HEIGHT";
    public static final String KEY_INLINE_ALBUM_NAVIGATION = "INLINE_ALBUM_NAVIGATION";
    public static final String KEY_INLINE_IMAGES_LONG_PRESS_SELECT = "INLINE_IMAGES_LONG_PRESS_SELECT";
    public static final String KEY_INLINE_IMAGES_LONG_PRESS_DELAY = "INLINE_IMAGES_LONG_PRESS_DELAY";
    public static final String KEY_INLINE_VIDEOS = "INLINE_VIDEOS";
    public static final String KEY_INLINE_VIDEOS_AUTOPLAY = "INLINE_VIDEOS_AUTOPLAY";
    public static final String KEY_YOUTUBE_CAPTIONS_LANDSCAPE = "YOUTUBE_CAPTIONS_LANDSCAPE";
    public static final String KEY_YOUTUBE_CAPTIONS_VERTICAL = "YOUTUBE_CAPTIONS_VERTICAL";
    public static final String KEY_YOUTUBE_CAPTIONS_SHORTS = "YOUTUBE_CAPTIONS_SHORTS";
    public static final String KEY_HIDE_BLOCKED_DISTINGUISHED = "HIDE_BLOCKED_DISTINGUISHED";

    private static SharedPreferences prefs;
    private static Context appContext;

    private Settings() {}

    /**
     * Captures the application Context. Called from a hook injected into rif's
     * Application.onCreate, so we never depend on (hidden-API-restricted)
     * ActivityThread reflection to read preferences.
     */
    public static void init(Context context) {
        try {
            if (context != null && appContext == null) {
                appContext = context.getApplicationContext();
                prefs = null; // re-resolve against the real context
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * The app Context captured by {@link #init}, falling back to (hidden-API)
     * ActivityThread reflection if init() somehow hasn't run. May return null.
     */
    static Context context() {
        Context ctx = appContext;
        if (ctx != null) return ctx;
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (Throwable t) {
            return null;
        }
    }

    private static SharedPreferences prefs() {
        if (prefs == null) {
            try {
                Context ctx = context();
                if (ctx != null) {
                    // rif overrides the preference name to "settings" in its base
                    // settings fragment (RifBaseSettingsFragment.s4 ->
                    // setSharedPreferencesName("settings")), so our checkboxes — and
                    // these reads — must use that file, not the androidx default.
                    prefs = ctx.getSharedPreferences("settings", Context.MODE_PRIVATE);
                }
            } catch (Throwable ignored) {
            }
        }
        return prefs;
    }

    private static boolean get(String key, boolean def) {
        try {
            SharedPreferences p = prefs();
            return p == null ? def : p.getBoolean(key, def);
        } catch (Throwable t) {
            return def;
        }
    }

    public static boolean blockAds() {
        return get(KEY_BLOCK_ADS, true);
    }

    public static boolean inlineImages() {
        return get(KEY_INLINE_IMAGES, true);
    }

    public static boolean scaleInlineImages() {
        return get(KEY_INLINE_IMAGES_SCALE, true);
    }

    /** Inline media width cap, % of the comment width at full screen (10-100), or 0 when off. */
    public static int inlineMaxWidthPercent() {
        return get(KEY_INLINE_IMAGES_LIMIT_WIDTH, false) ? percent(KEY_INLINE_IMAGES_MAX_WIDTH) : 0;
    }

    /** Inline media height cap, % of the screen height (10-100), or 0 when off. */
    public static int inlineMaxHeightPercent() {
        return get(KEY_INLINE_IMAGES_LIMIT_HEIGHT, false) ? percent(KEY_INLINE_IMAGES_MAX_HEIGHT) : 0;
    }

    private static int percent(String key) {
        try {
            SharedPreferences p = prefs();
            int v = p == null ? 100 : p.getInt(key, 100);
            return Math.max(10, Math.min(100, v));
        } catch (Throwable t) {
            return 100;
        }
    }

    public static boolean inlineAlbumNavigation() {
        return get(KEY_INLINE_ALBUM_NAVIGATION, true);
    }

    public static boolean inlineVideos() {
        return inlineImages() && get(KEY_INLINE_VIDEOS, true);
    }

    public static boolean autoplayInlineVideos() {
        return get(KEY_INLINE_VIDEOS_AUTOPLAY, true);
    }

    /** Captions on by default: landscape videos (also when the shape is unknown). Off unless turned on. */
    public static boolean youtubeCaptionsLandscape() {
        return get(KEY_YOUTUBE_CAPTIONS_LANDSCAPE, false);
    }

    /** Captions on by default: vertical videos. */
    public static boolean youtubeCaptionsVertical() {
        return get(KEY_YOUTUBE_CAPTIONS_VERTICAL, false);
    }

    /** Captions on by default: videos opened from a youtube.com/shorts link. */
    public static boolean youtubeCaptionsShorts() {
        return get(KEY_YOUTUBE_CAPTIONS_SHORTS, false);
    }

    /** Hide distinguished (mod/admin) comments from blocked users. Off unless turned on. */
    public static boolean hideBlockedDistinguished() {
        return get(KEY_HIDE_BLOCKED_DISTINGUISHED, false);
    }

    public static boolean longPressImageSelectsComment() {
        return get(KEY_INLINE_IMAGES_LONG_PRESS_SELECT, true);
    }

    /** Hold time (ms) for a long press on an inline image (a slider, 100-1000). */
    public static int longPressImageDelayMs() {
        try {
            SharedPreferences p = prefs();
            int ms = p == null ? 250 : p.getInt(KEY_INLINE_IMAGES_LONG_PRESS_DELAY, 250);
            return Math.max(100, Math.min(1000, ms));
        } catch (Throwable t) {
            return 250;
        }
    }
}
