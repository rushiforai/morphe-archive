package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The switch behind the speed-up-only touch guard.
 * <p>
 * The value is read once per process: the guard runs on every touch event of the feed, and the
 * switch is only changed from the Tweaks screen, which asks for a restart.
 */
public final class SpeedOnlySettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "speed_up_only";

    private static volatile Boolean cached;

    private SpeedOnlySettings() {}

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return false;
        Boolean value = cached;
        if (value != null) return value;
        value = prefs(ctx).getBoolean(KEY_ENABLED, true);
        cached = value;
        return value;
    }

    public static void setEnabled(Context ctx, boolean value) {
        cached = value;
        if (ctx != null) prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    /** Drops the cached answer, so a reset is visible in this process too. */
    public static void invalidate() {
        cached = null;
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
