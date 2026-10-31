package app.tikkamasalla.stremio.progress;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

/**
 * Keeps the Stremio process alive while an external player is open. Without it Android can kill
 * the idle app during a long episode, and the player's result (the watch position) is then lost.
 * Started when the player launches, stopped when its result arrives, with a safety timeout.
 */
public final class KeepAliveService extends Service {
    private static final String TAG = "ExtProgress";
    private static final String CHANNEL_ID = "external_player_progress";
    private static final int NOTIFICATION_ID = 7421;
    private static final long TIMEOUT_MS = 6L * 60L * 60L * 1000L;

    private final Handler handler = new Handler(Looper.getMainLooper());

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        try {
            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= 26) {
                NotificationManager manager = getSystemService(NotificationManager.class);
                manager.createNotificationChannel(new NotificationChannel(
                        CHANNEL_ID, "External player", NotificationManager.IMPORTANCE_LOW));
                builder = new Notification.Builder(this, CHANNEL_ID);
            } else {
                builder = new Notification.Builder(this);
            }
            Notification notification = builder
                    .setSmallIcon(android.R.drawable.ic_media_play)
                    .setContentTitle("Saving watch progress")
                    .build();
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PLAYBACK);
            } else {
                startForeground(NOTIFICATION_ID, notification);
            }
            handler.removeCallbacksAndMessages(null);
            handler.postDelayed(this::stopSelf, TIMEOUT_MS);
        } catch (Throwable error) {
            Log.w(TAG, "keep-alive start failed", error);
            stopSelf();
        }
        return START_NOT_STICKY;
    }

    @Override
    public void onDestroy() {
        handler.removeCallbacksAndMessages(null);
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
