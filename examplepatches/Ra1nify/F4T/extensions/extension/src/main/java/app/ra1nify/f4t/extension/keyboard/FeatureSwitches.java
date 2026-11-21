package app.ra1nify.f4t.extension.keyboard;

import android.content.Context;
import android.content.SharedPreferences;

/**
 * Normalized feature switches, aligned with the realOS module config.
 *
 * realOS gates its hooks with four per-feature switches (liquid glass, keyboard effects, keyboard
 * sounds, enhancements) plus the "bypass all limits" switch. The keys and defaults are kept here so
 * the F4T settings page writes exactly the same switch set, and the injected hooks read it at runtime.
 */
public final class FeatureSwitches {
    public static final String PREFS = "f4t_keyboard";

    /** Default of the four feature switches, matching realOS (enabled). */
    public static final boolean DEFAULT_FEATURE_ENABLED = true;
    /** Default of the bypass switch, matching realOS (disabled). */
    public static final boolean DEFAULT_BYPASS_ENABLED = false;

    private static final String KEY_LIQUID_GLASS = "oplus_input_liquid_glass";
    private static final String KEY_WORKSHOP = "oplus_input_workshop";
    private static final String KEY_KEYBOARD_EFFECTS = "oplus_input_keyboard_effects";
    private static final String KEY_KEYBOARD_SOUNDS = "oplus_input_keyboard_sounds";
    private static final String KEY_ENHANCEMENTS = "oplus_input_enhancements";
    private static final String KEY_BYPASS_ALL_LIMITS = "bypass_all_limits";

    private FeatureSwitches() {
    }

    /** The pref key realOS uses for a per-feature switch: `<key>_<packageName>`. */
    public static String featureKey(String key, Context context) {
        return key + "_" + context.getPackageName();
    }

    public static String liquidGlassKey(Context context) {
        return featureKey(KEY_LIQUID_GLASS, context);
    }

    public static String keyboardEffectsKey(Context context) {
        return featureKey(KEY_KEYBOARD_EFFECTS, context);
    }

    public static String keyboardSoundsKey(Context context) {
        return featureKey(KEY_KEYBOARD_SOUNDS, context);
    }

    public static String enhancementsKey(Context context) {
        return featureKey(KEY_ENHANCEMENTS, context);
    }

    public static String bypassAllLimitsKey(Context context) {
        return featureKey(KEY_BYPASS_ALL_LIMITS, context);
    }

    public static boolean isLiquidGlassEnabled(Context context) {
        Context app = context.getApplicationContext();
        SharedPreferences preferences = preferences(app);
        if (preferences == null) return DEFAULT_FEATURE_ENABLED;
        if (preferences.contains(liquidGlassKey(app))) {
            return preferences.getBoolean(liquidGlassKey(app), DEFAULT_FEATURE_ENABLED);
        }
        // The workshop switch was the legacy name of the same feature in realOS.
        return preferences.getBoolean(featureKey(KEY_WORKSHOP, app), DEFAULT_FEATURE_ENABLED);
    }

    public static boolean isKeyboardEffectsEnabled(Context context) {
        return featureEnabled(context, KEY_KEYBOARD_EFFECTS);
    }

    public static boolean isKeyboardSoundsEnabled(Context context) {
        return featureEnabled(context, KEY_KEYBOARD_SOUNDS);
    }

    public static boolean isEnhancementsEnabled(Context context) {
        return featureEnabled(context, KEY_ENHANCEMENTS);
    }

    public static boolean isBypassAllLimits(Context context) {
        Context app = context.getApplicationContext();
        SharedPreferences preferences = preferences(app);
        if (preferences == null) return DEFAULT_BYPASS_ENABLED;
        return preferences.getBoolean(bypassAllLimitsKey(app), DEFAULT_BYPASS_ENABLED);
    }

    /** True when at least one of the realOS feature switches is on; realOS skips the settings injection otherwise. */
    public static boolean anyFeatureEnabled(Context context) {
        return isLiquidGlassEnabled(context) ||
                isKeyboardEffectsEnabled(context) ||
                isKeyboardSoundsEnabled(context) ||
                isEnhancementsEnabled(context);
    }

    private static boolean featureEnabled(Context context, String key) {
        Context app = context.getApplicationContext();
        SharedPreferences preferences = preferences(app);
        if (preferences == null) return DEFAULT_FEATURE_ENABLED;
        return preferences.getBoolean(featureKey(key, app), DEFAULT_FEATURE_ENABLED);
    }

    /** Writes one page value into the F4T preference store that the patch gates read. */
    public static void setValue(Context context, String key, Object value) {
        Context app = context.getApplicationContext() == null ? context : context.getApplicationContext();
        SharedPreferences preferences = preferences(app);
        if (preferences == null || key == null || value == null) return;
        try {
            if (value instanceof Boolean) {
                preferences.edit().putBoolean(key, (Boolean) value).apply();
            } else if (value instanceof Integer) {
                preferences.edit().putInt(key, (Integer) value).apply();
            } else {
                String text = String.valueOf(value);
                try {
                    preferences.edit().putInt(key, Integer.parseInt(text)).apply();
                } catch (NumberFormatException ignored) {
                    preferences.edit().putString(key, text).apply();
                }
            }
        } catch (Throwable ignored) {
        }
    }

    public static boolean getBooleanValue(Context context, String key, boolean defaultValue) {
        SharedPreferences preferences = preferences(context.getApplicationContext());
        if (preferences == null) return defaultValue;
        try {
            return preferences.getBoolean(key, defaultValue);
        } catch (Throwable ignored) {
            return defaultValue;
        }
    }

    public static int getIntValue(Context context, String key, int defaultValue) {
        SharedPreferences preferences = preferences(context.getApplicationContext());
        if (preferences == null) return defaultValue;
        try {
            return preferences.getInt(key, defaultValue);
        } catch (Throwable ignored) {
            return defaultValue;
        }
    }

    public static String getStringValue(Context context, String key, String defaultValue) {
        SharedPreferences preferences = preferences(context.getApplicationContext());
        if (preferences == null) return defaultValue;
        try {
            return preferences.getString(key, defaultValue);
        } catch (Throwable ignored) {
            return defaultValue;
        }
    }

    private static SharedPreferences preferences(Context context) {
        try {
            return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
