package app.morphe.extension.chmate;

import android.app.Activity;
import android.app.Application;
import android.content.ComponentCallbacks;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.WeakHashMap;

/** OEM folding-feature driven native layout selection. Never interrupts editing or media playback. */
final class FoldLayout {
    static final String KEY = "automaticFoldMode";
    private static final String MODE = "enableTabletHome2";
    private static final String HOME = "jp.syoboi.a2chMate.activity.HomeActivity";
    private static final String TABLET = "jp.syoboi.a2chMate.activity.TabletHomeActivity";
    private static final String THREAD = "jp.syoboi.a2chMate.activity.ResListActivity";
    private static final String BOARD = "jp.syoboi.a2chMate.activity.ThreadListActivity";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, ViewTreeObserver.OnGlobalLayoutListener> ACTIVITIES = new WeakHashMap<>();
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    private static boolean installed, switching;
    private static Uri pendingThread;
    private static Uri pendingBoard;
    private static int switchingTask;
    private static int transition;
    private static final Runnable CHECK = () -> evaluate(resumed.get());

    private FoldLayout() { }
    private static SharedPreferences nativePrefs(Context context) {
        return android.preference.PreferenceManager.getDefaultSharedPreferences(context);
    }
    private static boolean enabled() { return Haiagaru.automaticFoldMode(); }
    private static boolean browser(Activity a) {
        String name = a.getClass().getName();
        return HOME.equals(name) || TABLET.equals(name) || THREAD.equals(name) || BOARD.equals(name)
                || "jp.syoboi.a2chMate.activity.BoardActivity".equals(name);
    }
    private static void schedule() { MAIN.removeCallbacks(CHECK); MAIN.postDelayed(CHECK, 350); }

    static synchronized void install(Application app) {
        if (installed) return;
        installed = true;
        app.registerComponentCallbacks(new ComponentCallbacks() {
            @Override public void onConfigurationChanged(Configuration config) { schedule(); }
            @Override public void onLowMemory() { }
        });
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override public void onActivityCreated(Activity a, Bundle state) {
                if (!browser(a)) return;
                View root = a.getWindow().getDecorView();
                ViewTreeObserver.OnGlobalLayoutListener listener = FoldLayout::schedule;
                ACTIVITIES.put(a, listener); root.getViewTreeObserver().addOnGlobalLayoutListener(listener);
            }
            @Override public void onActivityResumed(Activity a) {
                resumed = new WeakReference<>(a);
                if (enabled() && browser(a)) FoldWindowTracker.start(a, FoldLayout::schedule);
                if (switching && a.getTaskId() == switchingTask
                        && (HOME.equals(a.getClass().getName()) || TABLET.equals(a.getClass().getName()))) {
                    switching = false;
                    Uri thread = pendingThread; pendingThread = null;
                    Uri board = pendingBoard; pendingBoard = null;
                    if ((thread != null || board != null) && enabled()) MAIN.post(() -> {
                        if (!a.isFinishing() && !a.isDestroyed()) a.startActivity(new Intent(Intent.ACTION_VIEW, thread)
                                .setData(thread != null ? thread : board)
                                .setClassName(a.getPackageName(), thread != null ? THREAD : BOARD));
                    });
                }
                schedule();
            }
            @Override public void onActivityPaused(Activity a) {
                if (resumed.get() == a) resumed.clear();
                ReadingPosition.saveActivity(a);
            }
            @Override public void onActivityDestroyed(Activity a) {
                FoldWindowTracker.stop(a);
                ViewTreeObserver.OnGlobalLayoutListener listener = ACTIVITIES.remove(a);
                if (listener != null && a.getWindow().getDecorView().getViewTreeObserver().isAlive())
                    a.getWindow().getDecorView().getViewTreeObserver().removeOnGlobalLayoutListener(listener);
                if (resumed.get() == a) resumed.clear();
            }
            @Override public void onActivityStarted(Activity a) {
                if (enabled() && browser(a)) FoldWindowTracker.start(a, FoldLayout::schedule);
            }
            @Override public void onActivityStopped(Activity a) { FoldWindowTracker.stop(a); }
            @Override public void onActivitySaveInstanceState(Activity a, Bundle state) { }
        });
    }

    static void settingsChanged() {
        if (!enabled()) FoldWindowTracker.stopAll();
        else { Activity a = resumed.get(); if (a != null && browser(a)) FoldWindowTracker.start(a, FoldLayout::schedule); }
        schedule();
    }

    private static void evaluate(Activity a) {
        if (!enabled() || switching || a == null || !browser(a) || a.isFinishing() || a.isDestroyed()) return;
        Boolean posture = FoldWindowTracker.tablet(a);
        if (posture == null) return;
        boolean desired = posture;
        boolean previous = nativePrefs(a).getBoolean(MODE, false);
        boolean tabletScreen = TABLET.equals(a.getClass().getName());
        boolean homeScreen = HOME.equals(a.getClass().getName());
        if (previous == desired && (!tabletScreen || desired) && (!homeScreen || !desired)) return;
        // Native reply and sign-in dialogs can share the browsing Activity.
        // Only defer/poll when a mode transition is actually needed.
        if (!a.hasWindowFocus() || a.getCurrentFocus() instanceof android.widget.EditText) {
            schedule(); return;
        }
        Uri thread = ReadingPosition.captureForLayout(a);
        if (thread == null && THREAD.equals(a.getClass().getName())) thread = a.getIntent().getData();
        Intent destination = new Intent().setClassName(a.getPackageName(), HOME);
        // Retain the active board when it is a standalone board list.
        Uri board = BOARD.equals(a.getClass().getName()) ? a.getIntent().getData() : null;
        nativePrefs(a).edit().putBoolean(MODE, desired).apply();
        switching = true; switchingTask = a.getTaskId(); pendingThread = thread; pendingBoard = board;
        final int token = ++transition;
        ArrayList<Activity> obsolete = new ArrayList<>();
        for (Activity old : ACTIVITIES.keySet()) if (old != null && old.getTaskId() == a.getTaskId()) obsolete.add(old);
        // Fresh HomeActivity is required; recreate() retains the old phone/tablet fragment tree.
        try {
            for (Activity old : obsolete) ReadingPosition.saveActivity(old);
            for (Activity old : obsolete) old.finish();
            a.startActivity(destination);
            MAIN.postDelayed(() -> {
                if (token != transition) return;
                switching = false; pendingThread = null; pendingBoard = null; schedule();
            }, 5000);
        } catch (RuntimeException error) {
            switching = false; pendingThread = null; pendingBoard = null;
            nativePrefs(a).edit().putBoolean(MODE, previous).apply();
            android.util.Log.w("HaiagaruFold", "Cannot change native layout", error);
        }
    }
}
