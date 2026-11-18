package nl.johninnl.wuplay.test;

import android.app.Activity;
import android.app.Instrumentation;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ListView;
import java.lang.reflect.*;
import java.util.*;
import java.util.concurrent.*;

/** Exercise actual Activity save state, worker interleaving and focus on Android TV. */
final class WuplayPickerProbe {
    private static Object field(Object value, String name) throws Exception {
        Field f = value.getClass().getDeclaredField(name); f.setAccessible(true); return f.get(value);
    }
    private static Object staticField(Class<?> type, String name) throws Exception {
        Field f = type.getDeclaredField(name); f.setAccessible(true); return f.get(null);
    }
    private static void onUi(Instrumentation test, Runnable action) {
        Throwable[] failure = {null};
        test.runOnMainSync(() -> { try { action.run(); } catch (Throwable error) { failure[0] = error; } });
        if (failure[0] != null) throw new AssertionError("UI assertion failed", failure[0]);
    }
    private static void check(boolean value, String message) { if (!value) throw new AssertionError(message); }
    private static void block(CountDownLatch latch) {
        try { check(latch.await(15, TimeUnit.SECONDS), "Worker gate timed out"); }
        catch (InterruptedException e) { throw new AssertionError(e); }
    }
    private static void loaded(Instrumentation test, Activity activity) throws Exception {
        long deadline = System.currentTimeMillis() + 5000;
        boolean[] ready = {false};
        while (System.currentTimeMillis() < deadline) {
            onUi(test, () -> { try { ready[0] = field(activity, "snapshot") != null; } catch (Exception e) { throw new AssertionError(e); } });
            if (ready[0]) { test.waitForIdleSync(); return; }
            Thread.sleep(20);
        }
        throw new AssertionError("Picker did not load");
    }
    private static Activity recreate(Instrumentation test, Activity activity) {
        Instrumentation.ActivityMonitor monitor = test.addMonitor(activity.getClass().getName(), null, false);
        onUi(test, activity::recreate);
        Activity result = test.waitForMonitorWithTimeout(monitor, 5000); test.removeMonitor(monitor);
        check(result != null && result != activity, "Activity was not recreated"); return result;
    }
    static String run(Instrumentation test) throws Exception {
        Context context = test.getTargetContext();
        ClassLoader loader = context.getClassLoader();
        Class<?> nativeClass = loader.loadClass("nl.johninnl.wuplay.NativeCatalogs");
        Constructor<?> ctor = nativeClass.getDeclaredConstructor(android.app.Application.class); ctor.setAccessible(true);
        Object api = ctor.newInstance(context.getApplicationContext());
        Method method = nativeClass.getDeclaredMethod("snapshot"); method.setAccessible(true);
        List<?> definitions = (List<?>) field(method.invoke(api), "definitions");
        check(definitions.size() >= 2, "Fixture needs two Home catalogs");
        String savedKey = (String) field(definitions.get(1), "key");
        SharedPreferences prefs = context.getSharedPreferences("morphe_wuplay_tv_channels", 0);
        Set<String> original = new HashSet<>(prefs.getStringSet("selected", Collections.emptySet()));
        ExecutorService worker = (ExecutorService) staticField(loader.loadClass("nl.johninnl.wuplay.CatalogChannels"), "WORKER");
        // Keep the foreground timer from publishing temporary test selections.
        java.util.concurrent.atomic.AtomicBoolean queued = (java.util.concurrent.atomic.AtomicBoolean) staticField(loader.loadClass("nl.johninnl.wuplay.CatalogChannels"), "QUEUED");
        boolean previouslyQueued = queued.getAndSet(true);
        CountDownLatch firstGate = new CountDownLatch(1), laterGate = new CountDownLatch(1);
        Activity activity = null;
        try {
            prefs.edit().putStringSet("selected", new HashSet<>(Arrays.asList(savedKey))).commit();
            worker.execute(() -> block(firstGate));
            activity = test.startActivitySync(new Intent().setClassName(context, "nl.johninnl.wuplay.CatalogSettingsActivity").addFlags(Intent.FLAG_ACTIVITY_NEW_TASK));
            Activity first = activity; Bundle state = new Bundle();
            onUi(test, () -> test.callActivityOnSaveInstanceState(first, state));
            check(!state.containsKey("draft"), "Loading state recorded an empty draft over saved selections");
            activity = recreate(test, activity);
            // A second barrier lets an obsolete duplicate load arrive after a user edits the list.
            worker.execute(() -> block(laterGate));
            Activity current = activity;
            onUi(test, () -> {
                try { Button done = (Button) field(current, "done"); done.requestFocus(); done.performClick(); done.performClick(); }
                catch (Exception e) { throw new AssertionError(e); }
            });
            firstGate.countDown(); loaded(test, activity);
            onUi(test, () -> {
                try {
                    ListView list = (ListView) field(current, "list");
                    check(list.isItemChecked(1), "Loading recreation lost persisted selection");
                    check(((Button) field(current, "done")).hasFocus(), "Load completion stole Done focus");
                    list.setItemChecked(0, true);
                } catch (Exception e) { throw new AssertionError(e); }
            });
            laterGate.countDown(); CountDownLatch drained = new CountDownLatch(1); worker.execute(drained::countDown);
            check(drained.await(10, TimeUnit.SECONDS), "Worker did not drain"); test.waitForIdleSync();
            onUi(test, () -> {
                try { check(((ListView) field(current, "list")).isItemChecked(0), "Duplicate load erased draft edit"); }
                catch (Exception e) { throw new AssertionError(e); }
            });
            activity = recreate(test, activity); loaded(test, activity); Activity restored = activity;
            onUi(test, () -> {
                try {
                    ListView list = (ListView) field(restored, "list");
                    check(list.isItemChecked(0) && list.isItemChecked(1), "Recreation lost draft checks");
                    check(((Button) field(restored, "done")).hasFocus(), "Recreation lost action focus");
                } catch (Exception e) { throw new AssertionError(e); }
            });
            return "PASS: loading recreation preserves saved selection; single load preserves edits; async load and recreation preserve Done focus and draft";
        } finally {
            firstGate.countDown(); laterGate.countDown();
            if (activity != null) { Activity close = activity; onUi(test, close::finish); }
            prefs.edit().putStringSet("selected", original).commit();
            queued.set(previouslyQueued);
        }
    }
}
