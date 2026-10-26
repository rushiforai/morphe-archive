/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.clock;

import android.app.AlarmManager;
import android.content.BroadcastReceiver;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Build;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import org.fossify.clock.models.Alarm;

/** Per-alarm upcoming notifications; native ringing intents and alarm records are retained. */
public final class UpcomingAlarms {
    public static final String TAG = "penguin.clock.upcoming";
    public static final String PREFS = "penguin_clock_upcoming";
    public static final String WHEN = "penguin_trigger";
    private static final String RECEIVERS = "org.fossify.clock.receivers.";
    private static final String CHANNEL = "Early Alarm Dismissal";
    private static final int FLAGS = PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE;
    private UpcomingAlarms() {}

    /** Replaced with the validated Morphe option at patch time. */
    public static int leadMinutes() { return 120; }

    private static SharedPreferences prefs(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static AlarmManager alarms(Context context) {
        return context.getSystemService(AlarmManager.class);
    }

    private static NotificationManager notifications(Context context) {
        return context.getSystemService(NotificationManager.class);
    }

    private static String definition(Alarm alarm) {
        return alarm.getTimeInMinutes() + "/" + alarm.getDays();
    }

    private static String day(long when) {
        return new SimpleDateFormat("yyyy-MM-dd", Locale.ROOT).format(new Date(when));
    }

    private static void save(SharedPreferences.Editor editor) {
        if (!editor.commit()) throw new IllegalStateException("Could not save upcoming-alarm state");
    }

    private static Intent intent(Context context, String receiver, String kind, int id) {
        return new Intent().setClassName(context, RECEIVERS + receiver)
            .setData(Uri.parse("penguin-clock://" + kind + "/" + id))
            .putExtra("alarm_id", id);
    }

    public static synchronized PendingIntent upcoming(Context context, int id) {
        Intent intent = intent(context, "UpcomingAlarmReceiver", "upcoming", id)
            .putExtra(WHEN, prefs(context).getLong(id + ".when", 0));
        return PendingIntent.getBroadcast(context, id, intent, FLAGS);
    }

    private static PendingIntent skipIntent(Context context, int id, long when) {
        Intent intent = intent(context, "SkipUpcomingAlarmReceiver", "skip", id)
            .setData(Uri.parse("penguin-clock://skip/" + id + "/" + when))
            .putExtra(WHEN, when);
        return PendingIntent.getBroadcast(context, id, intent, FLAGS);
    }

    /** The earliest selected weekday strictly after the skipped local calendar date. */
    public static long nextOccurrence(Alarm alarm, long after) {
        Calendar base = Calendar.getInstance();
        base.setTimeInMillis(after);
        for (int offset = 1; offset <= 7; offset++) {
            Calendar next = (Calendar) base.clone();
            next.add(Calendar.DAY_OF_MONTH, offset);
            next.set(Calendar.HOUR_OF_DAY, alarm.getTimeInMinutes() / 60);
            next.set(Calendar.MINUTE, alarm.getTimeInMinutes() % 60);
            next.set(Calendar.SECOND, 0);
            next.set(Calendar.MILLISECOND, 0);
            int bit = 1 << ((next.get(Calendar.DAY_OF_WEEK) + 5) % 7);
            if ((alarm.getDays() & bit) != 0 && next.getTimeInMillis() > after) {
                return next.getTimeInMillis();
            }
        }
        throw new IllegalArgumentException("Recurring alarm has no selected weekday");
    }

    /** Same platform ringing API/identity as the original; only upcoming scheduling changes. */
    public static synchronized void setup(Context context, Alarm alarm, long requested) {
        try {
            SharedPreferences state = prefs(context);
            int id = alarm.getId();
            String key = Integer.toString(id);
            String definition = definition(alarm);
            long when = requested;
            if (alarm.isRecurring() && definition.equals(state.getString(key + ".skipDefinition", ""))
                    && day(when).equals(state.getString(key + ".skipDay", ""))) {
                when = nextOccurrence(alarm, when);
            }
            alarms(context).setAlarmClock(new AlarmManager.AlarmClockInfo(when,
                ClockHooks.openIntent(context)), ClockHooks.mainIntent(context, alarm));

            migrate(context);
            save(state.edit().putLong(key + ".when", when)
                .putString(key + ".definition", definition));
            notifications(context).cancel(TAG, id);
            PendingIntent pending = upcoming(context, id);
            alarms(context).cancel(pending);
            long now = System.currentTimeMillis();
            if (when > now) {
                alarms(context).setExactAndAllowWhileIdle(AlarmManager.RTC_WAKEUP,
                    Math.max(now + 500, when - leadMinutes() * 60_000L), pending);
            }
        } catch (Exception error) {
            ClockHooks.error(context, error);
        }
    }

    /** Retire only the original upcoming identity/channel, including on package replacement. */
    public static synchronized void migrate(Context context) {
        PendingIntent legacy = PendingIntent.getBroadcast(context, 10002,
            new Intent().setClassName(context, RECEIVERS + "UpcomingAlarmReceiver"),
            PendingIntent.FLAG_NO_CREATE | PendingIntent.FLAG_IMMUTABLE);
        if (legacy != null) { alarms(context).cancel(legacy); legacy.cancel(); }
        for (android.service.notification.StatusBarNotification posted : notifications(context).getActiveNotifications()) {
            if (posted.getTag() == null && posted.getId() == 10003
                    && CHANNEL.equals(posted.getNotification().getChannelId())) notifications(context).cancel(10003);
        }
    }

    private static void clearUpcoming(Context context, int id) {
        alarms(context).cancel(upcoming(context, id));
        notifications(context).cancel(TAG, id);
        save(prefs(context).edit().remove(id + ".when").remove(id + ".definition"));
    }

    public static synchronized void cancel(Context context, Alarm alarm) {
        alarms(context).cancel(ClockHooks.mainIntent(context, alarm));
        clearUpcoming(context, alarm.getId());
        save(prefs(context).edit().remove(alarm.getId() + ".skipDay")
            .remove(alarm.getId() + ".skipDefinition"));
    }

    /** Called before the original receiver reschedules a recurring alarm. */
    public static synchronized void ringing(Context context, Intent intent) {
        int id = intent.getIntExtra("alarm_id", -1);
        if (id >= 0) clearUpcoming(context, id);
    }

    private static Alarm current(Context context, Intent intent) {
        int id = intent.getIntExtra("alarm_id", -1);
        long when = intent.getLongExtra(WHEN, 0);
        SharedPreferences state = prefs(context);
        long now = System.currentTimeMillis();
        if (id < 0 || when <= now || when - now > leadMinutes() * 60_000L + 1000
                || when != state.getLong(id + ".when", 0)) return null;
        Alarm alarm = ClockHooks.alarm(context, id);
        return alarm != null && alarm.isEnabled()
            && definition(alarm).equals(state.getString(id + ".definition", "")) ? alarm : null;
    }

    private static int resource(Context context, String type, String name) {
        int id = context.getResources().getIdentifier(name, type, context.getPackageName());
        if (id == 0) throw new IllegalStateException("Missing Clock resource: " + name);
        return id;
    }

    private static void show(Context context, Intent intent) {
        if (Build.VERSION.SDK_INT >= 33 && context.checkSelfPermission(
                "android.permission.POST_NOTIFICATIONS") != PackageManager.PERMISSION_GRANTED) return;
        Alarm alarm = current(context, intent);
        if (alarm == null) return;
        long when = intent.getLongExtra(WHEN, 0);
        String title = context.getString(resource(context, "string", "upcoming_alarm"));
        NotificationChannel channel = new NotificationChannel(CHANNEL, title,
            NotificationManager.IMPORTANCE_DEFAULT);
        channel.setSound(null, null);
        notifications(context).createNotificationChannel(channel);
        String pattern = ClockHooks.is24Hour(context) ? "EEE HH:mm" : "EEE h:mm a";
        String text = new SimpleDateFormat(pattern, Locale.getDefault()).format(new Date(when));
        if (!alarm.getLabel().isEmpty()) text += " — " + alarm.getLabel();
        Bundle extras = new Bundle();
        extras.putInt("penguin_alarm_id", alarm.getId());
        extras.putLong(WHEN, when);
        Notification notification = new Notification.Builder(context, CHANNEL)
            .setContentTitle(title).setContentText(text)
            .setSmallIcon(resource(context, "drawable", "ic_alarm_vector"))
            .setContentIntent(ClockHooks.openIntent(context))
            .addAction(new Notification.Action.Builder(null,
                context.getString(resource(context, "string", "dismiss")),
                skipIntent(context, alarm.getId(), when)).build())
            .setAutoCancel(true).setOnlyAlertOnce(true).setShowWhen(false)
            .setExtras(extras).build();
        notifications(context).notify(TAG, alarm.getId(), notification);
    }

    private static void skip(Context context, Intent intent) {
        Alarm alarm = current(context, intent);
        if (alarm == null) return;
        long when = intent.getLongExtra(WHEN, 0);
        cancel(context, alarm);
        if (alarm.isRecurring()) {
            save(prefs(context).edit().putString(alarm.getId() + ".skipDay", day(when))
                .putString(alarm.getId() + ".skipDefinition", definition(alarm)));
            setup(context, alarm, nextOccurrence(alarm, when));
        } else {
            ClockHooks.finishOneTime(context, alarm);
        }
        ClockHooks.refresh(context);
    }

    /** Receiver DB work runs off main; the framework pending result remains alive until finished. */
    public static void receive(BroadcastReceiver receiver, Context context, Intent intent, boolean skip) {
        BroadcastReceiver.PendingResult result = receiver.goAsync();
        new Thread(() -> {
            try {
                synchronized (UpcomingAlarms.class) {
                    if (skip) skip(context, intent); else show(context, intent);
                }
            } catch (Exception error) {
                ClockHooks.error(context, error);
            } finally {
                if (result != null) result.finish();
            }
        }, "PenguinClockUpcoming").start();
    }
}
