package app.morphe.extension.facebook.marketplace;

import java.lang.reflect.Field;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.List;

/**
 * Runtime half of the "Marketplace only" patch for Facebook 582.0.0.50.54.
 *
 * The patch calls {@link #capture(Object)} at the start of {@code X.C2GO.A06(boolean)} and
 * {@link #onStartingTabDetermined()} (or the {@code ...HideBar} variant) at its end,
 * i.e. right after Facebook's own "TabBarController.determineStartingTabPosition"
 * logic has picked the tab to open. We then re-point the selection at the
 * Marketplace tab, looked up by its tab ID rather than by list position.
 *
 * Member names below (A00, A05, A01, A02, A03, A09) are the real, obfuscated
 * names in this exact build and are NOT stable across Facebook versions.
 *
 * Everything is wrapped so a mismatch can never crash the app: on any failure the
 * original tab selection is left untouched (Facebook opens normally).
 *
 * Deliberately has no Android compile-time dependency (View is touched via
 * reflection) so the lookup logic can be unit-tested on a plain JVM.
 */
@SuppressWarnings("unused")
public final class MarketplaceOnly {

    /** Marketplace tab ID observed in this build (TabTag.A03). */
    static final long MARKETPLACE_TAB_ID = 1606854132932955L;

    private static final int VIEW_GONE = 8; // android.view.View.GONE

    /**
     * Replaces the "home tab id" that {@code FbMainTabActivityDelegate.onBackPressedInternal} reads from
     * {@code X.1Hz.A02()}. Back with an empty tab stack switches to that tab unless you are already on it;
     * answering "Marketplace" makes Marketplace the home tab, so back falls through to leaving the app.
     */
    public static long marketplaceHomeTabId() {
        return MARKETPLACE_TAB_ID;
    }

    private MarketplaceOnly() {
    }

    /**
     * The tab pager controller (X.2FU) captured at the start of its tab-select method. Held weakly so
     * the patch never keeps an activity alive.
     */
    private static volatile WeakReference<Object> pager;

    /** Injected at the very start of X.2FU.A06(Intent, Bundle, 2Vz, String, int) (p0 = the controller). */
    public static void capturePager(Object pagerController) {
        pager = new WeakReference<>(pagerController);
    }

    /**
     * Injected right after {@link #capturePager}: every tab switch (Facebook's "reset to feed after being
     * in the background" routine, new intents, back handling, deep links) goes through X.2FU.A06 with a
     * tab INDEX. Whatever tab was asked for, answer with Marketplace's index instead. The index is
     * looked up by tab id via the controller's own {@code A04(long) -> Integer}. Any problem (Marketplace
     * not among this account's tabs, controller not ready, reflection mismatch) returns the original
     * index, so Facebook behaves normally instead of breaking.
     */
    public static int redirectTabIndex(int requested) {
        try {
            WeakReference<Object> ref = pager;
            Object controller = ref == null ? null : ref.get();
            if (controller == null) return requested;
            Object index = findMethod(controller.getClass(), "A04", long.class).invoke(controller, MARKETPLACE_TAB_ID);
            return index instanceof Integer ? (Integer) index : requested;
        } catch (Throwable ignored) {
            return requested;
        }
    }

    /**
     * The tab controller captured at method entry. Facebook's A06 reuses its "this" register
     * (v27) as scratch space, so by the time it reaches return-void that register holds a
     * different type on different paths and the ART verifier rejects any read of it
     * ("register v27 has type Conflict"). So the patch grabs "this" on entry, where it is
     * guaranteed valid, and the return-void hook takes no arguments.
     */
    private static volatile WeakReference<Object> controller;

    /** Injected at the very start of X.C2GO.A06(boolean). */
    public static void capture(Object tabBarController) {
        controller = new WeakReference<>(tabBarController);
    }

    /** Injected before every return-void: select Marketplace; leave the tab bar alone. */
    public static void onStartingTabDetermined() {
        WeakReference<Object> ref = controller;
        apply(ref == null ? null : ref.get(), false);
    }

