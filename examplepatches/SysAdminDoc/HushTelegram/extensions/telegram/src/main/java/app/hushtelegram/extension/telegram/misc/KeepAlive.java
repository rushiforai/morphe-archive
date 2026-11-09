/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.os.Build;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;

/**
 * Telegram's Keep-Alive Service holds its own connection open for people without push (#50, #54).
 * Telegram 13.2 starts it as a plain background service, and Android 8 and newer stop one of those
 * about a minute after Telegram leaves the screen, then freeze the process. Messages only arrived
 * once Telegram was opened again, and nothing came after a swipe from recents.
 *
 * <p>With the switch on, the start Telegram makes asks Android for a foreground service instead,
 * and the service shows a quiet notification so Android keeps it running. Android 14 and newer get
 * the remote messaging type the manifest patch declares, which has no daily time limit. When
 * Android refuses a foreground start, which it does while Telegram is in the background on Android
 * 12 and newer, Telegram's own start runs as before. Telegram's Keep-Alive switch still decides
 * whether the service runs at all.
 */
public final class KeepAlive {
    private KeepAlive() {}

    /** Marks a start that asked Android for a foreground service, so the service keeps that promise. */
    static final String IN_FRONT = "app.hushtelegram.keep_alive_in_front";
    static final String CHANNEL = "hushtelegram_keep_alive";
    static final int NOTIFICATION_ID = 0x4b41_4c56;
    /** ServiceInfo.FOREGROUND_SERVICE_TYPE_REMOTE_MESSAGING, Android 14's type for a messaging connection. */
    static final int REMOTE_MESSAGING = 0x200;
    static final String REMOTE_MESSAGING_PERMISSION = "android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING";

    static final String ASKED_IN_FRONT = "Keep-Alive Service asked to run in front";
    static final String KEPT_IN_FRONT = "Keep-Alive Service kept running in front";
    static final String ANDROID_REFUSED = "Android refused a foreground start";
    static final String STEPPED_BACK = "Keep-Alive Service back to Telegram's own start";
    static final String NOT_DECLARED = "remote messaging type missing from the manifest";

