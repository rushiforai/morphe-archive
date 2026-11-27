/*
 * Rambler Bangla diagnostic counter helper (opt-in, no raw text stored).
 *
 * Copyright (C) 2026 muhib-karim & Rambler Bangla contributors
 * Licensed under the GNU General Public License v3.0. See LICENSE and ATTRIBUTION.md.
 */
package com.akshaykadam.pixelboard.extension.rambler;

import android.content.Context;
import android.content.SharedPreferences;

public final class GboardRamblerDiag {
    private GboardRamblerDiag() {
    }

    public static void bump(String key) {
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            SharedPreferences prefs = GboardRamblerScriptFixSettings.prefsOrNull(app);
            if (prefs == null) {
                return;
            }
            prefs.edit().putInt(key, prefs.getInt(key, 0) + 1).apply();
        } catch (Throwable ignored) {
        }
    }

    public static void note(String key, String value) {
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            SharedPreferences prefs = GboardRamblerScriptFixSettings.prefsOrNull(app);
            if (prefs == null) {
                return;
            }
            prefs.edit().putString(key, value == null ? "" : value).apply();
        } catch (Throwable ignored) {
        }
    }

    public static void appendGate(String entry) {
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            SharedPreferences prefs = GboardRamblerScriptFixSettings.prefsOrNull(app);
            if (prefs == null) {
                return;
            }
            String existing = prefs.getString("diag_gate_history", "");
            if (existing == null) {
                existing = "";
            }
            String updated = existing.isEmpty() ? entry : (existing + " | " + entry);
            if (updated.length() > 600) {
                updated = updated.substring(updated.length() - 600);
            }
            prefs.edit().putString("diag_gate_history", updated).apply();
        } catch (Throwable ignored) {
        }
    }

    public static String readString(String key) {
        try {
            Context app = GboardRamblerScriptFixSettings.currentApplication();
            SharedPreferences prefs = GboardRamblerScriptFixSettings.prefsOrNull(app);
            if (prefs == null) {
                return "";
            }
            String val = prefs.getString(key, "");
            return val == null ? "" : val;
        } catch (Throwable ignored) {
            return "";
        }
    }
}
