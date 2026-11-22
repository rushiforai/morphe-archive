package dev.supperelias2.sbs.morphe;

import android.app.Activity;
import android.content.SharedPreferences;

/** Test-only bridge: policy/action checks never start the Android watchdog. */
public final class MorpheSettings {
    public static boolean enabled(String key, boolean fallback) { return fallback; }
    public static Activity getActivity() { return null; }
    public static SharedPreferences getPreferences() { return null; }
}
