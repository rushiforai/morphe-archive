package app.morphe.ather;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ServiceInfo;
import android.os.Build;
import android.os.IBinder;
import android.util.Log;

/**
 * Keeps the app's process alive so the ride log sees the odometer while you ride.
 *
 * <p>The app already receives the scooter's updates over its own connection whenever the process
 * is running, so this service adds no polling, no wake lock, no network request and no second
 * connection. Its only job is to stop Android from killing the process, which is what merges two
 * rides into one when the app is closed between them.
 *
 * <p>Android requires a foreground service to show an ongoing notification, so this one is silent
 * and low importance. Turn it on or off in the app's Morphe settings screen.
 */
public final class RideService extends Service {

    private static final String TAG = "RideService";
    private static final String CHANNEL = "morphe_ride";
    private static final int NOTIFICATION_ID = 0x52494445; // "RIDE"

    @Override
    public void onCreate() {
        super.onCreate();
        startForegroundCompat();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        // Start again on every call, so a restart after a kill leaves the notification in place.
        startForegroundCompat();
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    /**
     * Shows the ongoing notification. From Android 10 the service must name its foreground type;
     * the manifest declares connectedDevice, so pass the matching constant.
     */
    private void startForegroundCompat() {
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                startForeground(NOTIFICATION_ID, notification(this),
                        ServiceInfo.FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE);
            } else {
                startForeground(NOTIFICATION_ID, notification(this));
            }
        } catch (Throwable t) {
            Log.w(TAG, "Could not start the ride service in the foreground.", t);
        }
    }

    /** Starts the service when the user has turned it on. */
    public static void start(Context context) {
        try {
            if (context == null) {
                return;
            }
            Intent intent = new Intent(context, RideService.class);
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                context.startForegroundService(intent);
            } else {
                context.startService(intent);
            }
        } catch (Throwable t) {
            // Rides are then recorded only while the app is running.
            Log.w(TAG, "Could not start the ride service.", t);
        }
    }

    /** Stops the service when the user has turned it off. */
    public static void stop(Context context) {
        try {
            if (context != null) {
                context.stopService(new Intent(context, RideService.class));
            }
        } catch (Throwable t) {
            // Nothing to do.
        }
    }

    /** Starts or stops the service so it matches the stored preference. */
    public static void apply(Context context) {
        if (MapPref.rideServiceEnabled(context)) {
            start(context);
        } else {
            stop(context);
        }
    }

    private static Notification notification(Context context) {
        NotificationManager manager =
                (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
        if (manager != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                && manager.getNotificationChannel(CHANNEL) == null) {
            NotificationChannel channel = new NotificationChannel(CHANNEL, "Ride recording",
                    NotificationManager.IMPORTANCE_MIN);
            channel.setShowBadge(false);
            manager.createNotificationChannel(channel);
        }

        Notification.Builder builder = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                ? new Notification.Builder(context, CHANNEL)
                : new Notification.Builder(context);
        return builder.setContentTitle("Recording rides")
                .setContentText("Rides keep their own times while this is on.")
                .setSmallIcon(icon(context))
                .setOngoing(true)
                .setShowWhen(false)
                .setContentIntent(open(context))
                .build();
    }

    private static PendingIntent open(Context context) {
        Intent intent = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (intent == null) {
            intent = new Intent();
            intent.setClassName(context, "com.athermobileapp.ui.main.MainActivity");
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        return PendingIntent.getActivity(context, NOTIFICATION_ID, intent,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    private static int icon(Context context) {
        int id = context.getResources().getIdentifier("ic_notification", "drawable",
                context.getPackageName());
        return id != 0 ? id : android.R.drawable.ic_dialog_info;
    }
}
