/*
 * Ported from Morphe's GmsCoreSupportPatch extension (GPL-3.0):
 * https://github.com/MorpheApp/morphe-patches/blob/main/extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/patches/GmsCoreSupportPatch.java
 * Copyright 2026 Morphe. Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 * See the NOTICE file for the GPLv3 Section 7 terms that apply to Morphe contributions.
 * ALL CREDIT FOR THE GMSCORE CHECKS GOES TO MORPHE AND REVANCED.
 */

package semicoloncolonel.mobilestream.extension.shared.misc;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;
import android.widget.Toast;

/**
 * Checks, when the app's main activity starts, that GmsCore is installed,
 * exempt from battery optimization, and running in the background, and that
 * the app may see GmsCore's accounts. Without these the app cannot sign in or
 * keep its session.
 *
 * Morphe's version also looks for other microG installs signed with a key
 * other than MicroG-RE's, and checks GitHub for MicroG-RE updates. Both are
 * left out: ReVanced's GmsCore uses the same package name as MicroG-RE but a
 * different key, so it would be reported as a conflict. Morphe's settings
 * switch for the battery dialog is always on here, and its dialogs use plain
 * English strings because this extension has no string resources.
 */
@SuppressWarnings("unused")
public final class GmsCoreSupport {
    private static final String TAG = "MSP-GMS";

    private static final String GMS_CORE_PACKAGE_NAME = getGmsCoreVendorGroupId() + ".android.gms";
    private static final Uri GMS_CORE_PROVIDER =
            Uri.parse("content://" + getGmsCoreVendorGroupId() + ".android.gsf.gservices/prefix");
    private static final String GMS_CORE_DOWNLOAD = "https://github.com/ReVanced/GmsCore/releases/latest";
    private static final String DONT_KILL_MY_APP = "https://dontkillmyapp.com/?app=MicroG";
    private static final String DIALOG_TITLE = "GmsCore";
    private static final String PREFS = "msp_gmscore";
    private static final String PREF_ASKED_ACCOUNTS = "asked_get_accounts";

    private GmsCoreSupport() {
    }

    /** Overwritten by "GmsCore support" to return the stock package name. */
    public static String getOriginalPackageName() {
        return null;
    }

    /** Overwritten by "GmsCore support" to return GmsCore's vendor id. */
    public static String getGmsCoreVendorGroupId() {
        return "app.revanced";
    }

    private static void open(Activity activity, String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        activity.startActivity(intent);

        // Exit, otherwise the app keeps running without a working sign-in.
        System.exit(0);
    }

