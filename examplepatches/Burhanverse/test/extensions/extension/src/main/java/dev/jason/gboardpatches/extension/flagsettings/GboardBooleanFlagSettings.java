package dev.jason.gboardpatches.extension.flagsettings;

import android.content.SharedPreferences;

import java.util.Map;

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
        Map<String, ?> values = preferences.getAll();
        if (!values.containsKey(preferenceKey)) {
            return defaultEnabled;
        }
        Object raw = values.get(preferenceKey);
        if (raw instanceof Boolean value) {
            return value.booleanValue();
        }
        if (raw instanceof String value) {
            if ("true".equalsIgnoreCase(value)) {
                return true;
            }
            if ("false".equalsIgnoreCase(value)) {
                return false;
            }
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
