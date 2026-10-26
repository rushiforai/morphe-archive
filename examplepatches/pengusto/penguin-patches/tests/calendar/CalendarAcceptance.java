/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.calendar.tests;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Parcel;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CompoundButton;
import android.widget.TextView;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Calendar;
import java.util.TimeZone;

/** Integration tests through the actual R8 activities, native listeners, state and save path. */
public final class CalendarAcceptance extends Instrumentation {
    private static final String PKG = "org.fossify.calendar";
    private static final String BASE = "io.github.pengusto.patches.extension.calendarreminders.";
    private Context context;
    private Activity event;
    private volatile Activity resumed;
    private Bundle args;
    private int checks;
    private long expectedAlarm;
    private String stage = "setup";
    private interface Work { void run() throws Exception; }
    private interface Condition { boolean get() throws Exception; }

    @Override public void onCreate(Bundle args) {
        super.onCreate(args); this.args = args;
        if (!"ranchu".equals(android.os.Build.HARDWARE) || !"true".equals(args.getString("disposable"))) {
            throw new IllegalStateException("Explicit disposable emulator required");
        }
        start();
    }
    private void check(boolean value, String message) {
        if (!value) throw new AssertionError(stage + ": " + message);
        checks++;
    }
    private void main(Work work) throws Exception {
        Throwable[] error = {null};
        runOnMainSync(() -> { try { work.run(); } catch (Throwable e) { error[0] = e; } });
        if (error[0] != null) throw new Exception(stage, error[0]);
    }
    private void await(Condition condition, String message) throws Exception {
        long end = System.currentTimeMillis() + 20000;
        while (!condition.get() && System.currentTimeMillis() < end) Thread.sleep(100);
        check(condition.get(), message);
    }
    private Class<?> app(String name) throws Exception { return Class.forName(name, true, context.getClassLoader()); }
    private SharedPreferences prefs() { return context.getSharedPreferences("Prefs", 0); }
    private void defaults(int first, int second, int third) {
        check(context.getSharedPreferences("penguin_calendar_all_day", 0).edit()
            .putInt("reminder_0", first).putInt("reminder_1", second).putInt("reminder_2", third).commit(), "Write synthetic all-day defaults");
    }
    private View view(Activity activity, String id) {
        return activity.findViewById(context.getResources().getIdentifier(id, "id", PKG));
    }
    private Intent intent(boolean allDay) {
        Calendar start = Calendar.getInstance(); start.add(Calendar.DAY_OF_YEAR, 10);
        start.set(Calendar.HOUR_OF_DAY, 12); start.set(Calendar.MINUTE, 0); start.set(Calendar.SECOND, 0); start.set(Calendar.MILLISECOND, 0);
        return new Intent(Intent.ACTION_INSERT).setClassName(PKG, PKG + ".activities.EventActivity")
            .putExtra("beginTime", start.getTimeInMillis()).putExtra("endTime", start.getTimeInMillis() + 3600000)
            .putExtra("allDay", allDay).putExtra("title", "Penguin381Acceptance");
    }
    private Activity open(Intent intent) throws Exception {
        if (event != null) main(() -> event.finish());
        event = startActivitySync(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        await(() -> event.getClass().getField("F0").get(event) != null
            && view(event, "event_reminder_1") != null
            && ((TextView) view(event, "event_reminder_1")).length() > 0, "Native event loaded");
        Thread.sleep(300);
        return event;
    }
    private int[] read() throws Exception {
        String[] names = {"Z", "a0", "b0", "c0", "d0", "e0"}; int[] values = new int[6];
        main(() -> { for (int i = 0; i < names.length; i++) values[i] = event.getClass().getField(names[i]).getInt(event); });
        return values;
    }
    private void expect(int... expected) throws Exception {
        check(Arrays.equals(read(), expected), "Reminders " + Arrays.toString(read()) + " expected " + Arrays.toString(expected));
        String formatted = (String) app("u91").getMethod("R", Context.class, int.class).invoke(null, context, expected[0]);
        check(((TextView) view(event, "event_reminder_1")).getText().toString().equals(formatted), "Native first-reminder UI matches the field");
    }
    private void toggle(boolean allDay) throws Exception {
        main(() -> {
            CompoundButton button = (CompoundButton) view(event, "event_all_day");
            if (button.isChecked() != allDay) button.performClick();
        });
        check(((CompoundButton) view(event, "event_all_day")).isChecked() == allDay, "Native all-day switch");
    }
    private void manual(int... values) throws Exception {
        main(() -> {
            String[] names = {"Z", "a0", "b0", "c0", "d0", "e0"};
            for (int i = 0; i < names.length; i++) event.getClass().getField(names[i]).setInt(event, values[i]);
            event.getClass().getMethod("U").invoke(event);
        });
    }
    private void recreate() throws Exception {
        Activity before = event; resumed = null;
        main(() -> before.recreate());
        await(() -> resumed != null && resumed != before && resumed.getClass() == before.getClass(), "Actual activity recreated");
        event = resumed;
        await(() -> event.getClass().getField("F0").get(event) != null, "Restored native model loaded");
        Thread.sleep(500);
    }
    private SQLiteDatabase db() {
        return SQLiteDatabase.openDatabase(context.getDatabasePath("events.db").getPath(), null, SQLiteDatabase.OPEN_READONLY);
    }
    private long row(String title) {
        try (SQLiteDatabase db = db(); Cursor c = db.rawQuery("SELECT id FROM events WHERE title=?", new String[]{title})) {
            return c.moveToFirst() ? c.getLong(0) : -1;
        }
    }
    private String rows() {
        StringBuilder result = new StringBuilder();
        try (SQLiteDatabase db = db(); Cursor c = db.rawQuery("SELECT * FROM events ORDER BY id", null)) {
            while (c.moveToNext()) for (int i = 0; i < c.getColumnCount(); i++) result.append(c.getColumnName(i)).append('=').append(c.getString(i)).append('\n');
        }
        return result.toString();
    }
    private void save(String title) throws Exception {
        check(row(title) == -1, "Unique fixture title");
        main(() -> { ((TextView) view(event, "event_title")).setText(title); check(view(event, "save").performClick(), "Native Save click"); });
        await(() -> row(title) > 0, "Native save persisted event");
    }
    private void baseline() throws Exception {
        stage = "official baseline regression";
        open(intent(true));
        expect(30, 120, -1, 0, 0, 0);
        check(read()[0] != 720, "Official all-day uses timed defaults instead of 12 hours");
        main(() -> ((TextView) view(event, "event_description")).setText("<p>Penguin381 baseline <b>preserved</b></p>"));
        save("Penguin381Baseline-" + System.currentTimeMillis());
    }
    private void calendarCases() throws Exception {
        stage = "local midnight, DST and year boundary";
        TimeZone original = TimeZone.getDefault();
        Class<?> zoneType = app("org.joda.time.DateTimeZone");
        Object originalJoda = zoneType.getMethod("getDefault").invoke(null);
        String before = rows();
        try {
            for (String zone : new String[]{"UTC", "Europe/Berlin", "America/New_York"}) {
                TimeZone.setDefault(TimeZone.getTimeZone(zone));
                zoneType.getMethod("setDefault", zoneType).invoke(null, zoneType.getMethod("forID", String.class).invoke(null, zone));
                for (int[] date : new int[][]{{2027, Calendar.MARCH, 28}, {2027, Calendar.NOVEMBER, 7}, {2027, Calendar.DECEMBER, 31}}) {
                    Calendar start = Calendar.getInstance(); start.clear(); start.set(date[0], date[1], date[2], 12, 0);
                    open(intent(true).putExtra("beginTime", start.getTimeInMillis()).putExtra("endTime", start.getTimeInMillis() + 3600000));
                    expect(720, -1, -1, 0, 0, 0);
                    Object[] pair = {null};
                    main(() -> pair[0] = event.getClass().getMethod("h0").invoke(event));
                    long actual = (Long) pair[0].getClass().getField("d").get(pair[0]);
                    Calendar midnight = (Calendar) start.clone(); midnight.set(Calendar.HOUR_OF_DAY, 0);
                    check(actual == midnight.getTimeInMillis() / 1000, "Native all-day start remains local midnight: " + zone + " " + Arrays.toString(date));
                    long reminder = actual - read()[0] * 60L;
                    check(reminder == midnight.getTimeInMillis() / 1000 - 43200, "12 elapsed hours before midnight across DST/year boundary");
                }
            }
            check(before.equals(rows()), "Calendar boundary drafts do not rewrite database rows");
        } finally {
            TimeZone.setDefault(original);
            zoneType.getMethod("setDefault", zoneType).invoke(null, originalJoda);
        }
    }
    private void suite() throws Exception {
        stage = "timed and all-day defaults";
        defaults(720, -1, -1);
        String before = rows();
        open(intent(false)); expect(30, 120, -1, 0, 0, 0);
        toggle(true); expect(720, -1, -1, 0, 0, 0);
        toggle(false); expect(30, 120, -1, 0, 0, 0);
        stage = "manual draft values and types survive toggling";
        manual(45, 180, -1, 1, 0, 0);
        toggle(true); manual(360, 1440, 0, 0, 1, 0);
        toggle(false); expect(45, 180, -1, 1, 0, 0);
        toggle(true); expect(360, 1440, 0, 0, 1, 0);
        stage = "real activity recreation";
        recreate(); expect(360, 1440, 0, 0, 1, 0);
        toggle(false); expect(45, 180, -1, 1, 0, 0);
        recreate(); expect(45, 180, -1, 1, 0, 0);
        toggle(true); expect(360, 1440, 0, 0, 1, 0);
        check(before.equals(rows()), "Draft/toggle/recreation never writes the event database");

        stage = "native save, existing events and duplicates";
        defaults(360, 1440, 0);
        open(intent(true)); expect(360, 1440, 0, 0, 0, 0);
        String title = "Penguin381Saved-" + System.currentTimeMillis();
        String html = "<p>Penguin381 <b>exact HTML</b></p><table><tr><td>Untouched &amp; source</td></tr></table>";
        main(() -> ((TextView) view(event, "event_description")).setText(html));
        save(title);
        long id = row(title);
        String saved = rows();
        defaults(2880, -1, -1);
        Intent edit = new Intent().setClassName(PKG, PKG + ".activities.EventActivity").putExtra("event_id", id);
        open(edit);
        int[] savedValues = read();
        int[] sorted = Arrays.copyOf(savedValues, 3); Arrays.sort(sorted);
        check(Arrays.equals(sorted, new int[]{0, 360, 1440}), "Three native reminder values persisted");
        check(((TextView) view(event, "event_description")).getText().toString().equals(html), "HTML source preserved on reopen");
        toggle(false); check(Arrays.equals(savedValues, read()), "Existing event toggle keeps its reminders");
        toggle(true); check(Arrays.equals(savedValues, read()), "Existing event return keeps its reminders");
        recreate(); check(Arrays.equals(savedValues, read()), "Existing event recreation keeps reminders");
        save(title + "-edited");
        check(row(title + "-edited") == id, "Title-only save updates the same event");
        open(edit);
        check(Arrays.equals(savedValues, read()), "Title-only save keeps all three reminders");
        check(((TextView) view(event, "event_description")).getText().toString().equals(html), "Title-only save preserves exact HTML source");
        Object model = event.getClass().getField("F0").get(event);
        expectedAlarm = ((Long) model.getClass().getMethod("getEventStartTS").invoke(model) - 1440 * 60L) * 1000 + 1000;
        saved = rows();
        open(new Intent(edit).putExtra("is_duplicate_intent", true));
        check(Arrays.equals(savedValues, read()), "Duplicate keeps source reminders rather than new defaults");
        toggle(false); toggle(true);
        check(Arrays.equals(savedValues, read()), "Duplicate toggles keep source reminders");
        check(saved.equals(rows()), "Opening/editing/duplicating without save leaves all rows unchanged");

        stage = "reuse-last-reminders takes precedence";
        prefs().edit().putBoolean("use_previous_event_reminders", true)
            .putInt("reminder_minutes", 55).putInt("reminder_minutes_2", 80)
            .putInt("reminder_minutes_3", -1).commit();
        open(intent(true));
        int[] reused = read();
        expect(55, 80, -1, 0, 0, 0);
        toggle(false); toggle(true); check(Arrays.equals(reused, read()), "Reuse mode remains unchanged when toggling");
        prefs().edit().putBoolean("use_previous_event_reminders", false).commit();
        stage = "off and at-start defaults";
        defaults(-1, -1, -1); open(intent(true)); expect(-1, -1, -1, 0, 0, 0);
        toggle(false); expect(30, 120, -1, 0, 0, 0);
        defaults(0, -1, -1); open(intent(true)); expect(0, -1, -1, 0, 0, 0);
        stage = "settings visibility and no duplicate insertion";
        main(() -> event.finish()); event = null;
        Activity settings = startActivitySync(new Intent().setClassName(PKG, PKG + ".activities.SettingsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        ViewGroup root = settings.findViewById(android.R.id.content);
        View section = root.findViewWithTag("penguin.calendar.allDayDefaults");
        check(section != null && section.getVisibility() == View.VISIBLE, "Separate defaults visible with fixed native defaults");
        main(() -> view(settings, "settings_use_last_event_reminders_holder").performClick());
        check(section.getVisibility() == View.GONE, "Separate defaults hidden when using last reminders");
        main(() -> view(settings, "settings_use_last_event_reminders_holder").performClick());
        check(section.getVisibility() == View.VISIBLE, "Separate defaults reappear after disabling reuse");
        main(() -> { try { app(BASE + "AllDayReminders").getMethod("settings", Activity.class).invoke(null, settings); } catch(Exception e) { throw new RuntimeException(e); } });
        check(countTag(root, "penguin.calendar.allDayDefaults") == 1, "Repeated resume does not duplicate settings");
        main(() -> settings.finish());
        defaults(720, -1, -1);
        calendarCases();
    }
    private int countTag(View view, String tag) {
        int count = tag.equals(view.getTag()) ? 1 : 0;
        if (view instanceof ViewGroup) for (int i = 0; i < ((ViewGroup) view).getChildCount(); i++) count += countTag(((ViewGroup) view).getChildAt(i), tag);
        return count;
    }
    @Override public void onStart() {
        Bundle result = new Bundle();
        try {
            context = getTargetContext();
            ((Application) context.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityCreated(Activity a, Bundle b) {}
                public void onActivityStarted(Activity a) {}
                public void onActivityResumed(Activity a) { resumed = a; }
                public void onActivityPaused(Activity a) {}
                public void onActivityStopped(Activity a) {}
                public void onActivitySaveInstanceState(Activity a, Bundle b) {}
                public void onActivityDestroyed(Activity a) {}
            });
            prefs().edit().putBoolean("use_previous_event_reminders", false).putBoolean("was_alarm_warning_shown", true)
                .putInt("default_reminder_1", 30).putInt("default_reminder_2", 120).putInt("default_reminder_3", -1).commit();
            if ("baseline".equals(args.getString("mode"))) baseline(); else suite();
            result.putString("result", "PASS: " + checks + " Calendar integration checks");
            if (expectedAlarm != 0) result.putLong("expectedAlarm", expectedAlarm);
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("error", stage + "\n" + android.util.Log.getStackTraceString(error)); finish(0, result);
        }
    }
}
