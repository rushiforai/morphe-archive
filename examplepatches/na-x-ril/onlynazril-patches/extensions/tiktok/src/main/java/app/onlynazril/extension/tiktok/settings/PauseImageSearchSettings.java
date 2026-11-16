package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The pause-panel image-search switch.
 * <p>
 * On out of the box, so both image-search surfaces are hidden until the user asks for them back.
 * Off makes the pause item manager return its list and the visual search tag gate answer as before,
 * which restores TikTok's entries without touching the photo-search feature itself.
 */
public final class PauseImageSearchSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_DISABLED = "pause_image_search_disabled";

    private PauseImageSearchSettings() {}

    public static boolean isDisabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_DISABLED, true);
    }

    public static boolean isDisabled() {
        return isDisabled(HandleSettings.appContext());
    }

    public static void setDisabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_DISABLED, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
