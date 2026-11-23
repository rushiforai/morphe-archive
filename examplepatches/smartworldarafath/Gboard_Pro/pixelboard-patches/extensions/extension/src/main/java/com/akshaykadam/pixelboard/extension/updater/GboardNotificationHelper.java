package com.akshaykadam.pixelboard.extension.updater;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.os.Build;
import android.util.Log;

import com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity;

public final class GboardNotificationHelper {

    private static final String TAG = "GboardProNotification";
    public static final String CHANNEL_ID = "gboard_pro_updates_channel";
    public static final String CHANNEL_NAME = "Gboard Pro Updates";
    private static final String PREF_NAME = "gboard_pro_notification_prefs";
    private static final String KEY_PERMISSION_REQUESTED = "permission_requested_once";
    public static final int NOTIFICATION_ID_UPDATE = 801;

    private GboardNotificationHelper() {
    }

    public static void requestNotificationPermission(Activity activity) {
        if (activity == null) return;
        if (Build.VERSION.SDK_INT >= 33) {
            try {
                if (activity.checkSelfPermission("android.permission.POST_NOTIFICATIONS")
                        != PackageManager.PERMISSION_GRANTED) {
                    SharedPreferences prefs = activity.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
                    boolean alreadyRequested = prefs.getBoolean(KEY_PERMISSION_REQUESTED, false);
                    if (!alreadyRequested) {
                        prefs.edit().putBoolean(KEY_PERMISSION_REQUESTED, true).apply();
                        activity.requestPermissions(
                                new String[]{"android.permission.POST_NOTIFICATIONS"}, 701);
                    }
                }
            } catch (Throwable t) {
                Log.w(TAG, "Failed to request notification permission", t);
            }
        }
    }

    public static void ensureNotificationChannel(Context context) {
        if (context == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return;
        try {
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm != null) {
                NotificationChannel channel = nm.getNotificationChannel(CHANNEL_ID);
                if (channel == null) {
                    channel = new NotificationChannel(
                            CHANNEL_ID,
                            CHANNEL_NAME,
                            NotificationManager.IMPORTANCE_HIGH
                    );
                    channel.setDescription("Notifications about new Gboard Pro updates and releases");
                    channel.enableLights(true);
                    channel.setLightColor(Color.parseColor("#542983"));
                    channel.enableVibration(true);
                    nm.createNotificationChannel(channel);
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to create notification channel", t);
        }
    }

    public static void showUpdateNotification(Context context, String version, String releaseTitle, String changelog) {
        if (context == null) return;
        try {
            ensureNotificationChannel(context);
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) return;

            Intent intent = new Intent(context, GboardPatchesSettingsActivity.class);
            intent.setAction(GboardPatchesSettingsActivity.ACTION_UPDATES);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                flags |= PendingIntent.FLAG_IMMUTABLE;
            }
            PendingIntent pendingIntent = PendingIntent.getActivity(context, 0, intent, flags);

            int smallIconRes = 0;
            try {
                smallIconRes = context.getResources().getIdentifier("ic_app", "mipmap", context.getPackageName());
            } catch (Throwable ignored) {
            }
            if (smallIconRes == 0) {
                smallIconRes = android.R.drawable.stat_notify_sync;
            }

            String title = "Gboard Pro Update Available";
            String contentText = "Version v" + version + " is ready to install.";
            String expandedText = (changelog != null && !changelog.trim().isEmpty())
                    ? contentText + "\n\n" + changelog.trim()
                    : contentText;

            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                builder = new Notification.Builder(context, CHANNEL_ID);
            } else {
                builder = new Notification.Builder(context);
            }

            builder.setSmallIcon(smallIconRes)
                    .setContentTitle(title)
                    .setContentText(contentText)
                    .setContentIntent(pendingIntent)
                    .setAutoCancel(true)
                    .setPriority(Notification.PRIORITY_HIGH);

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                builder.setStyle(new Notification.BigTextStyle().bigText(expandedText));
            }

            nm.notify(NOTIFICATION_ID_UPDATE, builder.build());
        } catch (Throwable t) {
            Log.w(TAG, "Failed to post update notification", t);
        }
    }
}
