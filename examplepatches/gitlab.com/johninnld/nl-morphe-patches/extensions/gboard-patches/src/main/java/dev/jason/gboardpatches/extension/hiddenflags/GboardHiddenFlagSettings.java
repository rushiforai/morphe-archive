package dev.jason.gboardpatches.extension.hiddenflags;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettings;

/** Per-flag preference for the hidden-flag overrides. */
public final class GboardHiddenFlagSettings {
    private static final String KEY_PREFIX = "hidden_flag.";
    /** Present only after a real toggle, so a value written by merely opening the screen is ignored. */
    private static final String EXPLICIT_PREFIX = "hidden_flag_explicit.";

    private GboardHiddenFlagSettings() {
    }

    public static String preferenceKey(String flagName) {
        return KEY_PREFIX + flagName;
    }

    public static boolean readEnabled(SharedPreferences preferences, String flagName) {
        if (preferences == null || flagName == null || flagName.isEmpty()) {
            return false;
        }
        try {
            // Old versions persisted false when merely opening the screen. Only an explicit
            // choice supersedes the on-by-default behavior.
            return !preferences.contains(explicitKey(flagName))
                    || GboardBooleanFlagSettings.readEnabled(
                            preferences, preferenceKey(flagName), false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static String explicitKey(String flagName) {
        return EXPLICIT_PREFIX + flagName;
    }

    public static boolean writeEnabled(
            SharedPreferences preferences, String flagName, boolean enabled) {
        if (preferences == null || flagName == null || flagName.isEmpty()) {
            return false;
        }
        try {
            return preferences.edit()
                    .putBoolean(preferenceKey(flagName), enabled)
                    .putBoolean(explicitKey(flagName), enabled)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }
}
