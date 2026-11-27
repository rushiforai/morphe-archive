/*
 * Rambler Bangla settings bridge (Direct-Boot safe via RamblerEnhancementsSettings).
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors
 * Licensed under the GNU General Public License v3.0. See LICENSE and ATTRIBUTION.md.
 */
package com.akshaykadam.pixelboard.extension.rambler;

import android.content.Context;
import android.content.SharedPreferences;

import dev.abotmaker.ramblerenhancements.RamblerEnhancementsSettings;

public final class GboardRamblerScriptFixSettings {
    public static final String PREF_KEY_CONVERTED_COUNT = "pref_rambler_script_fix_converted_count";
    public static final String PREF_KEY_ENABLED = "pref_rambler_script_fix_enabled";
    public static final String PREF_KEY_DIAG_ARMED = "pref_rambler_diag_armed";

    private GboardRamblerScriptFixSettings() {
    }

    public static Context currentApplication() {
        try {
            Object invoke = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (invoke instanceof Context) {
                return (Context) invoke;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    public static SharedPreferences prefsOrNull(Context context) {
        if (context == null) {
            return null;
        }
        try {
            return RamblerEnhancementsSettings.preferencesOrNull(context);
        } catch (Throwable ignored) {
            try {
                return context.getSharedPreferences(RamblerEnhancementsSettings.PREF_FILE, Context.MODE_PRIVATE);
            } catch (Throwable ignored2) {
                return null;
            }
        }
    }

    public static boolean isEnabled() {
        Context app = currentApplication();
        if (app == null) {
            return true;
        }
        return isEnabled(prefsOrNull(app));
    }

    public static boolean isEnabled(Context context) {
        return isEnabled(prefsOrNull(context));
    }

    public static boolean isEnabled(SharedPreferences sharedPreferences) {
        if (sharedPreferences == null) {
            return true;
        }
        try {
            return sharedPreferences.getBoolean(PREF_KEY_ENABLED, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    public static void setEnabled(Context context, boolean enabled) {
        setEnabled(prefsOrNull(context), enabled);
    }

    public static void setEnabled(SharedPreferences sharedPreferences, boolean enabled) {
        if (sharedPreferences == null) {
            return;
        }
        try {
            sharedPreferences.edit().putBoolean(PREF_KEY_ENABLED, enabled).apply();
        } catch (Throwable ignored) {
        }
    }

    public static boolean isDiagArmed() {
        Context app = currentApplication();
        if (app == null) {
            return false;
        }
        return isDiagArmed(prefsOrNull(app));
    }

    public static boolean isDiagArmed(Context context) {
        return isDiagArmed(prefsOrNull(context));
    }

    public static boolean isDiagArmed(SharedPreferences sharedPreferences) {
        if (sharedPreferences == null) {
            return false;
        }
        try {
            return sharedPreferences.getBoolean(PREF_KEY_DIAG_ARMED, false);
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void setDiagArmed(Context context, boolean armed) {
        setDiagArmed(prefsOrNull(context), armed);
    }

    public static void setDiagArmed(SharedPreferences sharedPreferences, boolean armed) {
        if (sharedPreferences == null) {
            return;
        }
        try {
            sharedPreferences.edit().putBoolean(PREF_KEY_DIAG_ARMED, armed).apply();
        } catch (Throwable ignored) {
        }
    }

    public static void setDiagArmed(boolean armed) {
        Context app = currentApplication();
        if (app == null) {
            return;
        }
        setDiagArmed(prefsOrNull(app), armed);
    }

    public static int getConvertedCount(Context context) {
        return getConvertedCount(prefsOrNull(context));
    }

    public static int getConvertedCount(SharedPreferences sharedPreferences) {
        if (sharedPreferences == null) {
            return 0;
        }
        try {
            return sharedPreferences.getInt(PREF_KEY_CONVERTED_COUNT, 0);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    public static void incrementConverted() {
        Context app = currentApplication();
        SharedPreferences prefs = prefsOrNull(app);
        if (prefs == null) {
            return;
        }
        try {
            int next = prefs.getInt(PREF_KEY_CONVERTED_COUNT, 0) + 1;
            prefs.edit().putInt(PREF_KEY_CONVERTED_COUNT, next).apply();
        } catch (Throwable ignored) {
        }
    }
}