    private static void showDialog(Activity activity, String message, String buttonText, Runnable action) {
        // A short delay lets the activity finish starting, so the dialog
        // uses the right light or dark theme.
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            new AlertDialog.Builder(activity)
                    .setTitle(DIALOG_TITLE)
                    .setMessage(message)
                    .setPositiveButton(buttonText, (dialog, which) -> action.run())
                    // Cancelable, in case the change cannot be made on this device.
                    .setCancelable(true)
                    .show();
        }, 100);
    }

    /** Injection point: the main activity's onCreate. */
    public static void checkGmsCore(Activity activity) {
        try {
            // Null when "GmsCore support" was not applied. The app can keep its
            // stock package name and still need GmsCore.
            if (getOriginalPackageName() == null) return;

            if (!isInstalled(activity, GMS_CORE_PACKAGE_NAME)) {
                Log.i(TAG, "GmsCore was not found");
                // A toast, not a dialog: some installs crash before a dialog can show.
                Toast.makeText(activity,
                        "GmsCore is not installed. Install ReVanced GmsCore to sign in.",
                        Toast.LENGTH_LONG).show();
                open(activity, GMS_CORE_DOWNLOAD);
                return;
            }

            if (activity.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE)) {
                // Android Automotive has no battery optimization setting.
                Log.d(TAG, "Device is Android Automotive");
            } else if (batteryOptimizationsEnabled(activity)) {
                Log.i(TAG, "GmsCore is not exempt from battery optimization");
                showDialog(activity,
                        "GmsCore is not exempt from battery optimization. Android can stop it in "
                                + "the background, and " + appName(activity) + " can then lose its sign-in or "
                                + "notifications. Tap Continue and allow GmsCore to run in the "
                                + "background.",
                        "Continue",
                        () -> openDisableBatteryOptimizations(activity));
                return;
            }

            try (ContentProviderClient client =
                         activity.getContentResolver().acquireContentProviderClient(GMS_CORE_PROVIDER)) {
                if (client == null) {
                    Log.i(TAG, "GmsCore is not running in the background");
                    showDialog(activity,
                            "GmsCore is not running in the background. Your phone may be stopping "
                                    + "it. Tap Open website for steps to keep it running on this "
                                    + "phone.",
                            "Open website",
                            () -> open(activity, DONT_KILL_MY_APP));
                    return;
                }
            }

            checkAccountsPermission(activity);
        } catch (Exception ex) {
            Log.e(TAG, "checkGmsCore failure", ex);
        }
    }

    /**
     * GmsCore lists its accounts only to apps signed by Google or holding
     * GET_ACCOUNTS. The stock app never asks for GET_ACCOUNTS, because Google
     * Play services does not need it, so without this the sign-in screen
     * shows no accounts.
     */
    private static void checkAccountsPermission(Activity activity) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return;
        if (activity.checkSelfPermission(Manifest.permission.GET_ACCOUNTS) == PackageManager.PERMISSION_GRANTED) {
            return;
        }
        // Apps that sign in through GmsCore's own account picker do not declare it.
        if (!declaresPermission(activity, Manifest.permission.GET_ACCOUNTS)) return;
        Log.i(TAG, "GET_ACCOUNTS is not granted");

        SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        // Once denied for good, Android ignores further requests, so send the
        // user to the app's settings instead.
        boolean askedBefore = prefs.getBoolean(PREF_ASKED_ACCOUNTS, false);
        boolean useSettings = askedBefore
                && !activity.shouldShowRequestPermissionRationale(Manifest.permission.GET_ACCOUNTS);

        showDialog(activity,
                "To sign in, " + appName(activity) + " needs permission to see the Google accounts you added to "
                        + "GmsCore. Without it, the sign-in screen shows no accounts.\n\n"
                        + "Android lists this permission under Contacts. " + appName(activity) + " cannot read "
                        + "your contacts with it. These patches do not collect or send any of "
                        + "your data.\n\n"
                        + (useSettings
                        ? "Tap Open settings, then allow Contacts under Permissions."
                        : "Tap Continue, then choose Allow."),
                useSettings ? "Open settings" : "Continue",
                () -> {
                    if (useSettings) {
                        Intent intent = new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                Uri.fromParts("package", activity.getPackageName(), null));
                        activity.startActivity(intent);
                    } else {
                        prefs.edit().putBoolean(PREF_ASKED_ACCOUNTS, true).apply();
                        activity.requestPermissions(new String[]{Manifest.permission.GET_ACCOUNTS}, 0);
                    }
                });
    }

    private static String appName(Context context) {
        return context.getApplicationInfo().loadLabel(context.getPackageManager()).toString();
    }

    private static boolean declaresPermission(Context context, String permission) {
        try {
            String[] requested = context.getPackageManager().getPackageInfo(
                    context.getPackageName(), PackageManager.GET_PERMISSIONS).requestedPermissions;
            if (requested == null) return false;
            for (String name : requested) {
                if (permission.equals(name)) return true;
            }
        } catch (PackageManager.NameNotFoundException ex) {
            Log.e(TAG, "declaresPermission failure", ex);
        }
        return false;
    }

    private static boolean isInstalled(Context context, String packageName) {
        try {
            context.getPackageManager().getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException ex) {
            return false;
        }
    }

    @SuppressLint("BatteryLife") // The permission is part of GmsCore.
    private static void openDisableBatteryOptimizations(Activity activity) {
        Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
        intent.setData(Uri.fromParts("package", GMS_CORE_PACKAGE_NAME, null));
        activity.startActivityForResult(intent, 0);
    }

    private static boolean batteryOptimizationsEnabled(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) return false;
        PowerManager powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return powerManager != null && !powerManager.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE_NAME);
    }
}
