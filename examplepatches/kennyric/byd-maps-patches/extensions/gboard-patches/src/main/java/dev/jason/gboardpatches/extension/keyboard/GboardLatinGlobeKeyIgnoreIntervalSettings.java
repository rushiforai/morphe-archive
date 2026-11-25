package dev.jason.gboardpatches.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardLatinGlobeKeyIgnoreIntervalSettings {
    public static final String PREF_FILE = "gboard_latin_globe_key_ignore_interval";
    public static final String PREF_KEY_ENABLED =
            "pref_latin_globe_key_ignore_interval_enabled";
    public static final String PREF_KEY_INTERVAL_MS =
            "pref_latin_globe_key_ignore_interval_ms";
    public static final boolean DEFAULT_ENABLED = false;
    public static final int MIN_INTERVAL_MS = 0;
    public static final int MAX_INTERVAL_MS = 1000;
    public static final int DEFAULT_INTERVAL_MS = 500;

    private GboardLatinGlobeKeyIgnoreIntervalSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        Context applicationContext = context == null ? null : context.getApplicationContext();
        Context lookupContext = applicationContext != null ? applicationContext : context;
        if (lookupContext == null) {
            return null;
        }
        return lookupContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
    }

    public static void ensureDefaults(Context context) {
        if (context == null) {
            return;
        }
        ensureDefaults(preferences(context));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        SharedPreferences.Editor editor = null;
        if (!preferences.contains(PREF_KEY_ENABLED)) {
            editor = preferences.edit();
            editor.putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
        }
        if (!preferences.contains(PREF_KEY_INTERVAL_MS)) {
            if (editor == null) {
                editor = preferences.edit();
            }
            editor.putInt(PREF_KEY_INTERVAL_MS, DEFAULT_INTERVAL_MS);
        }
        if (editor != null) {
            editor.apply();
        }
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENABLED;
        }
        try {
            return preferences.getBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
        } catch (ClassCastException ignored) {
            return DEFAULT_ENABLED;
        }
    }

    public static int readIntervalMs(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_INTERVAL_MS;
        }
        try {
            return sanitizeIntervalMs(
                    preferences.getInt(PREF_KEY_INTERVAL_MS, DEFAULT_INTERVAL_MS));
        } catch (ClassCastException ignored) {
            return DEFAULT_INTERVAL_MS;
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putBoolean(PREF_KEY_ENABLED, enabled)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean writeIntervalMs(SharedPreferences preferences, int intervalMs) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putInt(PREF_KEY_INTERVAL_MS, sanitizeIntervalMs(intervalMs))
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static int sanitizeIntervalMs(int intervalMs) {
        return Math.max(MIN_INTERVAL_MS, Math.min(intervalMs, MAX_INTERVAL_MS));
    }
}
