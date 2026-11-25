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
import android.preference.PreferenceManager;
import android.util.Log;

import com.akshaykadam.pixelboard.extension.settings.GboardPatchesSettingsActivity;

public final class GboardNotificationHelper {

    private static final String TAG = "GboardProNotification";
    public static final String CHANNEL_ID = "gboard_pro_updates_channel";
    public static final String CHANNEL_NAME = "Gboard Pro Updates";
    public static final String CHANNEL_SILENT_ID = "gboard_pro_updates_silent_channel";
    public static final String CHANNEL_SILENT_NAME = "Gboard Pro Updates (Silent)";
    public static final String CHANNEL_BETA_ALERT_ID = "gboard_pro_beta_channel";
    public static final String CHANNEL_BETA_ALERT_NAME = "Gboard Pro Beta Releases";
    public static final String CHANNEL_BETA_SILENT_ID = "gboard_pro_beta_silent_channel";
    public static final String CHANNEL_BETA_SILENT_NAME = "Gboard Pro Beta Releases (Silent)";

    public static final String PREF_NAME = "gboard_pro_notification_prefs";
    private static final String KEY_PERMISSION_REQUESTED = "permission_requested_once";
    public static final String KEY_NOTIFY_UPDATES_ALERT = "notify_app_updates_enabled";
    public static final String KEY_NOTIFY_BETA_APK_ALERT = "notify_beta_apk_enabled";
    public static final String KEY_NOTIFY_BETA_FEATURES = "notify_beta_features_enabled";

    public static final int NOTIFICATION_ID_UPDATE = 801;
    public static final int NOTIFICATION_ID_BETA_APK = 802;
    public static final int NOTIFICATION_ID_BETA_FEATURES = 803;

    private GboardNotificationHelper() {
    }

    public static boolean isUpdateNotifyAlertEnabled(Context context) {
        return readPrefBoolean(context, KEY_NOTIFY_UPDATES_ALERT, true);
    }

    public static void setUpdateNotifyAlertEnabled(Context context, boolean enabled) {
        writePrefBoolean(context, KEY_NOTIFY_UPDATES_ALERT, enabled);
    }

    public static boolean isBetaApkNotifyAlertEnabled(Context context) {
        return readPrefBoolean(context, KEY_NOTIFY_BETA_APK_ALERT, true);
    }

    public static void setBetaApkNotifyAlertEnabled(Context context, boolean enabled) {
        writePrefBoolean(context, KEY_NOTIFY_BETA_APK_ALERT, enabled);
    }

    public static boolean isBetaFeaturesNotifyEnabled(Context context) {
        return readPrefBoolean(context, KEY_NOTIFY_BETA_FEATURES, true);
    }

    public static void setBetaFeaturesNotifyEnabled(Context context, boolean enabled) {
        writePrefBoolean(context, KEY_NOTIFY_BETA_FEATURES, enabled);
    }

    private static boolean readPrefBoolean(Context context, String key, boolean defaultValue) {
        if (context == null) return defaultValue;
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
            if (prefs != null && prefs.contains(key)) {
                return prefs.getBoolean(key, defaultValue);
            }
        } catch (Throwable ignored) {
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    SharedPreferences dpsPrefs = dps.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE);
                    if (dpsPrefs != null && dpsPrefs.contains(key)) {
                        return dpsPrefs.getBoolean(key, defaultValue);
                    }
                    SharedPreferences dpsDef = PreferenceManager.getDefaultSharedPreferences(dps);
                    if (dpsDef != null && dpsDef.contains(key)) {
                        return dpsDef.getBoolean(key, defaultValue);
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        try {
            SharedPreferences defPrefs = PreferenceManager.getDefaultSharedPreferences(context);
            if (defPrefs != null && defPrefs.contains(key)) {
                return defPrefs.getBoolean(key, defaultValue);
            }
        } catch (Throwable ignored) {
        }
        return defaultValue;
    }

