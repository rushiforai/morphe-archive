package app.plyrs1.extension;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.os.PowerManager;

/**
 * ExamKeepAliveService
 *
 * A foreground Service that keeps the exam process alive in the background.
 *
 * Acquires a PARTIAL_WAKE_LOCK so the CPU stays on even with the screen off
 * (timers, WebView JS, and network calls keep running). Calls startForeground()
 * to promote the process to foreground-service priority tier — Android will not
 * kill it for memory except under extreme pressure, and even then restarts it
 * automatically via START_STICKY.
 *
 * Started from ExamActivity.onCreate() via startForegroundService().
 * Stopped from ExamActivity.onDestroy() via stopService().
 *
 * Required manifest additions (added by ManifestPatch):
 *   <uses-permission android:name="android.permission.WAKE_LOCK"/>
 *   <uses-permission android:name="android.permission.FOREGROUND_SERVICE"/>
 *   <uses-permission android:name="android.permission.FOREGROUND_SERVICE_SPECIAL_USE"/>
 *   <service android:name=".ExamKeepAliveService"
 *            android:foregroundServiceType="specialUse"
 *            android:exported="false"
 *            android:stopWithTask="false"/>
 */
@SuppressWarnings("unused")
public class ExamKeepAliveService extends Service {

    private static final String CHANNEL_ID = "exam_keepalive";
    private static final int NOTIFICATION_ID = 9001;
    private static final String WAKE_TAG = "EUjianBrowser:ExamWakeLock";

    private PowerManager.WakeLock wakeLock;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        createNotificationChannel();
        startForeground(NOTIFICATION_ID, buildNotification());
        acquireWakeLock();
        // START_STICKY: if killed by OS, restart automatically with null intent
        return START_STICKY;
    }

    @Override
    public void onDestroy() {
        releaseWakeLock();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE);
        } else {
            stopForeground(true);
        }
        super.onDestroy();
    }

    // ── Private helpers ───────────────────────────────────────────────────────

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    CHANNEL_ID,
                    "Ujian Aktif",
                    NotificationManager.IMPORTANCE_MIN   // Silent, no heads-up
            );
            channel.setSound(null, null);
            channel.enableVibration(false);
            channel.setShowBadge(false);
            NotificationManager nm = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm != null) nm.createNotificationChannel(channel);
        }
    }

    private Notification buildNotification() {
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            builder = new Notification.Builder(this, CHANNEL_ID);
        } else {
            //noinspection deprecation
            builder = new Notification.Builder(this);
        }
        return builder
                .setContentTitle("Ujian sedang berlangsung")
                .setContentText("Jangan tinggalkan halaman ujian.")
                .setSmallIcon(android.R.drawable.ic_dialog_info)
                .setPriority(Notification.PRIORITY_MIN)
                .setOngoing(true)
                .build();
    }

    private void acquireWakeLock() {
        PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
        if (pm == null) return;
        wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, WAKE_TAG);
        wakeLock.setReferenceCounted(false);
        wakeLock.acquire();
    }

    private void releaseWakeLock() {
        if (wakeLock != null && wakeLock.isHeld()) {
            wakeLock.release();
        }
        wakeLock = null;
    }
}
