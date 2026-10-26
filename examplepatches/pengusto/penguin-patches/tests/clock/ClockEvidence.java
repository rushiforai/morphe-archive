/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.clock.evidence;

import android.app.AlarmManager;
import android.app.Instrumentation;
import android.app.Notification;
import android.app.NotificationManager;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import java.util.ArrayList;
import java.util.Calendar;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real native scheduling and notification actions; never injects a warning notification. */
public final class ClockEvidence extends Instrumentation {
    private static final int A = 910014, B = 910015;
    private Context context;
    private Class<?> model, helpers;
    private SQLiteDatabase db;
    private Bundle args;
    @Override public void onCreate(Bundle args) {
        super.onCreate(args); this.args = args;
        if (!"ranchu".equals(android.os.Build.HARDWARE) || !"true".equals(args.getString("disposable")))
            throw new IllegalStateException("Disposable emulator required");
        start();
    }
    private Object alarm(int id) throws Exception {
        Object helper = helpers.getMethod("l", Context.class).invoke(null, context);
        return helper.getClass().getMethod("i", int.class).invoke(helper, id);
    }
    private String otherRows() {
        StringBuilder value = new StringBuilder();
        try (Cursor c = db.rawQuery("SELECT * FROM contacts WHERE id NOT IN (910014,910015) ORDER BY id", null)) {
            while (c.moveToNext()) for (int i = 0; i < c.getColumnCount(); i++) value.append(c.getString(i)).append('\n');
        }
        return value.toString();
    }
    private void cleanup() throws Exception {
        ArrayList<Object> own = new ArrayList<>();
        for (int id : new int[]{A, B}) {
            Object alarm = alarm(id);
            if (alarm == null) continue;
            if (!model.getMethod("getLabel").invoke(alarm).equals("Penguin #14 " + id))
                throw new AssertionError("Unowned fixture ID " + id);
            own.add(alarm);
        }
        if (!own.isEmpty()) {
            Object helper = helpers.getMethod("l", Context.class).invoke(null, context);
            helper.getClass().getMethod("b", ArrayList.class).invoke(helper, own);
        }
    }
    private void seed(int id, long when) throws Exception {
        Calendar date = Calendar.getInstance(); date.setTimeInMillis(when);
        int minutes = date.get(Calendar.HOUR_OF_DAY) * 60 + date.get(Calendar.MINUTE);
        ContentValues row = new ContentValues(); row.put("id", id); row.put("time_in_minutes", minutes);
        row.put("days", 127); row.put("is_enabled", 1); row.put("vibrate", 0);
        row.put("sound_title", "Silent"); row.put("sound_uri", ""); row.put("label", "Penguin #14 " + id); row.put("one_shot", 0);
        db.insertOrThrow("contacts", null, row);
        helpers.getMethod("x", Context.class, model, long.class).invoke(null, context, alarm(id), when);
    }
    private StatusBarNotification[] notifications() {
        return context.getSystemService(NotificationManager.class).getActiveNotifications();
    }
    @Override public void onStart() {
        Bundle result = new Bundle(); int code = 0;
        try {
            context = getTargetContext(); model = Class.forName("org.fossify.clock.models.Alarm", true, context.getClassLoader());
            helpers = Class.forName("j5.e", true, context.getClassLoader());
            db = ((SQLiteOpenHelper) helpers.getMethod("l", Context.class).invoke(null, context)).getWritableDatabase();
            String others = otherRows(), mode = args.getString("mode", "inspect");
            if (mode.equals("seed")) {
                cleanup();
                long first = Long.parseLong(args.getString("first")), second = Long.parseLong(args.getString("second"));
                long now = System.currentTimeMillis();
                if (first < now + 20 * 60000 || second <= first || second > now + 115 * 60000)
                    throw new AssertionError("Fixtures must be beyond original ten-minute window and inside patched window");
                seed(A, first); seed(B, second);
                if (context.getSystemService(AlarmManager.class).getNextAlarmClock().getTriggerTime() != first)
                    throw new AssertionError("Main ringing time changed");
                // Android clamps very near exact alarms to its minimum futurity. Keep
                // instrumentation alive until delivery: finishing/restarting it force-stops
                // the target and can discard pending broadcasts before that boundary.
                // No direct receiver/PI sends or synthesized notification objects.
                Thread.sleep(8000);
            } else if (mode.equals("dismiss-A")) {
                Notification first = null;
                for (StatusBarNotification n : notifications())
                    if ("penguin.clock.upcoming".equals(n.getTag()) && n.getId() == A) first = n.getNotification();
                if (first == null || first.actions.length != 1) throw new AssertionError("Missing real A notification action");
                first.actions[0].actionIntent.send();
                Thread.sleep(1000);
            } else if (mode.equals("cleanup")) cleanup();
            JSONArray notices = new JSONArray();
            for (StatusBarNotification n : notifications()) {
                Notification value = n.getNotification(); JSONObject item = new JSONObject();
                item.put("id", n.getId()); item.put("tag", n.getTag());
                item.put("title", String.valueOf(value.extras.getCharSequence(Notification.EXTRA_TITLE)));
                item.put("text", String.valueOf(value.extras.getCharSequence(Notification.EXTRA_TEXT)));
                item.put("alarmId", value.extras.getInt("penguin_alarm_id", -1));
                item.put("when", value.extras.getLong("penguin_trigger", 0)); notices.put(item);
            }
            if (!otherRows().equals(others)) throw new AssertionError("Unrelated rows changed");
            result.putString("notifications", notices.toString());
            result.putString("result", "PASS: real scheduling/actions; unrelated alarm rows unchanged"); code = -1;
        } catch (Throwable error) { result.putString("error", android.util.Log.getStackTraceString(error)); }
        finish(code, result);
    }
}
