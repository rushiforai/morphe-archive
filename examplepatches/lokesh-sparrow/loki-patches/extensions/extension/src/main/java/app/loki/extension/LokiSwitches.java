/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.loki.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Build;
import android.os.Bundle;

/**
 * The switches for behaviour a patch built in but the user may turn off: Splitwise's AMOLED black and
 * Truecaller's after-call screen. Both default to on, so an install behaves as before until the user flips one.
 * Stored in Loki's own preferences, so Backup &amp; restore and Reset cover them.
 */
public final class LokiSwitches {
    static final String AMOLED = "amoled_black";
    static final String HIDE_AFTER_CALL = "hide_after_call";

    /** Name of the night theme overlay the AMOLED patch adds (values: empty, values-night: the black items). */
    private static final String AMOLED_STYLE = "LokiAmoledBlack";

    private LokiSwitches() {
    }

    public static boolean get(Context context, String key) {
        return context != null && LokiPrefs.store(context).getBoolean(key, true);
    }

    public static void set(Context context, String key, boolean on) {
        LokiPrefs.store(context).edit().putBoolean(key, on).apply();
    }

    // region Truecaller

    /** Called at the start of Truecaller's after-call entry (dm1.a): true = skip the screen. */
    public static boolean hideAfterCall() {
        try {
            return get(LokiLog.application(), HIDE_AFTER_CALL);
        } catch (Throwable error) {
            return true;
        }
    }

    // endregion

    // region Splitwise AMOLED

    /**
     * Registers the hook that layers the black night overlay onto every Splitwise screen's theme before it is
     * created. Called once from MenuProvider at app start; does nothing unless the AMOLED patch is in this
     * install. The switch is read once per process, so a change needs a restart (the screen offers one).
     */
    static void installAmoled(Context context) {
        if (context == null || Build.VERSION.SDK_INT < 29) return;
        if (!MenuInfo.on(context, "app.loki.menu.amoled")) return;
        if (!get(context, AMOLED)) return;
        final int overlay = context.getResources().getIdentifier(AMOLED_STYLE, "style", context.getPackageName());
        if (overlay == 0) {
            LokiLog.note("amoled: overlay style missing");
            return;
        }
        amoledOn = true;
        Application app = (Application) context.getApplicationContext();
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityPreCreated(Activity activity, Bundle state) {
                // Before onCreate, so the first frame is already black. In light mode the overlay resolves to
                // the empty values/ copy and changes nothing.
                if (activity instanceof MenuActivity) return;
                try {
                    activity.getTheme().applyStyle(overlay, true);
                } catch (Throwable error) {
                    LokiLog.note("amoled: " + error);
                }
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityResumed(Activity activity) {
            }

            @Override
            public void onActivityPaused(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle state) {
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    private static volatile boolean amoledOn;

    /** Background of the group totals charts, which take a colour string instead of following the theme. */
    public static String chartBackground() {
        return amoledOn ? "#000000" : "#202224";
    }

    // endregion
}
