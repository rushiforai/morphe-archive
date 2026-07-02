package dev.jason.gboardpatches.extension.writingtools;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardAiWritingToolsSettings {
    public static final String PREF_FILE = "gboard_ai_writing_tools";
    public static final String PREF_KEY_ENABLED = "pref_ai_writing_tools_enabled";
    public static final String PREF_KEY_ALL_KEYBOARDS =
            "pref_ai_writing_tools_all_keyboards_enabled";
    public static final boolean DEFAULT_ENABLED = true;
    public static final boolean DEFAULT_ALL_KEYBOARDS = false;

    private GboardAiWritingToolsSettings() {
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
        if (!preferences.contains(PREF_KEY_ENABLED)) {
            editor = preferences.edit();
            editor.putBoolean(PREF_KEY_ENABLED, DEFAULT_ENABLED);
        }
        if (!preferences.contains(PREF_KEY_ALL_KEYBOARDS)) {
            if (editor == null) {
                editor = preferences.edit();
            }
            editor.putBoolean(PREF_KEY_ALL_KEYBOARDS, DEFAULT_ALL_KEYBOARDS);
        }
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

    public static boolean readAllKeyboardsEnabled(SharedPreferences preferences) {
        if (preferences == null) {
            return DEFAULT_ALL_KEYBOARDS;
        }
        try {
            return preferences.getBoolean(PREF_KEY_ALL_KEYBOARDS, DEFAULT_ALL_KEYBOARDS);
        } catch (ClassCastException ignored) {
            return DEFAULT_ALL_KEYBOARDS;
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

    public static boolean writeAllKeyboardsEnabled(SharedPreferences preferences,
            boolean enabled) {
        if (preferences == null) {
            return false;
        }
        try {
            return preferences.edit()
                    .putBoolean(PREF_KEY_ALL_KEYBOARDS, enabled)
                    .commit();
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static Snapshot snapshot(Context context) {
        SharedPreferences preferences = preferences(context);
        ensureDefaults(preferences);
        return new Snapshot(
                readEnabled(preferences),
                readAllKeyboardsEnabled(preferences));
    }

    public static final class Snapshot {
        public final boolean featureEnabled;
        public final boolean allKeyboardsEnabled;

        public Snapshot(boolean featureEnabled, boolean allKeyboardsEnabled) {
            this.featureEnabled = featureEnabled;
            this.allKeyboardsEnabled = featureEnabled && allKeyboardsEnabled;
        }
    }
}
