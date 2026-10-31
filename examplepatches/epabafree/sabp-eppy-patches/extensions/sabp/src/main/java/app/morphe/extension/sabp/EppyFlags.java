package app.morphe.extension.sabp;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Kill switches for eppy's large optional features (Settings → Diagnostics → Feature switches).
 * Turning one off isolates a regression without re-patching; the feature hides itself or shows
 * "Turned off in Diagnostics" instead of an inert control.
 */
public final class EppyFlags {
    public static final String BLUR = "blur";
    public static final String ONLINE_LOOKUP = "onlineLookup";
    public static final String READ_ALONG = "readAlong";
    public static final String STATISTICS = "statistics";
    public static final String TERM_LOOKUP = "termLookup";
    public static final String GESTURES = "gestures";

    public static final String[] ALL = {READ_ALONG, ONLINE_LOOKUP, STATISTICS, BLUR, TERM_LOOKUP, GESTURES};

    private EppyFlags() {
    }

    private static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences("eppy_flags", Context.MODE_PRIVATE);
    }

    public static boolean on(Context c, String flag) {
        if (c == null) return true;
        return prefs(c).getBoolean(flag, true);
    }

    public static void set(Context c, String flag, boolean value) {
        prefs(c).edit().putBoolean(flag, value).apply();
        EppyDiag.log("flags", flag + " → " + (value ? "on" : "off"));
    }

    public static String title(String flag) {
        switch (flag) {
            case READ_ALONG: return "Read along";
            case ONLINE_LOOKUP: return "Online book information";
            case STATISTICS: return "eppy listening log";
            case BLUR: return "Blur effects";
            case TERM_LOOKUP: return "Word and term lookup";
            case GESTURES: return "Cover gestures (double-tap seek)";
            default: return flag;
        }
    }
}
