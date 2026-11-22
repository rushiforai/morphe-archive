/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to Morphe contributions.
 */

package app.morphe.extension.shared.patches;

import static app.morphe.extension.shared.requests.Route.Method.GET;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.app.SearchManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.net.Uri;
import android.os.Build;
import android.os.PowerManager;
import android.provider.Settings;

import androidx.annotation.Nullable;

import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Locale;

import app.morphe.extension.mapsautomotive.patches.BydBatteryPatch;
import app.morphe.extension.mapsautomotive.patches.CarAdb;
import app.morphe.extension.mapsautomotive.patches.M3;
import app.morphe.extension.mapsautomotive.patches.UiDensityPatch;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.Route;
import app.morphe.extension.shared.settings.SharedSettings;

@SuppressWarnings("unused")
public class GmsCoreSupportPatch {
    private static final String GMS_CORE_PACKAGE_NAME
            = getGmsCoreVendorGroupId() + ".android.gms";
    private static final Uri GMS_CORE_PROVIDER
            = Uri.parse("content://" + getGmsCoreVendorGroupId() + ".android.gsf.gservices/prefix");
    private static final String DONT_KILL_MY_APP_URL
            = "https://dontkillmyapp.com/";
    private static final Route DONT_KILL_MY_APP_MANUFACTURER_API
            = new Route(GET, "/api/v2/{manufacturer}.json");
    private static final String DONT_KILL_MY_APP_NAME_PARAMETER
            = "?app=MicroG";
    private static final String BUILD_MANUFACTURER
            = Build.MANUFACTURER.toLowerCase(Locale.ROOT).replace(" ", "-");

    /**
     * If a manufacturer specific page exists on DontKillMyApp.
     */
    @Nullable
    private static volatile Boolean DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED;

    private static String getOriginalPackageName() {
        return null; // Modified during patching.
    }

    /**
     * @return If the current package name is the same as the original unpatched app.
     *         If `GmsCore support` was not included during patching, this returns true;
     */
    public static boolean isPackageNameOriginal() {
        return isPackageNameOriginal(Utils.getContext());
    }

    private static boolean isPackageNameOriginal(Context context) {
        String originalPackageName = getOriginalPackageName();
        return originalPackageName == null
                || originalPackageName.equals(context.getPackageName());
    }

    private static void open(Activity context, String queryOrLink) {
        Logger.printInfo(() -> "Opening link: " + queryOrLink);

        Intent intent;
        try {
            // Check if queryOrLink is a valid URL.
            new URL(queryOrLink);

            intent = new Intent(Intent.ACTION_VIEW, Uri.parse(queryOrLink));
        } catch (MalformedURLException e) {
            intent = new Intent(Intent.ACTION_WEB_SEARCH);
            intent.putExtra(SearchManager.QUERY, queryOrLink);
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);

        // Gracefully exit, otherwise the broken app will continue to run.
        System.exit(0);
    }

    // The texts are here, in Thai and English like the extension's other screens: this bundle adds no
    // gms_core_* string resources to Maps, so reading them by name showed the raw keys (issue #9).
    private static String text(Context context, String thai, String english) {
        return UiDensityPatch.isThai(context) ? thai : english;
    }

    /** MicroG-RE's package on the battery whitelist, the command of the README's install step 1. */
    private static final String WHITELIST_COMMAND = "adb shell dumpsys deviceidle whitelist +" + GMS_CORE_PACKAGE_NAME;

    private static void showBatteryOptimizationDialog(Activity context,
                                                      String dialogMessage,
                                                      String positiveButtonText,
                                                      DialogInterface.OnClickListener onPositiveClickListener) {
        showDialog(context, text(context, "ต้องตั้งค่า MicroG-RE", "MicroG-RE needs a setting"), dialogMessage,
                positiveButtonText, onPositiveClickListener, null);
    }

    // The BYD battery dialog. With the car's own ADB answering: "Do it now" runs the command there (CarAdb), "Later"
    // closes; without it: the command and OK, as before.
    private static void showBydBatteryDialog(Activity context, String message, boolean carAdb) {
        if (context.isFinishing() || context.isDestroyed()) return;
        if (!carAdb) {
            showBatteryOptimizationDialog(context, message, text(context, "ตกลง", "OK"), (dialog, id) -> { });
            return;
        }
        String withButton = message + "\n\n" + text(context,
                "หรือกด ทำให้เลย เมื่อ Android ถามเรื่องการแก้ไขข้อบกพร่องผ่าน USB ให้ติ๊ก อนุญาตเสมอ แล้วกด อนุญาต"
                        + " Maps จะสั่งคำสั่งนี้ผ่าน ADB ของรถเอง",
                "Or tap Do it now. When Android asks \"Allow USB debugging?\", tick \"Always allow\" and tap Allow."
                        + " Maps then runs this command through the car's own ADB.");
        Utils.runOnMainThreadDelayed(() -> {
            // Maps Car's Material 3 dialog: Later beside Do it now.
            Dialog dialog = new M3.Builder(context)
                    .setTitle(text(context, "ต้องตั้งค่า MicroG-RE", "MicroG-RE needs a setting"))
                    .setMessage(withButton)
                    .setPositiveButton(text(context, "ทำให้เลย", "Do it now"),
                            (shown, which) -> CarAdb.whitelist(context, GMS_CORE_PACKAGE_NAME, WHITELIST_COMMAND))
                    .setNegativeButton(text(context, "ไว้ทีหลัง", "Later"), null)
                    .setCancelable(true)
                    .create();
            Utils.showDialog(context, dialog, true, null);
        }, 100);
    }

