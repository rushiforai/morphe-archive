package app.fblite.extension.hideads;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Removes sponsored reels where they enter the Reels list, not after they are on screen (the way Hushfacebook's
 * "Hide sponsored reels" filters each fetched page before the list holds it).
 *
 * Facebook Lite updates its lists by child index, so a child cannot be deleted. A sponsored reel is collapsed
 * instead, the way sponsored feed posts are: flagged hidden (A2c), height 0 (A0i) and "does not stop a swipe"
 * (A2z = false, which makes the pager's snap search skip it). This runs right after the props of a reel are
 * decoded, before the pager has laid the item out, so there is no window in which the ad can be current, and
 * nothing scrolls programmatically: a swipe goes from the reel before the ad to the reel after it.
 *
 * Which container is the Reels list is learned from the pager scan of {@link SponsoredReels} (the parent of
 * the trees of the snapping list's items), so no other list (feed, Marketplace) is ever touched.
 *
 * A reel counts as sponsored by the same rule as {@link SponsoredReels}: at least two text components with
 * flag X.0gp.A32. It is re-evaluated on every decode event of the reel, and undone when the reel is not
 * sponsored (any more). A detection next to another detection, or in a list where far too many reels
 * look sponsored, is treated as false. Any error only turns this off; the pager scan stays as the fallback.
 *
 * Names are for Facebook Lite 530.0.0.8.106.
 */
public final class ReelAds {
    private static final int MAX_CLIMB = 12;
    private static final int MAX_NODES = 400;
    /** A reel this big has been filled in by the server; a smaller one may still be decoding. */
    private static final int MIN_NODES_BOUND = 40;
    private static final int MAX_FAILURES = 25;
    private static final int MIN_ITEMS_FOR_SHARE = 8;
    private static final int MAX_SPONSORED_PERCENT = 35;
    private static final long SETTING_CHECK_MS = 1000;
    private static final long RELAYOUT_MS = 120;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** Containers known to be a Reels list -> the pager view that shows them. */
    private static final Map<Object, WeakReference<View>> LISTS =
            Collections.synchronizedMap(new WeakHashMap<Object, WeakReference<View>>());
    /** Collapsed child -> {hidden, height, stops} before this class changed them. */
    private static final Map<Object, Object[]> COLLAPSED =
            Collections.synchronizedMap(new WeakHashMap<Object, Object[]>());

    private static boolean resolved;
    private static boolean disabled;
    private static int failures;
    private static boolean enabled = true;
    private static long checkedAt = -SETTING_CHECK_MS;
    private static long lastRelayout;
    private static Class<?> textClass;
    private static Field fParent, fHeight, fHidden, fStops, fFlag, fId;

    private ReelAds() {
    }

    /** Called after the app decoded the props of a component (from {@link SponsoredPosts#afterDecode}). */
    public static void afterDecode(Object component) {
        if (component == null || disabled || LISTS.isEmpty()) return;
        try {
            if (!resolved) resolve();
            if (!switchedOn()) {
                if (!COLLAPSED.isEmpty()) restoreAll();
                return;
            }
            Object child = null;
            Object node = component;
            for (int i = 0; i <= MAX_CLIMB && node != null; i++) {
                if (LISTS.containsKey(node)) {
                    if (child == null) sweep(node); else evaluate(node, child);
                    break;
                }
                child = node;
                node = fParent.get(node);
            }
            failures = 0;
        } catch (Throwable t) {
            failures++;
            AdLog.log("reels", "Decode filter failed (" + failures + "/" + MAX_FAILURES + ")", t);
            if (failures >= MAX_FAILURES) {
                disabled = true;
                Log.e(OriginalClass.TAG, "Removing sponsored reels at decode failed, turning it off", t);
            }
        }
    }

    /**
     * Called by the pager scan with the trees of a Reels list's items: their parent is the list's container,
     * which from then on is filtered at decode time. Does not collapse anything itself (the reel on screen could
     * be among them).
     */
    static void learn(View pager, Object[] trees) {
        if (disabled) return;
        try {
            if (!resolved) resolve();
            for (Object tree : trees) {
                if (tree == null) continue;
                Object parent = fParent.get(tree);
                if (parent == null || LISTS.containsKey(parent)) continue;
                LISTS.put(parent, new WeakReference<View>(pager));
                AdLog.log("reels", "REELS LIST learned: container id " + fId.get(parent) + " " + parent.getClass().getName()
                        + ", tree " + tree.getClass().getName() + " id " + fId.get(tree) + ", decode-time removal active");
            }
        } catch (Throwable t) {
            AdLog.log("reels", "Learning the Reels list failed", t);
        }
    }

    /** The "does not stop a swipe" value a tree had before this class collapsed it, else the given current value. */
    static boolean stopsBefore(Object tree, boolean current) {
        Object[] original = COLLAPSED.get(tree);
        return original != null ? (Boolean) original[2] : current;
    }

    // ------------------------------------------------------------------------------------ decisions

    /** The list container was decoded: every reel in it. */
    private static void sweep(Object list) throws Exception {
        Object[] all = AdTrace.children(list);
        int[][] measured = new int[all.length][];
        boolean[] detected = new boolean[all.length];
        int count = 0;
        for (int i = 0; i < all.length; i++) {
            measured[i] = measure(all[i]);
            detected[i] = measured[i][0] >= 2;
            if (detected[i]) count++;
        }
        boolean unreliable = all.length >= MIN_ITEMS_FOR_SHARE && count * 100 / all.length > MAX_SPONSORED_PERCENT;
        for (int i = 0; i < all.length; i++) {
            boolean refusedHere = detected[i] && (unreliable || (i > 0 && detected[i - 1]) || (i < all.length - 1 && detected[i + 1]));
            String why = refusedHere ? (unreliable ? "too many in list" : "neighbour also detected") : null;
            apply(list, all[i], detected[i] && !refusedHere, measured[i][1] >= MIN_NODES_BOUND, i, all.length, why);
        }
    }

    /** One reel of the list was decoded (or one of its parts). */
    private static void evaluate(Object list, Object child) throws Exception {
        int[] measured = measure(child);
        boolean ad = measured[0] >= 2;
        Object[] all = AdTrace.children(list);
        int index = -1;
        for (int i = 0; i < all.length; i++) {
            if (all[i] == child) {
                index = i;
                break;
            }
        }
        String refused = null;
        if (ad) {
            if (index > 0 && isSponsored(all[index - 1])) refused = "neighbour also detected";
            else if (index >= 0 && index < all.length - 1 && isSponsored(all[index + 1])) refused = "neighbour also detected";
            else if (all.length >= MIN_ITEMS_FOR_SHARE) {
                int count = 0;
                for (Object other : all) if (other == child || isSponsored(other)) count++;
                if (count * 100 / all.length > MAX_SPONSORED_PERCENT) refused = "too many in list";
            }
        }
        apply(list, child, ad && refused == null, measured[1] >= MIN_NODES_BOUND, index, all.length, refused);
    }

    /**
     * A reel that is not sponsored gets its values back only once it is filled in (a reel being decoded in place
     * can show fewer than two marked texts for a moment: collapsed, restored and collapsed again within a
     * millisecond was seen), or when its detection was refused.
     */
    private static void apply(Object list, Object child, boolean ad, boolean bound, int index, int size, String refused) throws Exception {
        if (ad) {
            collapse(list, child, index, size);
        } else {
            if (refused != null && AdLog.enabled()) AdLog.log("reels", "DECODE detection at " + index + " ignored (" + refused + ")");
            if (bound || refused != null) restore(list, child, index);
        }
    }

    /** True when the tree is collapsed by this class. */
    static boolean isCollapsed(Object tree) {
        return tree != null && COLLAPSED.containsKey(tree);
    }

    /** At least two text components carrying the marker flag: sponsored, in any language. */
    private static boolean isSponsored(Object tree) throws Exception {
        return tree != null && measure(tree)[0] >= 2;
    }

    /** {text nodes carrying the marker flag, nodes counted}. */
    private static int[] measure(Object tree) throws Exception {
        int[] counts = new int[2];
        if (tree != null) count(tree, 0, counts);
        return counts;
    }

    private static void count(Object node, int depth, int[] counts) throws Exception {
        if (node == null || depth > 30 || counts[1] >= MAX_NODES) return;
        counts[1]++;
        if (textClass.isInstance(node) && fFlag.getBoolean(node)) counts[0]++;
        for (Object child : AdTrace.children(node)) count(child, depth + 1, counts);
    }

    // ------------------------------------------------------------------------------------ changes

    private static void collapse(Object list, Object child, int index, int size) throws Exception {
        boolean first = false;
        synchronized (COLLAPSED) {
            if (!COLLAPSED.containsKey(child)) {
                COLLAPSED.put(child, new Object[] {fHidden.getBoolean(child), fHeight.getInt(child), fStops.getBoolean(child)});
                first = true;
            }
        }
        boolean changed = !fHidden.getBoolean(child) || fHeight.getInt(child) != 0 || fStops.getBoolean(child);
        fHidden.setBoolean(child, true);
        fHeight.setInt(child, 0);
        fStops.setBoolean(child, false);
        if (first) {
            Object[] original = COLLAPSED.get(child);
            AdLog.log("reels", "DECODE-REMOVE sponsored reel at " + index + " of " + size + " (height " + original[1] + " -> 0, hidden "
                    + original[0] + " -> true, stops " + original[2] + " -> false)" + (AdLog.enabled() ? " | " + AdTrace.describe(child) : ""));
        }
        if (changed) relayout(list);
        // The item that holds it may already exist (the server fills ready-made empty items): have the pager scan
        // mark it unsnappable, and move on if the reel is already current, without waiting for the next tick.
        if (first) SponsoredReels.nudge();
    }

    /** Gives a collapsed reel back what it had, but only the values that are still the ones this class set. */
    private static void restore(Object list, Object child, int index) throws Exception {
        Object[] original = COLLAPSED.remove(child);
        if (original == null) return;
        if (fHidden.getBoolean(child) && fHeight.getInt(child) == 0) {
            fHidden.setBoolean(child, (Boolean) original[0]);
            fHeight.setInt(child, (Integer) original[1]);
        }
        if (!fStops.getBoolean(child)) fStops.setBoolean(child, (Boolean) original[2]);
        AdLog.log("reels", "DECODE-RESTORE reel at " + index + " is not sponsored (any more)");
        relayout(list);
    }

    private static void restoreAll() {
        Object[] children;
        synchronized (COLLAPSED) {
            children = COLLAPSED.keySet().toArray();
        }
        for (Object child : children) {
            try {
                restore(null, child, -1);
            } catch (Throwable ignored) {
            }
        }
        relayout(null);
    }

    /** The pager laid the item out before it was collapsed: ask for a new layout (not too often, on the main thread). */
    private static void relayout(Object list) {
        final long now = SystemClock.uptimeMillis();
        if (now - lastRelayout < RELAYOUT_MS) return;
        lastRelayout = now;
        final WeakReference<View> ref = list == null ? null : LISTS.get(list);
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    if (ref != null) {
                        View pager = ref.get();
                        if (pager != null) {
                            pager.requestLayout();
                            pager.invalidate();
                        }
                        return;
                    }
                    synchronized (LISTS) {
                        for (WeakReference<View> other : LISTS.values()) {
                            View pager = other == null ? null : other.get();
                            if (pager != null) {
                                pager.requestLayout();
                                pager.invalidate();
                            }
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        });
    }

    private static boolean switchedOn() {
        long now = SystemClock.uptimeMillis();
        if (now - checkedAt >= SETTING_CHECK_MS) {
            checkedAt = now;
            enabled = AdLog.setting("reels_hide_ads", true);
        }
        return enabled;
    }

    private static void resolve() throws Exception {
        if (!AdTrace.ensure()) throw new IllegalStateException("The app's component classes were not found");
        ClassLoader app = ReelAds.class.getClassLoader();
        Class<?> component = Class.forName("X.0gp", false, app);
        textClass = Class.forName("X.0hW", false, app);
        fId = component.getDeclaredField("A1b");
        fParent = component.getDeclaredField("A18");
        fHeight = component.getDeclaredField("A0i");
        fHidden = component.getDeclaredField("A2c");
        fStops = component.getDeclaredField("A2z");
        fFlag = component.getDeclaredField("A32");
        fId.setAccessible(true);
        fParent.setAccessible(true);
        fHeight.setAccessible(true);
        fHidden.setAccessible(true);
        fStops.setAccessible(true);
        fFlag.setAccessible(true);
        resolved = true;
    }
}
