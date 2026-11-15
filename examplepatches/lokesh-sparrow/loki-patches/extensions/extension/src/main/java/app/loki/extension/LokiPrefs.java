/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Iterator;
import java.util.Map;

/**
 * The settings the Loki screen owns in apps other than LinkedIn. They live in their own preferences file so
 * export, import and reset never touch the app's own settings.
 */
public final class LokiPrefs {
    static final String TAG = "LokiPatches";
    private static final String STORE = "loki_patches_settings";
    private static final String KEY_DEBUG = "diagnostic_logging";

    private LokiPrefs() {
    }

    static SharedPreferences store(Context context) {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    public static boolean debug(Context context) {
        return store(context).getBoolean(KEY_DEBUG, false);
    }

    public static void setDebug(Context context, boolean on) {
        store(context).edit().putBoolean(KEY_DEBUG, on).apply();
    }

    /** Everything stored, for a backup file. */
    public static JSONObject toJson(Context context) throws JSONException {
        JSONObject out = new JSONObject();
        for (Map.Entry<String, ?> entry : store(context).getAll().entrySet()) {
            out.put(entry.getKey(), entry.getValue());
        }
        return out;
    }

    /** Writes the booleans and strings of a backup back; returns how many were applied. */
    public static int fromJson(Context context, JSONObject in) throws JSONException {
        SharedPreferences.Editor edit = store(context).edit();
        int applied = 0;
        for (Iterator<String> keys = in.keys(); keys.hasNext(); ) {
            String key = keys.next();
            Object value = in.get(key);
            if (value instanceof Boolean) {
                edit.putBoolean(key, (Boolean) value);
                applied++;
            } else if (value instanceof String) {
                edit.putString(key, (String) value);
                applied++;
            }
        }
        edit.apply();
        return applied;
    }

    public static void reset(Context context) {
        store(context).edit().clear().apply();
    }
}
