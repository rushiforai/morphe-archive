/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */
package app.morphe.extension.samsung.dailyboard;

import android.app.Notification;
import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public final class DailyBoardNotificationListener extends NotificationListenerService {
    private static final Map<String, StatusBarNotification> notifications =
            new ConcurrentHashMap<>();

    @Override
    public void onListenerConnected() {
        notifications.clear();
        StatusBarNotification[] activeNotifications = getActiveNotifications();
        if (activeNotifications == null) return;

        for (StatusBarNotification notification : activeNotifications) {
            addNotification(notification);
        }
    }

    @Override
    public void onNotificationPosted(StatusBarNotification notification) {
        addNotification(notification);
    }

    @Override
    public void onNotificationRemoved(StatusBarNotification notification) {
        notifications.remove(notification.getKey());
    }

    public static String getNotificationSnapshot() {
        JSONArray result = new JSONArray();
        for (StatusBarNotification statusBarNotification : notifications.values()) {
            Notification notification = statusBarNotification.getNotification();
            JSONObject entry = new JSONObject();
            try {
                entry.put("key", statusBarNotification.getKey());
                entry.put("package", statusBarNotification.getPackageName());
                entry.put("postedAt", statusBarNotification.getPostTime());
                entry.put("ongoing", statusBarNotification.isOngoing());
                entry.put("clearable", statusBarNotification.isClearable());
                entry.put("title", text(notification, Notification.EXTRA_TITLE));
                entry.put("text", text(notification, Notification.EXTRA_TEXT));
                result.put(entry);
            } catch (JSONException ignored) {
                // All inserted values are JSON-compatible.
            }
        }
        return result.toString();
    }

    private void addNotification(StatusBarNotification statusBarNotification) {
        Notification notification = statusBarNotification.getNotification();
        if (getPackageName().equals(statusBarNotification.getPackageName())) return;
        if ((notification.flags & Notification.FLAG_GROUP_SUMMARY) != 0) return;

        notifications.put(statusBarNotification.getKey(), statusBarNotification);
    }

    private static String text(Notification notification, String key) {
        CharSequence value = notification.extras.getCharSequence(key);
        return value == null ? "" : value.toString();
    }
}
