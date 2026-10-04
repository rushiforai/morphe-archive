package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The profile-background switch.
 *
 * The app ships the feature behind an AB-test allow list
 * ({@code profile_bg_in_allow_list}), so the switch answers that gate for
 * accounts the server has not rolled out to. Off out of the box: the pickers
 * the app shows lead to a save the server still refuses for those accounts,
 * so a user who never saw the rollout gets an entry that cannot keep its
 * result.
 */
public final class ProfileBgSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_ENABLED = "profile_bg_enabled";

    private ProfileBgSettings() {}

    public static boolean isEnabled(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_ENABLED, false);
    }

    public static boolean isEnabled() {
        return isEnabled(appContext());
    }

    public static void setEnabled(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_ENABLED, value).apply();
    }

    /** The gate the patch asks: the master there is the switch itself. */
    public static boolean forceOn() {
        Context ctx = appContext();
        return ctx != null && isEnabled(ctx);
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static Context appContext() {
        return HandleSettings.appContext();
    }
}
