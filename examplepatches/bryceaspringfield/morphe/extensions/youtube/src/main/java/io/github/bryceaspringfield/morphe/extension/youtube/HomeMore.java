package io.github.bryceaspringfield.morphe.extension.youtube;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.util.LinkedHashMap;
import java.util.Map;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.youtube.shared.NavigationBar;

/**
 * Keeps Home going: Home stops loading after a few pages (fewer still once the filters hide items), so when its list
 * stays at its end with no item added for a moment, Home is reloaded (the Home button scrolls to the top, a pull down
 * reloads), and the videos shown before that reload are hidden, leaving a new batch of videos not yet shown. A reload
 * whose batch shows no new video counts as empty; after 3 in a row the feature waits for the next manual scroll to the
 * end of a non-empty list.
 */
final class HomeMore {

    private static final long CHECK_MS = 700;
    /** The list must sit at its end this long, with no Home item read, before a new batch is asked for. */
    private static final long AT_END_MS = 2500;
    private static final int MAX_EMPTY_BATCHES = 3;
    private static final int MAX_SEEN = 5000;

    private static boolean registered;
    private static Activity resumed;
    /** The running check loop's number; a loop whose number is no longer current stops. */
    private static int loop;
    private static int checks;
    /** Video ID to the uptime it was first shown on Home. */
    private static final Map<String, Long> SEEN = new LinkedHashMap<>(256, 0.75f, false) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Long> e) {
            return size() > MAX_SEEN;
        }
    };
    /** Uptime of the last reload asked for, or 0 before the first. */
    private static long batchAt;
    private static long lastItemAt;
    private static long atEndSince;
    private static int shownSinceBatch;
    private static int emptyBatches;

    private HomeMore() {
    }

    static synchronized void register() {
        if (registered) return;
        registered = true;
        try {
            ((Application) Utils.getContext().getApplicationContext()).registerActivityLifecycleCallbacks(new Callbacks());
        } catch (Throwable t) {
            Logger.printException(() -> "YouTube Extras: Home batches not registered", t);
        }
    }

    /** The main activity while it is resumed, else null. */
    static Activity resumedMain() {
        return resumed;
    }

    /** Whether the last feed item the filter read, in any place, was a Home item. */
    private static volatile boolean lastWasHome;

    /** Every feed item the filter reads, shown or hidden, with whether it is on Home. */
    static synchronized void onFeedItem(boolean home) {
        lastWasHome = home;
        if (home) lastItemAt = SystemClock.uptimeMillis();
    }

    /** A Home video the filter leaves on screen. */
    static synchronized void onShown(String videoId) {
        if (videoId == null) return;
        if (!SEEN.containsKey(videoId)) {
            SEEN.put(videoId, SystemClock.uptimeMillis());
            if (batchAt > 0) {
                shownSinceBatch++;
                emptyBatches = 0;
            }
        }
    }

    /** Whether a Home video was shown before the last reload this feature asked for (hidden after it). */
    static synchronized boolean shownBefore(String videoId) {
        if (videoId == null || batchAt == 0 || !XSettings.HOME_MORE.get()) return false;
        Long first = SEEN.get(videoId);
        return first != null && first < batchAt;
    }

    private static void check(int mine) {
        Activity a = resumed;
        if (a == null || mine != loop) return;
        Utils.runOnMainThreadDelayed(() -> check(mine), CHECK_MS);
        if (!XSettings.HOME_MORE.get()) return;
        try {
            NavigationBar.NavigationButton tab = NavigationBar.NavigationButton.getSelectedNavigationButton();
            View decor = a.getWindow().getDecorView();
            View list = feedList(decor, decor.getHeight() / 2);
            long now = SystemClock.uptimeMillis();
            // At the end: the list cannot scroll further down (a list shorter than the screen counts too).
            boolean atEnd = list != null && !list.canScrollVertically(1);
            if (XSettings.DEBUG.get() && ++checks % 10 == 0) {
                final View l = list;
                Logger.printDebug(() -> "YouTube Extras: Home batch check: tab " + tab + ", list "
                        + (l == null ? "none" : l.getClass().getSimpleName() + " h" + l.getHeight()) + ", at end " + atEnd
                        + ", last item " + (now - lastItemAt) + " ms ago, shown " + SEEN.size());
            }
            // A tab the bar cannot name (null) passes when the last feed item read was a Home item.
            if (tab != null ? tab != NavigationBar.NavigationButton.HOME : !lastWasHome) {
                atEndSince = 0;
                return;
            }
            if (!atEnd) {
                atEndSince = 0;
                return;
            }
            if (atEndSince == 0) atEndSince = now;
            if (now - atEndSince < AT_END_MS || now - lastItemAt < AT_END_MS) return;
            if (batchAt > 0 && shownSinceBatch == 0) {
                emptyBatches++;
                if (emptyBatches >= MAX_EMPTY_BATCHES) {
                    if (emptyBatches == MAX_EMPTY_BATCHES) Logger.printDebug(() -> "YouTube Extras: Home batches stop, " + MAX_EMPTY_BATCHES + " empty in a row");
                    return;
                }
            }
            // The Home button scrolls Home to its top; at the end of Home the bar is often hidden, and the list is then
            // scrolled to its top directly. Either way a pull down at the top reloads Home.
            View home = FeedRefresh.findHome(decor, decor.getHeight() * 3 / 4);
            synchronized (HomeMore.class) {
                batchAt = now;
                shownSinceBatch = 0;
            }
            atEndSince = 0;
            Logger.printDebug(() -> "YouTube Extras: Home ended, loading a new batch (" + SEEN.size() + " videos shown so far, "
                    + (home != null ? "Home button" : "list scrolled to top") + ")");
            if (home != null) {
                home.performClick();
                Utils.runOnMainThreadDelayed(() -> FeedRefresh.pullDown(decor), 900);
            } else {
                // A list scrolled to its top this way leaves the top bar collapsed, and a first pull only opens the
                // bar (2026-11-13: 3 such reloads brought no new video, while manual pulls brought 9 to 21 each).
                // The Home button, shown again with the bar, then does what it does above.
                toTop(list);
                Utils.runOnMainThreadDelayed(() -> {
                    View h = FeedRefresh.findHome(decor, decor.getHeight() * 3 / 4);
                    if (h != null) h.performClick();
                    else FeedRefresh.pullDown(decor);
                }, 500);
                Utils.runOnMainThreadDelayed(() -> FeedRefresh.pullDown(decor), 1500);
            }
        } catch (Throwable t) {
            Logger.printDebug(() -> "YouTube Extras: Home batch check failed: " + t);
        }
    }

    /** Scrolls a list to its top in screen-sized steps (a RecyclerView lays out the rows it passes). */
    private static void toTop(View list) {
        int step = Math.max(list.getHeight(), 1000);
        for (int i = 0; i < 400 && list.canScrollVertically(-1); i++) list.scrollBy(0, -step);
    }

    /** The tallest shown vertical RecyclerView of the window, taller than minHeight: the feed. */
    private static View feedList(View v, int minHeight) {
        View best = null;
        if (!v.isShown()) return null;
        if (v instanceof ViewGroup g) {
            // A list too short to scroll counts too: a Home of 4 videos is at its end from the start.
            if (g.getClass().getName().endsWith("RecyclerView") && g.getHeight() >= minHeight) {
                best = g;
            }
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = feedList(g.getChildAt(i), minHeight);
                if (r != null && (best == null || r.getHeight() > best.getHeight())) best = r;
            }
        }
        return best;
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity a) {
            if (!a.getClass().getName().endsWith("MainActivity")) return;
            resumed = a;
            final int mine = ++loop;
            Utils.runOnMainThreadDelayed(() -> check(mine), CHECK_MS);
        }

        @Override
        public void onActivityPaused(Activity a) {
            if (resumed == a) resumed = null;
        }

        @Override public void onActivityCreated(Activity a, Bundle b) {}
        @Override public void onActivityStarted(Activity a) {}
        @Override public void onActivityStopped(Activity a) {}
        @Override public void onActivitySaveInstanceState(Activity a, Bundle b) {}
        @Override public void onActivityDestroyed(Activity a) {}
    }
}
