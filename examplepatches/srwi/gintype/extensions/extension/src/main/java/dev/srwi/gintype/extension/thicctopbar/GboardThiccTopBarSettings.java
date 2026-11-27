package dev.srwi.gintype.extension.thicctopbar;

import android.content.Context;
import android.content.SharedPreferences;

import dev.srwi.gintype.extension.flagsettings.GboardBooleanFlagSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesFeatureAvailability;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;

public final class GboardThiccTopBarSettings {
    public static final String PREF_KEY_ENABLED = "pref_thicc_top_bar_enabled";
    public static final boolean DEFAULT_ENABLED = true;

    public static final String PREF_KEY_TOPBAR_SCALE = "pref_matrix_topbar_scale";
    public static final float MIN_TOPBAR_SCALE = 1.0f;
    public static final float MAX_TOPBAR_SCALE = 2.0f;
    public static final float DEFAULT_TOPBAR_SCALE = 1.4f;

    public static final String PREF_KEY_SWIPE_SENSITIVITY = "pref_matrix_swipe_sensitivity";
    public static final float MIN_SWIPE_SENSITIVITY = 0.25f;
    public static final float MAX_SWIPE_SENSITIVITY = 2.0f;
    public static final float DEFAULT_SWIPE_SENSITIVITY = 1.0f;

    public static final String PREF_KEY_INVERT_SWIPE = "pref_matrix_invert_vertical_swipe";
    public static final boolean DEFAULT_INVERT_SWIPE = false;

    public static final String PREF_KEY_DOUBLE_TAP_MULTI_WORD_SELECT =
            "pref_matrix_double_tap_multi_word_select";
    public static final boolean DEFAULT_DOUBLE_TAP_MULTI_WORD_SELECT = true;

    private GboardThiccTopBarSettings() {
    }

    public static boolean readEnabled(Context context) {
        if (context == null) return false;
        if (!GboardPatchesFeatureAvailability.hasFeature(
                context, GboardPatchesFeatureAvailability.FEATURE_THICC_TOP_BAR)) {
            return false;
        }
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
            if (preferences == null) {
                preferences = context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            }
            return readEnabled(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_ENABLED;
        }
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
    }

    public static void ensureDefault(SharedPreferences preferences) {
        ensureDefaults(preferences);
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        GboardBooleanFlagSettings.ensureDefault(
                preferences, PREF_KEY_INVERT_SWIPE, DEFAULT_INVERT_SWIPE);
        GboardBooleanFlagSettings.ensureDefault(
                preferences,
                PREF_KEY_DOUBLE_TAP_MULTI_WORD_SELECT,
                DEFAULT_DOUBLE_TAP_MULTI_WORD_SELECT);
        if (preferences != null && !preferences.contains(PREF_KEY_TOPBAR_SCALE)) {
            writeTopbarScale(preferences, DEFAULT_TOPBAR_SCALE);
        }
        if (preferences != null && !preferences.contains(PREF_KEY_SWIPE_SENSITIVITY)) {
            writeSwipeSensitivity(preferences, DEFAULT_SWIPE_SENSITIVITY);
        }
    }

    public static boolean readInvertSwipe(Context context) {
        if (context == null) return DEFAULT_INVERT_SWIPE;
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
            if (preferences == null) {
                preferences = context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            }
            return readInvertSwipe(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_INVERT_SWIPE;
        }
    }

