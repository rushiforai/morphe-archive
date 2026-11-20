/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

// Modified for Heval's Morphe Patches (2026-10-11): standalone, Android-SDK-only rewrite of
// app.morphe.extension.shared.patches.GmsCoreSupportPatch. No shared extension library,
// settings framework, string resources or network calls; hard-coded English strings; only the
// "not installed" and "battery optimisation" checks are kept.

package app.template.extension.gmscore;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

/**
 * Checks at app start that MicroG RE (GmsCore) is installed and allowed to run in the
 * background. The "GmsCore support" patch rewrites the app's Google Play services references to
 * MicroG RE's package, so Google sign-in and Google APIs only work while MicroG RE is installed.
 */
@SuppressWarnings("unused")
public final class GmsCoreSupport {
    private static final String TAG = "Morphe-GmsCore";

    /** MicroG RE. The patch points every Google Play services reference at this package. */
    private static final String MICROG_PACKAGE = "app.revanced.android.gms";

    /**
     * Vanced MicroG. It answers under its own package name, which the patched app does not call,
     * so it cannot stand in for MicroG RE.
     */
    private static final String VANCED_MICROG_PACKAGE = "com.mgoogle.android.gms";

    private static final String DOWNLOAD_URL = "https://github.com/MorpheApp/MicroG-RE/releases";

    private static final String PREFERENCES_NAME = "morphe_gmscore";
    private static final String PREFERENCE_SKIP_BATTERY_DIALOG = "skip_battery_optimization_dialog";
    private static final String PREFERENCE_DOWNLOAD_PAGE_OPENED = "download_page_opened";

    /** Lets the activity finish initialising (window, theme) before a dialog or page opens. */
    private static final long UI_DELAY_MILLIS = 100;

    /** Checked once per process, not on every activity recreation. */
    private static volatile boolean checked;

    private GmsCoreSupport() {
    }

    /**
     * Injection point: start of the main activity's onCreate. Never throws.
     */
    public static void checkGmsCore(Activity activity) {
        if (checked || activity == null) return;
        checked = true;

        try {
            PackageManager packageManager = activity.getPackageManager();

            if (!isInstalledAndEnabled(packageManager, MICROG_PACKAGE)) {
                Log.i(TAG, "MicroG RE is not installed or disabled");

                String message = isInstalledAndEnabled(packageManager, VANCED_MICROG_PACKAGE)
                        ? "This patched app needs MicroG RE for Google sign-in and notifications. Vanced MicroG does not work with it."
                        : "MicroG RE is not installed. This patched app needs it for Google sign-in and notifications.";
                // A toast, not a dialog: it still shows if the app fails to finish starting.
                Toast.makeText(activity.getApplicationContext(), message, Toast.LENGTH_LONG).show();
                // The download page opens once; after that only the toast reminds the user, so a
                // patched app without MicroG RE does not open the browser on every start.
                SharedPreferences preferences = getPreferences(activity);
                if (!preferences.getBoolean(PREFERENCE_DOWNLOAD_PAGE_OPENED, false)) {
                    preferences.edit().putBoolean(PREFERENCE_DOWNLOAD_PAGE_OPENED, true).apply();
                    runDelayed(() -> openDownloadPage(activity));
                }
                return;
            }

            if (isBatteryOptimized(activity) && !getPreferences(activity)
                    .getBoolean(PREFERENCE_SKIP_BATTERY_DIALOG, false)) {
                Log.i(TAG, "MicroG RE is subject to battery optimisation");
                runDelayed(() -> showBatteryOptimizationDialog(activity));
            }
        } catch (Throwable t) {
            Log.e(TAG, "checkGmsCore failure", t);
        }
    }

    private static boolean isInstalledAndEnabled(PackageManager packageManager, String packageName) {
        try {
            ApplicationInfo info = packageManager.getApplicationInfo(packageName, 0);
            return info.enabled;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    /**
     * @return True if MicroG RE may be stopped in the background, which breaks sign-in and
     *         token refresh. Android Automotive has no such setting.
     */
    private static boolean isBatteryOptimized(Context context) {
        if (context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE)) {
            return false;
        }
        PowerManager powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return powerManager != null && !powerManager.isIgnoringBatteryOptimizations(MICROG_PACKAGE);
    }

    private static void showBatteryOptimizationDialog(Activity activity) {
        try {
            if (activity.isFinishing() || activity.isDestroyed()) return;

            new AlertDialog.Builder(activity)
                    .setTitle("MicroG RE")
                    .setMessage("MicroG RE is restricted by battery optimisation, so Google sign-in, "
                            + "sync and notifications can fail in the background. Allow MicroG RE to run "
                            + "without restrictions?")
                    .setPositiveButton("Continue", (dialog, which) -> openBatteryOptimizationSettings(activity))
                    .setNegativeButton("Not now", null)
                    .setNeutralButton("Don't ask again", (dialog, which) -> getPreferences(activity)
                            .edit()
                            .putBoolean(PREFERENCE_SKIP_BATTERY_DIALOG, true)
                            .apply())
                    .setCancelable(true)
                    .show();
        } catch (Throwable t) {
            Log.e(TAG, "Could not show the battery optimisation dialog", t);
        }
    }

    /**
     * Asks to exempt MicroG RE. The system prompt only needs MicroG RE itself to request the
     * permission, which it does; the list of all apps is the fallback.
     */
    private static void openBatteryOptimizationSettings(Activity activity) {
        try {
            Intent request = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                    Uri.fromParts("package", MICROG_PACKAGE, null));
            activity.startActivity(request);
        } catch (ActivityNotFoundException | SecurityException e) {
            try {
                activity.startActivity(new Intent(Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS));
            } catch (Throwable t) {
                Log.e(TAG, "Could not open the battery optimisation settings", t);
            }
        } catch (Throwable t) {
            Log.e(TAG, "Could not request the battery optimisation exemption", t);
        }
    }

    /**
     * Opens the MicroG RE releases page. The app keeps running: only Google features need
     * MicroG RE.
     */
    private static void openDownloadPage(Activity activity) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(DOWNLOAD_URL));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "Could not open " + DOWNLOAD_URL, t);
        }
    }

    private static SharedPreferences getPreferences(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static void runDelayed(Runnable runnable) {
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            try {
                runnable.run();
            } catch (Throwable t) {
                Log.e(TAG, "Delayed GmsCore action failed", t);
            }
        }, UI_DELAY_MILLIS);
    }
}
