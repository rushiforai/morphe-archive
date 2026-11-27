package dev.srwi.gintype.extension.multiglide;

import android.content.Context;
import android.content.SharedPreferences;
import dev.srwi.gintype.extension.flagsettings.GboardBooleanFlagSettings;
import dev.srwi.gintype.extension.settings.GboardPatchesSettings;

/**
 * Persistent preferences for MultiGlide multi-finger swipe & tap+swipe gesture typing.
 */
public final class GboardMultiGlideSettings {

    public static final String PREF_KEY_ENABLED = "pref_multiglide_enabled";
    public static final String PREF_KEY_AUTO_SPACE = "pref_multiglide_auto_space_enabled";
    public static final String PREF_KEY_AUTO_SPACE_BEFORE_WORD =
            "pref_multiglide_auto_space_before_word";
    public static final String PREF_KEY_AUTO_SPACE_DELAY_MS = "pref_multiglide_auto_space_delay_ms";
    public static final String PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED =
            "pref_multiglide_single_touch_combine_enabled";
    public static final String PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS =
            "pref_multiglide_single_touch_combine_delay_ms";
    public static final String PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED =
            "pref_multiglide_tap_to_multiglide_enabled";
    public static final String PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS =
            "pref_multiglide_tap_to_multiglide_delay_ms";
    public static final String PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED =
            "pref_multiglide_smart_tap_swipe_split_enabled";
    public static final String PREF_KEY_SPACEBAR_TIMER_INDICATOR =
            "pref_multiglide_spacebar_timer_indicator";
    public static final String PREF_KEY_WORD_READY_VIBRATION =
            "pref_multiglide_word_ready_vibration";
    public static final String PREF_KEY_BACKSPACE_MODE =
            "pref_multiglide_backspace_mode";
    public static final String BACKSPACE_MODE_WHOLE_WORD = "whole_word";
    public static final String BACKSPACE_MODE_LAST_INPUT = "last_input";
    public static final String DEFAULT_BACKSPACE_MODE = BACKSPACE_MODE_WHOLE_WORD;
    public static final String PREF_KEY_BEAM_WIDTH = "pref_multiglide_beam_width";
    public static final String PREF_KEY_FREQ_WEIGHT_FLOOR = "pref_multiglide_freq_weight_floor";
    public static final String PREF_KEY_GEO_EXPONENT = "pref_multiglide_geo_exponent";
    public static final String PREF_KEY_BEAM_FREQ_WEIGHT = "pref_multiglide_beam_freq_weight";
    public static final String PREF_KEY_TRACE_LOGGING = "pref_multiglide_trace_logging_enabled";
    public static final boolean DEFAULT_ENABLED = true;
    public static final boolean DEFAULT_AUTO_SPACE = true;
    public static final boolean DEFAULT_AUTO_SPACE_BEFORE_WORD = true;
    public static final int MIN_AUTO_SPACE_DELAY_MS = 0;
    public static final int MAX_AUTO_SPACE_DELAY_MS = 2000;
    public static final int DEFAULT_AUTO_SPACE_DELAY_MS = 300;
    public static final boolean DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED = true;
    public static final int MIN_SINGLE_TOUCH_COMBINE_DELAY_MS = 50;
    public static final int MAX_SINGLE_TOUCH_COMBINE_DELAY_MS = 500;
    public static final int DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS = 150;
    public static final boolean DEFAULT_TAP_TO_MULTIGLIDE_ENABLED = true;
    public static final int MIN_TAP_TO_MULTIGLIDE_DELAY_MS = 50;
    public static final int MAX_TAP_TO_MULTIGLIDE_DELAY_MS = 500;
    public static final int DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS = 150;
    public static final boolean DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED = true;
    public static final boolean DEFAULT_SPACEBAR_TIMER_INDICATOR = true;
    public static final boolean DEFAULT_WORD_READY_VIBRATION = false;
    public static final int MIN_BEAM_WIDTH = 32;
    public static final int MAX_BEAM_WIDTH = 1024;
    public static final int DEFAULT_BEAM_WIDTH = 256;
    public static final float MIN_FREQ_WEIGHT_FLOOR = 0.05f;
    public static final float MAX_FREQ_WEIGHT_FLOOR = 1.0f;
    public static final float DEFAULT_FREQ_WEIGHT_FLOOR = 0.25f;
    public static final float MIN_GEO_EXPONENT = 1.0f;
    public static final float MAX_GEO_EXPONENT = 8.0f;
    public static final float DEFAULT_GEO_EXPONENT = 3.75f;
    public static final float MIN_BEAM_FREQ_WEIGHT = 0.0f;
    public static final float MAX_BEAM_FREQ_WEIGHT = 2.0f;
    public static final float DEFAULT_BEAM_FREQ_WEIGHT = 0.50f;
    public static final boolean DEFAULT_TRACE_LOGGING = false;
    public static final int MIN_TRACE_EXPORT_MINUTES = 1;
    public static final int MAX_TRACE_EXPORT_MINUTES = 1440;

