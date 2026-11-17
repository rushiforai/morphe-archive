package app.tiktoktweaks;

import android.content.Context;
import android.content.SharedPreferences;

/** Settings store. Holds the patch options and their defaults. */
public final class Prefs {
    static final String ADS = "remove_ads";
    static final String SHOP = "hide_shop";
    static final String LIVE = "hide_live";
    static final String STORY = "hide_story";
    static final String IMAGE = "hide_image";
    static final String OFFLINE = "disable_offline";
    static final String TAKO = "hide_tako";
    static final String WATERMARK = "remove_watermark";
    static final String PATH = "down_path";
    static final String CLEAR = "clear_display";
    static final String SPEED = "remembered_speed";
    static final String UI_SCALE = "ui_scale";
    static final String SMALLER_TEXT = "smaller_text";
    static final String TEXT_LEVEL = "text_level";
    private static final int EXTRA_STOPS = 3;
    static final String COMMENT_STICKERS = "hide_comment_stickers";
    static final String REMUTE = "show_remute";
    static final String ACTIVITY_COMMENTS = "activity_comments";
    static final String DEFAULT_PATH = "DCIM/TikTok";

    private static volatile SharedPreferences prefs;

    private Prefs() {}

    public static void init(Context context) {
        if (prefs != null || context == null) return;
        Context app = context.getApplicationContext();
        prefs = (app != null ? app : context).getSharedPreferences("revanced_tiktok", Context.MODE_PRIVATE);
    }

    static boolean bool(String key, boolean fallback) {
        SharedPreferences p = prefs;
        return p == null ? fallback : p.getBoolean(key, fallback);
    }

    static int number(String key, int fallback) {
        SharedPreferences p = prefs;
        return p == null ? fallback : p.getInt(key, fallback);
    }

    static void put(String key, boolean value) {
        SharedPreferences p = prefs;
        if (p != null) p.edit().putBoolean(key, value).apply();
    }

    static void put(String key, int value) {
        SharedPreferences p = prefs;
        if (p != null) p.edit().putInt(key, value).apply();
    }

    static void put(String key, String value) {
        SharedPreferences p = prefs;
        if (p != null) p.edit().putString(key, value).apply();
    }

    static float speed() {
        SharedPreferences p = prefs;
        return p == null ? 1f : p.getFloat(SPEED, 1f);
    }

    static void speed(float value) {
        SharedPreferences p = prefs;
        if (p != null) p.edit().putFloat(SPEED, value).apply();
    }

    static boolean removeAds() { return bool(ADS, true); }
    static boolean hideLive() { return bool(LIVE, true); }
    static boolean hideStory() { return bool(STORY, true); }
    static boolean hideImage() { return bool(IMAGE, false); }

    // Called from patched TikTok gates, which return false when these are true.
    public static boolean hideShop() { return bool(SHOP, true); }
    public static boolean disableOffline() { return bool(OFFLINE, true); }

    private static int extraStops() { return bool(SMALLER_TEXT, true) ? EXTRA_STOPS : 0; }

    /** Text slider: adds stops below TikTok's smallest. TikTok's own four positions are untouched. */
    public static int sliderMax(int original) { return original + extraStops(); }

    public static int modeToPos(int mode) {
        int extra = extraStops();
        if (extra == 0) return mode;
        return mode > 0 ? mode + extra : extra - number(TEXT_LEVEL, 0);
    }

    public static int posToMode(int position) {
        return Math.max(position - extraStops(), 0);
    }

    /** Called when the slider is confirmed; TikTok stores the mode, the extra level is ours. */
    public static int commitPos(int position) {
        int extra = extraStops();
        put(TEXT_LEVEL, position < extra ? extra - position : 0);
        return posToMode(position);
    }

    public static boolean smallStep(int mode) {
        return mode == 0 && extraStops() > 0 && number(TEXT_LEVEL, 0) > 0;
    }

    public static boolean hideCommentStickers() { return bool(COMMENT_STICKERS, true); }

    public static boolean hideTako() { return bool(TAKO, true); }
    static boolean activityOnComments() { return bool(ACTIVITY_COMMENTS, true); }

    /** The Activity dropdown's starting value; X.0Cwe.LIZLLL is TikTok's Comments group. */
    public static int activityGroup(int original) {
        if (!bool(ACTIVITY_COMMENTS, true)) return original;
        try {
            return Class.forName("X.0Cwe").getField("LIZLLL").getInt(null);
        } catch (Throwable t) {
            return original;
        }
    }

    /** Scale for the extra stops below TikTok's smallest (level 1 is the closest to it). */
    public static float fontFactor() {
        switch (number(TEXT_LEVEL, 0)) {
            case 1: return 0.93f;
            case 2: return 0.87f;
            case 3: return 0.8f;
            default: return 1f;
        }
    }

    /** Called from ACLCommonShare.getTranscode(). */
    public static int transcode(int original) {
        return bool(WATERMARK, false) ? 1 : original;
    }

    static String rawPath() {
        SharedPreferences p = prefs;
        String path = p == null ? DEFAULT_PATH : p.getString(PATH, DEFAULT_PATH);
        return path == null ? DEFAULT_PATH : path;
    }

    /** MediaStore wants a path relative to shared storage, without surrounding slashes. */
    public static String downloadPath() {
        String path = rawPath().trim().replaceFirst("^/?(storage/emulated/0|sdcard)/", "");
        path = path.replaceAll("^/+|/+$", "");
        return path.isEmpty() ? DEFAULT_PATH : path;
    }

    public static String downloadPathSlash() {
        return downloadPath() + "/";
    }
}