    // [onShown]: run when the dialog is on screen (possibly again after the app comes back), or null.
    private static void showDialog(Activity context,
                                   String title,
                                   String dialogMessage,
                                   String positiveButtonText,
                                   DialogInterface.OnClickListener onPositiveClickListener,
                                   @Nullable Runnable onShown) {
        // Use a delay to allow the activity to finish initializing.
        // Otherwise, if device is in dark mode the dialog is shown with wrong color scheme.
        Utils.runOnMainThreadDelayed(() -> {
            // Maps Car's Material 3 dialog. The listener gets no dialog and 0, as with the library's dialog.
            // Cancelable, so Back skips the action, in case the battery change can never be satisfied.
            Dialog dialog = new M3.Builder(context)
                    .setTitle(title)
                    .setMessage(dialogMessage)
                    .setPositiveButton(positiveButtonText, (shown, which) -> onPositiveClickListener.onClick(null, 0))
                    .setCancelable(true)
                    .create();

            // Show the dialog
            Utils.showDialog(context, dialog, true, onShown == null ? null : shown -> onShown.run());
        }, 100);
    }

    /**
     * Injection point.
     */
    public static void checkGmsCore(Activity context) {
        try {
            // Verify the user has not included GmsCore for a root installation.
            // GmsCore Support changes the package name, but with a mounted installation
            // all manifest changes are ignored and the original package name is used.
            // Must check both original package name and if resources load correctly
            // to allow changing to original package name with YT Music.
            if (isPackageNameOriginal(context) && ResourceUtils.getIdentifier(
                    ResourceType.STRING, "gms_core_dialog_title") == 0) {
                Logger.printInfo(() -> "App is mounted with root, but GmsCore patch was included");
                // Cannot use localize text here, since the app will load resources
                // from the unpatched app and all patch strings are missing.
                Utils.showToastLong("Do not include 'GmsCore support' patch with root install");

                // Do not exit. If the app exits before launch completes (and without
                // opening another activity), then on some devices such as Pixel phone Android 10
                // no toast will be shown and the app will continually relaunch
                // with the appearance of a hung app.
                open(context, "https://morphe.software");
                return;
            }

            // Verify GmsCore is installed.
            try {
                PackageManager manager = context.getPackageManager();
                manager.getPackageInfo(GMS_CORE_PACKAGE_NAME, PackageManager.GET_ACTIVITIES);
            } catch (PackageManager.NameNotFoundException exception) {
                Logger.printInfo(() -> "GmsCore was not found");
                // Cannot show a dialog and must show a toast,
                // because on some installations the app crashes before a dialog can be displayed.
                Utils.showToastLong(text(context, "ยังไม่ได้ติดตั้ง MicroG-RE ติดตั้งก่อนเปิดแอปนี้",
                        "MicroG-RE is not installed. Install it first."));
                open(context, getGmsCoreDownload());
                return;
            }

            // Another GmsCore build under MicroG-RE's package name: warned once per build.
            if (warnOtherProvider(context)) return;

            // Check if GmsCore is whitelisted from battery optimizations.
            if (isAndroidAutomotive(context)) {
                // Ignore Android Automotive devices (Google built-in),
                // as there is no way to disable battery optimizations.
                Logger.printDebug(() -> "Device is Android Automotive");
            } else if (batteryOptimizationsEnabled(context)) {
                Logger.printInfo(() -> "GmsCore is not whitelisted from battery optimizations");

                if (SharedSettings.GMS_CORE_BATTERY_OPTIMIZATION_DIALOG.get()) {
                    boolean byd = BydBatteryPatch.isByd();
                    String message = (byd
                            ? text(context,
                            "MicroG-RE ยังไม่อยู่ใน whitelist แบต ตำแหน่งอาจหยุดอัปเดตและ Send to car อาจไม่ทำงาน"
                                    + " บน BYD DiLink ตั้งจากหน้าจอไม่ได้ ให้สั่งครั้งเดียวผ่าน ADB (ขั้นตอนติดตั้งข้อ 1):",
                            "MicroG-RE is not on the battery whitelist, so location can stop updating and Send to car may"
                                    + " not work. BYD DiLink has no screen for this. Run once over ADB (Install step 1):")
                            : text(context,
                            "MicroG-RE ยังไม่อยู่ใน whitelist แบต ตำแหน่งอาจหยุดอัปเดตและ Send to car อาจไม่ทำงาน"
                                    + " กด เปิดหน้าตั้งค่า แล้วอนุญาต หรือสั่งครั้งเดียวผ่าน ADB (ขั้นตอนติดตั้งข้อ 1):",
                            "MicroG-RE is not on the battery whitelist, so location can stop updating and Send to car may"
                                    + " not work. Tap Open settings and allow it, or run once over ADB (Install step 1):"))
                            + "\n" + WHITELIST_COMMAND;
                    // On a BYD the system's dialog opens but does not whitelist MicroG-RE (DiLink 3): only the ADB
                    // command does. When the car's own ADB answers (owners turn on its wireless ADB to install), the
                    // dialog offers to run it there; otherwise the button only closes. Other cars get the system's
                    // dialog and the command.
                    if (byd) {
                        Utils.runOnBackgroundThread(() -> {
                            boolean carAdb = CarAdb.portOpen();
                            Logger.printInfo(() -> "Car's ADB on port 5555: " + (carAdb ? "answers" : "closed"));
                            Utils.runOnMainThread(() -> showBydBatteryDialog(context, message, carAdb));
                        });
                    } else {
                        showBatteryOptimizationDialog(context, message, text(context, "เปิดหน้าตั้งค่า", "Open settings"),
                                (dialog, id) -> openGmsCoreDisableBatteryOptimizationsIntent(context));
                    }
                    return;
                }
            }

            // Check if GmsCore is currently running in the background.
            var client = context.getContentResolver().acquireContentProviderClient(GMS_CORE_PROVIDER);
            //noinspection TryFinallyCanBeTryWithResources
            try {
                if (client == null) {
                    Logger.printInfo(() -> "GmsCore is not running in the background");

                    if (SharedSettings.GMS_CORE_BATTERY_OPTIMIZATION_DIALOG.get()) {
                        String message = text(context,
                                "MicroG-RE ไม่ได้ทำงานเบื้องหลัง แอปนี้จึงใช้บัญชี Google และตำแหน่งไม่ได้"
                                        + " เปิด MicroG-RE หนึ่งครั้ง และปิด MicroG-RE ใน BYD Disable Autostart",
                                "MicroG-RE is not running in the background, so this app cannot use the Google account or"
                                        + " location. Open MicroG-RE once, and turn MicroG-RE off in BYD Disable Autostart.");
                        // A head unit seldom has a browser for the guide's page: on a BYD the button only closes.
                        if (BydBatteryPatch.isByd()) {
                            showBatteryOptimizationDialog(context, message, text(context, "ตกลง", "OK"), (dialog, id) -> { });
                        } else {
                            checkIfDontKillMyAppSupportsManufacturer();
                            showBatteryOptimizationDialog(context, message, text(context, "เปิดคู่มือ", "Open the guide"),
                                    (dialog, id) -> openDontKillMyApp(context));
                        }
                    }
                }
            } finally {
                if (client != null) client.close();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "checkGmsCore failure", ex);
        }
    }