    /** Injected before every return-void: select Marketplace and hide the bottom tab bar. */
    public static void onStartingTabDeterminedHideBar() {
        WeakReference<Object> ref = controller;
        apply(ref == null ? null : ref.get(), true);
    }

    static void apply(Object c2go, boolean hideTabBar) {
        try {
            if (c2go == null) return;

            // static X.C2GO.A00(C2GO) -> C23681Hz (tab state holder)
            Method getState = findMethod(c2go.getClass(), "A00", c2go.getClass());
            Object state = getState.invoke(null, c2go);

            // C23681Hz.A05() -> ImmutableList<TabTag> (a java.util.List)
            Object tabsObj = findMethod(state.getClass(), "A05").invoke(state);
            if (!(tabsObj instanceof List)) return;
            List<?> tabs = (List<?>) tabsObj;

            int index = -1;
            for (int i = 0; i < tabs.size(); i++) {
                Object tag = tabs.get(i);
                if (tag != null && findField(tag.getClass(), "A03").getLong(tag) == MARKETPLACE_TAB_ID) {
                    index = i;
                    break;
                }
            }

            // Marketplace not in this account's tab list (feature-gated off, region, etc.):
            // do nothing at all rather than guess.
            if (index < 0) return;

            findField(c2go.getClass(), "A01").setInt(c2go, index);                  // selected position
            findField(c2go.getClass(), "A02").setLong(c2go, MARKETPLACE_TAB_ID);    // selected tab id

            if (hideTabBar) {
                Object bar = findField(c2go.getClass(), "A09").get(c2go);           // tab bar ViewGroup
                if (bar != null) {
                    rememberBarHeight(bar);
                    findMethod(bar.getClass(), "setVisibility", int.class).invoke(bar, VIEW_GONE);
                    scheduleReclaim(c2go, bar);
                }
            }
        } catch (Throwable ignored) {
            // Never break app startup because of a patch problem.
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Reclaiming the space the hidden tab bar used to occupy ("blank strip at the bottom").
    //
    // Setting the bar to GONE is not enough: Facebook keeps other things around it that still take
    // the space (a divider/background filler view next to it, bottom padding or margin on a
    // container, an explicit height). The layout XML isn't readable from the APK (the ids are
    // stripped), so this works on the live view tree instead, after layout has settled:
    //   1. keep the bar GONE and 0 high,
    //   2. hide full-width, short, bottom-aligned LEAF views near the bar (dividers / fillers),
    //   3. zero a bottom padding / margin on the bar's ancestors when it matches the bar's old
    //      height (or, if that is unknown, when it isn't the system navigation-bar inset),
    //   4. log the view tree around the bar (tag "MarketplaceOnly") so a leftover strip can be
    //      pinned down from one logcat.
    // Passes repeat a few times because Facebook re-applies insets/heights after first layout.
    // ---------------------------------------------------------------------------------------------

    private static final String TAG = "MarketplaceOnly";
    private static final int[] RECLAIM_DELAYS_MS = {0, 300, 1200, 3000};
    private static final int MAX_ANCESTORS = 6;

    /** The tab bar's height in px, remembered from before it was hidden (0 = unknown). */
    private static volatile int barHeightPx = 0;

    private static void rememberBarHeight(Object bar) {
        try {
            int h = getInt(bar, "getHeight");
            if (h <= 0) {
                Object lp = call(bar, "getLayoutParams");
                if (lp != null) h = findField(lp.getClass(), "height").getInt(lp);
            }
            if (h > 0) barHeightPx = h;
        } catch (Throwable ignored) {
            // unknown height is fine
        }
    }

    private static void scheduleReclaim(final Object c2go, final Object bar) {
        for (int i = 0; i < RECLAIM_DELAYS_MS.length; i++) {
            final boolean last = i == RECLAIM_DELAYS_MS.length - 1;
            Runnable pass = new Runnable() {
                @Override
                public void run() {
                    try {
                        reclaimSpace(c2go, bar, last);
                    } catch (Throwable ignored) {
                        // cosmetic only
                    }
                }
            };
            try {
                findMethod(bar.getClass(), "postDelayed", Runnable.class, long.class)
                        .invoke(bar, pass, (long) RECLAIM_DELAYS_MS[i]);
            } catch (Throwable t) {
                pass.run(); // no handler available: do one immediate pass
            }
        }
    }

    static void reclaimSpace(Object c2go, Object bar, boolean dump) throws Exception {
        // 1. bar stays hidden and takes no height, even if Facebook re-shows it or re-sizes it.
        callVoid(bar, "setVisibility", new Class<?>[]{int.class}, VIEW_GONE);
        Object barLp = call(bar, "getLayoutParams");
        if (barLp != null) {
            try {
                findField(barLp.getClass(), "height").setInt(barLp, 0);
            } catch (Throwable ignored) {
                // not a plain LayoutParams
            }
        }

        // The chain bar -> parent -> ... (stops at something that isn't a view group).
        java.util.ArrayList<Object> path = new java.util.ArrayList<>();
        path.add(bar);
        Object node = bar;
        for (int i = 0; i < MAX_ANCESTORS; i++) {
            Object parent = call(node, "getParent");
            if (parent == null || !hasMethod(parent, "getChildCount")) break;
            path.add(parent);
            node = parent;
        }
        int rootHeight = Math.max(1, getInt(path.get(path.size() - 1), "getHeight"));
        int navInset = navigationBarInset(bar);

        // Facebook's own views next to the bar that look like fillers (X.2GO A10 / A08).
        for (String fieldName : new String[]{"A10", "A08"}) {
            try {
                Object v = findField(c2go.getClass(), fieldName).get(c2go);
                Object parent = v == null ? null : call(v, "getParent");
                if (v != null && parent != null && isStripFiller(v, parent, rootHeight)) hide(v);
            } catch (Throwable ignored) {
                // field/view missing: fine
            }
        }

        for (int i = 1; i < path.size(); i++) {
            Object ancestor = path.get(i);
            Object onPath = path.get(i - 1);

            // 2. short full-width bottom-aligned leaf siblings (dividers / background fillers)
            int n = getInt(ancestor, "getChildCount");
            for (int c = 0; c < n; c++) {
                Object child = callArgs(ancestor, "getChildAt", new Class<?>[]{int.class}, c);
                if (child != null && child != onPath && isStripFiller(child, ancestor, rootHeight)) hide(child);
            }

            // 3. bottom padding on the ancestor / bottom margin on the child on the path
            int pb = getInt(ancestor, "getPaddingBottom");
            if (isReservedSpace(pb, navInset, rootHeight)) {
                callVoid(ancestor, "setPadding", new Class<?>[]{int.class, int.class, int.class, int.class},
                        getInt(ancestor, "getPaddingLeft"), getInt(ancestor, "getPaddingTop"),
                        getInt(ancestor, "getPaddingRight"), 0);
            }
            Object lp = call(onPath, "getLayoutParams");
            if (lp != null) {
                try {
                    Field margin = findField(lp.getClass(), "bottomMargin");
                    if (isReservedSpace(margin.getInt(lp), navInset, rootHeight)) margin.setInt(lp, 0);
                } catch (Throwable ignored) {
                    // no margins on this LayoutParams type
                }
            }
            call(onPath, "requestLayout");
        }

        if (dump) dumpTree(path);
    }

    /** A bottom padding/margin that is what the hidden bar used to reserve (not the nav-bar inset). */
    private static boolean isReservedSpace(int px, int navInset, int rootHeight) {
        if (px <= 0) return false;
        int bar = barHeightPx;
        if (bar > 0) return Math.abs(px - bar) <= 2;
        return Math.abs(px - navInset) > 2 && px < rootHeight / 5;
    }

    /** Visible, childless, (nearly) full-width, short, and sitting on the parent's bottom edge. */
    private static boolean isStripFiller(Object view, Object parent, int rootHeight) {
        try {
            if (getInt(view, "getVisibility") != 0) return false;
            if (hasMethod(view, "getChildCount") && getInt(view, "getChildCount") > 0) return false;
            int pw = getInt(parent, "getWidth");
            int h = getInt(view, "getHeight");
            if (pw <= 0 || h <= 0 || getInt(view, "getWidth") < pw - 2 || h > rootHeight / 5) return false;
            int parentBottom = getInt(parent, "getHeight") - getInt(parent, "getPaddingBottom");
            return getInt(view, "getBottom") >= parentBottom - 2;
        } catch (Throwable t) {
            return false;
        }
    }

    private static void hide(Object view) throws Exception {
        callVoid(view, "setVisibility", new Class<?>[]{int.class}, VIEW_GONE);
        log("hid filler view " + describe(view));
    }

    private static int navigationBarInset(Object view) {
        try {
            Object insets = call(view, "getRootWindowInsets");
            return insets == null ? 0 : getInt(insets, "getSystemWindowInsetBottom");
        } catch (Throwable t) {
            return 0;
        }
    }

    private static void dumpTree(java.util.List<Object> path) {
        try {
            log("navInset=" + navigationBarInset(path.get(0)) + " barHeightPx=" + barHeightPx);
            for (int i = path.size() - 1; i >= 0; i--) {
                Object v = path.get(i);
                log("path[" + i + "] " + describe(v));
                if (i == 0 || !hasMethod(v, "getChildCount")) continue;
                int n = getInt(v, "getChildCount");
                for (int c = 0; c < n; c++) {
                    Object child = callArgs(v, "getChildAt", new Class<?>[]{int.class}, c);
                    log("   child[" + c + "]" + (child == path.get(i - 1) ? "*" : "") + " " + describe(child));
                }
            }
        } catch (Throwable ignored) {
            // diagnostics only
        }
    }

    private static String describe(Object v) {
        try {
            return v.getClass().getName() + " id=0x" + Integer.toHexString(getInt(v, "getId"))
                    + " vis=" + getInt(v, "getVisibility")
                    + " [" + getInt(v, "getLeft") + "," + getInt(v, "getTop") + ","
                    + getInt(v, "getRight") + "," + getInt(v, "getBottom") + "]"
                    + " padB=" + getInt(v, "getPaddingBottom");
        } catch (Throwable t) {
            return String.valueOf(v);
        }
    }

    private static void log(String msg) {
        try {
            Class.forName("android.util.Log").getMethod("i", String.class, String.class).invoke(null, TAG, msg);
        } catch (Throwable ignored) {
            // not on Android (unit tests)
        }
    }

    private static boolean hasMethod(Object o, String name) {
        for (Class<?> c = o.getClass(); c != null; c = c.getSuperclass()) {
            for (Method m : c.getDeclaredMethods()) if (m.getName().equals(name)) return true;
        }
        return false;
    }

    private static Object call(Object o, String name) throws Exception {
        return findMethod(o.getClass(), name).invoke(o);
    }

    private static Object callArgs(Object o, String name, Class<?>[] types, Object... args) throws Exception {
        return findMethod(o.getClass(), name, types).invoke(o, args);
    }

    private static void callVoid(Object o, String name, Class<?>[] types, Object... args) throws Exception {
        findMethod(o.getClass(), name, types).invoke(o, args);
    }

    private static int getInt(Object o, String name) throws Exception {
        return ((Number) findMethod(o.getClass(), name).invoke(o)).intValue();
    }

    private static Method findMethod(Class<?> start, String name, Class<?>... params) throws NoSuchMethodException {
        for (Class<?> c = start; c != null; c = c.getSuperclass()) {
            try {
                Method m = c.getDeclaredMethod(name, params);
                m.setAccessible(true);
                return m;
            } catch (NoSuchMethodException ignored) {
                // keep walking up
            }
        }
        throw new NoSuchMethodException(start.getName() + "." + name);
    }

    private static Field findField(Class<?> start, String name) throws NoSuchFieldException {
        for (Class<?> c = start; c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch (NoSuchFieldException ignored) {
                // keep walking up
            }
        }
        throw new NoSuchFieldException(start.getName() + "." + name);
    }
}
