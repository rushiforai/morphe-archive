package app.badfella.extension.linkedin;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentProviderClient;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;

/**
 * With GmsCore support, checks once per start that microG RE is installed, recent enough, allowed to run in the
 * background and running, and says what to do when it is not. Without it "Continue with Google" fails silently.
 * <p>
 * The checks and the minimum version come from the runtime extension of Hoo-dles' MicroG integration patch (GPLv3):
 * https://github.com/hoo-dles/morphe-patches
 */
final class GmsCoreCheck {
    private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";
    private static final Uri GMS_CORE_PROVIDER = Uri.parse("content://app.revanced.android.gsf.gservices/prefix");
    /** Oldest microG RE this patch is known to work with. */
    private static final long MIN_VERSION_CODE = 255070104L;
    private static final String DOWNLOAD_URL = "https://github.com/MorpheApp/microg-RE/releases";
    private static final String DONT_KILL_MY_APP_URL = "https://dontkillmyapp.com/?app=MicroG";

    private static boolean checked;

    private GmsCoreCheck() {
    }

    /** Called when a screen of the app resumes; does its work once, a moment later so the screen is ready. */
    static void check(Activity activity) {
        if (checked || !Settings.isGmsCoreSupportIncluded()) return;
        checked = true;
        new Handler(Looper.getMainLooper()).postDelayed(() -> run(activity), 1500);
    }

    private static void run(Activity activity) {
        try {
            PackageManager manager = activity.getPackageManager();
            PackageInfo info;
            try {
                info = manager.getPackageInfo(GMS_CORE_PACKAGE, 0);
            } catch (PackageManager.NameNotFoundException e) {
                Settings.debugLog("GmsCore check: microG RE is not installed");
                Downloads.toast(activity, I18n.tr("microG RE is not installed. Opening its download page."));
                open(activity, DOWNLOAD_URL);
                return;
            }
            long version = Build.VERSION.SDK_INT >= Build.VERSION_CODES.P ? info.getLongVersionCode() : info.versionCode;
            if (version < MIN_VERSION_CODE) {
                Settings.debugLog("GmsCore check: microG RE " + version + " is older than " + MIN_VERSION_CODE);
                Downloads.toast(activity, I18n.tr("microG RE is too old. Opening its download page to update it."));
                open(activity, DOWNLOAD_URL);
                return;
            }

            boolean automotive = manager.hasSystemFeature("android.hardware.type.automotive");
            PowerManager power = (PowerManager) activity.getSystemService(Activity.POWER_SERVICE);
            if (!automotive && power != null && !power.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE)) {
                Settings.debugLog("GmsCore check: microG RE is under battery optimization");
                ask(activity, I18n.tr("microG RE is limited by battery optimization, so Google sign-in may fail. "
                                + "Allow it to run in the background."),
                        I18n.tr("Open settings"),
                        () -> activity.startActivity(
                                new Intent(android.provider.Settings.ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS)));
                return;
            }

            ContentProviderClient client = activity.getContentResolver().acquireContentProviderClient(GMS_CORE_PROVIDER);
            if (client == null) {
                Settings.debugLog("GmsCore check: microG RE is not running");
                ask(activity, I18n.tr("microG RE is not running in the background, so Google sign-in may fail. "
                                + "Your phone may stop it; the website explains how to allow it."),
                        I18n.tr("Open website"), () -> open(activity, DONT_KILL_MY_APP_URL));
            } else {
                client.close();
            }
        } catch (Throwable t) {
            Diagnostics.error("GmsCore check failed", t);
        }
    }

    private static void ask(Activity activity, String message, String action, Runnable onAction) {
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("microG RE")
                .setMessage(message)
                .setPositiveButton(action, (d, which) -> onAction.run())
                .setNegativeButton(I18n.tr("Not now"), null)
                .show();
        SettingsActivity.tintButtons(dialog, activity);
    }

    private static void open(Activity activity, String url) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        } catch (Throwable t) {
            Diagnostics.error("could not open " + url, t);
        }
    }
}
