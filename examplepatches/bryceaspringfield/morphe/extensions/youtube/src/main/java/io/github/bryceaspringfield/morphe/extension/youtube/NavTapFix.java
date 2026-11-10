package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Bottom bar buttons which need two taps: the first tap after a feed scroll or fling is spent on the bar (it slides back
 * in) or on stopping the scroll, and the page does not switch. A tap on a bar button which leaves the button unselected
 * 350 ms later is repeated once. The buttons are found by their descriptions (English and Spanish) each time the window
 * lays out, at most every 300 ms.
 */
final class NavTapFix {

    private static final String[] BUTTONS = {"home", "inicio", "shorts", "subscriptions", "suscripciones", "you", "tú", "library", "biblioteca"};
    private static final java.util.Set<View> HOOKED = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static final java.util.Set<View> DECORS = java.util.Collections.newSetFromMap(new java.util.WeakHashMap<>());
    private static boolean registered;
    private static long lastScan;

    private NavTapFix() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: nav tap fix not registered", t);
        }
    }

    private static String desc(View v) {
        CharSequence d = v.getContentDescription();
        return d == null ? "" : d.toString().toLowerCase(Locale.ROOT).trim();
    }

    private static boolean isButton(View v) {
        String d = desc(v);
        for (String b : BUTTONS) if (d.equals(b)) return true;
        return false;
    }

    private static void scan(View v, int bottomHalfFromY) {
        int[] xy = new int[2];
        v.getLocationOnScreen(xy);
        if (v.isClickable() && !HOOKED.contains(v) && xy[1] >= bottomHalfFromY && isButton(v)) {
            HOOKED.add(v);
            v.setOnTouchListener(NavTapFix::onTouch);
        }
        if (v instanceof ViewGroup g) for (int i = 0; i < g.getChildCount(); i++) scan(g.getChildAt(i), bottomHalfFromY);
    }

    private static boolean onTouch(View v, MotionEvent e) {
        if (XSettings.FIX_NAVIGATION_TAPS.get() && e.getActionMasked() == MotionEvent.ACTION_UP
                && e.getEventTime() - e.getDownTime() < 400 && !v.isSelected()) {
            Utils.runOnMainThreadDelayed(() -> {
                if (!v.isSelected() && v.isShown()) {
                    Logger.printDebug(() -> "YouTube Extras: bottom bar tap repeated for " + desc(v));
                    v.performClick();
                }
            }, 350);
        }
        // The touch is handled by the button itself as before.
        return false;
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            try {
                View decor = a.getWindow().getDecorView();
                if (!DECORS.add(decor)) return;
                decor.getViewTreeObserver().addOnGlobalLayoutListener(() -> {
                    if (!XSettings.FIX_NAVIGATION_TAPS.get()) return;
                    long now = android.os.SystemClock.uptimeMillis();
                    if (now - lastScan < 300) return;
                    lastScan = now;
                    scan(decor, decor.getHeight() * 3 / 4);
                });
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: nav tap fix hook failed", t);
            }
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityPaused(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
