package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The download switches.
 *
 * The master is off out of the box, so a fresh install downloads nothing until it is asked to. Once
 * it is on, the three below say how: whether the file is fetched without the watermark, whether the
 * entry is offered in every share sheet (not only a photo post's), and whether the highest bitrate
 * variant is taken instead of the default one.
 */
public final class DownloadSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "download_enabled";
    private static final String KEY_NO_WATERMARK = "download_no_watermark";
    private static final String KEY_EVERY_SHEET = "download_every_sheet";
    private static final String KEY_BEST_QUALITY = "download_best_quality";

    private DownloadSettings() {}

    public static boolean isEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_ENABLED, false);
    }

    public static boolean isEnabled() {
        return isEnabled(appContext());
    }

    public static boolean isNoWatermarkEnabled(Context ctx) {
        return ctx == null || prefs(ctx).getBoolean(KEY_NO_WATERMARK, true);
    }

    public static boolean isEverySheetEnabled(Context ctx) {
        return ctx == null || prefs(ctx).getBoolean(KEY_EVERY_SHEET, true);
    }

    public static boolean isBestQualityEnabled(Context ctx) {
        return ctx == null || prefs(ctx).getBoolean(KEY_BEST_QUALITY, true);
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    public static void setNoWatermarkEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_NO_WATERMARK, value).apply();
    }

    public static void setEverySheetEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_EVERY_SHEET, value).apply();
    }

    public static void setBestQualityEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_BEST_QUALITY, value).apply();
    }

    /** The gate the hooks ask: the master, and the one that decides where the entry appears. */
    public static boolean everySheetOn() {
        Context ctx = appContext();
        return ctx != null && isEnabled(ctx) && isEverySheetEnabled(ctx);
    }

    /** The gate the URL substitution asks. */
    public static boolean noWatermarkOn() {
        Context ctx = appContext();
        return ctx != null && isEnabled(ctx) && isNoWatermarkEnabled(ctx);
    }

    /** The gate the quality resolver asks. */
    public static boolean bestQualityOn() {
        Context ctx = appContext();
        return ctx != null && isEnabled(ctx) && isBestQualityEnabled(ctx);
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
