/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.app.SemActivityTaskManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;

/** "Disable post-processing" switch storage + query. */
@SuppressWarnings("unused")
public final class PpBypass {
    public static final String TAG = "GrawMod";
    public static final String PREFS = "graw_mod_prefs";
    public static final String KEY = "disable_post_processing";

    private PpBypass() {}

    public static boolean isEnabled(Context c) {
        if (c == null) return false;
        try {
            return c.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getBoolean(KEY, false);
        } catch (Throwable t) {
            return false;
        }
    }

    public static void set(Context c, boolean on) {
        if (c == null) return;
        SharedPreferences.Editor e = c.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit();
        e.putBoolean(KEY, on).apply();
        Log.i(TAG, "disable_post_processing set to " + on);
    }

    /** Hooked into the Expert RAW photo makers' single-frame decision. */
    public static boolean forceSingleFrame(Context c) {
        if (!isEnabled(c)) return false;
        Log.i(TAG, "post-processing bypass ON: forcing single-frame capture (no multi-frame merge)");
        return true;
    }

    /** getCameraCutoutSetting needs MANAGE_ACTIVITY_TASKS (signature); default 0 when denied. */
    public static int safeCutout(SemActivityTaskManager m, int userId, String pkg) {
        try {
            return m.getCameraCutoutSetting(userId, pkg);
        } catch (Throwable t) {
            Log.w(TAG, "getCameraCutoutSetting denied: " + t);
            return 0;
        }
    }
}
