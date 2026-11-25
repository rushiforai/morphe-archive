package dev.jason.gboardpatches.extension.roundedkeyboard;

import android.content.SharedPreferences;

import java.util.Map;

public final class GboardRoundedKeyboardSettings {
    public static final String PREF_KEY_ENABLED = "pref_rounded_keyboard_panel_enabled";
    public static final String PREF_KEY_MODE = "pref_rounded_keyboard_panel_mode";
    public static final String PREF_KEY_TOP_RADIUS_DP =
            "pref_rounded_keyboard_panel_top_radius_dp";
    public static final String PREF_KEY_BOTTOM_RADIUS_DP =
            "pref_rounded_keyboard_panel_bottom_radius_dp";

    private GboardRoundedKeyboardSettings() {
    }

    public static GboardRoundedKeyboardConfig readSnapshot(SharedPreferences preferences) {
        GboardRoundedKeyboardConfig snapshot = readSnapshotOrNull(preferences);
        return snapshot == null ? GboardRoundedKeyboardConfig.defaults() : snapshot;
    }

    public static GboardRoundedKeyboardConfig readSnapshotOrNull(
            SharedPreferences preferences) {
        if (preferences == null) {
            return null;
        }
        try {
            Map<String, ?> values = preferences.getAll();
            if (values == null) {
                return null;
            }
            Boolean enabled = readBoolean(
                    values, preferences, PREF_KEY_ENABLED,
                    GboardRoundedKeyboardConfig.DEFAULT_ENABLED);
            GboardRoundedKeyboardConfig.Mode mode = readMode(values, preferences);
            Integer top = readRadius(values, preferences, PREF_KEY_TOP_RADIUS_DP);
            Integer bottom = readRadius(values, preferences, PREF_KEY_BOTTOM_RADIUS_DP);
            if (enabled == null || mode == null || top == null || bottom == null) {
                return null;
            }
            return new GboardRoundedKeyboardConfig(enabled, mode, top, bottom);
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        try {
            GboardRoundedKeyboardConfig snapshot = readSnapshot(preferences);
            preferences.edit()
                    .putBoolean(PREF_KEY_ENABLED, snapshot.isEnabled())
                    .putString(PREF_KEY_MODE, snapshot.getMode().storedValue())
                    .putString(PREF_KEY_TOP_RADIUS_DP,
                            Integer.toString(snapshot.getTopRadiusDp()))
                    .putString(PREF_KEY_BOTTOM_RADIUS_DP,
                            Integer.toString(snapshot.getBottomRadiusDp()))
                    .commit();
        } catch (Throwable ignored) {
            // The settings feature provides its own warning fallback.
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        return commit(preferences, editor -> editor.putBoolean(PREF_KEY_ENABLED, enabled));
    }

    public static boolean writeMode(
            SharedPreferences preferences, GboardRoundedKeyboardConfig.Mode mode) {
        GboardRoundedKeyboardConfig.Mode value = mode == null
                ? GboardRoundedKeyboardConfig.DEFAULT_MODE : mode;
        return commit(preferences,
                editor -> editor.putString(PREF_KEY_MODE, value.storedValue()));
    }

    public static boolean writeTopRadiusDp(SharedPreferences preferences, int radiusDp) {
        return writeRadius(preferences, PREF_KEY_TOP_RADIUS_DP, radiusDp);
    }

    public static boolean writeBottomRadiusDp(SharedPreferences preferences, int radiusDp) {
        return writeRadius(preferences, PREF_KEY_BOTTOM_RADIUS_DP, radiusDp);
    }

    public static boolean restoreDefaultRadii(SharedPreferences preferences) {
        return commit(preferences, editor -> editor
                .putString(PREF_KEY_TOP_RADIUS_DP,
                        Integer.toString(GboardRoundedKeyboardConfig.DEFAULT_RADIUS_DP))
                .putString(PREF_KEY_BOTTOM_RADIUS_DP,
                        Integer.toString(GboardRoundedKeyboardConfig.DEFAULT_RADIUS_DP)));
    }

    private static boolean writeRadius(
            SharedPreferences preferences, String key, int radiusDp) {
        int value = GboardRoundedKeyboardConfig.sanitizeRadiusDp(radiusDp);
        return commit(preferences, editor -> editor.putString(key, Integer.toString(value)));
    }

    private static Boolean readBoolean(Map<String, ?> values, SharedPreferences preferences,
            String key, boolean defaultValue) {
        Object raw = values.get(key);
        if (raw == null && !preferences.contains(key)) {
            return defaultValue;
        }
        if (raw instanceof Boolean) {
            return (Boolean) raw;
        }
        if (raw instanceof String) {
            if ("true".equalsIgnoreCase((String) raw)) {
                return Boolean.TRUE;
            }
            if ("false".equalsIgnoreCase((String) raw)) {
                return Boolean.FALSE;
            }
        }
        return null;
    }

    private static GboardRoundedKeyboardConfig.Mode readMode(
            Map<String, ?> values, SharedPreferences preferences) {
        Object raw = values.get(PREF_KEY_MODE);
        if (raw == null && !preferences.contains(PREF_KEY_MODE)) {
            return GboardRoundedKeyboardConfig.DEFAULT_MODE;
        }
        return raw instanceof String
                ? GboardRoundedKeyboardConfig.Mode.fromStoredValue((String) raw) : null;
    }

    private static Integer readRadius(Map<String, ?> values, SharedPreferences preferences,
            String key) {
        Object raw = values.get(key);
        if (raw == null && !preferences.contains(key)) {
            return GboardRoundedKeyboardConfig.DEFAULT_RADIUS_DP;
        }
        final int parsed;
        try {
            if (raw instanceof Integer) {
                parsed = (Integer) raw;
            } else if (raw instanceof String) {
                parsed = Integer.parseInt(((String) raw).trim());
            } else {
                return null;
            }
        } catch (NumberFormatException ignored) {
            return null;
        }
        if (parsed < GboardRoundedKeyboardConfig.MIN_RADIUS_DP
                || parsed > GboardRoundedKeyboardConfig.MAX_RADIUS_DP) {
            return null;
        }
        return parsed;
    }

    private static boolean commit(SharedPreferences preferences, Mutation mutation) {
        if (preferences == null || mutation == null) {
            return false;
        }
        try {
            SharedPreferences.Editor editor = preferences.edit();
            mutation.apply(editor);
            return editor.commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private interface Mutation {
        void apply(SharedPreferences.Editor editor);
    }
}
