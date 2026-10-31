package app.proxma.mytelenor;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Runs the same claims as ClaimJobService, inside a short foreground service. ColorOS stops a
 * background job after a few seconds and freezes the process, which cut the quiz (about a minute
 * with its pacing) off mid-flow; it leaves a process with a foreground service running.
 * Started by the 00:05 alarm and shortly after the app is opened. The jobs stay as the fallback.
 */
public final class ClaimService extends Service {

    private static final String TAG = "PROXMA_MT";
    private static final String CHANNEL_ID = "proxma_mt_run";
    private static final String CHANNEL_NAME = "My Telenor Auto (running)";
    private static final int NOTIF_ID = 1005;
    static final int RUN_ID = 0x50524F05;

    private static final AtomicBoolean sRunning = new AtomicBoolean(false);

    /** Returns false when the system refuses the start, so the caller can fall back to a job. */
    static boolean start(Context context, String why) {
        try {
            Intent intent = new Intent(context, ClaimService.class).putExtra("why", why);
            if (Build.VERSION.SDK_INT >= 26) {
                context.startForegroundService(intent);
            } else {
                context.startService(intent);
            }
            Log.i(TAG, "FGS_START " + why);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "FGS_START_ERR " + why + " " + t);
            return false;
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        final Context context = getApplicationContext();
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(NOTIF_ID, notification(context), ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC);
            } else {
                startForeground(NOTIF_ID, notification(context));
            }
        } catch (Throwable t) {
            Log.w(TAG, "FGS_FOREGROUND_ERR " + t);
            ClaimJobService.runSoon(context);
            stopSelf(startId);
            return START_NOT_STICKY;
        }

        // A run already in progress finishes the work and stops the service.
        if (!sRunning.compareAndSet(false, true)) return START_NOT_STICKY;

        final String why = intent != null ? intent.getStringExtra("why") : null;
        new Thread(() -> {
            try {
                Log.i(TAG, "FGS_RUN " + why);
                ClaimJobService.runClaims(context, RUN_ID);
            } catch (Throwable t) {
                Log.w(TAG, "FGS_ERR " + t);
            } finally {
                sRunning.set(false);
                stopForeground(true);
                stopSelf();
            }
        }, "proxma-mt-fgs").start();
        return START_NOT_STICKY;
    }

    /** dataSync services get a daily time cap on Android 15+; never close to it, but stop cleanly. */
    @Override
    public void onTimeout(int startId, int fgsType) {
        stopSelf();
    }

    private static Notification notification(Context context) {
        Notification.Builder builder;
        if (Build.VERSION.SDK_INT >= 26) {
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm != null) {
                NotificationChannel channel = new NotificationChannel(CHANNEL_ID, CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_LOW);
                channel.setDescription("Shown while the daily claims run");
                nm.createNotificationChannel(channel);
            }
            builder = new Notification.Builder(context, CHANNEL_ID);
        } else {
            builder = new Notification.Builder(context);
        }
        return builder.setSmallIcon(context.getApplicationInfo().icon)
            .setContentTitle("My Telenor Auto-Claim")
            .setContentText("Claiming daily rewards…")
            .setOngoing(true)
            .build();
    }
}
