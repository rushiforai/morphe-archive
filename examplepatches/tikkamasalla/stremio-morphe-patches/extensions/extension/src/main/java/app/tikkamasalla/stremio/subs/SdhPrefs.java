package app.tikkamasalla.stremio.subs;

import android.content.Context;
import android.content.SharedPreferences;

/** Avoid SDH subtitles settings, stored in a dedicated file so Stremio keys are never touched. */
public final class SdhPrefs {
    public static final String FILE = "sdh_prefs";
    public static final String KEY_AVOID = "sdh_avoid";
    public static final String KEY_CLEAN = "sdh_clean";

    private SdhPrefs() {
    }

    public static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    public static boolean isAvoidEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_AVOID, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static boolean isCleanEnabled(Context context) {
        try {
            return prefs(context).getBoolean(KEY_CLEAN, true);
        } catch (Throwable ignored) {
            return true;
        }
    }
}
