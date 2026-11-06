package dev.jason.gboardpatches.extension.editingaccesspoints;

import android.content.SharedPreferences;
import java.util.Map;

/** A readable missing key defaults on; unavailable or corrupt settings fail closed. */
public final class GboardEditingAccessPointsSettings {
    public static final String ENABLED = "pref_editing_access_points_enabled";

    private GboardEditingAccessPointsSettings() {}

    public static String key(EditorAction action) {
        return "pref_editing_access_points_" + action.token;
    }

    public static boolean read(SharedPreferences preferences, String key) {
        try {
            return preferences != null && read(preferences.getAll(), key);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean read(Map<String, ?> values, String key) {
        if (values == null) return false;
        if (!values.containsKey(key)) return true;
        Object value = values.get(key);
        // Accept portable settings backups containing Boolean or string values.
        return Boolean.TRUE.equals(value) || "true".equals(value);
    }
}
