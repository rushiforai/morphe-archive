package dev.jason.gboardpatches.extension.splitkeyboard;

import android.content.SharedPreferences;

import dev.jason.gboardpatches.extension.flagsettings.GboardBooleanFlagSettings;

public final class GboardSplitKeyboardSettings {
    public static final String PREF_KEY_ENABLED = "pref_force_split_keyboard_enabled";
    public static final boolean DEFAULT_ENABLED = true;
    public static final String PREF_KEY_AUTO_SPLIT_ENABLED =
            "pref_auto_split_keyboard_enabled";
    public static final boolean DEFAULT_AUTO_SPLIT_ENABLED = false;

    private GboardSplitKeyboardSettings() {
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static void ensureDefault(SharedPreferences preferences) {
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_AUTO_SPLIT_ENABLED, DEFAULT_AUTO_SPLIT_ENABLED);
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(preferences, PREF_KEY_ENABLED, enabled);
    }

    public static boolean readAutoSplitEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_AUTO_SPLIT_ENABLED, DEFAULT_AUTO_SPLIT_ENABLED);
    }

    public static boolean writeAutoSplitEnabled(
            SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_AUTO_SPLIT_ENABLED, enabled);
    }
}
