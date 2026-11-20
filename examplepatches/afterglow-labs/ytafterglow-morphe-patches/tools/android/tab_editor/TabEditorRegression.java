package app.afterglow.extension.ui;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Intent;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import app.afterglow.extension.settings.TabStore;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;
import org.json.JSONArray;
import org.json.JSONObject;

/** Real InputDispatcher -> Activity -> ScrollView -> row -> handle dispatch. */
public final class TabEditorRegression extends Instrumentation {
    private AfterglowActivity host;
    private final JSONArray passed = new JSONArray();
    private int assertions;
    private String currentCase;
    private long down;
    private float fingerX, fingerY;

    @Override public void onCreate(Bundle arguments) { super.onCreate(arguments); start(); }
    private interface Test { void run() throws Exception; }
    private <T> T ui(Callable<T> callback) throws Exception {
        FutureTask<T> task = new FutureTask<>(callback);
        runOnMainSync(task);
        return task.get();
    }
    private void act(Runnable callback) throws Exception {
        ui(() -> { callback.run(); return null; }); settle();
    }
    private void settle() throws Exception {
        waitForIdleSync(); Thread.sleep(65); waitForIdleSync();
        Throwable failure = ui(() -> host.dispatchFailure);
        if (failure != null) throw new AssertionError("Touch dispatch threw", failure);
    }
    private void check(boolean condition, String message) {
        assertions++;
        if (!condition) throw new AssertionError(message);
    }
    private void prepare(int maximum, String... tabs) throws Exception { act(() -> host.prepare(maximum, tabs)); }
    private List<String> active() throws Exception { return ui(TabStore::currentActiveTabs); }
    private void order(String... tabs) throws Exception { check(active().equals(Arrays.asList(tabs)), "Order: " + active() + "; expected " + Arrays.toString(tabs)); }
    private float[] position(String tab, boolean handle, float fraction) throws Exception {
        return ui(() -> {
            View row = host.row(tab);
            if (row == null) throw new AssertionError("Missing row " + tab);
            View view = handle ? ((ViewGroup)row).getChildAt(((ViewGroup)row).getChildCount()-1) : row;
            int[] loc = new int[2]; view.getLocationOnScreen(loc);
            return new float[] { loc[0] + view.getWidth()/2f, loc[1] + view.getHeight()*fraction };
        });
    }
    private void event(int action, float x, float y) throws Exception {
        MotionEvent event = MotionEvent.obtain(down, SystemClock.uptimeMillis(), action, x, y, 0);
        event.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);
        try { sendPointerSync(event); } finally { event.recycle(); }
        fingerX = x; fingerY = y; settle();
    }
    private void start(String tab) throws Exception {
        float[] p = position(tab, true, .5f); down = SystemClock.uptimeMillis();
        event(MotionEvent.ACTION_DOWN, p[0], p[1]);
        check(ui(() -> host.screen.isBusy()), "DOWN starts a drag");
    }
    private void move(String target, float fraction) throws Exception {
        float[] p = position(target, false, fraction);
        event(MotionEvent.ACTION_MOVE, fingerX, p[1]);
        check(ui(() -> host.screen.isBusy()), "Drag must survive MOVE without synthetic cancellation");
        check(ui(() -> TabStore.writes)==0, "MOVE must not persist an incomplete drag");
    }
    private void end(int action) throws Exception { event(action, fingerX, fingerY); clean(); }
    private void clean() throws Exception {
        check(!ui(() -> host.screen.isBusy()), "Gesture ended");
        check(ui(() -> host.layer.getChildCount())==0, "No ghost remains");
        check(ui(() -> {
            for (String id : SettingsSpec.TAB_IDS) {
                View row = host.row(id);
                if (row != null && (row.getVisibility()!=View.VISIBLE || row.getHeight()==0)) return false;
            }
            return true;
        }), "Every remaining row has its original visibility and nonzero height");
    }
    private List<String> section(String tag) throws Exception {
        return ui(() -> {
            ViewGroup group = (ViewGroup)host.row(tag).getParent();
            List<String> ids = new ArrayList<>();
            for (int i=0; i<group.getChildCount(); i++) {
                Object id=group.getChildAt(i).getTag();
                if (id instanceof String) ids.add((String)id);
                else throw new AssertionError("Placeholder remains after end");
            }
            return ids;
        });
    }
    private void test(String name, Test test) throws Exception { currentCase=name; test.run(); passed.put(name); }

    @Override public void onStart() {
        JSONObject result = new JSONObject();
        try {
            Intent intent = new Intent(getTargetContext(), AfterglowActivity.class).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            host = (AfterglowActivity)startActivitySync(intent); settle();
            test("same-list drag retains touch ownership through multiple moves", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("home"); move("subscriptions",.8f); move("library",.8f); end(MotionEvent.ACTION_UP);
                order("subscriptions","library","home","afterglow");
                check(section("home").equals(active()), "Visual and saved order agree");
            });
            test("upward reorder", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("afterglow"); move("library",.2f); move("subscriptions",.2f); end(MotionEvent.ACTION_UP);
                order("home","afterglow","subscriptions","library");
            });
            test("shown to hidden", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("subscriptions"); move("history",.8f); end(MotionEvent.ACTION_UP);
                order("home","library","afterglow");
                List<String> hidden=section("subscriptions");
                check(hidden.indexOf("subscriptions")==hidden.indexOf("history")+1, "Hidden insertion position");
            });
            test("hidden to shown", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("history"); move("subscriptions",.8f); end(MotionEvent.ACTION_UP);
                order("home","subscriptions","history","library","afterglow");
            });
            test("CANCEL after crossing sections preserves saved order", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("subscriptions"); move("history",.8f); end(MotionEvent.ACTION_CANCEL);
                order("home","subscriptions","library","afterglow");
                check(ui(() -> TabStore.writes)==0, "CANCEL must not write preferences");
                check(section("subscriptions").equals(active()), "CANCEL restores source section");
            });
            test("two shown tabs cannot be hidden by drag", () -> {
                prepare(11,"home","subscriptions");
                start("home"); move("library",.8f); end(MotionEvent.ACTION_UP);
                List<String> values=active(); Collections.sort(values);
                check(values.equals(Arrays.asList("home","subscriptions")), "Minimum shown count");
            });
            test("maximum shown count cannot be exceeded by drag", () -> {
                prepare(6,"home","subscriptions","library","afterglow","history","watchlater");
                start("posts"); move("subscriptions",.8f); end(MotionEvent.ACTION_UP);
                order("home","subscriptions","library","afterglow","history","watchlater");
                check(section("posts").contains("messages"), "Rejected addition remains hidden");
            });
            test("tap of a handle does not change order", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("library"); end(MotionEvent.ACTION_UP); order("home","subscriptions","library","afterglow");
            });
            test("repeated drags on the same editor", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("home"); move("subscriptions",.8f); end(MotionEvent.ACTION_UP);
                order("subscriptions","home","library","afterglow");
                act(() -> TabStore.writes=0);
                start("home"); move("subscriptions",.2f); end(MotionEvent.ACTION_UP);
                order("home","subscriptions","library","afterglow");
            });
            test("auto-scroll advances and stops after cancellation", () -> {
                prepare(11,"home","subscriptions","library","afterglow","history","watchlater","posts","messages","shorts");
                act(() -> host.scroll.setLayoutParams(new FrameLayout.LayoutParams(-1,host.views().dp(300))));
                start("home");
                float edge=ui(() -> {int[] p=new int[2];host.scroll.getLocationOnScreen(p);return p[1]+host.scroll.getHeight()-6f;});
                event(MotionEvent.ACTION_MOVE,fingerX,edge); Thread.sleep(350); settle();
                check(ui(() -> host.screen.isBusy()), "Auto-scroll keeps gesture active");
                check(ui(() -> host.scroll.getScrollY())>0, "Actual ScrollView scrolled");
                end(MotionEvent.ACTION_CANCEL);
                int y=ui(() -> host.scroll.getScrollY()); Thread.sleep(150); settle();
                check(ui(() -> host.scroll.getScrollY())==y, "Auto-scroll callback stopped");
                check(ui(() -> TabStore.writes)==0, "Cancelled auto-scroll preserves preferences");
            });
            test("detaching the screen cancels without persisting", () -> {
                prepare(11,"home","subscriptions","library","afterglow");
                start("home"); move("subscriptions",.8f);
                act(() -> host.content.removeAllViews());
                check(!ui(() -> host.screen.isBusy()), "Detached screen ends drag");
                check(ui(() -> host.layer.getChildCount())==0, "Detach removes ghost");
                check(ui(() -> TabStore.writes)==0, "Detach preserves saved order");
                event(MotionEvent.ACTION_CANCEL,fingerX,fingerY);
            });
            result.put("success",true);
        } catch (Throwable error) {
            try {
                result.put("success",false); result.put("failed_case",currentCase);
                StringWriter out=new StringWriter(); error.printStackTrace(new PrintWriter(out));
                result.put("error",out.toString());
            } catch (Exception ignored) {}
        }
        try {
            result.put("passed_cases",passed); result.put("assertions",assertions);
            result.put("sdk",android.os.Build.VERSION.SDK_INT);
            result.put("dispatch","Instrumentation.sendPointerSync through the real Android view hierarchy");
            try (FileWriter out=new FileWriter(new File(getTargetContext().getFilesDir(),"result.json"))) {out.write(result.toString(2));}
            Bundle output=new Bundle(); output.putString("stream",result.toString(2));
            finish(result.optBoolean("success")?Activity.RESULT_OK:Activity.RESULT_CANCELED,output);
        } catch (Exception error) {throw new RuntimeException(error);}
    }
}
