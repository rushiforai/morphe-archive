package dev.jason.gboardpatches.extension.closeproactivesuggestions;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettings;

public final class GboardCloseProactiveSuggestionsSettings {
    public static final String PREF_KEY_ENABLED =
            "pref_close_proactive_suggestions_access_point_enabled";
    public static final boolean DEFAULT_ENABLED = true;

    private GboardCloseProactiveSuggestionsSettings() {
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        try {
            return GboardBooleanFlagSettings.readEnabled(
                    preferences,
                    PREF_KEY_ENABLED,
                    DEFAULT_ENABLED);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void ensureDefault(SharedPreferences preferences) {
        try {
            GboardBooleanFlagSettings.ensureDefault(
                    preferences,
                    PREF_KEY_ENABLED,
                    DEFAULT_ENABLED);
        } catch (Throwable ignored) {
            // The feature screen safely falls back without propagating into Gboard.
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        try {
            return GboardBooleanFlagSettings.writeEnabled(
                    preferences,
                    PREF_KEY_ENABLED,
                    enabled);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
