package dev.srwi.gintype.extension.flagsettings;

import android.content.SharedPreferences;

public final class GboardBooleanFlagSettings {
    private GboardBooleanFlagSettings() {
    }

    public static boolean readEnabled(
            SharedPreferences preferences,
            String preferenceKey,
            boolean defaultEnabled) {
        if (preferences == null || preferenceKey == null || preferenceKey.isEmpty()) {
            return false;
        }
        if (!preferences.contains(preferenceKey)) {
            return defaultEnabled;
        }
        try {
            boolean asFalseDefault = preferences.getBoolean(preferenceKey, false);
            boolean asTrueDefault = preferences.getBoolean(preferenceKey, true);
            if (asFalseDefault == asTrueDefault) {
                return asFalseDefault;
            }
        } catch (ClassCastException ignored) {
        }
        try {
            String raw = preferences.getString(preferenceKey, null);
            if ("true".equalsIgnoreCase(raw)) {
                return true;
            }
            if ("false".equalsIgnoreCase(raw)) {
                return false;
            }
        } catch (ClassCastException ignored) {
        }
        return false;
    }

    public static void ensureDefault(
            SharedPreferences preferences,
            String preferenceKey,
            boolean defaultEnabled) {
        if (preferences == null || preferenceKey == null || preferenceKey.isEmpty()
                || preferences.contains(preferenceKey)) {
            return;
        }
        preferences.edit().putBoolean(preferenceKey, defaultEnabled).commit();
    }

    public static boolean writeEnabled(
            SharedPreferences preferences,
            String preferenceKey,
            boolean enabled) {
        if (preferences == null || preferenceKey == null || preferenceKey.isEmpty()) {
            return false;
        }
        return preferences.edit().putBoolean(preferenceKey, enabled).commit();
    }
}
