package dev.jason.gboardpatches.extension.accesspointcount;

import android.content.SharedPreferences;

import java.util.Map;

public final class GboardAccessPointCountSettings {
    public static final String PREF_KEY_ENABLED = "pref_access_point_count_enabled";
    public static final String PREF_KEY_COUNT = "pref_access_point_count_value";
    public static final boolean DEFAULT_ENABLED = false;
    public static final int DEFAULT_COUNT = 6;
    public static final int MIN_COUNT = 3;
    public static final int MAX_COUNT = 8;

    private GboardAccessPointCountSettings() {
    }

    public static Snapshot read(SharedPreferences preferences) {
        Snapshot snapshot = readRuntimeOrNull(preferences);
        return snapshot != null ? snapshot : new Snapshot(DEFAULT_ENABLED, DEFAULT_COUNT);
    }

    public static Snapshot readRuntimeOrNull(SharedPreferences preferences) {
        if (preferences == null) {
            return null;
        }
        try {
            Map<String, ?> values = preferences.getAll();
            Boolean enabled = readBoolean(values, preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
            Integer count = readCount(values, preferences, PREF_KEY_COUNT, DEFAULT_COUNT);
            if (enabled == null || count == null || !isValidCount(count.intValue())) {
                return null;
            }
            return new Snapshot(enabled.booleanValue(), count.intValue());
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        try {
            SharedPreferences.Editor editor = null;
            if (!preferences.contains(PREF_KEY_ENABLED)) {
                editor = preferences.edit().putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
            }
            if (!preferences.contains(PREF_KEY_COUNT)) {
                editor = editor == null ? preferences.edit() : editor;
                editor.putInt(PREF_KEY_COUNT, DEFAULT_COUNT);
            }
            if (editor != null) {
                editor.apply();
            }
        } catch (Throwable ignored) {
            // The settings screen and runtime both fail closed when storage is unavailable.
        }
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putBoolean(PREF_KEY_ENABLED, enabled)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean writeCount(SharedPreferences preferences, int count) {
        if (preferences == null || !isValidCount(count)) {
            return false;
        }
        try {
            return preferences.edit()
                    .putInt(PREF_KEY_COUNT, count)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean isValidCount(int count) {
        return count >= MIN_COUNT && count <= MAX_COUNT;
    }

    private static Boolean readBoolean(Map<String, ?> values, SharedPreferences preferences,
            String key, boolean defaultValue) {
        Object raw = values == null ? null : values.get(key);
        if (raw == null && !preferences.contains(key)) {
            return Boolean.valueOf(defaultValue);
        }
        if (raw instanceof Boolean value) {
            return value;
        }
        if (raw instanceof String value) {
            if ("true".equalsIgnoreCase(value)) {
                return Boolean.TRUE;
            }
            if ("false".equalsIgnoreCase(value)) {
                return Boolean.FALSE;
            }
        }
        return null;
    }

    private static Integer readCount(Map<String, ?> values, SharedPreferences preferences,
            String key, int defaultValue) {
        Object raw = values == null ? null : values.get(key);
        if (raw == null && !preferences.contains(key)) {
            return Integer.valueOf(defaultValue);
        }
        if (raw instanceof Number value) {
            long longValue = value.longValue();
            return longValue >= Integer.MIN_VALUE && longValue <= Integer.MAX_VALUE
                    ? Integer.valueOf((int) longValue)
                    : null;
        }
        if (raw instanceof String value) {
            try {
                return Integer.valueOf(Integer.parseInt(value.trim()));
            } catch (NumberFormatException ignored) {
                return null;
            }
        }
        return null;
    }

    public static final class Snapshot {
        public final boolean enabled;
        public final int count;

        public Snapshot(boolean enabled, int count) {
            this.enabled = enabled;
            this.count = count;
        }
    }
}
