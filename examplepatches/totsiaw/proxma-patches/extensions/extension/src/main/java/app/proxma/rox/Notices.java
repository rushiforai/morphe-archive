package app.proxma.rox;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;

/**
 * A silent notification about the background check-in, so the result is visible without opening
 * ROX. When the background run could not check in, tapping the notification opens ROX, which then
 * checks in on its own as usual. The same notification is replaced each time, never stacked.
 */
final class Notices {

    private static final String TAG = "PROXMA_ROX";
    private static final String CHANNEL = "proxma_rox_checkin";
    private static final int NOTICE_ID = 0x524f5802;
    private static final int STATUS_ID = 0x524f5803;

    private Notices() {}

    static void done(Context context, String text) {
        post(context, "ROX daily check-in done", text);
    }

    static void needsYou(Context context, String text) {
        post(context, "ROX daily check-in not done yet", text + " Tap to open ROX and it will check in.");
    }

    /**
     * The full background result shown on an app open. A toast is cut to two lines on recent
     * Android, so the whole text goes here too. Its own id, so a check-in that clears the
     * reminder above leaves this one readable.
     */
    static void lastTry(Context context, String text) {
        post(context, STATUS_ID, "ROX patch: last background try", text, false);
    }

    static void clear(Context context) {
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager != null) manager.cancel(NOTICE_ID);
        } catch (Throwable t) {
            Log.w(TAG, "NOTICE_CLEAR_ERR " + t);
        }
    }

    private static void post(Context context, String title, String text) {
        post(context, NOTICE_ID, title, text, true);
    }

    private static void post(Context context, int id, String title, String text, boolean opensApp) {
        try {
            Context app = context.getApplicationContext();
            NotificationManager manager = (NotificationManager) app.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) {
                Log.w(TAG, "NOTICE no notification manager");
                return;
            }
            if (!manager.areNotificationsEnabled()) {
                Log.i(TAG, "NOTICE notifications are off for ROX, skipped: " + title);
                return;
            }
            if (manager.getNotificationChannel(CHANNEL) == null) {
                NotificationChannel channel = new NotificationChannel(CHANNEL, "Daily check-in (patch)",
                    NotificationManager.IMPORTANCE_LOW);
                channel.setDescription("Result of the patched background daily check-in");
                manager.createNotificationChannel(channel);
            }
            Notification.Builder builder = new Notification.Builder(app, CHANNEL)
                .setSmallIcon(smallIcon(app))
                .setContentTitle(title)
                .setContentText(text)
                .setStyle(new Notification.BigTextStyle().bigText(text))
                .setAutoCancel(true)
                .setShowWhen(true)
                .setWhen(System.currentTimeMillis());
            Intent launch = opensApp
                ? app.getPackageManager().getLaunchIntentForPackage(app.getPackageName()) : null;
            if (launch != null) {
                launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                builder.setContentIntent(PendingIntent.getActivity(app, 0, launch,
                    PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT));
            }
            manager.notify(id, builder.build());
            Log.i(TAG, "NOTICE posted: " + title + " / " + text);
        } catch (Throwable t) {
            Log.w(TAG, "NOTICE_ERR " + t);
        }
    }

    private static int smallIcon(Context app) {
        try {
            ApplicationInfo info = app.getPackageManager()
                .getApplicationInfo(app.getPackageName(), PackageManager.GET_META_DATA);
            Bundle meta = info.metaData;
            if (meta != null) {
                int icon = meta.getInt("com.google.firebase.messaging.default_notification_icon", 0);
                if (icon != 0) return icon;
            }
            if (info.icon != 0) return info.icon;
        } catch (Throwable t) {
            Log.w(TAG, "NOTICE_ICON_ERR " + t);
        }
        return android.R.drawable.ic_popup_reminder;
    }
}
