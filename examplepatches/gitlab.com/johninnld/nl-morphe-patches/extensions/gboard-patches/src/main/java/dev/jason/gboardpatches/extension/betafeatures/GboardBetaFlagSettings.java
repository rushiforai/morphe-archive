package dev.jason.gboardpatches.extension.betafeatures;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettings;

/**
 * Persistent switches for the 18.8 beta gates forced by {@link GboardBetaFlagRuntime}.
 *
 * There is one master switch and one switch per flag: a flag is only forced while both are on,
 * so the whole group can be turned off without losing the individual choices.
 */
public final class GboardBetaFlagSettings {
    public static final String PREF_KEY_ENABLED = "pref_beta_flags_enabled";
    public static final boolean DEFAULT_ENABLED = true;

    private static final String PREF_KEY_FLAG_PREFIX = "pref_beta_flag_";
    public static final boolean DEFAULT_FLAG_ENABLED = true;

    private GboardBetaFlagSettings() {
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        try {
            return GboardBooleanFlagSettings.readEnabled(
                    preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void ensureDefault(SharedPreferences preferences) {
        try {
            GboardBooleanFlagSettings.ensureDefault(
                    preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        } catch (Throwable ignored) {
            // The feature screen falls back to its warning state.
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        try {
            return GboardBooleanFlagSettings.writeEnabled(
                    preferences, PREF_KEY_ENABLED, enabled);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Preference key of one flag's own switch, or null when the name is unusable. */
    public static String flagKey(String flagName) {
        if (flagName == null || flagName.isEmpty()) {
            return null;
        }
        return PREF_KEY_FLAG_PREFIX + flagName;
    }

    public static void ensureFlagDefault(SharedPreferences preferences, String flagName) {
        try {
            GboardBooleanFlagSettings.ensureDefault(
                    preferences, flagKey(flagName), DEFAULT_FLAG_ENABLED);
        } catch (Throwable ignored) {
            // Same fallback as the master switch.
        }
    }

    public static boolean readFlagEnabled(SharedPreferences preferences, String flagName) {
        try {
            return GboardBooleanFlagSettings.readEnabled(
                    preferences, flagKey(flagName), DEFAULT_FLAG_ENABLED);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean writeFlagEnabled(
            SharedPreferences preferences,
            String flagName,
            boolean enabled) {
        try {
            return GboardBooleanFlagSettings.writeEnabled(
                    preferences, flagKey(flagName), enabled);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
