package dev.jason.gboardpatches.extension.cursortrackpad;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettings;

public final class GboardCursorTrackpadSettings {
    public static final String PREF_KEY_ENABLED = "pref_force_cursor_trackpad_mode";
    public static final boolean DEFAULT_ENABLED = true;

    private static volatile boolean cachedEnabled = true;
    private static volatile boolean cachedInitialized = true;

    private GboardCursorTrackpadSettings() {
    }

    public static boolean isCachedEnabled() {
        return cachedInitialized ? cachedEnabled : DEFAULT_ENABLED;
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences != null) {
            boolean enabled = GboardBooleanFlagSettings.readEnabled(
                    preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
            cachedEnabled = enabled;
            cachedInitialized = true;
            return enabled;
        }
        return cachedInitialized ? cachedEnabled : DEFAULT_ENABLED;
    }

    public static void ensureDefault(SharedPreferences preferences) {
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        if (preferences != null && preferences.contains(PREF_KEY_ENABLED)) {
            cachedEnabled = GboardBooleanFlagSettings.readEnabled(
                    preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
            cachedInitialized = true;
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        cachedEnabled = enabled;
        cachedInitialized = true;
        return GboardBooleanFlagSettings.writeEnabled(preferences, PREF_KEY_ENABLED, enabled);
    }
}
