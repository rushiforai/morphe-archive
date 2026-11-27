package dev.jason.gboardpatches.extension.textexpander;

import android.content.SharedPreferences;

import java.util.Map;

public final class GboardTextExpanderSettings {
    public static final String ENABLED = "pref_text_expander_enabled";
    public static final String SHORTCUTS = "pref_text_expander_shortcuts";

    private GboardTextExpanderSettings() { }

    public static boolean enabled(SharedPreferences preferences) {
        return preferences != null && preferences.getBoolean(ENABLED, true);
    }

    public static Map<String, String> shortcuts(SharedPreferences preferences) {
        return GboardTextExpander.decode(
                preferences == null ? null : preferences.getString(SHORTCUTS, null));
    }

    public static boolean writeShortcuts(SharedPreferences preferences, Map<String, String> value) {
        return preferences != null && preferences.edit()
                .putString(SHORTCUTS, GboardTextExpander.encode(value)).commit();
    }
}
