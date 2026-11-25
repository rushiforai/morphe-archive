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
import android.graphics.drawable.Icon;
import android.os.Build;
import android.os.IBinder;

import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;

/**
 * Keeps Telegram running while a player app streams a video from it. Without this Android freezes
 * Telegram as soon as the player covers it, and the stream stops with it. The service ends when the
 * last stream does, and its notification has a Stop button.
 */
public final class ExternalVideoService extends Service {
    static final String STOP = "app.hushtelegram.extension.telegram.STOP_VIDEO_STREAM";
    static final String CHANNEL = "hushtelegram_video_stream";
    static final int NOTIFICATION_ID = 0x4856_5354;
    static final String PERMISSION = "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK";

    /** The instance Android is running. Main thread only. */
    private static ExternalVideoService running;

    private int lastStart;

    /** Starts it, or throws when Android can't run it in front, before any promise is made. */
    static void start(Context context) {
        ComponentName name = new ComponentName(context, ExternalVideoService.class);
        if (!declared(context, name)) {
            throw new IllegalStateException("the media playback service type isn't declared");
        }
        if (context.startForegroundService(new Intent().setComponent(name)) == null) {
            throw new IllegalStateException("the video stream service isn't in this build");
        }
    }

    /** Android 14 throws from startForeground for an undeclared type, and by then the promise is made. */
    private static boolean declared(Context context, ComponentName name) {
        // Only Android 14 and newer ask; the guard sits here so lint sees it on the API 29 call.
        if (Build.VERSION.SDK_INT < 34) return true;
        try {
            ServiceInfo info = context.getPackageManager().getServiceInfo(name, 0);
            return (info.getForegroundServiceType() & ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK) != 0
                    && context.checkSelfPermission(PERMISSION) == PackageManager.PERMISSION_GRANTED;
        } catch (PackageManager.NameNotFoundException missing) {
            return false;
        }
    }

    /** The last stream ended. Main thread only. */
    static void finish() {
        if (running != null) running.end();
    }

    @Override public int onStartCommand(Intent intent, int flags, int startId) {
        running = this;
        lastStart = startId;
        boolean stopping = intent == null || STOP.equals(intent.getAction());
        try {
            // First, whatever happens next: Android ends the app if a foreground start never does this.
            inFront();
        } catch (RuntimeException refused) {
            HookStatus.threw(FamilyNames.KEEP_VIDEOS_MUTED, "video stream service", refused);
            stopping = true;
        }
        if (stopping) ExternalVideo.stopStreaming();
        if (stopping || !ExternalVideo.streaming()) end();
        return START_NOT_STICKY;
    }

    @Override public IBinder onBind(Intent intent) {
        return null;
    }

    @Override public void onDestroy() {
        if (running == this) running = null;
        super.onDestroy();
    }

    private void end() {
        stopForeground(STOP_FOREGROUND_REMOVE);
        // Only the latest start: one still on its way has to reach onStartCommand, or Android
        // treats its foreground promise as broken and ends the app.
        stopSelf(lastStart);
    }

    private void inFront() {
        Notification notification = notification(this);
        if (Build.VERSION.SDK_INT >= 29) {
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK);
        } else {
            startForeground(NOTIFICATION_ID, notification);
        }
    }

    static Notification notification(Context context) {
        String channel = channel(context);
        int icon = context.getResources().getIdentifier("notification", "drawable", context.getPackageName());
        PendingIntent stop = PendingIntent.getService(context, 0,
                new Intent(context, ExternalVideoService.class).setAction(STOP),
                PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
        return new Notification.Builder(context, channel)
                .setSmallIcon(icon != 0 ? icon : android.R.drawable.stat_notify_sync)
                .setContentTitle(L10n.t("Playing video in another app"))
                .setContentText(L10n.t("Stops on its own when the player closes."))
                .addAction(new Notification.Action.Builder(
                        Icon.createWithResource(context, android.R.drawable.ic_menu_close_clear_cancel),
                        L10n.t("Stop"), stop).build())
                .setOngoing(true)
                .setShowWhen(false)
                .setLocalOnly(true)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();
    }

    /** Created before every use: Android drops a foreground notification whose channel doesn't exist. */
    private static String channel(Context context) {
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        if (manager != null && manager.getNotificationChannel(CHANNEL) == null) {
            NotificationChannel created = new NotificationChannel(CHANNEL, L10n.t("Video streaming"),
                    NotificationManager.IMPORTANCE_MIN);
            created.setShowBadge(false);
            created.setSound(null, null);
            created.enableVibration(false);
            manager.createNotificationChannel(created);
        }
        return CHANNEL;
    }
}
