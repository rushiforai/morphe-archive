/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.tasks.tests;

import android.app.Activity;
import android.app.Application;
import android.app.Instrumentation;
import android.app.AlertDialog;
import android.content.Context;
import android.content.ContentValues;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.KeyEvent;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

/** Real native editor + Room/save path. Only local synthetic fixtures on a named disposable AVD. */
public final class TasksAcceptance extends Instrumentation {
    private static final String PKG = "org.tasks";
    private static final String EXT = "io.github.pengusto.patches.extension.tasks.";
    private static final long BASE = 2838000;
    private Context context;
    private Activity activity;
    private volatile Activity resumed;
    private Bundle args;
    private int checks;
    private String stage = "setup";
    private interface Work { void run() throws Exception; }
    private interface Condition { boolean get() throws Exception; }

    @Override public void onCreate(Bundle args) {
        super.onCreate(args); this.args = args;
        if (!"ranchu".equals(android.os.Build.HARDWARE) || !"true".equals(args.getString("disposable")))
            throw new IllegalStateException("Explicit disposable emulator required");
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
        long end = System.currentTimeMillis() + 15000;
        while (!condition.get() && System.currentTimeMillis() < end) Thread.sleep(100);
        check(condition.get(), message);
    }
    private Class<?> app(String name) throws Exception { return Class.forName(name, true, context.getClassLoader()); }
    private Object call(Object target, String name) throws Exception { return target.getClass().getMethod(name).invoke(target); }
    private Object field(Object target, String name) throws Exception { return target.getClass().getField(name).get(target); }
    private long number(Object target, String name) throws Exception { return target.getClass().getField(name).getLong(target); }
    private SQLiteDatabase db(boolean write) {
        return SQLiteDatabase.openDatabase(context.getDatabasePath("database").getPath(), null,
            write ? SQLiteDatabase.OPEN_READWRITE : SQLiteDatabase.OPEN_READONLY);
    }
    private void seed() {
        try (SQLiteDatabase db = db(true)) {
            try (Cursor c = db.rawQuery("SELECT count(*) FROM tasks WHERE _id NOT BETWEEN 2838001 AND 2838020", null)) {
                check(c.moveToFirst() && c.getInt(0) == 0, "Refuse non-fixture task data");
            }
            String calendar;
            try (Cursor c = db.rawQuery("SELECT cdl_uuid FROM caldav_lists JOIN caldav_accounts ON cdl_account=cda_uuid WHERE cda_account_type=2 LIMIT 1", null)) {
                check(c.moveToFirst(), "Local offline list required"); calendar = c.getString(0);
            }
            try (Cursor c = db.rawQuery("SELECT count(*) FROM caldav_accounts WHERE cda_account_type<>2", null)) {
                check(c.moveToFirst() && c.getInt(0) == 0, "No sync accounts allowed");
            }
            db.beginTransaction();
            try {
                db.delete("caldav_tasks", "cd_task BETWEEN 2838001 AND 2838020", null);
                db.delete("tasks", "_id BETWEEN 2838001 AND 2838020", null);
                long[] parents = {0, BASE+1, BASE+2, BASE+2, BASE+99, BASE+7, 0, BASE+8,
                    BASE+1, BASE+11, 0, BASE+1, BASE+14, BASE+13};
                for (int i = 1; i <= parents.length; i++) {
                    ContentValues v = new ContentValues(); v.put("_id", BASE+i);
                    v.put("title", "Penguin2838-" + i); v.put("notes", "Preserve <b>notes</b> " + i);
                    v.put("importance", 1); v.put("dueDate", i == 3 ? System.currentTimeMillis()+86400000 : 0);
                    v.put("hideUntil", 0); v.put("created", 1700000000000L); v.put("modified", 1700000000000L);
                    v.put("completed", i == 11 ? 1700000000000L : 0); v.put("deleted", i == 7 ? 1700000000000L : 0);
                    v.put("estimatedSeconds", 0); v.put("elapsedSeconds", 0); v.put("timerStart", 0);
                    v.put("notificationFlags", 0); v.put("lastNotified", 0); v.put("reminderDismissed", 0);
                    v.put("recurrence", ""); v.put("repeat_from", 0); v.put("calendarUri", "");
                    v.put("remoteId", "penguin2838-"+i); v.put("collapsed", 0); v.put("parent", parents[i-1]);
                    v.put("\"order\"", (i-1)*1000); v.put("read_only", i == 9 ? 1 : 0);
                    check(db.insertOrThrow("tasks", null, v) > 0, "Insert owned task fixture");
                    ContentValues link = new ContentValues(); link.put("cd_task", BASE+i); link.put("cd_calendar", calendar);
                    link.put("cd_remote_id", "penguin2838-"+i+".ics"); link.put("cd_object", ""); link.put("cd_etag", "");
                    link.put("cd_deleted", 0); link.put("cd_remote_parent", parents[i-1] > 0 ? "penguin2838-"+(parents[i-1]-BASE)+".ics" : "");
                    link.put("gt_moved", 0); link.put("gt_remote_order", (i-1)*1000);
                    db.insertOrThrow("caldav_tasks", null, link);
                }
                db.setTransactionSuccessful();
            } finally { db.endTransaction(); }
        }
    }
    private Parcelable task(long id) throws Exception {
        try (SQLiteDatabase db = db(false); Cursor c = db.rawQuery("SELECT * FROM tasks WHERE _id=?", new String[]{""+id})) {
            check(c.moveToFirst(), "Fixture task exists");
            Object[] values = {id, s(c,"title"), n(c,"importance"), l(c,"dueDate"),l(c,"hideUntil"),l(c,"created"),l(c,"modified"),
                l(c,"completed"),l(c,"deleted"),s(c,"notes"),n(c,"estimatedSeconds"),n(c,"elapsedSeconds"),l(c,"timerStart"),
                n(c,"notificationFlags"),l(c,"lastNotified"),l(c,"reminderDismissed"),s(c,"recurrence"),n(c,"repeat_from"),
                s(c,"calendarUri"),s(c,"remoteId"),n(c,"collapsed") != 0,l(c,"parent"),Long.valueOf(l(c,"order")),n(c,"read_only") != 0,new HashMap<>()};
            for (Constructor<?> ctor : app("org.tasks.data.entity.Task").getConstructors())
                if (ctor.getParameterCount() == values.length && ctor.getParameterTypes()[24] == HashMap.class)
                    return (Parcelable) ctor.newInstance(values);
            throw new AssertionError("Expected shipped Task constructor");
        }
    }
    private static String s(Cursor c, String name) { return c.getString(c.getColumnIndexOrThrow(name)); }
    private static int n(Cursor c, String name) { return c.getInt(c.getColumnIndexOrThrow(name)); }
    private static long l(Cursor c, String name) { return c.getLong(c.getColumnIndexOrThrow(name)); }
    private String title(long id) {
        try (SQLiteDatabase db = db(false); Cursor c = db.rawQuery("SELECT title FROM tasks WHERE _id=?", new String[]{""+id})) { return c.moveToFirst() ? c.getString(0) : null; }
    }
    private String retained(long id) {
        try (SQLiteDatabase db=db(false); Cursor c=db.rawQuery("SELECT notes,parent,dueDate,hideUntil,created,importance,recurrence,repeat_from,read_only FROM tasks WHERE _id=?",new String[]{""+id})) {
            check(c.moveToFirst(),"Saved task still exists"); List<String> row=new ArrayList<>();
            for(int i=0;i<c.getColumnCount();i++) row.add(c.getString(i)); return row.toString();
        }
    }
    private Map<Long,String> rows() {
        Map<Long,String> result = new TreeMap<>();
        try (SQLiteDatabase db = db(false); Cursor c = db.rawQuery("SELECT * FROM tasks ORDER BY _id", null)) {
            while (c.moveToNext()) {
                List<String> row = new ArrayList<>(); for (int i=0;i<c.getColumnCount();i++) row.add(c.getColumnName(i)+"="+c.getString(i));
                result.put(l(c,"_id"), row.toString());
            }
        }
        return result;
    }
    private AccessibilityNodeInfo find(AccessibilityNodeInfo root, String text) {
        if (root == null) return null;
        if (text.equalsIgnoreCase(root.getText() == null ? "" : root.getText().toString()) || text.equalsIgnoreCase(root.getContentDescription() == null ? "" : root.getContentDescription().toString())) return root;
        for (int i=0;i<root.getChildCount();i++) { AccessibilityNodeInfo found = find(root.getChild(i),text); if(found != null) return found; }
        return null;
    }
    private AccessibilityNodeInfo node(String text) { return find(getUiAutomation().getRootInActiveWindow(), text); }
    private void click(String text) throws Exception {
        await(() -> node(text) != null, "Visible native UI action: " + text);
        AccessibilityNodeInfo n = node(text);
        while(n != null && !n.isClickable()) n = n.getParent();
        check(n != null && n.performAction(AccessibilityNodeInfo.ACTION_CLICK), "Click " + text);
        Thread.sleep(250);
    }
    private void edit(String old, String value) throws Exception {
        await(() -> node(old) != null, "Title editable");
        Bundle b = new Bundle(); b.putCharSequence(AccessibilityNodeInfo.ACTION_ARGUMENT_SET_TEXT_CHARSEQUENCE, value);
        check(node(old).performAction(AccessibilityNodeInfo.ACTION_SET_TEXT,b), "Real Compose title edit");
        await(() -> node(value) != null, "Edited title visible");
        await(() -> Boolean.TRUE.equals(call(vm(),"hasChanges")), "Native view model observes draft changes");
    }
    @SuppressWarnings("unchecked") private Object vm() throws Exception {
        java.lang.reflect.Field f = app(EXT+"ParentNavigation").getDeclaredField("fragments"); f.setAccessible(true);
        final Object[] result = {null};
        main(() -> { for (Map.Entry<Object, WeakReference<Object>> e : ((Map<Object,WeakReference<Object>>)f.get(null)).entrySet()) {
            Object fragment = e.getValue().get();
            if (fragment != null && Boolean.TRUE.equals(app(EXT+"TasksHooks").getMethod("active",Object.class).invoke(null,fragment))) result[0] = e.getKey();
        }});
        return result[0];
    }
    private Object current(Object vm) throws Exception { return field(call(field(vm,"viewState"),"getValue"),"task"); }
    private long currentId() throws Exception { Object vm=vm(); return vm==null ? -1 : number(current(vm),"id"); }
    private void expect(long id) throws Exception { await(() -> currentId()==id, "Native editor task " + id); Thread.sleep(300); }
    private Object mainVm() throws Exception {
        Object fragment = null;
        java.lang.reflect.Field f = app(EXT+"ParentNavigation").getDeclaredField("fragments"); f.setAccessible(true);
        Map<?,?> bindings=(Map<?,?>)f.get(null); WeakReference<?> weak=(WeakReference<?>)bindings.get(vm());
        fragment=weak.get(); return call(field(fragment,"mainViewModel$delegate"),"getValue");
    }
    private Object filter() throws Exception { return field(call(field(mainVm(),"state"),"getValue"),"filter"); }
    private void open(int fixture, boolean patched) throws Exception {
        Intent intent = new Intent().setClassName(PKG,"com.todoroo.astrid.activity.MainActivity")
            .putExtra("open_new_task", task(BASE+fixture));
        if(activity == null) activity = startActivitySync(intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
        else main(() -> activity.startActivity(intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)));
        if(patched) expect(BASE+fixture); else await(() -> node(title(BASE+fixture)) != null, "Baseline editor loaded");
    }
    private void filtered(String type, String label, String query) throws Exception {
        Parcelable filter=(Parcelable)app("org.tasks.filters."+type).getConstructor(String.class,String.class).newInstance(label,query);
        Intent intent=new Intent().setClassName(PKG,"com.todoroo.astrid.activity.MainActivity")
            .putExtra("open_filter",filter).putExtra("open_new_task",task(BASE+3)).addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP);
        main(() -> activity.startActivity(intent)); expect(BASE+3);
        check(filter.equals(filter()),"Requested native filter selected");
        Object mainVm=mainVm(); up(2); check(filter.equals(filter()),"Parent outside filter opens without replacing filter");
        // No keyboard on these existing task editors; use the unchanged native Back path.
        sendKeyDownUpSync(KeyEvent.KEYCODE_BACK); await(() -> currentId()==-1,"Filtered parent Back returns to list");
        check(filter.equals(field(call(field(mainVm,"state"),"getValue"),"filter")),"Filtered list context restored");
    }
    private void up(int fixture) throws Exception { click("Go to parent task"); expect(BASE+fixture); }
    private void unchanged(Map<Long,String> before, String message) { check(before.equals(rows()), message); }
    private void capture(String label) throws Exception {
        android.graphics.Bitmap bitmap=getUiAutomation().takeScreenshot();
        check(bitmap!=null,"Raw emulator screenshot available");
        try(FileOutputStream output=new FileOutputStream(new File(context.getCacheDir(),"penguin2838-"+label+".png"))) {
            check(bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG,100,output),"Raw screenshot saved");
        } finally {bitmap.recycle();}
    }
    private void suite() throws Exception {
        stage="unchanged child, hierarchy and filter";
        open(3,true); capture("after"); Map<Long,String> before=rows(); Object filter=filter();
        up(2); capture("parent"); check(filter.equals(filter()), "Filter retained by native navigation"); up(1);
        check(node("Go to parent task")==null,"Root has no parent arrow"); unchanged(before,"Navigation does not alter task rows");

        stage="cancel, discard and sibling selection";
        open(3,true); edit("Penguin2838-3","Penguin2838-unsaved"); click("Go to parent task");
        await(() -> node("Cancel")!=null,"Draft confirmation visible"); capture("draft-dialog"); click("Cancel");
        expect(BASE+3); check(node("Penguin2838-unsaved") != null,"Cancel retains draft"); unchanged(before,"Cancel writes no task");
        click("Go to parent task"); click("Discard"); expect(BASE+2); unchanged(before,"Discard does not autosave draft");
        open(4,true); up(2); open(3,true); check(node("Penguin2838-3")!=null,"Discarded draft stays discarded on reopen");

        stage="native save and subsequent edits";
        String retained=retained(BASE+3);
        edit("Penguin2838-3","Penguin2838-saved"); click("Go to parent task"); click("Save"); expect(BASE+2);
        await(() -> "Penguin2838-saved".equals(title(BASE+3)),"Native save persisted title");
        Map<Long,String> after=rows(); before.remove(BASE+3); after.remove(BASE+3);
        check(before.equals(after),"Save leaves all other task rows unchanged");
        check(retained.equals(retained(BASE+3)),"Title save preserves notes, hierarchy, dates and task settings");
        open(3,true); check(node("Penguin2838-saved")!=null,"Saved child reopened");
        edit("Penguin2838-saved","Penguin2838-saved-twice"); click("Go to parent task"); click("Save"); expect(BASE+2);
        check("Penguin2838-saved-twice".equals(title(BASE+3)),"Fresh editor can save again");

        stage="missing, deleted and corrupt parent";
        for(int child:new int[]{5,6}) {
            open(child,true); before=rows(); click("Go to parent task"); Thread.sleep(600); expect(BASE+child);
            unchanged(before,"Unavailable parent preserves editor/data");
        }
        open(8,true); check(node("Go to parent task")==null,"Self-parent has no arrow");
        open(13,true); before=rows(); up(14); up(13); unchanged(before,"Cyclic metadata causes no recursion or writes");

        stage="read-only and completed task";
        open(9,true); before=rows(); up(1); unchanged(before,"Read-only child navigation writes nothing");
        open(10,true); up(11); check(node("Go to parent task")==null,"Completed parent opens as root");

        stage="parent disappears while confirmation is open";
        open(4,true); edit("Penguin2838-4","Penguin2838-race-draft"); click("Go to parent task");
        await(() -> node("Save")!=null,"Save confirmation visible before synthetic deletion");
        try(SQLiteDatabase db=db(true)){db.execSQL("UPDATE tasks SET deleted=1700000000000 WHERE _id=2838002");}
        before=rows(); click("Save"); Thread.sleep(500); expect(BASE+4);
        check(node("Penguin2838-race-draft")!=null,"Unavailable destination retains draft after confirmation");
        check(!((Boolean)field(vm(),"cleared")),"No discard/save clears the editor when destination vanished");
        unchanged(before,"No save after parent disappeared");
        try(SQLiteDatabase db=db(true)){db.execSQL("UPDATE tasks SET deleted=0 WHERE _id=2838002");}
        click("Go to parent task"); click("Discard"); expect(BASE+2);

        stage="search and date-filter contexts";
        filtered("SearchFilter","Penguin search","Penguin2838-saved-twice");
        try(SQLiteDatabase db=db(true)){db.execSQL("UPDATE tasks SET dueDate=? WHERE _id=2838003",new Object[]{System.currentTimeMillis()+3600000});}
        filtered("TodayFilter","Penguin today",null);

        stage="unavailable parent retains unsaved draft";
        open(5,true); before=rows(); edit("Penguin2838-5","Penguin2838-orphan-draft"); click("Go to parent task");
        Thread.sleep(400); expect(BASE+5); check(node("Penguin2838-orphan-draft")!=null,"Unavailable parent keeps changed draft");
        check(node("Open parent task")==null,"Unavailable parent offers no destructive dialog"); unchanged(before,"Unavailable parent writes no draft");
        // Explicitly discard this owned test draft with the native view model before selecting the next fixture.
        Object orphanVm=vm(); main(() -> orphanVm.getClass().getField("cleared").setBoolean(orphanVm,true));

        stage="configuration recreation";
        open(3,true); before=rows(); edit("Penguin2838-saved-twice","Penguin2838-rotated-draft");
        click("Go to parent task"); Activity old=activity; resumed=null; main(() -> old.recreate());
        await(() -> resumed!=null && resumed!=old,"Native activity recreated"); activity=resumed;
        expect(BASE+3); check(node("Penguin2838-rotated-draft")!=null,"Native draft survives activity recreation");
        click("Go to parent task"); click("Discard"); expect(BASE+2); unchanged(before,"Rotation/dismissal does not autosave draft");

        stage="native Back remains list navigation";
        open(3,true);
        // Real Back first dismisses the IME if visible. The second goes through the native handler.
        main(() -> ((android.view.inputmethod.InputMethodManager)context.getSystemService(Context.INPUT_METHOD_SERVICE)).hideSoftInputFromWindow(activity.getWindow().getDecorView().getWindowToken(),0));
        Thread.sleep(400); sendKeyDownUpSync(KeyEvent.KEYCODE_BACK);
        await(() -> currentId()==-1,"Back closes editor instead of opening parent");
    }
    @Override public void onStart() {
        Bundle result=new Bundle();
        try {
            context=getTargetContext();
            ((Application)context.getApplicationContext()).registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                public void onActivityResumed(Activity a){resumed=a;}
                public void onActivityCreated(Activity a,Bundle b){} public void onActivityStarted(Activity a){}
                public void onActivityPaused(Activity a){} public void onActivityStopped(Activity a){}
                public void onActivitySaveInstanceState(Activity a,Bundle b){} public void onActivityDestroyed(Activity a){}
            });
            String mode=args.getString("mode");
            if("baseline".equals(mode)) {
                seed(); open(3,false); check(node("Go to parent task")==null,"Original APK reproduces missing parent action"); capture("before");
                result.putString("stream","PASS: original editor reproduces #2838; "+checks+" assertions\n");
            } else if("suite".equals(mode)) {
                suite(); result.putString("stream","PASS: native Tasks editor, UI/save/data/lifecycle; "+checks+" assertions\n");
            } else throw new IllegalArgumentException(mode);
            finish(Activity.RESULT_OK,result);
        } catch(Throwable e) {
            android.util.Log.e("PenguinTasksAcceptance",stage,e); result.putString("stream","FAIL: "+stage+"\n"+android.util.Log.getStackTraceString(e)); finish(Activity.RESULT_CANCELED,result);
        }
    }
}