    /**
     * Called in place of Telegram's startService for its Keep-Alive Service. Throws what the stock
     * start throws, so Telegram's own catch around it still decides what happens next.
     */
    public static ComponentName start(Context context, Intent intent) {
        if (wanted(context, intent.getComponent())) {
            intent.putExtra(IN_FRONT, true);
            try {
                ComponentName started = context.startForegroundService(intent);
                HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, ASKED_IN_FRONT);
                return started;
            } catch (Throwable refused) {
                // Android 12 and newer refuse it while Telegram is in the background. The stock start
                // keeps the service going until Android stops it, as it always has.
                intent.removeExtra(IN_FRONT);
                HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, ANDROID_REFUSED);
            }
        }
        return context.startService(intent);
    }

    /** Called first in the Keep-Alive Service's onStartCommand. A null intent is a restart after Android stopped it. */
    public static void started(Service service, @Nullable Intent intent) {
        try {
            boolean promised = intent != null && intent.getBooleanExtra(IN_FRONT, false);
            if (promised) {
                // Android ends the app if a foreground start never calls startForeground.
                inFront(service, true);
            } else if (intent != null) {
                // A plain start while the service runs in front: a refused foreground start leaves it
                // there, and a switch turned off or a pause takes it back out.
                if (wasInFront && !wanted(service, new ComponentName(service, service.getClass()))) {
                    service.stopForeground(Service.STOP_FOREGROUND_REMOVE);
                    wasInFront = false;
                    HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, STEPPED_BACK);
                }
            } else if (wanted(service, new ComponentName(service, service.getClass()))) {
                inFront(service, false);
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "Keep-Alive Service", failure);
        }
    }

    /** Whether this process put the service in front, so a plain start knows to take it back out. */
    private static boolean wasInFront;

    /** The switch is on and Android can run the service in front with the type it will be given. */
    static boolean wanted(Context context, @Nullable ComponentName service) {
        HookStatus.invoked(FamilyNames.REPAIR_FIREBASE_PUSH);
        try {
            if (!Utils.settingsReady() || !PatchFamily.Capability.KEEP_ALIVE_RUNNING.installed()
                    || !Settings.KEEP_ALIVE_RUNNING.get()) return false;
            if (Build.VERSION.SDK_INT < 34) return true;
            if (service == null) return false;
            // Android 14 throws from startForeground for a type the manifest doesn't declare, and by
            // then the promise is already made, so this is checked before asking.
            ServiceInfo info = context.getPackageManager().getServiceInfo(service, 0);
            boolean declared = (info.getForegroundServiceType() & REMOTE_MESSAGING) != 0
                    && context.checkSelfPermission(REMOTE_MESSAGING_PERMISSION) == PackageManager.PERMISSION_GRANTED;
            if (!declared) HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, NOT_DECLARED);
            return declared;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "Keep-Alive Service check", failure);
            return false;
        }
    }

    private static void inFront(Service service, boolean promised) {
        try {
            Notification notification = notification(service);
            if (Build.VERSION.SDK_INT >= 34) service.startForeground(NOTIFICATION_ID, notification, REMOTE_MESSAGING);
            else service.startForeground(NOTIFICATION_ID, notification);
            wasInFront = true;
            HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, KEPT_IN_FRONT);
            return;
        } catch (Throwable refused) {
            HookStatus.counted(FamilyNames.REPAIR_FIREBASE_PUSH, ANDROID_REFUSED);
            Logger.printException(() -> "Keep-Alive Service couldn't run in front", refused);
            if (!promised) return;
        }
        // Keep the promise with the data sync type Telegram declares and step straight back, which
        // leaves the service exactly as Telegram's own start would have.
        try {
            Notification plain = new Notification.Builder(service, channel(service))
                    .setSmallIcon(android.R.drawable.stat_notify_sync).build();
            if (Build.VERSION.SDK_INT >= 34) {
                service.startForeground(NOTIFICATION_ID, plain, ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
            } else {
                service.startForeground(NOTIFICATION_ID, plain);
            }
            service.stopForeground(Service.STOP_FOREGROUND_REMOVE);
            wasInFront = false;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "Keep-Alive Service promise", failure);
        }
    }

    /** A silent, ongoing notification with Telegram's own icon. A tap opens its channel, where it can be hidden. */
    static Notification notification(Context context) {
        String channel = channel(context);
        int icon = 0;
        try {
            icon = context.getResources().getIdentifier("notification", "drawable", context.getPackageName());
        } catch (Throwable unreadable) { }
        Notification.Builder builder = new Notification.Builder(context, channel)
                .setSmallIcon(icon != 0 ? icon : android.R.drawable.stat_notify_sync)
                .setContentTitle(L10n.t("Keeping Telegram connected"))
                .setContentText(L10n.t("So messages arrive on time. Tap to hide this notification."))
                .setOngoing(true)
                .setShowWhen(false)
                .setLocalOnly(true)
                .setCategory(Notification.CATEGORY_SERVICE);
        try {
            Intent hide = new Intent(android.provider.Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                    .putExtra(android.provider.Settings.EXTRA_APP_PACKAGE, context.getPackageName())
                    .putExtra(android.provider.Settings.EXTRA_CHANNEL_ID, channel)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            builder.setContentIntent(PendingIntent.getActivity(context, 0, hide,
                    PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT));
        } catch (Throwable unreadable) { }
        return builder.build();
    }

    /** Created before every use: Android drops a foreground notification whose channel doesn't exist. */
    private static String channel(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null && manager.getNotificationChannel(CHANNEL) == null) {
            NotificationChannel created = new NotificationChannel(CHANNEL, L10n.t("Keep-Alive Service"),
                    NotificationManager.IMPORTANCE_MIN);
            created.setShowBadge(false);
            created.setSound(null, null);
            created.enableVibration(false);
            manager.createNotificationChannel(created);
        }
        return CHANNEL;
    }

    /** Puts a flipped switch into effect now: Telegram starts or stops its service again. */
    public static void switched() {
        try {
            OwnConnection.apply.run();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.REPAIR_FIREBASE_PUSH, "Keep-Alive Service switch", failure);
        }
    }

    static void reset() {
        wasInFront = false;
    }
}
