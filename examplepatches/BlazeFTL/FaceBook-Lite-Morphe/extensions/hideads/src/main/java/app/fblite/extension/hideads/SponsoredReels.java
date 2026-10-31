package app.fblite.extension.hideads;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.WeakHashMap;

/**
 * Skips sponsored reels. The Reels tab is a vertical, snapping FbLiteRecyclerView (X.0zb) in
 * MainActivity whose items (X.0z8) each hold a reel's component tree (item.A0B.A03).
 *
 * A sponsored reel has at least two text components (X.0hW) with flag X.0gp.A32 set; organic reels
 * have at most one, whatever the language of the "Sponsored" label. Like the feed, the list is updated
 * by index, so items are not removed: they are made unsnappable (X.0z8.A0N, from X.0gp.A2z), which the
 * pager's snap target search (X.0yb.A00) skips, and the pager moves on when one is current.
 *
 * Guards against skipping organic reels: the unsnappable flags are undone when an item turns out organic
 * (items are rebound by the server's index updates), a run of two or more neighbouring detections or a
 * list where far too many reels look sponsored is treated as a false detection, and the pager is only moved
 * when the same reel has been current in two scans in a row, and never past the next organic reel.
 *
 * This scan is the fallback. The main way sponsored reels are dealt with is {@link ReelAds}: it collapses them when
 * the server's data for them is decoded (before the pager has laid them out), so a swipe goes straight from the reel
 * before the ad to the reel after it. This scan learns which container is the Reels list for it, makes whatever
 * got through unsnappable, and only when a sponsored reel is on screen and nothing has moved for a while moves the
 * pager on. With Debug logging on, every decision is logged.
 *
 * Names are for Facebook Lite 530.0.0.8.106. Any reflection error turns this off.
 */
public final class SponsoredReels {
    private static final long SCAN_INTERVAL_MS = 500;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Component tree -> last verdict, only to log changes. */
    private static final WeakHashMap<Object, Boolean> SPONSORED = new WeakHashMap<>();
    /** Item -> its own unsnappable value before this class changed it, and tree -> its A2z. */
    private static final WeakHashMap<Object, Boolean> ORIGINAL_SNAPPABLE = new WeakHashMap<>();
    private static final WeakHashMap<Object, Boolean> ORIGINAL_STOPS = new WeakHashMap<>();
    /** More than this share of a list looking sponsored means the detection is wrong for it (about 15% is real). */
    private static final int MAX_SPONSORED_PERCENT = 35;
    private static final int MIN_ITEMS_FOR_SHARE = 8;

    private static Activity resumed;
    private static Activity front;
    private static boolean disabled;
    private static String lastDetected = "";
    private static int lastLoggedCurrent = -2;
    private static long lastLoggedCurrentTime;
    private static long lastSkip;
    private static int lastCurrent = -2;
    private static int lastCount = -1;
    private static long lastChange;
    private static long lastSizeChange;
    private static long lastUnverifiedLog;
    private static Object lastCurrentTree;
    private static int previousCurrent = -2;
    private static long lastProgrammatic;
    private static int failures;
    private static Class<?> component, pagerClass, textClass;
    private static Field a32, a2z;
    private static Method childList;

    private SponsoredReels() {
    }

    /** Called at the start of Application.attachBaseContext. */
    public static void install(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    AdLog.init(activity.getApplicationContext());
                    front = activity;
                    if (!activity.getClass().getName().equals("com.facebook.lite.MainActivity")) {
                        // Other screens are only looked at for debug logging.
                        AdLog.log("ads", "ACTIVITY " + activity.getClass().getName() + " in front");
                        resumed = null;
                        MAIN.removeCallbacks(SCAN);
                        MAIN.postDelayed(SCAN, SCAN_INTERVAL_MS);
                        return;
                    }
                    AdLog.log("ads", "ACTIVITY MainActivity in front");
                    resumed = activity;
                    MAIN.removeCallbacks(SCAN);
                    MAIN.postDelayed(SCAN, SCAN_INTERVAL_MS);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (front == activity) front = null;
                    if (resumed == activity) resumed = null;
                    if (front == null) MAIN.removeCallbacks(SCAN);
                }

                @Override
                public void onActivityCreated(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityStarted(Activity activity) {
                }

                @Override
                public void onActivityStopped(Activity activity) {
                }

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle state) {
                }

