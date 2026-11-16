package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The hide-captcha switch.
 * <p>
 * One switch, on out of the box. Off leaves every risk-control puzzle exactly as TikTok raised it.
 * Account verification is never hidden by the bridge whatever this says, so the switch only governs
 * the puzzle that interrupts browsing.
 */
public final class CaptchaSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_HIDE = "captcha_hide_enabled";

    private CaptchaSettings() {}

    public static boolean isEnabled(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_HIDE, true);
    }

    public static boolean isEnabled() {
        return isEnabled(HandleSettings.appContext());
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_HIDE, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
