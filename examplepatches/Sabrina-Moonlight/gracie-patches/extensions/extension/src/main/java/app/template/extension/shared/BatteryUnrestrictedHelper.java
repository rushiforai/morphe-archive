/*
 * Copyright (C) 2026 Sabrina-Moonlight / Gracie Patches
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.extension.shared;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;

/**
 * Shows the system dialog to allow unrestricted battery if not already granted.
 */
@SuppressWarnings("unused")
public final class BatteryUnrestrictedHelper {

    private static boolean requested;

    private BatteryUnrestrictedHelper() {
    }

    public static void requestIfNeeded(Context context) {
        if (context == null || requested) {
            return;
        }
        try {
            Context app = context.getApplicationContext();
            if (app == null) {
                app = context;
            }
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
                return;
            }
            PowerManager pm = (PowerManager) app.getSystemService(Context.POWER_SERVICE);
            String pkg = app.getPackageName();
            if (pm == null || pkg == null) {
                return;
            }
            if (pm.isIgnoringBatteryOptimizations(pkg)) {
                return;
            }
            requested = true;
            try {
                Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
                intent.setData(Uri.parse("package:" + pkg));
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                app.startActivity(intent);
            } catch (Throwable first) {
                // Fallback: open the battery settings list for this package
                Intent fallback = new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS);
                fallback.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                app.startActivity(fallback);
            }
        } catch (Throwable ignored) {
        }
    }
}
