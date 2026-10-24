package app.proxma.simosa;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.os.Build;
import android.util.Log;

/**
 * The notification {@link DailyCheckinWorker} posts after each run.
 *
 * <p>Channel: {@code proxma_auto} at IMPORTANCE_HIGH (heads-up banner), so the post survives a
 * notification-permission check and a missing app icon without ever throwing.
 *
 * <p>Day tracking used to live here as well ({@code claimed_day}/{@code att_day} in prefs
 * {@code proxma_claim}, install-global). It is gone: the only latch is {@link AutoClaim}'s, which
 * is per account and per day, and nothing here should be able to disagree with it.
 */
public final class WorkerNotify {

    private static final String TAG = "PROXMA_CLAIM";
    private static final String CHANNEL_ID = "proxma_auto";
    private static final String CHANNEL_NAME = "Auto Status";
    private static final int NOTIF_ID = 1003;

    private WorkerNotify() {}

    /** Post a BigTextStyle notification showing the worker result. */
    public static void notifyStatus(Context context, String claimStatus, String nextAction, String title) {
        try {
            if (Build.VERSION.SDK_INT >= 33) {
                if (context.checkSelfPermission("android.permission.POST_NOTIFICATIONS") != 0) {
                    return;
                }
            }

            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) {
                return;
            }

            if (Build.VERSION.SDK_INT >= 26) {
                NotificationChannel channel = new NotificationChannel(CHANNEL_ID, CHANNEL_NAME,
                    NotificationManager.IMPORTANCE_HIGH);
                channel.setDescription("Background worker status");
                nm.createNotificationChannel(channel);
            }

            int icon = context.getApplicationInfo().icon;
            if (icon == 0) {
                return;
            }

            String body = "Session: " + BackgroundCheckin.getSession()
                + "\nCheckin: " + BackgroundCheckin.getCheckin()
                + "\n" + claimStatus
                + "\nMilestone: " + MilestoneClaim.getResult()
                + "\nNext: " + nextAction;

            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= 26) {
                builder = new Notification.Builder(context, CHANNEL_ID);
            } else {
                builder = new Notification.Builder(context);
            }

            builder.setSmallIcon(icon)
                .setContentTitle(title)
                .setContentText(body)
                .setStyle(new Notification.BigTextStyle().bigText(body))
                .setAutoCancel(true)
                .setOnlyAlertOnce(true);

            if (Build.VERSION.SDK_INT >= 26) {
                builder.setTimeoutAfter(72 * 60 * 60 * 1000L);
            }

            nm.notify(NOTIF_ID, builder.build());
        } catch (Throwable t) {
            Log.w(TAG, "notifyStatus failed: " + t);
        }
    }

    public static void log(String msg) {
        Log.i(TAG, msg);
    }
}