    public static boolean readInvertSwipe(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_INVERT_SWIPE, DEFAULT_INVERT_SWIPE);
    }

    public static boolean writeInvertSwipe(SharedPreferences preferences, boolean invert) {
        return GboardBooleanFlagSettings.writeEnabled(preferences, PREF_KEY_INVERT_SWIPE, invert);
    }

    public static boolean writeInvertSwipe(Context context, boolean invert) {
        if (context == null) return false;
        try {
            return writeInvertSwipe(GboardPatchesSettings.preferences(context), invert);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean readDoubleTapMultiWordSelect(Context context) {
        if (context == null) return DEFAULT_DOUBLE_TAP_MULTI_WORD_SELECT;
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
            if (preferences == null) {
                preferences = context.getSharedPreferences(
                        context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            }
            return readDoubleTapMultiWordSelect(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_DOUBLE_TAP_MULTI_WORD_SELECT;
        }
    }

    public static boolean readDoubleTapMultiWordSelect(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences,
                PREF_KEY_DOUBLE_TAP_MULTI_WORD_SELECT,
                DEFAULT_DOUBLE_TAP_MULTI_WORD_SELECT);
    }

    public static boolean writeDoubleTapMultiWordSelect(
            SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_DOUBLE_TAP_MULTI_WORD_SELECT, enabled);
    }

    public static boolean writeDoubleTapMultiWordSelect(Context context, boolean enabled) {
        if (context == null) return false;
        try {
            return writeDoubleTapMultiWordSelect(GboardPatchesSettings.preferences(context), enabled);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static float readTopbarScale(Context context) {
        return readTopbarScale(GboardPatchesSettings.preferencesOrNull(context));
    }

    public static float readTopbarScale(SharedPreferences preferences) {
        return readSanitizedFloat(
                preferences, PREF_KEY_TOPBAR_SCALE, MIN_TOPBAR_SCALE, MAX_TOPBAR_SCALE, DEFAULT_TOPBAR_SCALE);
    }

    public static void writeTopbarScale(Context context, float value) {
        if (context == null) {
            return;
        }
        writeTopbarScale(GboardPatchesSettings.preferences(context), value);
    }

    public static void writeTopbarScale(SharedPreferences preferences, float value) {
        writeSanitizedFloat(
                preferences, PREF_KEY_TOPBAR_SCALE, value, MIN_TOPBAR_SCALE, MAX_TOPBAR_SCALE, DEFAULT_TOPBAR_SCALE);
    }

    public static float sanitizeTopbarScale(float value) {
        return sanitizeFloat(value, MIN_TOPBAR_SCALE, MAX_TOPBAR_SCALE, DEFAULT_TOPBAR_SCALE);
    }

    public static float readSwipeSensitivity(Context context) {
        return readSwipeSensitivity(GboardPatchesSettings.preferencesOrNull(context));
    }

    public static float readSwipeSensitivity(SharedPreferences preferences) {
        return readSanitizedFloat(
                preferences,
                PREF_KEY_SWIPE_SENSITIVITY,
                MIN_SWIPE_SENSITIVITY,
                MAX_SWIPE_SENSITIVITY,
                DEFAULT_SWIPE_SENSITIVITY);
    }

    public static void writeSwipeSensitivity(Context context, float value) {
        if (context == null) {
            return;
        }
        writeSwipeSensitivity(GboardPatchesSettings.preferences(context), value);
    }

    public static void writeSwipeSensitivity(SharedPreferences preferences, float value) {
        writeSanitizedFloat(
                preferences,
                PREF_KEY_SWIPE_SENSITIVITY,
                value,
                MIN_SWIPE_SENSITIVITY,
                MAX_SWIPE_SENSITIVITY,
                DEFAULT_SWIPE_SENSITIVITY);
    }

    public static float sanitizeSwipeSensitivity(float value) {
        return sanitizeFloat(
                value, MIN_SWIPE_SENSITIVITY, MAX_SWIPE_SENSITIVITY, DEFAULT_SWIPE_SENSITIVITY);
    }

    private static float readSanitizedFloat(
            SharedPreferences preferences, String key, float min, float max, float defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        try {
            return sanitizeFloat(preferences.getFloat(key, defaultValue), min, max, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    private static void writeSanitizedFloat(
            SharedPreferences preferences,
            String key,
            float value,
            float min,
            float max,
            float defaultValue) {
        if (preferences == null) {
            return;
        }
        preferences.edit()
                .putFloat(key, sanitizeFloat(value, min, max, defaultValue))
                .apply();
    }

    private static float sanitizeFloat(float value, float min, float max, float defaultValue) {
        if (!Float.isFinite(value)) {
            return defaultValue;
        }
        return Math.max(min, Math.min(max, value));
    }

    public static boolean writeEnabled(SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(preferences, PREF_KEY_ENABLED, enabled);
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        if (context == null) return false;
        try {
            SharedPreferences preferences = GboardPatchesSettings.preferences(context);
            return writeEnabled(preferences, enabled);
        } catch (Throwable ignored) {
            return false;
        }
    }
}
