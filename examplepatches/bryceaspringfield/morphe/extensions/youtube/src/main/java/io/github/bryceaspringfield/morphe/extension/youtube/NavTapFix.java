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

    private static final String[] BUTTONS = {"home", "inicio", "principal", "shorts", "subscriptions", "suscripciones", "you", "tú", "library", "biblioteca"};
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

    /** Whether the button was selected when the finger went down, and the page list shown then. */
    private static boolean downSelected;
    private static java.lang.ref.WeakReference<View> downPage = new java.lang.ref.WeakReference<>(null);

    private static boolean onTouch(View v, MotionEvent e) {
        if (!XSettings.FIX_NAVIGATION_TAPS.get()) return false;
        if (e.getActionMasked() == MotionEvent.ACTION_DOWN) {
            downSelected = v.isSelected();
            downPage = new java.lang.ref.WeakReference<>(page(v.getRootView()));
        } else if (e.getActionMasked() == MotionEvent.ACTION_UP && e.getEventTime() - e.getDownTime() < 400 && !downSelected) {
            final View before = downPage.get();
            Utils.runOnMainThreadDelayed(() -> {
                if (!v.isShown()) return;
                // Two failures seen: the button stays unselected, or (2026-11-11, with the miniplayer open) the button
                // turns selected while the old page stays on screen. Either way the page list is the same view.
                View now = page(v.getRootView());
                boolean samePage = before != null && now == before && before.isShown();
                if (!v.isSelected() || samePage) {
                    Logger.printDebug(() -> "YouTube Extras: bottom bar tap repeated for " + desc(v)
                            + (samePage ? " (same page shown)" : " (button not selected)"));
                    v.performClick();
                }
            }, 400);
        }
        // The touch is handled by the button itself as before.
        return false;
    }

    /** The page's list: the largest shown RecyclerView above the bottom bar. */
    private static View page(View root) {
        View[] best = {null};
        int[] area = {0};
        findLists(root, best, area);
        return best[0];
    }

    private static void findLists(View v, View[] best, int[] area) {
        if (!v.isShown()) return;
        if (v.getClass().getName().endsWith("RecyclerView")) {
            int a = v.getWidth() * v.getHeight();
            if (a > area[0]) {
                area[0] = a;
                best[0] = v;
            }
            return;
        }
        if (v instanceof ViewGroup g) for (int i = 0; i < g.getChildCount(); i++) findLists(g.getChildAt(i), best, area);
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
