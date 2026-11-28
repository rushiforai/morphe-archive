package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The diagnostics switch. Off, the extension keeps the cheap lines and skips every stack walk; on,
 * it logs everything, including the app frames that name a caller.
 */
public final class DebugSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY = "debug_verbose";

    private DebugSettings() {}

    public static boolean isVerbose(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY, false);
    }

    public static void setVerbose(Context ctx, boolean value) {
        if (ctx == null) return;
        prefs(ctx).edit().putBoolean(KEY, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
