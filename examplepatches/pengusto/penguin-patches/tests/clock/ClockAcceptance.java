/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.clock.tests;

import android.app.AlarmManager;
import android.app.Instrumentation;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Locale;
import java.util.TimeZone;

/** Tests actual patched entry points, Android scheduling, receivers and notification actions. */
public final class ClockAcceptance extends Instrumentation {
    private static final int A = 910014, B = 910015, C = 910016;
    private static final String TAG = "penguin.clock.upcoming", PREFS = "penguin_clock_upcoming";
    private Context context;
    private Class<?> model, helpers, runtime;
    private SQLiteDatabase db;
    private int checks;
    private String mode, stage = "initialization";
    private Bundle args;
    private interface Condition { boolean get() throws Exception; }

    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        this.args = args;
        if (!"ranchu".equals(android.os.Build.HARDWARE)
                || !"true".equals(args.getString("disposable"))) {
            throw new IllegalStateException("Explicit disposable emulator required");
        }
        mode = args.getString("mode", "suite");
        start();
    }

    private Class<?> app(String name) throws Exception {
        return Class.forName(name, true, context.getClassLoader());
    }
    private void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(stage + ": " + message);
        checks++;
    }
    private void await(Condition condition, String message) throws Exception {
        long end = System.currentTimeMillis() + 30_000;
        while (!condition.get() && System.currentTimeMillis() < end) Thread.sleep(100);
        check(condition.get(), message);
    }
    private Object make(int id, long when, int days, boolean oneShot) throws Exception {
        Calendar date = Calendar.getInstance(); date.setTimeInMillis(when);
        return model.getConstructor(int.class, int.class, int.class, boolean.class,
            boolean.class, String.class, String.class, String.class, boolean.class)
            .newInstance(id, date.get(Calendar.HOUR_OF_DAY) * 60 + date.get(Calendar.MINUTE),
                days, true, false, "Silent", "", "Penguin #14 " + id, oneShot);
    }
    private int number(Object alarm, String name) throws Exception {
        return (Integer) model.getMethod(name).invoke(alarm);
    }
    private Object get(int id) throws Exception {
        Object helper = helpers.getMethod("l", Context.class).invoke(null, context);
        return helper.getClass().getMethod("i", int.class).invoke(helper, id);
    }
    private void insert(Object alarm) throws Exception {
        int id = number(alarm, "getId");
        Object existing = get(id);
        check(existing == null, "Fixture ID already occupied: " + id);
        ContentValues values = new ContentValues();
        values.put("id", id); values.put("time_in_minutes", number(alarm, "getTimeInMinutes"));
        values.put("days", number(alarm, "getDays")); values.put("is_enabled", 1);
        values.put("vibrate", 0); values.put("sound_title", "Silent"); values.put("sound_uri", "");
        values.put("label", "Penguin #14 " + id);
        values.put("one_shot", (Boolean) model.getMethod("getOneShot").invoke(alarm) ? 1 : 0);
        check(db.insertOrThrow("contacts", null, values) == id, "Insert synthetic alarm");
    }
    private void setup(Object alarm, long when) throws Exception {
        helpers.getMethod("x", Context.class, model, long.class).invoke(null, context, alarm, when);
        check(stored(number(alarm, "getId")) >= when, "Native setup saved a trigger");
    }
    private long stored(int id) {
        return context.getSharedPreferences(PREFS, 0).getLong(id + ".when", 0);
    }
    private PendingIntent upcoming(Object alarm) throws Exception {
        return (PendingIntent) helpers.getMethod("v", Context.class, model).invoke(null, context, alarm);
    }
    private void cancel(Object alarm) throws Exception {
        helpers.getMethod("a", Context.class, model).invoke(null, context, alarm);
    }
    private HashMap<Integer, Notification> posted() {
        HashMap<Integer, Notification> result = new HashMap<>();
        for (StatusBarNotification notification : context.getSystemService(NotificationManager.class).getActiveNotifications()) {
            if (TAG.equals(notification.getTag())) result.put(notification.getId(), notification.getNotification());
        }
        return result;
    }
    private void removeFixtures() throws Exception {
        if (db == null) return;
        for (int id : new int[]{A, B, C}) {
            Object alarm = get(id);
            if (alarm != null) {
                check(((String) model.getMethod("getLabel").invoke(alarm)).startsWith("Penguin #14 " + id),
                    "Refusing unrelated fixture row");
                cancel(alarm);
                db.delete("contacts", "id=?", new String[]{Integer.toString(id)});
            }
        }
    }
    private String otherRows() {
        StringBuilder result = new StringBuilder();
        try (Cursor cursor = db.rawQuery("SELECT * FROM contacts WHERE id NOT IN (910014,910015,910016) ORDER BY id", null)) {
            while (cursor.moveToNext()) for (int col = 0; col < cursor.getColumnCount(); col++) {
                result.append(cursor.getColumnName(col)).append('=').append(cursor.getString(col)).append('\n');
            }
        }
        return result.toString();
    }
    private void identities() throws Exception {
        stage = "per-alarm identity";
        long now = System.currentTimeMillis();
        Object first = make(A, now + 3600000, 127, false), second = make(B, now + 7200000, 127, false);
        PendingIntent a = upcoming(first), b = upcoming(second);
        try {
            check(!a.equals(b), "Different alarms share the upcoming PendingIntent");
            a.cancel();
            b.send(); // Proves cancellation of A did not invalidate B; no matching state => no notification.
            checks++;
        } finally { a.cancel(); b.cancel(); }
    }
    private void multiAlarm(boolean reverse) throws Exception {
        stage = "overlapping alarms " + (reverse ? "B then A" : "A then B");
        removeFixtures();
        long now = System.currentTimeMillis(), firstTime = now + 25 * 60000, secondTime = now + 40 * 60000;
        Object first = make(A, firstTime, 127, false), second = make(B, secondTime, -1, false);
        insert(first); insert(second);
        if (reverse) { setup(second, secondTime); setup(first, firstTime); }
        else { setup(first, firstTime); setup(second, secondTime); }
        check(context.getSystemService(AlarmManager.class).getNextAlarmClock().getTriggerTime() == firstTime,
            "Earliest native ringing time changed");
        upcoming(first).send(); upcoming(second).send();
        await(() -> posted().containsKey(A) && posted().containsKey(B), "Two separate notifications");
        HashMap<Integer, Notification> notifications = posted();
        for (int id : new int[]{A, B}) {
            Notification notification = notifications.get(id);
            check(notification.extras.getInt("penguin_alarm_id") == id, "Notification ID belongs to its alarm");
            check(notification.extras.getLong("penguin_trigger") == (id == A ? firstTime : secondTime), "Correct occurrence timestamp");
            String text = notification.extras.getCharSequence(Notification.EXTRA_TEXT).toString();
            check(text.contains("Penguin #14 " + id) && !text.contains("Penguin #14 " + (id == A ? B : A)),
                "Text belongs to its alarm, not the closest other alarm");
            check(notification.actions.length == 1, "Exactly one skip action");
        }
        PendingIntent stale = notifications.get(A).actions[0].actionIntent;
        notifications.get(B).actions[0].actionIntent.send();
        await(() -> !(Boolean) model.getMethod("isEnabled").invoke(get(B)), "One-time skip disables only B");
        await(() -> !posted().containsKey(B), "Only B's notification removed");
        check(posted().containsKey(A), "A notification preserved after B skip");
        check((Boolean) model.getMethod("isEnabled").invoke(get(A)), "A still enabled");
        check(stored(A) == firstTime, "A trigger preserved after B skip");
        String definition = get(A).toString();
        stale.send();
        await(() -> stored(A) > firstTime, "Recurring skip schedules next occurrence");
        long next = stored(A);
        check(get(A).toString().equals(definition), "Recurring skip does not rewrite alarm definition");
        check(next - firstTime > 22 * 3600000L && next - firstTime < 26 * 3600000L, "Daily next occurrence");
        stale.send(); Thread.sleep(200);
        check(stored(A) == next, "Old skip action cannot skip the following occurrence");
        // This is also the scheduling entry used by the native boot/package/time-change receiver.
        setup(first, firstTime);
        check(stored(A) == next, "Rescheduling must not rearm a skipped occurrence");
        cancel(first);
        check(stored(A) == 0, "Disable/cancel removes state");
        check(!(Boolean) model.getMethod("isEnabled").invoke(get(B)), "Cancel A does not re-enable B");
    }
    private void oneShotAndDelete() throws Exception {
        stage = "one-shot and deletion"; removeFixtures();
        long when = System.currentTimeMillis() + 30 * 60000;
        Object first = make(A, when, 127, false), second = make(B, when, -1, true);
        insert(first); insert(second); setup(first, when); setup(second, when);
        upcoming(first).send(); upcoming(second).send();
        await(() -> posted().containsKey(A) && posted().containsKey(B), "Same-time alarms stay separate");
        posted().get(B).actions[0].actionIntent.send();
        await(() -> get(B) == null, "One-shot skip uses native deletion");
        check(posted().containsKey(A) && stored(A) == when, "Other same-time alarm preserved");
        Object helper = helpers.getMethod("l", Context.class).invoke(null, context);
        helper.getClass().getMethod("b", ArrayList.class).invoke(helper, new ArrayList<>(Arrays.asList(first)));
        await(() -> !posted().containsKey(A), "Native delete removes only its notification");
        check(stored(A) == 0 && get(A) == null, "Native delete cancels metadata");
    }
    private void calendarCases() throws Exception {
        stage = "weekly, midnight and DST";
        TimeZone original = TimeZone.getDefault();
        try {
            for (String zone : new String[]{"UTC", "Europe/Berlin", "America/New_York"}) {
                TimeZone.setDefault(TimeZone.getTimeZone(zone));
                for (int[] date : new int[][]{{2026, Calendar.MARCH, 28}, {2026, Calendar.OCTOBER, 24}, {2026, Calendar.DECEMBER, 31}}) {
                    Calendar before = Calendar.getInstance(); before.clear(); before.set(date[0], date[1], date[2], 0, 5);
                    Object daily = make(A, before.getTimeInMillis(), 127, false);
                    long next = (Long) runtime.getMethod("nextOccurrence", model, long.class).invoke(null, daily, before.getTimeInMillis());
                    Calendar expected = (Calendar) before.clone(); expected.add(Calendar.DAY_OF_MONTH, 1);
                    check(next == expected.getTimeInMillis(), "Next local day across DST/year boundary: " + zone);
                    int bit = 1 << ((before.get(Calendar.DAY_OF_WEEK) + 5) % 7);
                    Object weekly = make(A, before.getTimeInMillis(), bit, false);
                    next = (Long) runtime.getMethod("nextOccurrence", model, long.class).invoke(null, weekly, before.getTimeInMillis());
                    expected = (Calendar) before.clone(); expected.add(Calendar.DAY_OF_MONTH, 7);
                    check(next == expected.getTimeInMillis(), "Weekly occurrence retained: " + zone);
                }
            }
        } finally { TimeZone.setDefault(original); }
    }
    private void timedDelivery(int lead) throws Exception {
        stage = "real AlarmManager upcoming delivery"; removeFixtures();
        long when = System.currentTimeMillis() + lead * 60000L + 3500;
        Object alarm = make(A, when, 127, false); insert(alarm); setup(alarm, when);
        check(context.getSystemService(AlarmManager.class).getNextAlarmClock().getTriggerTime() == when,
            "Configured notice must not change ringing time");
        Thread.sleep(500);
        check(!posted().containsKey(A), "No upcoming notification before configured boundary");
        await(() -> posted().containsKey(A), "System delivers upcoming notification at configured boundary");
        check(System.currentTimeMillis() < when, "Alarm did not ring early");
        removeFixtures();
    }
    private void realRingingAndSnooze() throws Exception {
        stage = "real ringing, cleanup and native snooze"; removeFixtures();
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        context.startActivity(launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)); Thread.sleep(1000);
        long now = System.currentTimeMillis();
        Object first = make(A, now + 4000, 127, false), second = make(B, now + 40 * 60000, 127, false);
        insert(first); insert(second); setup(first, now + 4000); setup(second, now + 40 * 60000);
        upcoming(first).send(); upcoming(second).send();
        await(() -> posted().containsKey(A) && posted().containsKey(B), "Both warnings before ringing");
        await(() -> stored(A) > now + 22 * 3600000L, "Actual alarm receiver reschedules recurring A");
        check(!posted().containsKey(A) && posted().containsKey(B), "Ringing A clears only its warning");
        Object controller = helpers.getMethod("f", Context.class).invoke(null, context);
        long before = System.currentTimeMillis();
        controller.getClass().getMethod("g", int.class, int.class).invoke(controller, A, 5);
        await(() -> stored(A) > before + 290000 && stored(A) < before + 320000, "Native five-minute snooze preserved");
        check(posted().containsKey(B), "Snoozing A preserves B notification");
        controller.getClass().getMethod("h", int.class).invoke(controller, A);
        Thread.sleep(500);
        removeFixtures();
    }

    private void seedPreservation() throws Exception {
        stage = "original APK data preservation fixture"; removeFixtures();
        long now = System.currentTimeMillis();
        Object first = make(A, now + 3 * 3600000L, 127, false);
        Object second = make(B, now + 5 * 3600000L, -2, true);
        Object third = make(C, now + 6 * 3600000L, -2, false);
        insert(first); insert(second); insert(third);
        ContentValues values = new ContentValues(); values.put("vibrate", 1); values.put("sound_title", "Penguin fixture ☃");
        db.update("contacts", values, "id=?", new String[]{Integer.toString(A)});
        values.clear(); values.put("is_enabled", 0);
        db.update("contacts", values, "id=?", new String[]{Integer.toString(C)});
        helpers.getMethod("x", Context.class, model, long.class).invoke(null, context, first, now + 3 * 3600000L);
        helpers.getMethod("x", Context.class, model, long.class).invoke(null, context, second, now + 5 * 3600000L);
    }

    private void ui(boolean seed) throws Exception {
        stage = "native UI fixture";
        if (seed) {
            removeFixtures();
            long now = System.currentTimeMillis();
            Object first = make(A, now + 25 * 60000, 127, false), second = make(B, now + 40 * 60000, 127, false);
            insert(first); insert(second); setup(first, now + 25 * 60000); setup(second, now + 40 * 60000);
            upcoming(first).send(); upcoming(second).send();
            await(() -> posted().containsKey(A) && posted().containsKey(B), "UI fixture warnings");
        } else if ("ui-disabled".equals(mode)) {
            check(!(Boolean) model.getMethod("isEnabled").invoke(get(B)), "Native UI disabled B");
            check((Boolean) model.getMethod("isEnabled").invoke(get(A)), "Native UI retained A");
            await(() -> !posted().containsKey(B) && posted().containsKey(A), "UI disabled only B warning");
        } else {
            check(get(A) == null, "Native UI deleted A");
            check(!(Boolean) model.getMethod("isEnabled").invoke(get(B)), "Native UI B remains disabled");
            check(stored(A) == 0 && stored(B) == 0, "UI deletion/disable cleared only fixture metadata");
        }
    }

    private void formatAndStale() throws Exception {
        stage = "format and stale-delivery guards"; removeFixtures();
        int lead = (Integer) runtime.getMethod("leadMinutes").invoke(null);
        long far = System.currentTimeMillis() + (lead + 30) * 60000L;
        Object first = make(A, far, 127, false); insert(first); setup(first, far);
        upcoming(first).send(); Thread.sleep(350);
        check(!posted().containsKey(A), "Early/manual stale delivery cannot bypass notice window");
        cancel(first); upcoming(first).send(); Thread.sleep(350);
        check(!posted().containsKey(A), "Cancelled occurrence cannot post a warning");
        removeFixtures();
        long when = System.currentTimeMillis() + 25 * 60000;
        first = make(A, when, 127, false); insert(first); setup(first, when);
        Object config = helpers.getMethod("k", Context.class).invoke(null, context);
        java.lang.reflect.Field field = app("J5.c").getDeclaredField("b"); field.setAccessible(true);
        android.content.SharedPreferences settings = (android.content.SharedPreferences) field.get(config);
        boolean existed = settings.contains("use_24_hour_format"), old = settings.getBoolean("use_24_hour_format", false);
        try {
            for (boolean is24 : new boolean[]{true, false}) {
                check(settings.edit().putBoolean("use_24_hour_format", is24).commit(), "Change disposable app hour preference");
                upcoming(first).send();
                String time = new java.text.SimpleDateFormat(is24 ? "EEE HH:mm" : "EEE h:mm a", Locale.getDefault()).format(new java.util.Date(when));
                await(() -> posted().containsKey(A) && posted().get(A).extras.getCharSequence(Notification.EXTRA_TEXT).toString().startsWith(time),
                    "Notification follows app's " + (is24 ? "24" : "12") + "-hour preference");
            }
        } finally {
            android.content.SharedPreferences.Editor edit = settings.edit();
            if (existed) edit.putBoolean("use_24_hour_format", old); else edit.remove("use_24_hour_format");
            check(edit.commit(), "Restore app hour preference exactly");
        }
        removeFixtures();
    }

    private void permissionDenied() throws Exception {
        stage = "notifications permission denied"; removeFixtures();
        check(!context.getSystemService(NotificationManager.class).areNotificationsEnabled(), "Permission denial fixture required");
        long when = System.currentTimeMillis() + 25 * 60000;
        Object first = make(A, when, 127, false); insert(first); setup(first, when);
        upcoming(first).send(); Thread.sleep(600);
        check(!posted().containsKey(A), "No unauthorized warning posted");
        check(context.getSystemService(AlarmManager.class).getNextAlarmClock().getTriggerTime() == when, "Ringing retained without notification permission");
    }

    private void persistence(boolean seed) throws Exception {
        stage = "skip persistence and native rescheduling";
        android.content.SharedPreferences fixture = context.getSharedPreferences("penguin_clock_test_fixture", 0);
        if (seed) {
            removeFixtures();
            long when = System.currentTimeMillis() + 25 * 60000;
            Object alarm = make(A, when, 127, false); insert(alarm); setup(alarm, when);
            upcoming(alarm).send(); await(() -> posted().containsKey(A), "Warning for persistence fixture");
            posted().get(A).actions[0].actionIntent.send();
            await(() -> stored(A) > when, "Skip recorded before process death");
            check(fixture.edit().putLong("expected", stored(A)).putString("definition", get(A).toString()).commit(), "Save test oracle");
        } else {
            long expected = fixture.getLong("expected", 0);
            check(expected > System.currentTimeMillis(), "Persistence fixture exists");
            check(stored(A) == expected, "Skip metadata survived process death");
            PendingIntent main = (PendingIntent) helpers.getMethod("g", Context.class, model).invoke(null, context, get(A));
            context.getSystemService(AlarmManager.class).cancel(main);
            context.sendBroadcast(new Intent().setClassName(context, "org.fossify.clock.receivers.RescheduleAlarmsReceiver"));
            await(() -> context.getSystemService(AlarmManager.class).getNextAlarmClock() != null,
                "Real native reschedule receiver scheduled the alarm");
            check(stored(A) == expected, "Native reschedule did not rearm skipped occurrence");
            check(context.getSystemService(AlarmManager.class).getNextAlarmClock().getTriggerTime() == expected,
                "Native ringing uses retained next occurrence");
            check(get(A).toString().equals(fixture.getString("definition", "")), "Recurring definition survived restart/reschedule");
        }
    }

    @Override public void onStart() {
        Bundle result = new Bundle(); String others = null;
        int code = 0;
        try {
            context = getTargetContext(); model = app("org.fossify.clock.models.Alarm"); helpers = app("j5.e");
            boolean seedOriginal = "preservation-seed".equals(mode);
            if (!seedOriginal && !mode.startsWith("persistence-") && !mode.startsWith("ui-")) identities();
            if (!"identity".equals(mode)) {
                Object helper = helpers.getMethod("l", Context.class).invoke(null, context);
                db = ((SQLiteOpenHelper) helper).getWritableDatabase(); others = otherRows();
                if (seedOriginal) {
                    seedPreservation();
                } else {
                    runtime = app("io.github.pengusto.patches.extension.clock.UpcomingAlarms");
                    int lead = (Integer) runtime.getMethod("leadMinutes").invoke(null);
                    check(lead == Integer.parseInt(args.getString("lead", "120")), "Selected Morphe option");
                    if (mode.startsWith("persistence-")) persistence("persistence-seed".equals(mode));
                    else if (mode.startsWith("ui-")) ui("ui-seed".equals(mode));
                    else if ("permission-denied".equals(mode)) permissionDenied();
                    else {
                        timedDelivery(lead);
                        if (!"timing".equals(mode)) {
                            multiAlarm(false); multiAlarm(true);
                            oneShotAndDelete(); calendarCases(); formatAndStale(); realRingingAndSnooze();
                        }
                    }
                }
                check(otherRows().equals(others), "Unrelated alarm rows preserved");
            }
            result.putString("result", "PASS: " + checks + " Clock scheduling/notification/skip assertions");
            code = -1;
        } catch (Throwable error) {
            result.putString("error", stage + "\n" + android.util.Log.getStackTraceString(error));
        } finally {
            try { if (!mode.endsWith("seed") && !"ui-disabled".equals(mode)) removeFixtures(); }
            catch (Exception error) { result.putString("cleanupError", android.util.Log.getStackTraceString(error)); code = 0; }
        }
        finish(code, result);
    }
}
