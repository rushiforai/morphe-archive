package app.morphe.ather;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;

/**
 * Posts the notifications the app would otherwise receive over Firebase Cloud Messaging.
 *
 * <p>FCM carries its messages over Google Play Services, which this device profile does not have,
 * so nothing is ever delivered. The app does receive the scooter's live state over its own
 * websocket, so the notifications are derived from that instead.
 *
 * <p>The websocket is only connected while the app is running, so a notification appears only when
 * the app is alive. That covers charging, because the app keeps a foreground service running for
 * the duration of a charge.
 */
final class Notify {

    /** The channel the vehicle notifications appear under. */
    private static final String CHANNEL = "morphe_vehicle";

    private Notify() {
    }

    /** Shows a notification. Does nothing when the app has no notification permission. */
    static void post(Context context, String title, String text) {
        post(context, title, text, null);
    }

    /**
     * Shows a notification that opens {@code target} when tapped, or the app itself when
     * {@code target} is null.
     */
    static void post(Context context, String title, String text, Intent target) {
        try {
            if (context == null) {
                return;
            }
            NotificationManager manager =
                    (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) {
                return;
            }
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                    && manager.getNotificationChannel(CHANNEL) == null) {
                manager.createNotificationChannel(new NotificationChannel(CHANNEL, "Scooter",
                        NotificationManager.IMPORTANCE_DEFAULT));
            }
            Notification.Builder builder = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                    ? new Notification.Builder(context, CHANNEL)
                    : new Notification.Builder(context);
            builder.setContentTitle(title)
                    .setContentText(text)
                    .setSmallIcon(icon(context))
                    .setAutoCancel(true)
                    .setContentIntent(content(context, title, target));
            // One id per title, so a repeated alert replaces its own notification.
            manager.notify(title.hashCode(), builder.build());
        } catch (Throwable t) {
            // Never let a notification break shadow parsing.
        }
    }

    /**
     * What a tap on the notification opens. Without this the notification ignores taps and stays
     * in the shade until it is swiped away.
     */
    private static PendingIntent content(Context context, String title, Intent target) {
        Intent intent = target != null ? target : app(context);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return PendingIntent.getActivity(context, title.hashCode(), intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    /** The app's own launcher entry, so a tap lands wherever the app normally starts. */
    private static Intent app(Context context) {
        Intent intent = context.getPackageManager()
                .getLaunchIntentForPackage(context.getPackageName());
        if (intent == null) {
            intent = new Intent();
            intent.setClassName(context, "com.athermobileapp.ui.main.MainActivity");
        }
        return intent;
    }

    /** The app's own notification icon, so the alert matches the rest of the app's. */
    private static int icon(Context context) {
        try {
            int id = context.getResources()
                    .getIdentifier("ic_notification", "drawable", context.getPackageName());
            if (id != 0) {
                return id;
            }
        } catch (Throwable t) {
            // Fall through to the framework icon.
        }
        return android.R.drawable.ic_dialog_info;
    }
}
