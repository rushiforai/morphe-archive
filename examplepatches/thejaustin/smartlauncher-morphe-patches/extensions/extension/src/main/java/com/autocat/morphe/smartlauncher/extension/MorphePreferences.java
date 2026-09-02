package com.autocat.morphe.smartlauncher.extension;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Manages persistent user preferences for Morphe Smart Launcher patches.
 */
public final class MorphePreferences {
    private static final String PREF_NAME = "morphe_smartlauncher_prefs";
    public static final String KEY_HIDE_ARCHIVED = "hide_archived_apps";
    public static final String KEY_USE_SHIZUKU = "use_shizuku_archiving";
    public static final String KEY_USE_NATIVE = "use_native_archiving";

    private MorphePreferences() {}

    public static SharedPreferences getPrefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
    }

    public static boolean isHideArchivedEnabled(Context context) {
        try {
            return getPrefs(context).getBoolean(KEY_HIDE_ARCHIVED, true);
        } catch (Throwable t) {
            return true;
        }
    }

    public static void setHideArchivedEnabled(Context context, boolean enabled) {
        try {
            getPrefs(context).edit().putBoolean(KEY_HIDE_ARCHIVED, enabled).apply();
        } catch (Throwable ignored) {}
    }

    public static boolean isShizukuEnabled(Context context) {
        try {
            return getPrefs(context).getBoolean(KEY_USE_SHIZUKU, false);
        } catch (Throwable t) {
            return false;
        }
    }

    public static void setShizukuEnabled(Context context, boolean enabled) {
        try {
            getPrefs(context).edit().putBoolean(KEY_USE_SHIZUKU, enabled).apply();
        } catch (Throwable ignored) {}
    }

    public static boolean isNativeEnabled(Context context) {
        try {
            return getPrefs(context).getBoolean(KEY_USE_NATIVE, true);
        } catch (Throwable t) {
            return true;
        }
    }

    public static void setNativeEnabled(Context context, boolean enabled) {
        try {
            getPrefs(context).edit().putBoolean(KEY_USE_NATIVE, enabled).apply();
        } catch (Throwable ignored) {}
    }
}
