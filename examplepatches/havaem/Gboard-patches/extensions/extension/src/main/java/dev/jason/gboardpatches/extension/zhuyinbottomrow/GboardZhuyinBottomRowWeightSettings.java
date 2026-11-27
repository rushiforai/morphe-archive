package dev.jason.gboardpatches.extension.zhuyinbottomrow;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardZhuyinBottomRowWeightSettings {
    public static final String PREF_FILE = "gboard_zhuyin_bottom_row_weight_settings";
    public static final String PREF_KEY_ENABLED =
            "pref_zhuyin_bottom_row_weights_enabled";
    public static final String PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL =
            "pref_zhuyin_bottom_row_weight_switch_to_symbol";
    public static final String PREF_KEY_WEIGHT_A02 =
            "pref_zhuyin_bottom_row_weight_a02";
    public static final String PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE =
            "pref_zhuyin_bottom_row_weight_switch_to_next_language";
    public static final String PREF_KEY_WEIGHT_SPACE =
            "pref_zhuyin_bottom_row_weight_space";
    public static final String PREF_KEY_WEIGHT_A06 =
            "pref_zhuyin_bottom_row_weight_a06";
    public static final String PREF_KEY_WEIGHT_A08 =
            "pref_zhuyin_bottom_row_weight_a08";
    public static final String PREF_KEY_WEIGHT_IME_ACTION =
            "pref_zhuyin_bottom_row_weight_ime_action";

    public static final boolean DEFAULT_ENABLED = false;
    public static final int MIN_WEIGHT = 1;
    public static final int MAX_WEIGHT = 500;
    public static final int DEFAULT_WEIGHT_SWITCH_TO_SYMBOL = 150;
    public static final int DEFAULT_WEIGHT_A02 = 100;
    public static final int DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE = 100;
    public static final int DEFAULT_WEIGHT_SPACE = 300;
    public static final int DEFAULT_WEIGHT_A06 = 100;
    public static final int DEFAULT_WEIGHT_A08 = 100;
    public static final int DEFAULT_WEIGHT_IME_ACTION = 150;
    public static final int RECOMMENDED_WEIGHT_SPACE = 200;
    public static final int RECOMMENDED_WEIGHT_A08 = 200;

    private GboardZhuyinBottomRowWeightSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        Context applicationContext = context == null ? null : context.getApplicationContext();
        Context lookupContext = applicationContext != null ? applicationContext : context;
        if (lookupContext == null) {
            return null;
        }
        return lookupContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
    }

    public static void ensureDefaults(Context context) {
        if (context == null) {
            return;
        }
        ensureDefaults(preferences(context));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        SharedPreferences.Editor editor = null;
        editor = putBooleanIfMissing(editor, preferences, PREF_KEY_ENABLED, DEFAULT_ENABLED);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL,
                DEFAULT_WEIGHT_SWITCH_TO_SYMBOL);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_A02, DEFAULT_WEIGHT_A02);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_SPACE, DEFAULT_WEIGHT_SPACE);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_A06, DEFAULT_WEIGHT_A06);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_A08, DEFAULT_WEIGHT_A08);
        editor = putIntIfMissing(editor, preferences, PREF_KEY_WEIGHT_IME_ACTION,
                DEFAULT_WEIGHT_IME_ACTION);
        if (editor != null) {
            editor.apply();
        }
    }

    public static boolean readEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENABLED;
        }
        try {
            return preferences.getBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
        } catch (ClassCastException ignored) {
            return DEFAULT_ENABLED;
        }
    }

    public static int readWeightSwitchToSymbol(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL,
                DEFAULT_WEIGHT_SWITCH_TO_SYMBOL);
    }

    public static int readWeightA02(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_A02, DEFAULT_WEIGHT_A02);
    }

    public static int readWeightSwitchToNextLanguage(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE);
    }

    public static int readWeightSpace(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_SPACE, DEFAULT_WEIGHT_SPACE);
    }

    public static int readWeightA06(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_A06, DEFAULT_WEIGHT_A06);
    }

    public static int readWeightA08(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_A08, DEFAULT_WEIGHT_A08);
    }

    public static int readWeightImeAction(SharedPreferences preferences) {
        return readWeight(preferences, PREF_KEY_WEIGHT_IME_ACTION, DEFAULT_WEIGHT_IME_ACTION);
    }

    public static boolean writeEnabled(Context context, boolean enabled) {
        SharedPreferences preferences = preferences(context);
        ensureDefaults(preferences);
        return writeEnabled(preferences, enabled);
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

    public static boolean writeWeightSwitchToSymbol(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL, weight);
    }

    public static boolean writeWeightA02(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_A02, weight);
    }

    public static boolean writeWeightSwitchToNextLanguage(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE, weight);
    }

    public static boolean writeWeightSpace(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_SPACE, weight);
    }

    public static boolean writeWeightA06(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_A06, weight);
    }

    public static boolean writeWeightA08(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_A08, weight);
    }

    public static boolean writeWeightImeAction(Context context, int weight) {
        return writeWeight(preferences(context), PREF_KEY_WEIGHT_IME_ACTION, weight);
    }

    public static boolean writeDefaultWeights(Context context) {
        SharedPreferences preferences = preferences(context);
        ensureDefaults(preferences);
        return writeDefaultWeights(preferences);
    }

    public static boolean writeDefaultWeights(SharedPreferences preferences) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putInt(PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL, DEFAULT_WEIGHT_SWITCH_TO_SYMBOL)
                    .putInt(PREF_KEY_WEIGHT_A02, DEFAULT_WEIGHT_A02)
                    .putInt(PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                            DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE)
                    .putInt(PREF_KEY_WEIGHT_SPACE, DEFAULT_WEIGHT_SPACE)
                    .putInt(PREF_KEY_WEIGHT_A06, DEFAULT_WEIGHT_A06)
                    .putInt(PREF_KEY_WEIGHT_A08, DEFAULT_WEIGHT_A08)
                    .putInt(PREF_KEY_WEIGHT_IME_ACTION, DEFAULT_WEIGHT_IME_ACTION)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static boolean writeRecommendedWeights(Context context) {
        SharedPreferences preferences = preferences(context);
        ensureDefaults(preferences);
        return writeRecommendedWeights(preferences);
    }

    public static boolean writeRecommendedWeights(SharedPreferences preferences) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putInt(PREF_KEY_WEIGHT_SWITCH_TO_SYMBOL, DEFAULT_WEIGHT_SWITCH_TO_SYMBOL)
                    .putInt(PREF_KEY_WEIGHT_A02, DEFAULT_WEIGHT_A02)
                    .putInt(PREF_KEY_WEIGHT_SWITCH_TO_NEXT_LANGUAGE,
                            DEFAULT_WEIGHT_SWITCH_TO_NEXT_LANGUAGE)
                    .putInt(PREF_KEY_WEIGHT_SPACE, RECOMMENDED_WEIGHT_SPACE)
                    .putInt(PREF_KEY_WEIGHT_A06, DEFAULT_WEIGHT_A06)
                    .putInt(PREF_KEY_WEIGHT_A08, RECOMMENDED_WEIGHT_A08)
                    .putInt(PREF_KEY_WEIGHT_IME_ACTION, DEFAULT_WEIGHT_IME_ACTION)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static int sanitizeWeight(int weight) {
        return Math.max(MIN_WEIGHT, Math.min(weight, MAX_WEIGHT));
    }

    private static int readWeight(SharedPreferences preferences, String key, int defaultValue) {
        if (preferences == null) {
            return defaultValue;
        }
        try {
            return sanitizeWeight(preferences.getInt(key, defaultValue));
        } catch (ClassCastException ignored) {
            return defaultValue;
        }
    }

    private static boolean writeWeight(SharedPreferences preferences, String key, int weight) {
        if (preferences == null) {
            return false;
        }
        ensureDefaults(preferences);
        try {
            return preferences.edit()
                    .putInt(key, sanitizeWeight(weight))
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static SharedPreferences.Editor putBooleanIfMissing(SharedPreferences.Editor editor,
            SharedPreferences preferences, String key, boolean value) {
        if (preferences.contains(key)) {
            return editor;
        }
        SharedPreferences.Editor workingEditor = editor != null ? editor : preferences.edit();
        workingEditor.putBoolean(key, value);
        return workingEditor;
    }

    private static SharedPreferences.Editor putIntIfMissing(SharedPreferences.Editor editor,
            SharedPreferences preferences, String key, int value) {
        if (preferences.contains(key)) {
            return editor;
        }
        SharedPreferences.Editor workingEditor = editor != null ? editor : preferences.edit();
        workingEditor.putInt(key, value);
        return workingEditor;
    }

    public static final class SettingsSnapshot {
        public final boolean enabled;
        public final int switchToSymbolWeight;
        public final int a02Weight;
        public final int switchToNextLanguageWeight;
        public final int spaceWeight;
        public final int a06Weight;
        public final int a08Weight;
        public final int imeActionWeight;

        public SettingsSnapshot(boolean enabled, int switchToSymbolWeight, int a02Weight,
                int switchToNextLanguageWeight, int spaceWeight, int a06Weight,
                int a08Weight, int imeActionWeight) {
            this.enabled = enabled;
            this.switchToSymbolWeight = sanitizeWeight(switchToSymbolWeight);
            this.a02Weight = sanitizeWeight(a02Weight);
            this.switchToNextLanguageWeight = sanitizeWeight(switchToNextLanguageWeight);
            this.spaceWeight = sanitizeWeight(spaceWeight);
            this.a06Weight = sanitizeWeight(a06Weight);
            this.a08Weight = sanitizeWeight(a08Weight);
            this.imeActionWeight = sanitizeWeight(imeActionWeight);
        }
    }
}
