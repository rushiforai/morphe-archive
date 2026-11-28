package app.onlynazril.extension.tiktok.settings;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * The feed search suggestion switch.
 * <p>
 * On out of the box, so the Search · <query> bar under a feed video is hidden until the user asks
 * for it back. Off lets both trigger versions answer as before.
 */
public final class FeedSearchSettings {
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_HIDDEN = "feed_search_hidden";

    private FeedSearchSettings() {}

    public static boolean isHidden(Context ctx) {
        if (ctx == null) return true;
        return prefs(ctx).getBoolean(KEY_HIDDEN, true);
    }

    public static boolean isHidden() {
        return isHidden(HandleSettings.appContext());
    }

    public static void setHidden(Context ctx, boolean value) {
        prefs(ctx).edit().putBoolean(KEY_HIDDEN, value).apply();
    }

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }
}
