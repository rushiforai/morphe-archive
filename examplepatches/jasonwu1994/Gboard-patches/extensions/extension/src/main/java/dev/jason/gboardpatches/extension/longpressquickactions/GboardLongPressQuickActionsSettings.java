package dev.jason.gboardpatches.extension.longpressquickactions;

import android.content.Context;
import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

public final class GboardLongPressQuickActionsSettings {
    public static final String PREF_KEY_ENABLED =
            "pref_long_press_quick_actions_enabled";
    public static final boolean DEFAULT_ENABLED = true;

    private GboardLongPressQuickActionsSettings() {
    }

    public static boolean readEnabled(Context context) {
        SharedPreferences preferences = GboardPatchesSettings.preferences(context);
        ensureDefault(preferences);
        return readEnabled(preferences);
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENABLED;
        }
        Object raw = preferences.getAll().get(PREF_KEY_ENABLED);
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
        return DEFAULT_ENABLED;
    }

    public static void ensureDefault(SharedPreferences preferences) {
        if (preferences == null || preferences.contains(PREF_KEY_ENABLED)) {
            return;
        }
        preferences.edit()
                .putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED)
                .commit();
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        if (context == null) {
            return false;
        }
        SharedPreferences preferences = GboardPatchesSettings.preferences(context);
        return writeEnabled(preferences, enabled);
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) {
            return false;
        }
        return preferences.edit()
                .putBoolean(PREF_KEY_ENABLED, enabled)
                .commit();
    }
}

