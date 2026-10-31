/*
 * Based on the GmsCore support extension of Morphe Patches, https://github.com/MorpheApp/morphe-patches
 * See the included NOTICE file for the GPLv3 section 7 terms that apply to this code.
 */

package io.github.hyperstown.extension.maps;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

@SuppressWarnings("unused")
public final class GmsCoreSupport {
    private static final String TAG = "GmsCoreSupport";

    private static final String GMS_CORE_PACKAGE_NAME = "app.revanced.android.gms";
    private static final String GMS_CORE_DOWNLOAD_URL = "https://github.com/MorpheApp/MicroG-RE/releases/latest";

    private static final String PREFERENCES_NAME = "gms_core_support";
    private static final String PREFERENCE_SKIP_BATTERY_OPTIMIZATION = "skip_battery_optimization_dialog";

    private GmsCoreSupport() {
    }

    /**
     * Injection point: MapsActivity.onCreate.
     */
    public static void checkGmsCore(Activity activity) {
        try {
            try {
                activity.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE_NAME, 0);
            } catch (PackageManager.NameNotFoundException exception) {
                Log.i(TAG, "MicroG-RE is not installed");

                // A toast, because without GmsCore the app can crash before a dialog shows.
                Toast.makeText(activity, "Google Maps needs MicroG-RE. Install it, then open Maps again.",
                        Toast.LENGTH_LONG).show();
                activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(GMS_CORE_DOWNLOAD_URL))
                        .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
                // Exit, otherwise the broken app keeps running.
                System.exit(0);
                return;
            }

            if (!batteryOptimizationsEnabled(activity)) return;

            SharedPreferences preferences = activity.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
            if (preferences.getBoolean(PREFERENCE_SKIP_BATTERY_OPTIMIZATION, false)) return;

            Log.i(TAG, "MicroG-RE is not exempt from battery optimizations");
            // Delayed, so the dialog uses the theme of the fully created activity.
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;

                new AlertDialog.Builder(activity)
                        .setTitle("MicroG-RE")
                        .setMessage("MicroG-RE is not allowed to run in the background. "
                                + "Location sharing, notifications and signing in can stop working.\n\n"
                                + "Allow MicroG-RE to ignore battery optimizations?")
                        .setPositiveButton("Allow", (dialog, which) -> requestIgnoreBatteryOptimizations(activity))
                        .setNegativeButton("Not now", null)
                        .setNeutralButton("Don't ask again", (dialog, which) -> preferences.edit()
                                .putBoolean(PREFERENCE_SKIP_BATTERY_OPTIMIZATION, true).apply())
                        .show();
            }, 100);
        } catch (Exception exception) {
            Log.e(TAG, "checkGmsCore failure", exception);
        }
    }

    private static boolean batteryOptimizationsEnabled(Context context) {
        PowerManager powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return !powerManager.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE_NAME);
    }

    @SuppressLint("BatteryLife") // MicroG-RE declares the permission.
    private static void requestIgnoreBatteryOptimizations(Activity activity) {
        activity.startActivity(new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS)
                .setData(Uri.fromParts("package", GMS_CORE_PACKAGE_NAME, null)));
    }
}
