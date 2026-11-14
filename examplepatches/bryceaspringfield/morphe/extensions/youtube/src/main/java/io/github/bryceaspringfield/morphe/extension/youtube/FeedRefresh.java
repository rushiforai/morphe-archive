package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;

import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Filters apply when a feed item is built, so items already on screen keep showing after Morphe's keyword list or its
 * switches change. When the app returns from the settings with a changed list, the Home button is tapped: on Home,
 * YouTube reloads the feed, and the new items pass the filter.
 */
final class FeedRefresh {

    private static final String[] HOME = {"home", "inicio", "principal"};
    private static boolean registered;

    private FeedRefresh() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: feed refresh not registered", t);
        }
    }

    static View findHome(View v, int fromY) {
        if (v.isShown() && v.isClickable()) {
            CharSequence d = v.getContentDescription();
            if (d != null) {
                String s = d.toString().toLowerCase(Locale.ROOT).trim();
                int[] xy = new int[2];
                v.getLocationOnScreen(xy);
                for (String h : HOME) if (s.equals(h) && xy[1] >= fromY) return v;
            }
        }
        if (v instanceof ViewGroup g) {
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = findHome(g.getChildAt(i), fromY);
                if (r != null) return r;
            }
        }
        return null;
    }

    /** A finger drag from the upper to the lower part of the screen, as the pull that reloads a feed at its top. */
    static void pullDown(View decor) {
        long start = android.os.SystemClock.uptimeMillis();
        float x = decor.getWidth() / 2f, y0 = decor.getHeight() * 0.25f, y1 = decor.getHeight() * 0.65f;
        int steps = 16;
        for (int i = 0; i <= steps + 1; i++) {
            final int k = i;
            Utils.runOnMainThreadDelayed(() -> {
                long now = android.os.SystemClock.uptimeMillis();
                int action = k == 0 ? android.view.MotionEvent.ACTION_DOWN
                        : k > steps ? android.view.MotionEvent.ACTION_UP : android.view.MotionEvent.ACTION_MOVE;
                float y = y0 + (y1 - y0) * Math.min(k, steps) / steps;
                android.view.MotionEvent e = android.view.MotionEvent.obtain(start, now, action, x, y, 0);
                e.setSource(android.view.InputDevice.SOURCE_TOUCHSCREEN);
                decor.dispatchTouchEvent(e);
                e.recycle();
            }, k * 25L);
        }
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            try {
                // Only the main activity shows the feed; the settings screens resume too and must not use the change up.
                if (!a.getClass().getName().endsWith("MainActivity")) return;
                String used = MorpheKeywords.usedSignature;
                String now = MorpheKeywords.signature();
                Logger.printDebug(() -> "YouTube Extras: resumed, keyword list " + (used == null ? "not yet used" : used.equals(now) ? "unchanged" : "changed"));
                if (used == null || used.equals(now)) return;
                // The feed is rebuilt by the tap, and its items record the new signature as they are filtered.
                MorpheKeywords.usedSignature = now;
                View decor = a.getWindow().getDecorView();
                Utils.runOnMainThreadDelayed(() -> {
                    View home = findHome(decor, decor.getHeight() * 3 / 4);
                    if (home == null) {
                        MorpheKeywords.usedSignature = used;
                        return;
                    }
                    Logger.printDebug(() -> "YouTube Extras: keyword list changed, reloading the feed");
                    // A tap on the selected Home button scrolls to the top; a pull down from there reloads the feed.
                    home.performClick();
                    Utils.runOnMainThreadDelayed(() -> pullDown(decor), 900);
                }, 600);
            } catch (Throwable t) {
                Logger.printException(() -> "YouTube Extras: feed refresh failed", t);
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
