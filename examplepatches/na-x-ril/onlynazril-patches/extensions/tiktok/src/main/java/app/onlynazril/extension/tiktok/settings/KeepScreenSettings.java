package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The keep-screen switch.
 * <p>
 * One flag, on out of the box. It only holds a window awake while that screen is resumed, so the
 * cost is limited to the time TikTok is actually in front; off returns the system timeout.
 */
public final class KeepScreenSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY = "keep_screen_enabled";

    private KeepScreenSettings() {}

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY, true);
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
