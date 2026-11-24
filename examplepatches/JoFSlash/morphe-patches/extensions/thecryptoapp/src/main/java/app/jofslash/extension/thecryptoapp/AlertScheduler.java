package app.jofslash.extension.thecryptoapp;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

/**
 * Schedules the periodic alert check with AlarmManager.
 *
 * <p>Preferred mode: a self-rescheduling {@code setExactAndAllowWhileIdle} chain (the receiver
 * re-arms the next check at the end of each run), so alerts fire through Doze. If exact alarms are
 * not permitted ({@link AlarmManager#canScheduleExactAlarms()} is false on API 31+), it falls back
 * to {@code setInexactRepeating} and logs which mode is active. Cadence is ~15 min in both modes.
 */
public final class AlertScheduler {

    static final String TAG = CustomAlerts.TAG;

    public static final String ACTION_CHECK = "app.jofslash.thecryptoapp.CHECK_ALERTS";
    private static final int REQUEST_CODE = 0x4A4F41; // "JOA"
    private static final long INTERVAL_MS = 15L * 60L * 1000L;

    private AlertScheduler() {
    }

    private static PendingIntent checkIntent(Context ctx) {
        Intent i = new Intent(ctx, AlertReceiver.class).setAction(ACTION_CHECK);
        int flags = PendingIntent.FLAG_UPDATE_CURRENT;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) flags |= PendingIntent.FLAG_IMMUTABLE;
        return PendingIntent.getBroadcast(ctx.getApplicationContext(), REQUEST_CODE, i, flags);
    }

    private static boolean exactAllowed(AlarmManager am) {
        // Exact alarms: always allowed pre-31; on 31+ depends on the permission/user setting.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return true;
        try {
            return am.canScheduleExactAlarms();
        } catch (Throwable t) {
            return false;
        }
    }

    /** First scheduling, from App.onCreate and BOOT_COMPLETED. */
    public static void schedule(Context ctx) {
        scheduleNext(ctx);
    }

    /**
     * Arms the next check. In exact mode this is a one-shot the receiver re-arms (a chain); in the
     * inexact fallback it (re)arms a repeating alarm, which is harmless to call repeatedly.
     */
    public static void scheduleNext(Context ctx) {
        try {
            AlarmManager am = (AlarmManager) ctx.getApplicationContext()
                    .getSystemService(Context.ALARM_SERVICE);
            if (am == null) {
                Log.e(TAG, "schedule: no AlarmManager");
                return;
            }
            PendingIntent pi = checkIntent(ctx);
            long triggerAt = System.currentTimeMillis() + INTERVAL_MS;

            boolean exact = false;
            if (exactAllowed(am)) {
                try {
                    am.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, triggerAt, pi);
                    exact = true;
                    Log.i(TAG, "schedule: EXACT (setExactAndAllowWhileIdle) next check in ~15 min");
                } catch (SecurityException revoked) {
                    // The exact-alarm permission was taken away after the check above.
                    Log.w(TAG, "schedule: exact alarm refused, falling back to inexact");
                }
            }
            if (!exact) {
                am.setInexactRepeating(AlarmManager.RTC_WAKEUP, triggerAt,
                        AlarmManager.INTERVAL_FIFTEEN_MINUTES, pi);
                Log.i(TAG, "schedule: INEXACT fallback (exact alarms not permitted) repeating ~15 min");
            }
        } catch (Throwable t) {
            Log.e(TAG, "schedule: failed", t);
        }
    }

    public static void cancel(Context ctx) {
        try {
            AlarmManager am = (AlarmManager) ctx.getApplicationContext()
                    .getSystemService(Context.ALARM_SERVICE);
            if (am != null) am.cancel(checkIntent(ctx));
        } catch (Throwable t) {
            Log.e(TAG, "schedule: cancel failed", t);
        }
    }
}
