package dev.jason.gboardpatches.extension.customtheme;

import android.content.SharedPreferences;

/** Runtime setting for the Custom Theme feature. */
final class GboardCustomThemeSettings {
    static final String ENABLED_KEY = "pref_custom_theme_enabled";
    static final boolean DEFAULT_ENABLED = false;

    private GboardCustomThemeSettings() {
    }

    static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENABLED;
        }
        try {
            Object raw = preferences.getAll().get(ENABLED_KEY);
            if (raw instanceof Boolean value) {
                return value;
            }
            if (raw instanceof String value) {
                return Boolean.parseBoolean(value.trim());
            }
        } catch (Throwable ignored) {
            // Invalid or unavailable preferences fail closed.
        }
        return DEFAULT_ENABLED;
    }

    static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        return preferences != null && preferences.edit().putBoolean(ENABLED_KEY, enabled).commit();
    }
}
