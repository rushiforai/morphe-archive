/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.calendar.tests;

import android.app.Instrumentation;
import android.app.Activity;
import android.app.Notification;
import android.app.NotificationManager;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Rect;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.service.notification.StatusBarNotification;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RemoteViews;
import android.widget.TextView;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Calendar;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileInputStream;
import android.os.ParcelFileDescriptor;
import android.util.Xml;
import org.xmlpull.v1.XmlSerializer;

/** Runs against a patched official APK on an explicitly disposable emulator. */
public final class DescriptionSurfaces extends Instrumentation {
    private static final String PKG = "org.fossify.calendar";
    private static final int NOTIFICATION_ID = 98765421;
    private static final long FIXED_START = 1793772000L;
    private Context context;
    private int checks;
    private boolean baseline;
    private String evidence;
    private boolean widgetCaptured, notificationCaptured;

    @Override public void onCreate(Bundle args) {
        super.onCreate(args);
        if (!"ranchu".equals(android.os.Build.HARDWARE) || !"true".equals(args.getString("disposable"))) {
            throw new IllegalStateException("Explicit disposable emulator required");
        }
        baseline = "true".equals(args.getString("baseline"));
        evidence = args.getString("evidence");
        if (evidence != null && !evidence.matches("[a-z0-9-]+")) throw new IllegalArgumentException("Invalid evidence label");
        start();
    }
    private void check(boolean condition, String message) {
        if (!condition) throw new AssertionError(message);
        checks++;
    }
    private interface Condition { boolean ready() throws Exception; }
    private void await(Condition condition, String message) throws Exception {
        long end = System.currentTimeMillis() + 20000;
        while (!condition.ready() && System.currentTimeMillis() < end) Thread.sleep(100);
        check(condition.ready(), message);
    }
    private void shell(String command) throws Exception {
        try (ParcelFileDescriptor descriptor = getUiAutomation().executeShellCommand(command);
             FileInputStream input = new FileInputStream(descriptor.getFileDescriptor())) {
            byte[] buffer = new byte[4096]; while (input.read(buffer) != -1) { }
        }
    }
    private void screenshot(String surface) throws Exception {
        Thread.sleep(1000);
        Bitmap image = getUiAutomation().takeScreenshot();
        if (image == null) throw new AssertionError("No screenshot for " + surface);
        File dir = context.getExternalFilesDir(null);
        try (FileOutputStream stream = new FileOutputStream(new File(dir, "penguin-" + evidence + "-" + surface + ".png"))) {
            if (!image.compress(Bitmap.CompressFormat.PNG, 100, stream)) throw new AssertionError("Screenshot write failed");
        }
        AccessibilityNodeInfo root = getUiAutomation().getRootInActiveWindow();
        if (root == null) throw new AssertionError("No accessibility tree for " + surface);
        File tree = new File(dir, "penguin-" + evidence + "-" + surface + ".xml");
        try (FileOutputStream stream = new FileOutputStream(tree)) {
            XmlSerializer xml = Xml.newSerializer(); xml.setOutput(stream, "UTF-8");
            xml.startDocument("UTF-8", true); writeNode(xml, root); xml.endDocument();
        }
        String content = new String(java.nio.file.Files.readAllBytes(tree.toPath()), java.nio.charset.StandardCharsets.UTF_8);
        check(content.contains(surface.equals("widget") ? "Synthetic title" : "Penguin synthetic notification"), "Evidence surface is not visible: " + surface);
        check(content.contains(baseline ? "&lt;html&gt;" : "Hello world"), "Evidence text is not visible: " + surface);
    }
    private void writeNode(XmlSerializer xml, AccessibilityNodeInfo node) throws Exception {
        xml.startTag(null, "node");
        Rect bounds = new Rect(); node.getBoundsInScreen(bounds);
        xml.attribute(null, "class", String.valueOf(node.getClassName()));
        xml.attribute(null, "text", node.getText() == null ? "" : node.getText().toString());
        xml.attribute(null, "content-desc", node.getContentDescription() == null ? "" : node.getContentDescription().toString());
        xml.attribute(null, "bounds", bounds.toShortString());
        for (int i = 0; i < node.getChildCount(); i++) {
            AccessibilityNodeInfo child = node.getChild(i); if (child != null) writeNode(xml, child);
        }
        xml.endTag(null, "node");
    }
    private void widgetScreenshot(RemoteViews remote) throws Exception {
        long start = System.currentTimeMillis() + 86400000L;
        Activity host = startActivitySync(new Intent(Intent.ACTION_INSERT)
            .setClassName(PKG, PKG + ".activities.EventActivity")
            .putExtra("beginTime", start).putExtra("endTime", start + 3600000)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        runOnMainSync(() -> {
            host.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
            LinearLayout background = new LinearLayout(host);
            background.setOrientation(LinearLayout.VERTICAL);
            background.setFocusableInTouchMode(true);
            background.setBackgroundColor(Color.rgb(24, 30, 34));
            background.setPadding(32, 80, 32, 32);
            TextView label = new TextView(host);
            label.setText("Calendar widget · RemoteViews test render");
            label.setTextColor(Color.WHITE);
            label.setTextSize(18);
            background.addView(label, new LinearLayout.LayoutParams(-1, -2));
            View widget = remote.apply(host, background);
            LinearLayout.LayoutParams row = new LinearLayout.LayoutParams(-1, -2);
            row.topMargin = 40;
            background.addView(widget, row);
            host.addContentView(background, new FrameLayout.LayoutParams(-1, -1));
            background.requestFocus();
            host.getSystemService(InputMethodManager.class).hideSoftInputFromWindow(background.getWindowToken(), 0);
        });
        screenshot("widget");
        runOnMainSync(host::finish);
    }
    private View view(Activity activity, String id) {
        return activity.findViewById(context.getResources().getIdentifier(id, "id", PKG));
    }
    private String[] saved(String title) {
        try (SQLiteDatabase db = SQLiteDatabase.openDatabase(context.getDatabasePath("events.db").getPath(), null, SQLiteDatabase.OPEN_READONLY);
             Cursor cursor = db.rawQuery("SELECT id, description FROM events WHERE title=?", new String[]{title})) {
            return cursor.moveToFirst() ? new String[]{cursor.getString(0), cursor.getString(1)} : null;
        }
    }
    private void editorSave() throws Exception {
        Calendar start = Calendar.getInstance(); start.add(Calendar.DAY_OF_YEAR, 10);
        String title = "Penguin HTML surface " + System.currentTimeMillis();
        String html = " \n<html><body><p>Original &amp; exact</p></body></html>\n ";
        Activity activity = startActivitySync(new Intent(Intent.ACTION_INSERT)
            .setClassName(PKG, PKG + ".activities.EventActivity")
            .putExtra("beginTime", start.getTimeInMillis()).putExtra("endTime", start.getTimeInMillis() + 3600000)
            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        await(() -> view(activity, "event_description") instanceof TextView && view(activity, "save") != null, "Editor controls loaded");
        Thread.sleep(1200);
        runOnMainSync(() -> {
            ((TextView) view(activity, "event_title")).setText(title);
            ((TextView) view(activity, "event_description")).setText(html);
            view(activity, "save").performClick();
        });
        await(() -> saved(title) != null, "Synthetic event saved");
        String[] original = saved(title);
        check((baseline ? html.trim() : html).equals(original[1]), "Initial HTML save mismatch");
        Activity edit = startActivitySync(new Intent().setClassName(PKG, PKG + ".activities.EventActivity")
            .putExtra("event_id", Long.parseLong(original[0])).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        await(() -> view(edit, "event_description") instanceof TextView &&
            original[1].equals(((TextView) view(edit, "event_description")).getText().toString()), "Saved source loaded into editor");
        runOnMainSync(() -> {
            ((TextView) view(edit, "event_title")).setText(title + " edited");
            view(edit, "save").performClick();
        });
        await(() -> saved(title + " edited") != null, "Title-only edit saved");
        String[] changed = saved(title + " edited");
        check(original[0].equals(changed[0]) && original[1].equals(changed[1]), "Title-only edit changed original HTML");
        runOnMainSync(edit::finish);
        Activity sourceEdit = startActivitySync(new Intent().setClassName(PKG, PKG + ".activities.EventActivity")
            .putExtra("event_id", Long.parseLong(original[0])).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        await(() -> view(sourceEdit, "event_description") instanceof TextView &&
            changed[1].equals(((TextView) view(sourceEdit, "event_description")).getText().toString()), "Source edit loaded");
        String replacement = "\n<p>Edited &amp; exact</p> \n";
        runOnMainSync(() -> {
            if (!baseline) {
                ViewGroup holder = (ViewGroup) view(sourceEdit, "event_description").getParent();
                Button toggle = null;
                for (int i = 0; i < holder.getChildCount(); i++) if (holder.getChildAt(i) instanceof Button) toggle = (Button) holder.getChildAt(i);
                check(toggle != null && toggle.performClick(), "HTML source toggle opens editor");
                check(view(sourceEdit, "event_description").getVisibility() == View.VISIBLE, "HTML source editor visible");
                ((TextView) view(sourceEdit, "event_description")).setText(replacement);
                check(toggle.performClick(), "HTML preview toggle");
                check(view(sourceEdit, "event_description").getVisibility() == View.GONE, "HTML preview hides source editor");
            } else ((TextView) view(sourceEdit, "event_description")).setText(replacement);
            ((TextView) view(sourceEdit, "event_title")).setText(title + " source edited");
            view(sourceEdit, "save").performClick();
        });
        await(() -> saved(title + " source edited") != null, "Source edit saved");
        check((baseline ? replacement.trim() : replacement).equals(saved(title + " source edited")[1]), "Explicit HTML source edit mismatch");
        runOnMainSync(sourceEdit::finish);
    }
    private Class<?> app(String name) throws Exception { return Class.forName(name, true, context.getClassLoader()); }
    private String owner(String first, String second) throws Exception {
        try { return app(first).getMethod("getViewAt", int.class) != null ? first : second; }
        catch (ReflectiveOperationException ignored) { return second; }
    }
    private Object listEvent(String description, String location) throws Exception {
        Class<?> type = app("org.fossify.calendar.models.ListEvent");
        Constructor<?> constructor = type.getDeclaredConstructor(long.class, long.class, long.class,
            String.class, String.class, boolean.class, int.class, String.class,
            boolean.class, boolean.class, boolean.class, boolean.class, boolean.class, boolean.class);
        return constructor.newInstance(123L, FIXED_START, FIXED_START + 3600, "Synthetic title", description,
            false, 0xff4488cc, location, false, false, false, false, false, false);
    }
    private String widget(String description, String location, boolean replace) throws Exception {
        Class<?> type = app(owner("wp0", "xp0"));
        Object factory = type.getConstructor(Context.class, Intent.class).newInstance(context, new Intent());
        type.getField("g").setBoolean(factory, true);
        type.getField("h").setBoolean(factory, replace);
        if (evidence != null) { type.getField("e").setInt(factory, Color.WHITE); type.getField("f").setInt(factory, Color.LTGRAY); }
        Object event = listEvent(description, location);
        ArrayList<Object> entries = new ArrayList<>(); entries.add(event);
        type.getField("d").set(factory, entries);
        RemoteViews remote = (RemoteViews) type.getMethod("getViewAt", int.class).invoke(factory, 0);
        if (evidence != null && !widgetCaptured) { widgetCaptured = true; widgetScreenshot(remote); }
        View[] root = {null}; runOnMainSync(() -> root[0] = remote.apply(context, null));
        int id = context.getResources().getIdentifier("event_item_time", "id", PKG);
        String result = ((TextView) root[0].findViewById(id)).getText().toString();
        check(description.equals(event.getClass().getMethod("getDescription").invoke(event)), "Widget changed model description");
        return result;
    }
    private Object event(String description, String location) throws Exception {
        Class<?> type = app("org.fossify.calendar.models.Event");
        Constructor<?> constructor = null;
        for (Constructor<?> candidate : type.getDeclaredConstructors()) {
            if (candidate.getParameterTypes().length == 29) constructor = candidate;
        }
        if (constructor == null) throw new AssertionError("Event constructor missing");
        Class<?>[] types = constructor.getParameterTypes(); Object[] values = new Object[types.length];
        for (int i = 0; i < types.length; i++) {
            if (types[i] == long.class) values[i] = 0L;
            else if (types[i] == int.class) values[i] = 0;
            else if (types[i] == String.class) values[i] = "";
            else if (types[i] == Long.class) values[i] = (long) NOTIFICATION_ID;
            else if (java.util.List.class.isAssignableFrom(types[i])) values[i] = Collections.emptyList();
            else throw new AssertionError("Unknown constructor argument " + types[i]);
        }
        Object event = constructor.newInstance(values);
        type.getMethod("setTitle", String.class).invoke(event, "Penguin synthetic notification");
        type.getMethod("setLocation", String.class).invoke(event, location);
        type.getMethod("setDescription", String.class).invoke(event, description);
        type.getMethod("setCalendarId", long.class).invoke(event, 1L);
        type.getMethod("setStartTS", long.class).invoke(event, FIXED_START);
        type.getMethod("setEndTS", long.class).invoke(event, FIXED_START + 3600);
        return event;
    }
    private String notification(String description, String location, boolean replace) throws Exception {
        SharedPreferences prefs = context.getSharedPreferences("Prefs", 0);
        prefs.edit().putBoolean("replace_description", replace).commit();
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        manager.cancel(NOTIFICATION_ID);
        Object event = event(description, location);
        Class<?> eventType = event.getClass();
        java.lang.reflect.Method method = null;
        for (String name : new String[]{"q50", "r50"}) try {
            Class<?> candidate = app(name);
            java.lang.reflect.Method m = candidate.getMethod("C", Context.class, eventType);
            method = m; break;
        } catch (ReflectiveOperationException ignored) { }
        if (method == null) throw new AssertionError("Notification binding missing");
        method.invoke(null, context, event);
        long deadline = System.currentTimeMillis() + 15000;
        do {
            for (StatusBarNotification sbn : manager.getActiveNotifications()) {
                if (sbn.getId() == NOTIFICATION_ID) {
                    Notification n = sbn.getNotification();
                    String text = String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TEXT));
                    String expanded = String.valueOf(n.extras.getCharSequence(Notification.EXTRA_BIG_TEXT));
                    check(text.equals(expanded), "Collapsed and expanded notification differ");
                    check(description.equals(eventType.getMethod("getDescription").invoke(event)), "Notification changed model description");
                    if (evidence != null && !notificationCaptured) {
                        notificationCaptured = true;
                        shell("cmd statusbar expand-notifications");
                        Thread.sleep(15000);
                        screenshot("notification");
                        shell("cmd statusbar collapse");
                    }
                    manager.cancel(NOTIFICATION_ID);
                    return text;
                }
            }
            Thread.sleep(100);
        } while (System.currentTimeMillis() < deadline);
        throw new AssertionError("Native event notification not posted");
    }
    @Override public void onStart() {
        context = getTargetContext();
        SharedPreferences prefs = context.getSharedPreferences("Prefs", 0);
        boolean had = prefs.contains("replace_description"); boolean previous = prefs.getBoolean("replace_description", false);
        Bundle result = new Bundle();
        try {
            String html = "<html><head><style>hidden</style></head><body><p>Hello <b>world</b></p></body></html>";
            String location = "<b>Literal location</b>";
            if (!baseline) {
                android.widget.EditText[] field = {null};
                runOnMainSync(() -> { field[0] = new android.widget.EditText(context); field[0].setText(" \tPlain text\n "); });
                Object nativeResult = app("io.github.pengusto.patches.extension.calendar.DescriptionPreview")
                    .getMethod("saveValue", android.widget.EditText.class).invoke(null, field[0]);
                check("Plain text".equals(nativeResult), "Plain-text saving must retain native trimming");
            }
            String value = widget(html, location, false);
            check(baseline ? value.contains("<html>") : value.contains("Hello world") && !value.contains("<") && !value.contains("hidden"), "Widget HTML: " + value);
            check(widget(html, location, true).contains(location), "Widget location should remain literal");
            check(widget("Plain < 5", location, false).contains("Plain < 5"), "Widget plain text");
            value = widget("First<br>Second &amp; third", location, false);
            check(baseline ? value.contains("<br>") : value.contains("First Second & third"), "Widget line breaks: " + value);
            value = notification(html, location, false);
            check(baseline ? value.contains("<html>") : value.contains("Hello world") && !value.contains("<") && !value.contains("hidden"), "Notification HTML: " + value);
            check(notification(html, location, true).contains(location), "Notification location should remain literal");
            check(notification("Plain < 5", location, false).contains("Plain < 5"), "Notification plain text");
            value = notification("First<br>Second &amp; third", location, false);
            check(baseline ? value.contains("<br>") : value.contains("First Second & third"), "Notification line breaks: " + value);
            // Synthetic counterpart of the Exchange payload documented in FossifyOrg/Calendar#12.
            String exchange = "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">"
                + "<meta name=\"Generator\" content=\"Microsoft Exchange Server\"><style></style></head><body>"
                + "<font size=\"2\"><span style=\"font-size:11pt;\"><div class=\"PlainText\">"
                + "Workshop schedule confirmed.</div></span></font></body></html>";
            value = notification(exchange, location, false);
            check(baseline ? value.contains("<html>") : value.contains("Workshop schedule confirmed.")
                && !value.contains("<html>") && !value.contains("<div") && !value.contains("<font"),
                "Exchange-style notification description: " + value);
            editorSave();
            result.putString("stream", "PASS: " + checks + " Calendar widget/notification checks\n");
            finish(-1, result);
        } catch (Throwable error) {
            result.putString("stream", android.util.Log.getStackTraceString(error));
            finish(0, result);
        } finally {
            SharedPreferences.Editor edit = prefs.edit();
            if (had) edit.putBoolean("replace_description", previous); else edit.remove("replace_description");
            edit.commit();
            context.getSystemService(NotificationManager.class).cancel(NOTIFICATION_ID);
        }
    }
}
