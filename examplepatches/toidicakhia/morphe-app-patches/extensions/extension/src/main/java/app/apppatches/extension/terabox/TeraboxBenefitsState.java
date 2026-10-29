/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.apppatches.extension.terabox;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

@SuppressWarnings("unused")
public final class TeraboxBenefitsState {

    private static final String TAG = "TeraboxBenefitsState";

    private static final String EXTRA_URL = "extra_url";

    private static final String BENEFITS_PATH = "/wap/commercial/taskcenter";

    private static volatile boolean active;

    private TeraboxBenefitsState() {
    }

    public static boolean isActive() {
        return active;
    }

    public static void onResume(Activity activity) {
        boolean benefits = isBenefits(activity);
        if (benefits == active) {
            return;
        }

        active = benefits;
        setAdsEnabled(activity, benefits);
    }

    public static void onDestroy(Activity activity) {
        if (!active || !isBenefits(activity)) {
            return;
        }

        active = false;
        setAdsEnabled(activity, false);
    }

    private static boolean isBenefits(Activity activity) {
        Intent intent = activity.getIntent();
        if (intent == null) {
            return false;
        }

        String url = intent.getStringExtra(EXTRA_URL);
        return url != null && url.contains(BENEFITS_PATH);
    }

    private static void setAdsEnabled(Context context, boolean enabled) {
        Log.d(TAG, "Ads enabled: " + enabled);

        try {
            Class<?> managerClass = Class.forName("com.dubox.drive.ads.AdManager");

            if (enabled) {
                managerClass.getMethod("i8", Context.class).invoke(null, context);
            }

            Field instanceField = managerClass.getDeclaredField("_");
            instanceField.setAccessible(true);
            Object manager = instanceField.get(null);

            if (enabled) {
                managerClass.getMethod("t9", boolean.class).invoke(manager, true);
            } else {
                managerClass.getMethod("d5").invoke(manager);
            }
        } catch (Throwable exception) {
            Log.w(TAG, "Could not toggle ads", exception);
        }
    }
}