                @Override
                public void onActivityDestroyed(Activity activity) {
                }
            });
        } catch (Throwable t) {
            Log.e(OriginalClass.TAG, "Could not install sponsored reels", t);
        }
    }

    private static final Runnable SCAN = new Runnable() {
        @Override
        public void run() {
            Activity activity = front;
            if (activity == null) return;
            boolean debug = AdLog.enabled();
            if (resumed != null && !disabled) {
                try {
                    if (component == null) resolve(activity.getClassLoader());
                    scan(activity.getWindow().getDecorView());
                    failures = 0;
                } catch (Throwable t) {
                    // A list changing under the scan is normal; only repeated failures switch this off.
                    failures++;
                    AdLog.log("ads", "Reels scan failed (" + failures + "/5)", t);
                    if (failures >= 5) {
                        disabled = true;
                        Log.e(OriginalClass.TAG, "Skipping sponsored reels failed, turning it off", t);
                    }
                }
            }
            if (debug) AdTrace.onTick(activity);
            if (resumed == null && !debug) return;
            MAIN.postDelayed(this, SCAN_INTERVAL_MS);
        }
    };

    /** Two extra scans soon after a reel was collapsed at decode time (the first marks, the second can skip). */
    static void nudge() {
        MAIN.removeCallbacks(NUDGE_FIRST);
        MAIN.removeCallbacks(NUDGE_SECOND);
        MAIN.postDelayed(NUDGE_FIRST, 40);
        MAIN.postDelayed(NUDGE_SECOND, 330);
    }

    private static final Runnable NUDGE_FIRST = new Runnable() {
        @Override
        public void run() {
            scanOnce();
        }
    };

    private static final Runnable NUDGE_SECOND = new Runnable() {
        @Override
        public void run() {
            scanOnce();
        }
    };

    private static void scanOnce() {
        Activity activity = front;
        if (activity == null || resumed == null || disabled) return;
        try {
            if (component == null) resolve(activity.getClassLoader());
            scan(activity.getWindow().getDecorView());
        } catch (Throwable t) {
            AdLog.log("ads", "Extra reels scan failed", t);
        }
    }

    private static void scan(View view) throws Exception {
        if (view.getVisibility() != View.VISIBLE) return;
        if (pagerClass.isInstance(view)) {
            AdTrace.onPager(view);
            AdVideos.scan(view);
            skipSponsored(view);
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) scan(group.getChildAt(i));
        }
    }

    private static void skipSponsored(View pager) throws Exception {
        // Reels: vertical and snapping. The feed's lists do not snap.
        if ((Boolean) pagerClass.getMethod("AQS").invoke(pager)) return;
        Object snap = field(pager, pagerClass, "A07");
        Object handler = field(pager, pagerClass, "A08");
        Object layout = field(pager, pagerClass, "A05");
        if (snap == null || handler == null || layout == null) return;
        if ((Integer) field(snap, snap.getClass(), "A02") == 0) return;

        List<?> items = (List<?>) field(layout, layout.getClass(), "A0E");
        if (items == null) return;
        int appCurrent = (Integer) field(layout, layout.getClass(), "A03");
        // The app's own "current" index is not kept up to date when the server reorders the list while a reel is
        // watched (seen: index 18 became an ad while the viewer was on the reel now at 16, and a skip from 18 moved the
        // pager over two real reels). The reel on screen is the item of the most visible child view.
        int shown = shownIndex(pager, items.size());
        int current = shown >= 0 ? shown : appCurrent;
        if (shown >= 0 && shown != appCurrent && AdLog.enabled() && SystemClock.uptimeMillis() - lastDesyncLog > 1500) {
            lastDesyncLog = SystemClock.uptimeMillis();
            AdLog.log("reels", "DESYNC: the app says current " + appCurrent + ", the reel on screen is item " + shown + " (items " + items.size() + ")");
        }
        Marking marking = markUnsnappable(items, current);
        // The parent of the items' trees is the Reels list's container; ReelAds filters it as the server fills it.
        ReelAds.learn(pager, marking.trees);
        // The snap handler searches its own item list, which may hold other item objects.
        Object snapItems = field(snap, snap.getClass(), "A04");
        if (snapItems != items && snapItems instanceof List) markUnsnappable((List<?>) snapItems, -1);

        long now = SystemClock.uptimeMillis();
        if (AdLog.enabled()) logCurrent(items, snapItems, current, marking, now);

        // Only act when nothing has moved for a while: the same reel is current, the item at that index holds the
        // same tree, the list has not grown or shifted (the app loads reels, and ads, while one is watched), and
        // the pager is idle (no finger down, no animation). Acting earlier scrolled the pager on its own.
        Object currentTree = current >= 0 && current < items.size() ? treeAt(items, current) : null;
        if (items.size() != lastCount) {
            lastCount = items.size();
            lastChange = now;
            lastSizeChange = now;
        }
        if (currentTree != lastCurrentTree) {
            lastCurrentTree = currentTree;
            lastChange = now;
        }
        if (current != lastCurrent) {
            previousCurrent = lastCurrent;
            lastChange = now;
        }
        lastCurrent = current;
        if (scrollState(pager) != 0) lastChange = now;
        // A reel collapsed by ReelAds is a blank page: nothing to watch, so no reason to wait as long as for a reel
        // the scan found on its own.
        boolean settled = now - lastSizeChange >= SETTLE_MS
                && now - lastChange >= (ReelAds.isCollapsed(currentTree) ? SETTLE_COLLAPSED_MS : SETTLE_MS);
        if (!marking.currentSponsored || !settled || now - lastSkip <= 900) return;
        // The reel on screen must be proven by its own view, and agree with the app's index. A stale app index after
        // the server inserted an ad right behind the reel being watched made this scroll over a real reel.
        if (shown < 0 || shown != appCurrent) {
            if (AdLog.enabled() && now - lastUnverifiedLog > 1500) {
                lastUnverifiedLog = now;
                AdLog.log("reels", "SKIP refused: reel on screen not verified (view says " + shown + ", app says " + appCurrent + ", items " + items.size() + ")");
            }
            return;
        }

        // Move by exactly one reel, in the direction the user came from. Sponsored reels are never next to each
        // other here (neighbouring detections are dropped), so the reel beside this one is an organic one. The
        // snap search (X.0yb.A00) is not used: its result is in the snap handler's list, and a mismatch with this
        // list moved the pager over real reels.
        int direction = previousCurrent >= 0 && previousCurrent > current ? -1 : 1;
        int target = current + direction;
        if (target < 0 || target >= items.size()) {
            AdLog.log("reels", "SKIP waiting: sponsored reel " + current + " is current, nothing at " + target + " yet (items " + items.size() + ")");
            return;
        }
        if (marking.sponsored[target]) {
            AdLog.log("reels", "SKIP refused: reel " + target + " is sponsored too (current " + current + ")");
            return;
        }
        Field snappable = items.get(target).getClass().getDeclaredField("A0N");
        snappable.setAccessible(true);
        if (!snappable.getBoolean(items.get(target))) {
            AdLog.log("reels", "SKIP refused: reel " + target + " is not snappable itself (current " + current + ")");
            return;
        }
        // For the log only: where the app's own snap search would go.
        int appNext = -1;
        if (AdLog.enabled()) {
            try {
                Method nextSnap = snap.getClass().getMethod("A00", pager.getClass().getClassLoader().loadClass("X.0yV"), int.class, int.class);
                appNext = (Integer) nextSnap.invoke(null, snapItems, current + 1, 1);
            } catch (Throwable ignored) {
            }
        }
        AdLog.log("reels", "SKIP sponsored reel " + current + " -> " + target + " (direction " + direction + ", previous current "
                + previousCurrent + ", app snap search " + appNext + ", items " + items.size() + ")");
        handler.getClass().getMethod("A04", int.class).invoke(handler, target);
        lastSkip = now;
        lastProgrammatic = now;
    }

    private static final long SETTLE_MS = 1100;
    private static final long SETTLE_COLLAPSED_MS = 250;
    private static long lastDesyncLog;

    /** The list index of the item whose view fills most of the list (at least 55% of it), or -1. */
    private static int shownIndex(View pager, int count) {
        try {
            if (!(pager instanceof android.view.ViewGroup)) return -1;
            android.view.ViewGroup group = (android.view.ViewGroup) pager;
            int height = pager.getHeight();
            View best = null;
            int bestVisible = 0;
            for (int i = 0; i < group.getChildCount(); i++) {
                View child = group.getChildAt(i);
                int visible = Math.min(child.getBottom(), height) - Math.max(child.getTop(), 0);
                if (visible > bestVisible) {
                    bestVisible = visible;
                    best = child;
                }
            }
            if (best == null || bestVisible < height * 0.55f) return -1;
            int position = (Integer) pager.getClass().getMethod("getChildAdapterPosition", View.class).invoke(pager, best);
            return position >= 0 && position < count ? position : -1;
        } catch (Throwable t) {
            return -1;
        }
    }

    private static Object treeAt(List<?> items, int index) throws Exception {
        Object item = items.get(index);
        Object wrapper = field(item, item.getClass(), "A0B");
        return wrapper == null ? null : field(wrapper, wrapper.getClass(), "A03");
    }

    /** RecyclerView.getScrollState: 0 idle, 1 dragging, 2 settling. Unknown counts as idle. */
    private static int scrollState(View pager) {
        try {
            return (Integer) pager.getClass().getMethod("getScrollState").invoke(pager);
        } catch (Throwable t) {
            return 0;
        }
    }

    private static final class Marking {
        boolean currentSponsored;
        /** The first index after current that is not sponsored, or -1. */
        int nextOrganic = -1;
        /** Per index: counted as sponsored (after the neighbour and share guards). */
        boolean[] sponsored = new boolean[0];
        boolean[] detected = new boolean[0];
        boolean unreliable;
        Object[] trees = new Object[0];
    }

    /**
     * Makes sponsored items unsnappable (and, in hide mode, hidden with height 0) and gives every other item
     * back what it had. A detection counts only when its neighbours are not detected too (reel ads are not
     * served back to back), and not when most of the list is detected.
     */
    private static Marking markUnsnappable(List<?> items, int current) throws Exception {
        int count = items.size();
        boolean[] detected = new boolean[count];
        boolean[] certain = new boolean[count];
        Object[] trees = new Object[count];
        int detectedCount = 0;
        for (int i = 0; i < count; i++) {
            Object item = items.get(i);
            Object wrapper = field(item, item.getClass(), "A0B");
            trees[i] = wrapper == null ? null : field(wrapper, wrapper.getClass(), "A03");
            certain[i] = AdVideos.isAdTree(trees[i]);
            detected[i] = certain[i] || (trees[i] != null && isSponsored(trees[i], i));
            if (detected[i]) detectedCount++;
        }
        boolean unreliable = count >= MIN_ITEMS_FOR_SHARE && detectedCount * 100 / count > MAX_SPONSORED_PERCENT;
        if (unreliable && current >= 0) AdLog.log("reels", "Detection unreliable: " + detectedCount + " of " + count + " look sponsored, skipping nothing");

        Marking marking = new Marking();
        marking.detected = detected;
        marking.trees = trees;
        marking.unreliable = unreliable;
        marking.sponsored = new boolean[count];
        for (int i = 0; i < count; i++) {
            // An ad video (its props say "adid") is certain; the text rule must pass the neighbour and share guards.
            boolean sponsored = certain[i] || (detected[i] && !unreliable
                    && !(i > 0 && detected[i - 1]) && !(i < count - 1 && detected[i + 1]));
            marking.sponsored[i] = sponsored;
            if (detected[i] && !sponsored && current >= 0 && AdLog.enabled()) {
                AdLog.log("reels", "Detection at " + i + " ignored (" + (unreliable ? "too many in list" : "neighbour also detected") + ")");
            }
            Object item = items.get(i);
            if (sponsored) {
                Field snappable = item.getClass().getDeclaredField("A0N");
                snappable.setAccessible(true);
                if (!ORIGINAL_SNAPPABLE.containsKey(item)) ORIGINAL_SNAPPABLE.put(item, snappable.getBoolean(item));
                if (!ORIGINAL_STOPS.containsKey(trees[i])) ORIGINAL_STOPS.put(trees[i], ReelAds.stopsBefore(trees[i], a2z.getBoolean(trees[i])));
                snappable.setBoolean(item, false);
                a2z.setBoolean(trees[i], false);
                if (i == current) marking.currentSponsored = true;
            } else {
                restore(item, trees[i]);
                if (current >= 0 && i > current && marking.nextOrganic < 0) marking.nextOrganic = i;
            }
        }
        return marking;
    }

    /** Debug: logs each change of the current reel, and any change by more than one reel, with what the list looked like. */
    private static void logCurrent(List<?> items, Object snapItems, int current, Marking marking, long now) throws Exception {
        StringBuilder flags = new StringBuilder();
        for (int i = 0; i < items.size(); i++) flags.append(marking.sponsored[i] ? 'S' : marking.detected[i] ? 's' : '.');
        String detectedNow = items.size() + ":" + flags;
        if (current != lastLoggedCurrent) {
            int step = lastLoggedCurrent < 0 ? 0 : current - lastLoggedCurrent;
            boolean programmatic = now - lastProgrammatic < 1500;
            AdLog.log("reels", (Math.abs(step) > 1 ? "JUMP " : "INDEX ") + lastLoggedCurrent + " -> " + current + " (" + (now - lastLoggedCurrentTime)
                    + " ms after the last change, " + (programmatic ? "after our skip" : "by the user or the app") + ") items=" + items.size()
                    + " list=" + flags + " (S sponsored, s detected but ignored) snapItems=" + (snapItems == items ? "same list" : snapItems instanceof List ? ((List<?>) snapItems).size() + " items" : "?"));
            lastLoggedCurrent = current;
            lastLoggedCurrentTime = now;
            if (current >= 0 && current < items.size()) {
                Object wrapper = field(items.get(current), items.get(current).getClass(), "A0B");
                Object tree = wrapper == null ? null : field(wrapper, wrapper.getClass(), "A03");
                if (tree != null) AdLog.log("reels", "  ON SCREEN " + current + " sponsored=" + marking.sponsored[current] + " | " + AdTrace.describe(tree));
            }
        } else if (!detectedNow.equals(lastDetected)) {
            AdLog.log("reels", "LIST changed, current " + current + " items=" + items.size() + " list=" + flags);
        }
        lastDetected = detectedNow;
    }

    /** An item that was made unsnappable but is not sponsored (any more) gets its own values back. */
    private static void restore(Object item, Object tree) throws Exception {
        Boolean snappable = ORIGINAL_SNAPPABLE.remove(item);
        if (snappable != null) {
            Field field = item.getClass().getDeclaredField("A0N");
            field.setAccessible(true);
            field.setBoolean(item, snappable);
        }
        if (tree != null) {
            Boolean stops = ORIGINAL_STOPS.remove(tree);
            if (stops != null) a2z.setBoolean(tree, stops);
        }
    }

    /**
     * Not cached: the server rebinds items, so the tree an item holds can change, and a verdict kept for it would
     * mark an organic reel unsnappable. The count is cheap (about 50 nodes per reel). Only a change is logged.
     */
    private static boolean isSponsored(Object tree, int index) throws Exception {
        int[] counts = new int[2];
        countFlaggedText(tree, 0, counts);
        boolean sponsored = counts[0] >= 2;
        Boolean before = SPONSORED.put(tree, sponsored);
        if (AdLog.enabled() && (before == null ? sponsored : before != sponsored)) {
            AdLog.log("reels", (sponsored ? "CLASSIFIED sponsored" : "classified organic") + " reel " + index + " flaggedText=" + counts[0]
                    + " nodes=" + counts[1] + " | " + AdTrace.describe(tree));
        }
        return sponsored;
    }

    /** counts[0] = text nodes carrying the marker flag, counts[1] = all nodes. */
    private static void countFlaggedText(Object node, int depth, int[] counts) throws Exception {
        if (node == null || depth > 30) return;
        counts[1]++;
        if (textClass.isInstance(node) && a32.getBoolean(node)) counts[0]++;
        if (childList.getDeclaringClass().isInstance(node)) {
            Object list = childList.invoke(node);
            if (list instanceof List) {
                Object[] snapshot = AdTrace.snapshot((List<?>) list);
                for (Object child : snapshot) countFlaggedText(child, depth + 1, counts);
            }
        }
    }

    private static void resolve(ClassLoader app) throws Exception {
        pagerClass = Class.forName("X.0zb", false, app);
        component = Class.forName("X.0gp", false, app);
        textClass = Class.forName("X.0hW", false, app);
        a32 = component.getDeclaredField("A32");
        a32.setAccessible(true);
        a2z = component.getDeclaredField("A2z");
        a2z.setAccessible(true);
        childList = Class.forName("X.0gn", false, app).getMethod("AF0");
    }

    private static Object field(Object target, Class<?> declaring, String name) throws Exception {
        Field f = declaring.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }
}
