package app.jofslash.extension.quora;

import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.provider.Settings;
import android.widget.Toast;

/**
 * Used by the GmsCore support patch. Google sign-in goes through MicroG-RE,
 * so tell the user when it is missing.
 */
@SuppressWarnings("unused")
public final class GmsCoreCheck {
    private static final String GMS_CORE_PACKAGE = "app.revanced.android.gms";
    private static final String GMS_CORE_RELEASES = "https://github.com/MorpheApp/MicroG-RE/releases";

    /** Whether the GmsCore support patch is in this app; only then Patch settings shows the notifications row. */
    static volatile boolean applied;

    private GmsCoreCheck() {
    }

    public static void check(Context context) {
        applied = true;
        try {
            context.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE, 0);
            batteryHint(context.getApplicationContext() != null ? context.getApplicationContext() : context);
        } catch (PackageManager.NameNotFoundException e) {
            final Context app = context.getApplicationContext() != null
                    ? context.getApplicationContext() : context;
            // Once: the patch is on by default, and not everyone wants MicroG-RE. Patch settings >
            // More > Notifications keeps saying it.
            android.content.SharedPreferences prefs = app.getSharedPreferences("jofslash_gmscore", Context.MODE_PRIVATE);
            if (prefs.getBoolean("missingHint", false)) return;
            prefs.edit().putBoolean("missingHint", true).apply();
            new Handler(Looper.getMainLooper()).postDelayed(() -> Toast.makeText(app,
                    Texts.t("Install MicroG-RE to sign in with Google and get notifications."),
                    Toast.LENGTH_LONG).show(), 3000);
        } catch (Throwable ignored) {
            // Never break the app start.
        }
    }

    /** What stops notifications from coming, and where a tap on the row leads. */
    static final class Status {
        /** The line under "Notifications", in English; Patch settings translates it. */
        final String line;
        final Intent action;

        Status(String line, Intent action) {
            this.line = line;
            this.action = action;
        }
    }

    /**
     * The first thing that keeps notifications from coming: MicroG-RE missing, notifications
     * turned off for this app, or battery saving holding MicroG-RE back. Android doesn't let
     * MicroG-RE keep its connection to Google open in the background without the battery
     * exception, so then notifications come late or not at all.
     */
    static Status status(Context context) {
        try {
            context.getPackageManager().getPackageInfo(GMS_CORE_PACKAGE, 0);
        } catch (Throwable e) {
            return new Status("Install MicroG-RE to sign in with Google and get notifications.",
                    new Intent(Intent.ACTION_VIEW, Uri.parse(GMS_CORE_RELEASES)));
        }
        try {
            NotificationManager notifications = context.getSystemService(NotificationManager.class);
            if (notifications != null && !notifications.areNotificationsEnabled()) {
                return new Status("Notifications are off for this app. Tap to turn them on.",
                        new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
                                .putExtra(Settings.EXTRA_APP_PACKAGE, context.getPackageName()));
            }
        } catch (Throwable ignored) {
            // Then we can't tell; carry on with MicroG-RE.
        }
        Intent gmsCore = gmsCoreApp(context);
        try {
            PowerManager power = context.getSystemService(PowerManager.class);
            if (power != null && !power.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE)) {
                return new Status("Battery saving holds MicroG-RE back, so notifications come late or not at all. Tap, then set its battery use to Unrestricted.",
                        new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                Uri.parse("package:" + GMS_CORE_PACKAGE)));
            }
        } catch (Throwable ignored) {
            // Then we can't tell.
        }
        if (!registered(context)) {
            return new Status("This app isn't registered for notifications yet. Open the MicroG RE app and check that Cloud Messaging is on.",
                    gmsCore);
        }
        return new Status("Ready: MicroG-RE delivers notifications to this app.", gmsCore);
    }

    /** Whether Firebase got a push token for this app, which it keeps in its own preferences file. */
    private static boolean registered(Context context) {
        try {
            for (java.util.Map.Entry<String, ?> entry : context
                    .getSharedPreferences("com.google.android.gms.appid", Context.MODE_PRIVATE).getAll().entrySet()) {
                Object value = entry.getValue();
                if (entry.getKey().contains("|T|") && value instanceof String && !((String) value).isEmpty()) return true;
            }
        } catch (Throwable ignored) {
            // Then we can't tell.
        }
        return false;
    }

    /**
     * Once, when battery saving holds MicroG-RE back: says so at start, as nobody looks for
     * the notifications row before missing a notification.
     */
    private static void batteryHint(Context app) {
        try {
            PowerManager power = app.getSystemService(PowerManager.class);
            if (power == null || power.isIgnoringBatteryOptimizations(GMS_CORE_PACKAGE)) return;
            android.content.SharedPreferences prefs = app.getSharedPreferences("jofslash_gmscore", Context.MODE_PRIVATE);
            if (prefs.getBoolean("batteryHint", false)) return;
            prefs.edit().putBoolean("batteryHint", true).apply();
            new Handler(Looper.getMainLooper()).postDelayed(() -> Toast.makeText(app,
                    Texts.t("Battery saving blocks notifications. Fix it in Patch settings."),
                    Toast.LENGTH_LONG).show(), 3000);
        } catch (Throwable ignored) {
            // Never break the app start.
        }
    }

    private static Intent gmsCoreApp(Context context) {
        Intent launch = null;
        try {
            launch = context.getPackageManager().getLaunchIntentForPackage(GMS_CORE_PACKAGE);
        } catch (Throwable ignored) {
            // Fall back to its app details.
        }
        return launch != null ? launch
                : new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + GMS_CORE_PACKAGE));
    }

    /** Opens where the status leads; false when nothing on the phone can open it. */
    static boolean open(Context context, Status status) {
        if (status.action == null) return false;
        try {
            context.startActivity(status.action.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            return true;
        } catch (Throwable e) {
            return false;
        }
    }
}
