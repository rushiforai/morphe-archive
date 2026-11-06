package dev.jason.gboardpatches.extension.ocr;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardOcrSettings {
    public static final String PREF_FILE = "gboard_ocr_settings";
    public static final String PREF_KEY_ENGINE = "pref_ocr_engine";
    public static final String DEFAULT_ENGINE = "latin";

    private GboardOcrSettings() {
    }

    public static SharedPreferences preferences(Context context) {
        Context applicationContext = context == null ? null : context.getApplicationContext();
        Context lookupContext = applicationContext != null ? applicationContext : context;
        return lookupContext == null
                ? null
                : lookupContext.getSharedPreferences(PREF_FILE, Context.MODE_PRIVATE);
    }

    public static void ensureDefaults(Context context) {
        ensureDefaults(preferences(context));
    }

    public static void ensureDefaults(SharedPreferences preferences) {
        if (preferences == null) {
            return;
        }
        String rawValue;
        try {
            rawValue = preferences.getString(PREF_KEY_ENGINE, DEFAULT_ENGINE);
        } catch (ClassCastException ignored) {
            rawValue = null;
        }
        String sanitizedValue = GboardOcrEngine.fromValue(rawValue).getSettingsValue();
        if (!preferences.contains(PREF_KEY_ENGINE) || !sanitizedValue.equals(rawValue)) {
            preferences.edit().putString(PREF_KEY_ENGINE, sanitizedValue).apply();
        }
    }

    public static GboardOcrEngine readEngine(Context context) {
        return readEngine(preferences(context));
    }

    public static GboardOcrEngine readEngine(SharedPreferences preferences) {
        return GboardOcrEngine.fromValue(readEngineValue(preferences));
    }

    public static String readEngineValue(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ENGINE;
        }
        try {
            String stored = preferences.getString(PREF_KEY_ENGINE, DEFAULT_ENGINE);
            return GboardOcrEngine.fromValue(stored).getSettingsValue();
        } catch (ClassCastException ignored) {
            return DEFAULT_ENGINE;
        }
    }

    public static boolean writeEngine(Context context, String value) {
        return writeEngine(preferences(context), value);
    }

    public static boolean writeEngine(SharedPreferences preferences, String value) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putString(PREF_KEY_ENGINE,
                            GboardOcrEngine.fromValue(value).getSettingsValue())
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }
}