    /** SHA-256 of MicroG-RE's signing certificate (its releases 7.2.1 to 7.3.1). */
    static final String MICROG_RE_SIGNER = "0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7";
    private static final String CHECKS = "morphe_gms_check", PROVIDER_WARNED = "provider_warned";

    /**
     * The build to warn about, or null: [signer] (SHA-256, hex) is not MicroG-RE's and [warned] is not this build.
     * Plain Java, so it can be checked off the device.
     */
    @Nullable
    static String otherProvider(@Nullable String signer, @Nullable String versionName, long versionCode, @Nullable String warned) {
        if (signer == null || MICROG_RE_SIGNER.equals(signer)) return null;
        String build = versionName + " " + versionCode + " " + signer.substring(0, Math.min(16, signer.length()));
        return build.equals(warned) ? null : build;
    }

    @Nullable
    static String sha256(@Nullable Signature[] signatures) {
        if (signatures == null || signatures.length == 0 || signatures[0] == null) return null;
        try {
            StringBuilder hex = new StringBuilder();
            for (byte b : MessageDigest.getInstance("SHA-256").digest(signatures[0].toByteArray())) {
                hex.append(String.format(Locale.ROOT, "%02x", b));
            }
            return hex.toString();
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * Maps Car is built and checked with MicroG-RE. Another GmsCore under the same package name (an older ReVanced
     * GmsCore, for one) has made Maps crash at start, so the user hears once per installed build which one to use.
     * True when the warning is shown.
     */
    @SuppressWarnings("deprecation")
    private static boolean warnOtherProvider(Activity context) {
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE_NAME, PackageManager.GET_SIGNATURES);
            SharedPreferences checks = context.getSharedPreferences(CHECKS, Context.MODE_PRIVATE);
            String build = otherProvider(sha256(info.signatures), info.versionName, info.getLongVersionCode(),
                    checks.getString(PROVIDER_WARNED, null));
            if (build == null) return false;
            Logger.printInfo(() -> "GmsCore is not MicroG-RE: " + build);
            String version = info.versionName != null ? info.versionName : "?";
            String message = text(context,
                    "แอปนี้ใช้กับ MicroG-RE 7.3.0 แต่ MicroG ที่ติดตั้งอยู่เป็นตัวอื่น (" + version + ") แอปอาจปิดเองหรือ"
                            + " ใช้บัญชี Google ไม่ได้ ให้ถอน MicroG ตัวนี้ออก แล้วติดตั้ง MicroG-RE 7.3.0 (ขั้นตอนติดตั้งข้อ 1)",
                    "This app is made for MicroG-RE 7.3.0, but another MicroG is installed (" + version + "). The app may"
                            + " close by itself or lose the Google account. Uninstall this MicroG, then install MicroG-RE 7.3.0"
                            + " (Install step 1).");
            // Marked as warned once the dialog is on screen: a start that ends before it shows warns again next time.
            showDialog(context, text(context, "MicroG ไม่ใช่ MicroG-RE", "This MicroG is not MicroG-RE"), message,
                    text(context, "ตกลง", "OK"), (dialog, id) -> { },
                    () -> checks.edit().putString(PROVIDER_WARNED, build).apply());
            return true;
        } catch (Exception ex) {
            Logger.printException(() -> "provider check failure", ex);
            return false;
        }
    }

