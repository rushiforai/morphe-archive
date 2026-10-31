package app.proxma.mytelenor;

import android.app.AlarmManager;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.util.Log;

/**
 * Exact 00:05 PKT alarm that starts ClaimService. An exact alarm is one of the few cases where
 * Android lets a background app start a foreground service; it needs "Alarms & reminders"
 * (SCHEDULE_EXACT_ALARM). Without it nothing changes: the midnight job still runs.
 */
public final class ClaimAlarm extends BroadcastReceiver {

    private static final String TAG = "PROXMA_MT";
    private static final String PREFS = "proxma_mt_job";
    private static final String KEY_ASKED = "exact_alarm_asked";
    private static final int REQUEST = 0x50524F06;
    private static final int NOTIF_ID = 1006;

    static void arm(Context context) {
        try {
            AlarmManager am = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (am == null) return;
            if (Build.VERSION.SDK_INT >= 31 && !am.canScheduleExactAlarms()) {
                Log.i(TAG, "ALARM_NO_EXACT_PERMISSION");
                askOnce(context);
                return;
            }
            long at = System.currentTimeMillis() + ClaimJobService.msUntilNextMidnight();
            am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pendingIntent(context));
            Log.i(TAG, "ALARM_ARMED in=" + ((at - System.currentTimeMillis()) / 60_000L) + "min");
        } catch (Throwable t) {
            Log.w(TAG, "ALARM_ERR " + t);
        }
    }

    @Override
    public void onReceive(Context context, Intent intent) {
        Context app = context.getApplicationContext();
        Log.i(TAG, "ALARM_FIRED");
        arm(app);
        if (!ClaimService.start(app, "alarm")) ClaimJobService.runSoon(app);
    }

    private static PendingIntent pendingIntent(Context context) {
        return PendingIntent.getBroadcast(context, REQUEST, new Intent(context, ClaimAlarm.class),
            PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }

    /** One notification, once, pointing at the "Alarms & reminders" setting. */
    private static void askOnce(Context context) {
        try {
            SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            if (prefs.getBoolean(KEY_ASKED, false)) return;
            if (Build.VERSION.SDK_INT >= 33
                    && context.checkSelfPermission("android.permission.POST_NOTIFICATIONS") != 0) {
                return;
            }
            NotificationManager nm = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (nm == null) return;
            Intent settings = new Intent("android.settings.REQUEST_SCHEDULE_EXACT_ALARM",
                android.net.Uri.parse("package:" + context.getPackageName()));
            PendingIntent open = PendingIntent.getActivity(context, REQUEST, settings,
                PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
            Notification.Builder builder;
            if (Build.VERSION.SDK_INT >= 26) {
                NotificationChannel channel = new NotificationChannel("proxma_mt_auto", "My Telenor Auto",
                    NotificationManager.IMPORTANCE_HIGH);
                nm.createNotificationChannel(channel);
                builder = new Notification.Builder(context, "proxma_mt_auto");
            } else {
                builder = new Notification.Builder(context);
            }
            String body = "Tap and allow \"Alarms & reminders\" so the midnight claim isn't cut off "
                + "by the phone's battery manager.";
            nm.notify(NOTIF_ID, builder.setSmallIcon(context.getApplicationInfo().icon)
                .setContentTitle("My Telenor Auto-Claim")
                .setContentText(body)
                .setStyle(new Notification.BigTextStyle().bigText(body))
                .setContentIntent(open)
                .setAutoCancel(true)
                .build());
            prefs.edit().putBoolean(KEY_ASKED, true).apply();
        } catch (Throwable t) {
            Log.w(TAG, "ALARM_ASK_ERR " + t);
        }
    }
}