    private static void writePrefBoolean(Context context, String key, boolean value) {
        if (context == null) return;
        try {
            context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                    .edit().putBoolean(key, value).commit();
        } catch (Throwable ignored) {
        }
        try {
            PreferenceManager.getDefaultSharedPreferences(context)
                    .edit().putBoolean(key, value).commit();
        } catch (Throwable ignored) {
        }
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N && !context.isDeviceProtectedStorage()) {
                Context dps = context.createDeviceProtectedStorageContext();
                if (dps != null) {
                    dps.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                            .edit().putBoolean(key, value).commit();
                    PreferenceManager.getDefaultSharedPreferences(dps)
                            .edit().putBoolean(key, value).commit();
                }
            }
        } catch (Throwable ignored) {
        }
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
                createAlertChannel(nm, CHANNEL_ID, CHANNEL_NAME,
                        "Notifications about new Gboard Pro updates and releases");
                createSilentChannel(nm, CHANNEL_SILENT_ID, CHANNEL_SILENT_NAME,
                        "Silent notifications for new Gboard Pro app updates");
                createAlertChannel(nm, CHANNEL_BETA_ALERT_ID, CHANNEL_BETA_ALERT_NAME,
                        "Notifications about new Gboard Pro beta testing APK releases");
                createSilentChannel(nm, CHANNEL_BETA_SILENT_ID, CHANNEL_BETA_SILENT_NAME,
                        "Silent notifications for new Gboard Pro beta testing APKs");
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed to create notification channel", t);
        }
    }

    private static void createAlertChannel(NotificationManager nm, String id, String name, String desc) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O || nm == null) return;
        if (nm.getNotificationChannel(id) == null) {
            NotificationChannel channel = new NotificationChannel(id, name, NotificationManager.IMPORTANCE_HIGH);
            channel.setDescription(desc);
            channel.enableLights(true);
            channel.setLightColor(Color.parseColor("#542983"));
            channel.enableVibration(true);
            nm.createNotificationChannel(channel);
        }
    }

    private static void createSilentChannel(NotificationManager nm, String id, String name, String desc) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O || nm == null) return;
        if (nm.getNotificationChannel(id) == null) {
            NotificationChannel channel = new NotificationChannel(id, name, NotificationManager.IMPORTANCE_LOW);
            channel.setDescription(desc);
            channel.setSound(null, null);
            channel.enableLights(false);
            channel.enableVibration(false);
            nm.createNotificationChannel(channel);
        }
    }

    public static void showUpdateNotification(Context context, String version, String releaseTitle, String changelog) {
        boolean alert = isUpdateNotifyAlertEnabled(context);
        String channelId = alert ? CHANNEL_ID : CHANNEL_SILENT_ID;
        String title = "Gboard Pro Update Available";
        String contentText = "Version v" + version + " is ready to install.";
        String expandedText = (changelog != null && !changelog.trim().isEmpty())
                ? contentText + "\n\n" + changelog.trim()
                : contentText;
        postNotificationInternal(
                context,
                NOTIFICATION_ID_UPDATE,
                channelId,
                GboardPatchesSettingsActivity.ACTION_UPDATES,
                title,
                contentText,
                expandedText,
                alert);
    }

    public static void showBetaApkNotification(Context context, String version, String releaseTitle, String changelog) {
        boolean alert = isBetaApkNotifyAlertEnabled(context);
        String channelId = alert ? CHANNEL_BETA_ALERT_ID : CHANNEL_BETA_SILENT_ID;
        String title = "New Beta Testing APK Available";
        String label = (version != null && !version.trim().isEmpty()) ? version.trim() : releaseTitle;
        String contentText = "Beta build " + label + " is ready in Beta version testing.";
        String expandedText = (changelog != null && !changelog.trim().isEmpty())
                ? contentText + "\n\n" + changelog.trim()
                : contentText;
        postNotificationInternal(
                context,
                NOTIFICATION_ID_BETA_APK,
                channelId,
                GboardPatchesSettingsActivity.ACTION_BETA_TESTING,
                title,
                contentText,
                expandedText,
                alert);
    }

    public static void showNewBetaFeaturesNotification(Context context, int count, String summary) {
        if (context == null || !isBetaFeaturesNotifyEnabled(context)) return;
        String title = "New Experimental Beta Features";
        String contentText = (summary != null && !summary.trim().isEmpty())
                ? summary.trim()
                : (count + " new beta feature(s) added to New features (Beta).");
        postNotificationInternal(
                context,
                NOTIFICATION_ID_BETA_FEATURES,
                CHANNEL_BETA_ALERT_ID,
                GboardPatchesSettingsActivity.ACTION_BETA_FEATURES,
                title,
                contentText,
                contentText,
                true);
    }

    @SuppressWarnings("deprecation")
    private static void postNotificationInternal(
            Context context,
            int notificationId,
            String channelId,
            String targetAction,
            String title,
            String contentText,
            String expandedText,
            boolean alert) {
        if (context == null) return;
        try {
            ensureNotificationChannel(context);
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) return;

            Intent intent = new Intent(context, GboardPatchesSettingsActivity.class);
            intent.setAction(targetAction);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);

            int flags = PendingIntent.FLAG_UPDATE_CURRENT;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                flags |= PendingIntent.FLAG_IMMUTABLE;
            }
            PendingIntent pendingIntent = PendingIntent.getActivity(context, notificationId, intent, flags);

            int smallIconRes = 0;
            try {
                smallIconRes = context.getResources().getIdentifier("ic_app", "mipmap", context.getPackageName());
            } catch (Throwable ignored) {
            }
            if (smallIconRes == 0) {
                smallIconRes = android.R.drawable.stat_notify_sync;
            }

            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                builder = new Notification.Builder(context, channelId);
            } else {
                builder = new Notification.Builder(context);
            }

            builder.setSmallIcon(smallIconRes)
                    .setContentTitle(title)
                    .setContentText(contentText)
                    .setContentIntent(pendingIntent)
                    .setAutoCancel(true)
                    .setPriority(alert ? Notification.PRIORITY_HIGH : Notification.PRIORITY_LOW);

            if (!alert) {
                builder.setDefaults(0);
                builder.setSound(null);
                builder.setVibrate(null);
                builder.setOnlyAlertOnce(true);
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                builder.setStyle(new Notification.BigTextStyle().bigText(expandedText));
            }

            nm.notify(notificationId, builder.build());
        } catch (Throwable t) {
            Log.w(TAG, "Failed to post notification id=" + notificationId, t);
        }
    }
}
