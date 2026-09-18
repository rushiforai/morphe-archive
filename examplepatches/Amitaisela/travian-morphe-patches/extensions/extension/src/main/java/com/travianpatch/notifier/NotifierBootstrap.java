package com.travianpatch.notifier;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;

import androidx.core.app.NotificationCompat;

/**
 * Entry point injected into the patched Activity's onCreate(). Credentials
 * are no longer baked into the APK at patch time, so this just decides
 * whether a saved login session already exists: if so, the background
 * poller starts immediately; otherwise the user is nudged to log in once.
 */
public final class NotifierBootstrap {

    private static final String TAG = "TravianNotifier";
    static final String CHANNEL_ID = "travian_notifier";
    private static final int LOGIN_PROMPT_NOTIFICATION_ID = 2;

    private NotifierBootstrap() {
    }

    public static void start(Context ctx) {
        Context appCtx = ctx.getApplicationContext();
        try {
            if (SecureStore.loadSessionCookie(appCtx) != null) {
                NotifierService.start(appCtx);
            } else {
                promptLogin(appCtx);
            }
        } catch (Throwable t) {
            Log.e(TAG, "bootstrap failed", t);
        }
    }

    static void promptLogin(Context ctx) {
        createChannel(ctx);

        Intent intent = new Intent(ctx, LoginActivity.class);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT
                | (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M ? PendingIntent.FLAG_IMMUTABLE : 0);
        PendingIntent pendingIntent = PendingIntent.getActivity(ctx, 0, intent, flags);

        Notification n = new NotificationCompat.Builder(ctx, CHANNEL_ID)
                .setContentTitle("Travian Notifier")
                .setContentText("Tap to enable build/troop notifications")
                .setSmallIcon(android.R.drawable.ic_popup_reminder)
                .setContentIntent(pendingIntent)
                .setAutoCancel(true)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
                .build();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            int granted = ctx.checkSelfPermission("android.permission.POST_NOTIFICATIONS");
            if (granted != PackageManager.PERMISSION_GRANTED) {
                return;
            }
        }
        NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
        nm.notify(LOGIN_PROMPT_NOTIFICATION_ID, n);
    }

    private static void createChannel(Context ctx) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationManager nm = (NotificationManager) ctx.getSystemService(Context.NOTIFICATION_SERVICE);
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID, "Travian timers", NotificationManager.IMPORTANCE_DEFAULT);
            channel.setDescription("Alerts when a building, upgrade, or troop queue finishes.");
            nm.createNotificationChannel(channel);
        }
    }
}
