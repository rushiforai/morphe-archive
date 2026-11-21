package app.proxma.rox;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.util.Log;

/**
 * A job planned for shortly after midnight is held back by Doze while the phone lies unused, often
 * until the morning or later, so the background check-in ran late or not at all. ROX already holds
 * USE_EXACT_ALARM, so the same planned time is also set as an exact alarm that fires in Doze. When
 * it fires, this asks for an expedited job, which the system runs straight away with network even
 * in Doze; that job does the same off-screen check-in as the planned one (CheckinJobService).
 */
public final class CheckinAlarm extends BroadcastReceiver {

    private static final String TAG = "PROXMA_ROX";
    private static final int REQUEST_CODE = 0x52_4f_58;
    static final String KEY_ALARM_SET_AT = "bg_alarm_set_for";
    static final String KEY_ALARM_FIRED_AT = "bg_alarm_fired_at";
    static final String KEY_ALARM_KIND = "bg_alarm_kind";

    @Override public void onReceive(Context context, Intent intent) {
        try {
            Context app = context.getApplicationContext();
            long now = System.currentTimeMillis();
            AutoCheckin.prefs(app).edit().putLong(KEY_ALARM_FIRED_AT, now).commit();
            Log.i(TAG, "ALARM fired at " + AutoCheckin.clock(now));
            CheckinJobService.runNow(app);
        } catch (Throwable t) {
            Log.w(TAG, "ALARM_ERR " + t);
        }
    }

    /** Sets (or moves) the wake-up alarm to the given wall-clock time. */
    static void set(Context context, long at) {
        try {
            AlarmManager alarms = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
            if (alarms == null) {
                Log.w(TAG, "ALARM no alarm manager");
                return;
            }
            PendingIntent pending = pendingIntent(context);
            String kind;
            if (Build.VERSION.SDK_INT < 31 || alarms.canScheduleExactAlarms()) {
                alarms.setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending);
                kind = "exact";
            } else {
                // Without exact alarm access an inexact one still fires in Doze, a little later.
                alarms.setAndAllowWhileIdle(AlarmManager.RTC_WAKEUP, at, pending);
                kind = "inexact";
            }
            AutoCheckin.prefs(context).edit()
                .putLong(KEY_ALARM_SET_AT, at)
                .putString(KEY_ALARM_KIND, kind)
                .apply();
            Log.i(TAG, "ALARM " + kind + " set for " + AutoCheckin.clock(at));
        } catch (Throwable t) {
            Log.w(TAG, "ALARM_SET_ERR " + t);
        }
    }

    private static PendingIntent pendingIntent(Context context) {
        Intent intent = new Intent(context, CheckinAlarm.class).setPackage(context.getPackageName());
        return PendingIntent.getBroadcast(context, REQUEST_CODE, intent,
            PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);
    }
}
