package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The app-refresh-rate choice.
 * <p>
 * `0` means the system default: Android and TikTok keep their own decision. The other values are
 * the fixed rates the Tweaks screen offers. Anything else falls back to the default, so a bad
 * stored value can never make the app ask for a rate the screen does not show.
 */
public final class RefreshRateSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_FPS = "refresh_rate_fps";

    public static final int DEFAULT_FPS = 0;
    public static final int[] CHOICES = {DEFAULT_FPS, 60, 90, 120};

    private RefreshRateSettings() {}

    public static int fps(Context ctx) {
        if (ctx == null) return DEFAULT_FPS;
        int value = prefs(ctx).getInt(KEY_FPS, DEFAULT_FPS);
        for (int choice : CHOICES) {
            if (choice == value) return value;
        }
        return DEFAULT_FPS;
    }

    public static int fps() {
        return fps(HandleSettings.appContext());
    }

    public static void setFps(Context ctx, int fps) {
        if (ctx == null) return;
        int value = DEFAULT_FPS;
        for (int choice : CHOICES) {
            if (choice == fps) {
                value = fps;
                break;
            }
        }
        prefs(ctx).edit().putInt(KEY_FPS, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
