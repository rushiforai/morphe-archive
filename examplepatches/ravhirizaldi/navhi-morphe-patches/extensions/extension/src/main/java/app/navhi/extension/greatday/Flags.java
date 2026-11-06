package app.navhi.extension.greatday;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * What the app is allowed to notice about the device. All false by default,
 * which is the patched behaviour; the switches in {@link SettingsActivity}
 * only matter if someone wants the stock answer back.
 */
@SuppressWarnings("unused")
public final class Flags {
    private static final String PREFS = "navhi";

    private Flags() {
    }

    private static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, 0);
    }

    public static boolean get(Context context, String key) {
        return prefs(context).getBoolean(key, false);
    }

    public static void put(Context context, String key, boolean value) {
        prefs(context).edit().putBoolean(key, value).apply();
    }
}
