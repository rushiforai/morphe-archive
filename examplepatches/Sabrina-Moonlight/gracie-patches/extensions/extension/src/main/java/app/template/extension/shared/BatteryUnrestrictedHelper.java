/*
 * Copyright (C) 2026 Sabrina-Moonlight / Gracie Patches
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.template.extension.shared;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.PowerManager;
import android.provider.Settings;

/**
 * Opens the system dialog that asks the user to allow unrestricted battery
 * (ignore battery optimizations) when the app is not already on the whitelist.
 */
@SuppressWarnings("unused")
public final class BatteryUnrestrictedHelper {

    private BatteryUnrestrictedHelper() {
    }

    /**
     * If the app is not ignoring battery optimizations, starts the system
     * request screen. Safe to call from Application.onCreate (uses NEW_TASK).
     * Failures are swallowed so a missing permission or OEM quirk never crashes.
     */
    public static void requestIfNeeded(Context context) {
        if (context == null) {
            return;
        }
        try {
            PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
            String pkg = context.getPackageName();
            if (pm == null || pkg == null) {
                return;
            }
            if (pm.isIgnoringBatteryOptimizations(pkg)) {
                return;
            }
            Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
            intent.setData(Uri.parse("package:" + pkg));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Throwable ignored) {
            // Permission missing, OEM blocked background start, etc.
        }
    }
}