    private GboardMultiGlideSettings() {}

    private static SharedPreferences resolvePreferences(Context context) {
        if (context == null) return null;
        SharedPreferences preferences = GboardPatchesSettings.preferencesOrNull(context);
        if (preferences == null) {
            preferences = context.getSharedPreferences(
                    context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
        }
        return preferences;
    }

    public static boolean readEnabled(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return preferences == null ? DEFAULT_ENABLED : readEnabled(preferences);
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
        if (preferences == null) return;
        SharedPreferences.Editor editor = null;
        if (!preferences.contains(PREF_KEY_AUTO_SPACE)) {
            editor = preferences.edit();
            editor.putBoolean(PREF_KEY_AUTO_SPACE, DEFAULT_AUTO_SPACE);
        }
        if (!preferences.contains(PREF_KEY_AUTO_SPACE_BEFORE_WORD)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_AUTO_SPACE_BEFORE_WORD, DEFAULT_AUTO_SPACE_BEFORE_WORD);
        }
        if (!preferences.contains(PREF_KEY_AUTO_SPACE_DELAY_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_AUTO_SPACE_DELAY_MS, DEFAULT_AUTO_SPACE_DELAY_MS);
        }
        if (!preferences.contains(PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED)) {
            if (editor == null) editor = preferences.edit();
            boolean legacyOff = preferences.contains(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS)
                    && readIntRaw(preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS,
                            DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS) <= 0;
            editor.putBoolean(PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED,
                    !legacyOff && DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED);
            if (legacyOff) {
                editor.putInt(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS,
                        DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS);
            }
        }
        if (!preferences.contains(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS, DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS);
        }
        if (!preferences.contains(PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED)) {
            if (editor == null) editor = preferences.edit();
            boolean legacyOff = preferences.contains(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS)
                    && readIntRaw(preferences, PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS,
                            DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS) <= 0;
            editor.putBoolean(PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED,
                    !legacyOff && DEFAULT_TAP_TO_MULTIGLIDE_ENABLED);
            if (legacyOff) {
                editor.putInt(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS,
                        DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS);
            }
        }
        if (!preferences.contains(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS, DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS);
        }
        if (!preferences.contains(PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(
                    PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED, DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED);
        }
        if (!preferences.contains(PREF_KEY_SPACEBAR_TIMER_INDICATOR)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_SPACEBAR_TIMER_INDICATOR, DEFAULT_SPACEBAR_TIMER_INDICATOR);
        }
        if (!preferences.contains(PREF_KEY_WORD_READY_VIBRATION)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_WORD_READY_VIBRATION, DEFAULT_WORD_READY_VIBRATION);
        }
        if (!preferences.contains(PREF_KEY_BACKSPACE_MODE)) {
            if (editor == null) editor = preferences.edit();
            editor.putString(PREF_KEY_BACKSPACE_MODE, DEFAULT_BACKSPACE_MODE);
        }
        if (!preferences.contains(PREF_KEY_BEAM_WIDTH)) {
            if (editor == null) editor = preferences.edit();
            editor.putInt(PREF_KEY_BEAM_WIDTH, DEFAULT_BEAM_WIDTH);
        }
        if (!preferences.contains(PREF_KEY_FREQ_WEIGHT_FLOOR)) {
            if (editor == null) editor = preferences.edit();
            editor.putFloat(PREF_KEY_FREQ_WEIGHT_FLOOR, DEFAULT_FREQ_WEIGHT_FLOOR);
        }
        if (!preferences.contains(PREF_KEY_GEO_EXPONENT)) {
            if (editor == null) editor = preferences.edit();
            editor.putFloat(PREF_KEY_GEO_EXPONENT, DEFAULT_GEO_EXPONENT);
        }
        if (!preferences.contains(PREF_KEY_BEAM_FREQ_WEIGHT)) {
            if (editor == null) editor = preferences.edit();
            editor.putFloat(PREF_KEY_BEAM_FREQ_WEIGHT, DEFAULT_BEAM_FREQ_WEIGHT);
        }
        if (!preferences.contains(PREF_KEY_TRACE_LOGGING)) {
            if (editor == null) editor = preferences.edit();
            editor.putBoolean(PREF_KEY_TRACE_LOGGING, DEFAULT_TRACE_LOGGING);
        }
        if (editor != null) {
            editor.apply();
        }
    }

    public static boolean resetToDefaults(SharedPreferences preferences) {
        if (preferences == null) return false;
        try {
            boolean saved = preferences.edit()
                    .putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED)
                    .putBoolean(PREF_KEY_AUTO_SPACE, DEFAULT_AUTO_SPACE)
                    .putBoolean(PREF_KEY_AUTO_SPACE_BEFORE_WORD, DEFAULT_AUTO_SPACE_BEFORE_WORD)
                    .putInt(PREF_KEY_AUTO_SPACE_DELAY_MS, DEFAULT_AUTO_SPACE_DELAY_MS)
                    .putBoolean(PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED, DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED)
                    .putInt(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS, DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS)
                    .putBoolean(PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED, DEFAULT_TAP_TO_MULTIGLIDE_ENABLED)
                    .putInt(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS, DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS)
                    .putBoolean(
                            PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED,
                            DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED)
                    .putBoolean(PREF_KEY_SPACEBAR_TIMER_INDICATOR, DEFAULT_SPACEBAR_TIMER_INDICATOR)
                    .putBoolean(PREF_KEY_WORD_READY_VIBRATION, DEFAULT_WORD_READY_VIBRATION)
                    .putString(PREF_KEY_BACKSPACE_MODE, DEFAULT_BACKSPACE_MODE)
                    .putInt(PREF_KEY_BEAM_WIDTH, DEFAULT_BEAM_WIDTH)
                    .putFloat(PREF_KEY_FREQ_WEIGHT_FLOOR, DEFAULT_FREQ_WEIGHT_FLOOR)
                    .putFloat(PREF_KEY_GEO_EXPONENT, DEFAULT_GEO_EXPONENT)
                    .putFloat(PREF_KEY_BEAM_FREQ_WEIGHT, DEFAULT_BEAM_FREQ_WEIGHT)
                    .putBoolean(PREF_KEY_TRACE_LOGGING, DEFAULT_TRACE_LOGGING)
                    .commit();
            syncDecoderConstants(preferences);
            return saved;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Resets only the Kinetica decoder tuning parameters to their release defaults. */
    public static boolean resetDecoderToDefaults(SharedPreferences preferences) {
        if (preferences == null) return false;
        try {
            boolean saved = preferences.edit()
                    .putInt(PREF_KEY_BEAM_WIDTH, DEFAULT_BEAM_WIDTH)
                    .putFloat(PREF_KEY_FREQ_WEIGHT_FLOOR, DEFAULT_FREQ_WEIGHT_FLOOR)
                    .putFloat(PREF_KEY_GEO_EXPONENT, DEFAULT_GEO_EXPONENT)
                    .putFloat(PREF_KEY_BEAM_FREQ_WEIGHT, DEFAULT_BEAM_FREQ_WEIGHT)
                    .commit();
            syncDecoderConstants(preferences);
            return saved;
        } catch (Throwable ignored) {
            return false;
        }
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

    public static boolean isAutoSpaceEnabled(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return readAutoSpaceEnabled(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_AUTO_SPACE;
        }
    }

    public static boolean readAutoSpaceEnabled(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_AUTO_SPACE;
        try {
            return preferences.getBoolean(PREF_KEY_AUTO_SPACE, DEFAULT_AUTO_SPACE);
        } catch (ClassCastException ignored) {
            return DEFAULT_AUTO_SPACE;
        }
    }

    public static boolean writeAutoSpaceEnabled(SharedPreferences preferences, boolean enabled) {
        if (preferences == null) return false;
        try {
            return preferences.edit()
                    .putBoolean(PREF_KEY_AUTO_SPACE, enabled)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static int readAutoSpaceDelayMs(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return readAutoSpaceDelayMs(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_AUTO_SPACE_DELAY_MS;
        }
    }

    public static int readAutoSpaceDelayMs(SharedPreferences preferences) {
        return readInt(preferences, PREF_KEY_AUTO_SPACE_DELAY_MS,
                DEFAULT_AUTO_SPACE_DELAY_MS, MIN_AUTO_SPACE_DELAY_MS, MAX_AUTO_SPACE_DELAY_MS);
    }

    public static boolean writeAutoSpaceDelayMs(SharedPreferences preferences, int delayMs) {
        return writeInt(preferences, PREF_KEY_AUTO_SPACE_DELAY_MS,
                delayMs, MIN_AUTO_SPACE_DELAY_MS, MAX_AUTO_SPACE_DELAY_MS);
    }

    public static boolean readSingleTouchCombineEnabled(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return preferences == null
                    ? DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED
                    : readSingleTouchCombineEnabled(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED;
        }
    }

    public static boolean readSingleTouchCombineEnabled(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED;
        if (!preferences.contains(PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED)
                && preferences.contains(PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS)
                && readIntRaw(preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS,
                        DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS) <= 0) {
            return false;
        }
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED,
                DEFAULT_SINGLE_TOUCH_COMBINE_ENABLED);
    }

    public static boolean writeSingleTouchCombineEnabled(
            SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_ENABLED, enabled);
    }

    public static int readEffectiveSingleTouchCombineDelayMs(Context context) {
        return readSingleTouchCombineEnabled(context)
                ? readSingleTouchCombineDelayMs(context)
                : 0;
    }

    public static int readSingleTouchCombineDelayMs(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return readSingleTouchCombineDelayMs(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS;
        }
    }

    public static int readSingleTouchCombineDelayMs(SharedPreferences preferences) {
        return readInt(preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS,
                DEFAULT_SINGLE_TOUCH_COMBINE_DELAY_MS,
                MIN_SINGLE_TOUCH_COMBINE_DELAY_MS,
                MAX_SINGLE_TOUCH_COMBINE_DELAY_MS);
    }

    public static boolean writeSingleTouchCombineDelayMs(SharedPreferences preferences, int delayMs) {
        return writeInt(preferences, PREF_KEY_SINGLE_TOUCH_COMBINE_DELAY_MS,
                delayMs, MIN_SINGLE_TOUCH_COMBINE_DELAY_MS, MAX_SINGLE_TOUCH_COMBINE_DELAY_MS);
    }

    public static boolean readTapToMultiGlideEnabled(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return preferences == null
                    ? DEFAULT_TAP_TO_MULTIGLIDE_ENABLED
                    : readTapToMultiGlideEnabled(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_TAP_TO_MULTIGLIDE_ENABLED;
        }
    }

    public static boolean readTapToMultiGlideEnabled(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_TAP_TO_MULTIGLIDE_ENABLED;
        if (!preferences.contains(PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED)
                && preferences.contains(PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS)
                && readIntRaw(preferences, PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS,
                        DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS) <= 0) {
            return false;
        }
        return GboardBooleanFlagSettings.readEnabled(
                preferences, PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED,
                DEFAULT_TAP_TO_MULTIGLIDE_ENABLED);
    }

    public static boolean writeTapToMultiGlideEnabled(
            SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_TAP_TO_MULTIGLIDE_ENABLED, enabled);
    }

    public static int readEffectiveTapToMultiGlideDelayMs(Context context) {
        return readTapToMultiGlideEnabled(context)
                ? readTapToMultiGlideDelayMs(context)
                : 0;
    }

    public static int readTapToMultiGlideDelayMs(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return readTapToMultiGlideDelayMs(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS;
        }
    }

    public static int readTapToMultiGlideDelayMs(SharedPreferences preferences) {
        return readInt(preferences, PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS,
                DEFAULT_TAP_TO_MULTIGLIDE_DELAY_MS,
                MIN_TAP_TO_MULTIGLIDE_DELAY_MS,
                MAX_TAP_TO_MULTIGLIDE_DELAY_MS);
    }

    public static boolean writeTapToMultiGlideDelayMs(SharedPreferences preferences, int delayMs) {
        return writeInt(preferences, PREF_KEY_TAP_TO_MULTIGLIDE_DELAY_MS,
                delayMs, MIN_TAP_TO_MULTIGLIDE_DELAY_MS, MAX_TAP_TO_MULTIGLIDE_DELAY_MS);
    }

    public static boolean readSmartTapSwipeSplitEnabled(Context context) {
        return GboardBooleanFlagSettings.readEnabled(
                resolvePreferences(context),
                PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED,
                DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED);
    }

    public static boolean readSmartTapSwipeSplitEnabled(SharedPreferences preferences) {
        return GboardBooleanFlagSettings.readEnabled(
                preferences,
                PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED,
                DEFAULT_SMART_TAP_SWIPE_SPLIT_ENABLED);
    }

    public static boolean writeSmartTapSwipeSplitEnabled(
            SharedPreferences preferences, boolean enabled) {
        return GboardBooleanFlagSettings.writeEnabled(
                preferences, PREF_KEY_SMART_TAP_SWIPE_SPLIT_ENABLED, enabled);
    }

    public static String readBackspaceMode(Context context) {
        try {
            SharedPreferences preferences = resolvePreferences(context);
            return readBackspaceMode(preferences);
        } catch (Throwable ignored) {
            return DEFAULT_BACKSPACE_MODE;
        }
    }

    public static String readBackspaceMode(SharedPreferences preferences) {
        if (preferences == null) return DEFAULT_BACKSPACE_MODE;
        try {
            return sanitizeBackspaceMode(preferences.getString(PREF_KEY_BACKSPACE_MODE, DEFAULT_BACKSPACE_MODE));
        } catch (ClassCastException ignored) {
            return DEFAULT_BACKSPACE_MODE;
        }
    }

    public static boolean writeBackspaceMode(SharedPreferences preferences, String mode) {
        if (preferences == null) return false;
        try {
            return preferences.edit()
                    .putString(PREF_KEY_BACKSPACE_MODE, sanitizeBackspaceMode(mode))
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static String sanitizeBackspaceMode(String mode) {
        if (BACKSPACE_MODE_LAST_INPUT.equals(mode)) {
            return BACKSPACE_MODE_LAST_INPUT;
        }
        return BACKSPACE_MODE_WHOLE_WORD;
    }

    public static int readBeamWidth(SharedPreferences preferences) {
        return readInt(preferences, PREF_KEY_BEAM_WIDTH,
                DEFAULT_BEAM_WIDTH, MIN_BEAM_WIDTH, MAX_BEAM_WIDTH);
    }

    public static boolean writeBeamWidth(SharedPreferences preferences, int beamWidth) {
        return writeInt(preferences, PREF_KEY_BEAM_WIDTH,
                beamWidth, MIN_BEAM_WIDTH, MAX_BEAM_WIDTH);
    }

    public static float readFreqWeightFloor(SharedPreferences preferences) {
        return readFloat(preferences, PREF_KEY_FREQ_WEIGHT_FLOOR,
                DEFAULT_FREQ_WEIGHT_FLOOR, MIN_FREQ_WEIGHT_FLOOR, MAX_FREQ_WEIGHT_FLOOR);
    }

    public static boolean writeFreqWeightFloor(SharedPreferences preferences, float value) {
        return writeFloat(preferences, PREF_KEY_FREQ_WEIGHT_FLOOR,
                value, MIN_FREQ_WEIGHT_FLOOR, MAX_FREQ_WEIGHT_FLOOR);
    }

    public static float readGeoExponent(SharedPreferences preferences) {
        return readFloat(preferences, PREF_KEY_GEO_EXPONENT,
                DEFAULT_GEO_EXPONENT, MIN_GEO_EXPONENT, MAX_GEO_EXPONENT);
    }

    public static boolean writeGeoExponent(SharedPreferences preferences, float value) {
        return writeFloat(preferences, PREF_KEY_GEO_EXPONENT,
                value, MIN_GEO_EXPONENT, MAX_GEO_EXPONENT);
    }

    public static float readBeamFreqWeight(SharedPreferences preferences) {
        return readFloat(preferences, PREF_KEY_BEAM_FREQ_WEIGHT,
                DEFAULT_BEAM_FREQ_WEIGHT, MIN_BEAM_FREQ_WEIGHT, MAX_BEAM_FREQ_WEIGHT);
    }

    public static boolean writeBeamFreqWeight(SharedPreferences preferences, float value) {
        return writeFloat(preferences, PREF_KEY_BEAM_FREQ_WEIGHT,
                value, MIN_BEAM_FREQ_WEIGHT, MAX_BEAM_FREQ_WEIGHT);
    }

    public static void syncDecoderConstants(Context context) {
        try {
            syncDecoderConstants(resolvePreferences(context));
        } catch (Throwable ignored) {
            KineticaConstants.applyRuntimeTuning(
                    DEFAULT_BEAM_WIDTH,
                    DEFAULT_FREQ_WEIGHT_FLOOR,
                    DEFAULT_GEO_EXPONENT,
                    DEFAULT_BEAM_FREQ_WEIGHT);
        }
    }

    public static void syncDecoderConstants(SharedPreferences preferences) {
        KineticaConstants.applyRuntimeTuning(
                readBeamWidth(preferences),
                readFreqWeightFloor(preferences),
                readGeoExponent(preferences),
                readBeamFreqWeight(preferences));
    }

    private static int readIntRaw(SharedPreferences preferences, String key, int defaultValue) {
        if (preferences == null) return defaultValue;
        try {
            return preferences.getInt(key, defaultValue);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    private static int readInt(
            SharedPreferences preferences, String key, int defaultValue, int min, int max) {
        if (preferences == null) return defaultValue;
        try {
            return sanitizeInt(preferences.getInt(key, defaultValue), min, max);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    private static boolean writeInt(
            SharedPreferences preferences, String key, int value, int min, int max) {
        if (preferences == null) return false;
        try {
            return preferences.edit().putInt(key, sanitizeInt(value, min, max)).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static int sanitizeInt(int value, int min, int max) {
        return Math.max(min, Math.min(value, max));
    }

    private static float readFloat(
            SharedPreferences preferences, String key, float defaultValue, float min, float max) {
        if (preferences == null) return defaultValue;
        try {
            return sanitizeFloat(preferences.getFloat(key, defaultValue), defaultValue, min, max);
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    private static boolean writeFloat(
            SharedPreferences preferences, String key, float value, float min, float max) {
        if (preferences == null) return false;
        float sanitized = sanitizeFloat(value, min, min, max);
        if (!Float.isFinite(value)) return false;
        try {
            return preferences.edit().putFloat(key, sanitized).commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static float sanitizeFloat(float value, float fallback, float min, float max) {
        if (!Float.isFinite(value)) return fallback;
        return Math.max(min, Math.min(value, max));
    }

    public static boolean isSpacebarTimerIndicatorEnabled(Context context) {
        try {
            return readSpacebarTimerIndicatorEnabled(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_SPACEBAR_TIMER_INDICATOR;
        }
    }

    public static boolean isAutoSpaceBeforeWord(Context context) {
        try {
            return readAutoSpaceBeforeWord(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_AUTO_SPACE_BEFORE_WORD;
        }
    }

    public static boolean readAutoSpaceBeforeWord(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_AUTO_SPACE_BEFORE_WORD, DEFAULT_AUTO_SPACE_BEFORE_WORD);
    }

    public static boolean writeAutoSpaceBeforeWord(SharedPreferences preferences, boolean beforeWord) {
        return writeBoolean(preferences, PREF_KEY_AUTO_SPACE_BEFORE_WORD, beforeWord);
    }

    public static boolean readSpacebarTimerIndicatorEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_SPACEBAR_TIMER_INDICATOR, DEFAULT_SPACEBAR_TIMER_INDICATOR);
    }

    public static boolean writeSpacebarTimerIndicatorEnabled(SharedPreferences preferences, boolean enabled) {
        return writeBoolean(preferences, PREF_KEY_SPACEBAR_TIMER_INDICATOR, enabled);
    }

    public static boolean isWordReadyVibrationEnabled(Context context) {
        try {
            return readWordReadyVibrationEnabled(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_WORD_READY_VIBRATION;
        }
    }

    public static boolean readWordReadyVibrationEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_WORD_READY_VIBRATION, DEFAULT_WORD_READY_VIBRATION);
    }

    public static boolean writeWordReadyVibrationEnabled(SharedPreferences preferences, boolean enabled) {
        return writeBoolean(preferences, PREF_KEY_WORD_READY_VIBRATION, enabled);
    }

    public static boolean isTraceLoggingEnabled(Context context) {
        try {
            return readTraceLoggingEnabled(resolvePreferences(context));
        } catch (Throwable ignored) {
            return DEFAULT_TRACE_LOGGING;
        }
    }

    public static boolean readTraceLoggingEnabled(SharedPreferences preferences) {
        return readBoolean(preferences, PREF_KEY_TRACE_LOGGING, DEFAULT_TRACE_LOGGING);
    }

    public static boolean writeTraceLoggingEnabled(SharedPreferences preferences, boolean enabled) {
        return writeBoolean(preferences, PREF_KEY_TRACE_LOGGING, enabled);
    }

    private static boolean readBoolean(SharedPreferences preferences, String key, boolean fallback) {
        if (preferences == null) return fallback;
        try {
            return preferences.getBoolean(key, fallback);
        } catch (ClassCastException ignored) {
            return fallback;
        }
    }

    private static boolean writeBoolean(SharedPreferences preferences, String key, boolean value) {
        if (preferences == null) return false;
        try {
            return preferences.edit()
                    .putBoolean(key, value)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }
}