    @SuppressLint("BatteryLife") // Permission is part of GmsCore
    private static void openGmsCoreDisableBatteryOptimizationsIntent(Activity activity) {
        Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
        intent.setData(Uri.fromParts("package", GMS_CORE_PACKAGE_NAME, null));
        activity.startActivityForResult(intent, 0);
    }

    private static void checkIfDontKillMyAppSupportsManufacturer() {
        Utils.runOnBackgroundThread(() -> {
            try {
                final long start = System.currentTimeMillis();
                HttpURLConnection connection = Requester.getConnectionFromRoute(
                        DONT_KILL_MY_APP_URL, DONT_KILL_MY_APP_MANUFACTURER_API, BUILD_MANUFACTURER);
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);

                final boolean supported = connection.getResponseCode() == 200;
                Logger.printInfo(() -> "Manufacturer is " + (supported ? "" : "NOT ")
                        + "listed on DontKillMyApp: " + BUILD_MANUFACTURER
                        + " fetch took: " + (System.currentTimeMillis() - start) + "ms");
                DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED = supported;
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not check if manufacturer is listed on DontKillMyApp: "
                        + BUILD_MANUFACTURER, ex);
                DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED = null;
            }
        });
    }

    private static void openDontKillMyApp(Activity activity) {
        final Boolean manufacturerSupported = DONT_KILL_MY_APP_MANUFACTURER_SUPPORTED;

        String manufacturerPageToOpen;
        if (manufacturerSupported == null) {
            // Fetch has not completed yet. Only happens on extremely slow internet connections
            // and the user spends less than 1 second reading what's on screen.
            // Instead of waiting for the fetch (which may time out),
            // open the website without a vendor.
            manufacturerPageToOpen = "";
        } else if (manufacturerSupported) {
            manufacturerPageToOpen = BUILD_MANUFACTURER;
        } else {
            // No manufacturer specific page exists. Open the general page.
            manufacturerPageToOpen = "general";
        }

        open(activity, DONT_KILL_MY_APP_URL + manufacturerPageToOpen + DONT_KILL_MY_APP_NAME_PARAMETER);
    }

    /**
     * @return If GmsCore is not whitelisted from battery optimizations.
     */
    private static boolean batteryOptimizationsEnabled(Context context) {
        //noinspection ObsoleteSdkInt
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            // Android 5.0 does not have battery optimization settings.
            return false;
        }
        var powerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        return !powerManager.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE_NAME);
    }

    private static boolean isAndroidAutomotive(Context context) {
        return context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUTOMOTIVE);
    }

    private static String getGmsCoreDownload() {
        return "https://github.com/MorpheApp/MicroG-RE/releases/tag/7.3.0";
    }

    private static String getGmsCoreVendorGroupId() {
        return "app.revanced"; // Modified during patching.
    }
}
