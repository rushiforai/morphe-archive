package app.template.extension.alerts;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import android.util.Log;
import android.util.LruCache;

import java.util.Objects;

public final class NativeAlertHistory {
    private static final LruCache<String, PendingIntent> actions = new LruCache<>(64);

    private NativeAlertHistory() {}

    public static void initialize(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        try {
            if ("com.google.android.gms".equals(manager.getNotificationDelegate())) {
                manager.setNotificationDelegate(null);
            }
        } catch (RuntimeException error) {
            Log.w("MorpheAlertHistory", "Could not update the app’s notification delegate", error);
        }
    }

    // Called only after the stock app posts its notification.
    public static void posted(Context context, String tag, int id, Notification notification) {
        try {
            if (notification == null || (notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0) return;
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            if (!manager.areNotificationsEnabled()) return;
            String channelId = notification.getChannelId();
            NotificationChannel channel = channelId == null ? null : manager.getNotificationChannel(channelId);
            if (channel != null && channel.getImportance() == NotificationManager.IMPORTANCE_NONE) return;

            String title = title(notification);
            String body = body(notification);
            if (title.isEmpty() && body.isEmpty()) return;
            String key = key(tag, id, notification, title, body);
            if (notification.contentIntent != null) actions.put(key, notification.contentIntent);
            AlertHistory.record(context, key, title.isEmpty() ? "Letterboxd" : title, body, "");
        } catch (RuntimeException error) {
            Log.w("MorpheAlertHistory", "Could not record a Letterboxd notification", error);
        }
    }

    static PendingIntent action(Context context, String key) {
        PendingIntent cached = actions.get(key);
        if (cached != null) return cached;
        if (!key.startsWith("native:")) return null;
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        for (StatusBarNotification active : manager.getActiveNotifications()) {
            Notification notification = active.getNotification();
            if (key.equals(key(active.getTag(), active.getId(), notification,
                    title(notification), body(notification)))) {
                return notification.contentIntent;
            }
        }
        return null;
    }

    private static String key(String tag, int id, Notification notification, String title, String body) {
        return "native:" + id + ":" + notification.when + ":" + Objects.hash(tag, title, body);
    }

    private static String title(Notification notification) {
        return text(notification.extras, Notification.EXTRA_TITLE);
    }

    private static String body(Notification notification) {
        String body = text(notification.extras, Notification.EXTRA_BIG_TEXT);
        return body.isEmpty() ? text(notification.extras, Notification.EXTRA_TEXT) : body;
    }

    private static String text(Bundle extras, String key) {
        if (extras == null) return "";
        CharSequence value = extras.getCharSequence(key);
        return value == null ? "" : value.toString().trim();
    }
}
