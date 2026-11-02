package app.morphe.extension.facebook.marketplace;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Runtime half of the "Block Facebook-wide search" option (Facebook 582.0.0.50.54).
 *
 * Keeps Marketplace search inside Marketplace: removes the "Search in all of Facebook" and
 * "Search with Meta AI" entries and every other way into Facebook's global search (for example
 * profile > More options > Search). Three layers:
 *
 * 0. {@link #allowSearchLaunch()}: gate on the single launcher of Facebook's search screen, denying the
 *    profile screen's callers. Verified in the dex of 582.0.0.50.54 (Fingerprints.kt).
 *
 * The two layers below were written before the dex was available and are unverified:
 *
 * 1. MobileConfig flags (same hook as {@link GroupSuggestions}, a second filter chained after it):
 *    {@link #filterBoolByName(String, boolean)} / {@link #filterBoolBySpec(long, boolean)}. Marketplace search is
 *    React Native, so the JS decides what to draw from flags. The name rule is a pattern, not a verified flag
 *    list; every flag it overrides or nearly matches is logged once under tag "MarketplaceOnly" so the real
 *    names can be read from one logcat and pinned in {@link #BLOCKED_SPECS} / {@link #isFacebookWideSearchFlag}.
 *
 * 2. Visible text: {@link #install()} registers activity lifecycle callbacks and, on every layout pass of a
 *    resumed activity, hides the row whose text / content description is one of {@link #PHRASES}. RN draws
 *    real Android views, so this works without knowing any class or flag. English UI strings only.
 *
 * Like {@link MarketplaceOnly} there is no Android compile-time dependency (views are touched through
 * reflection) so the matching and scanning logic runs in plain-JVM tests, and everything is wrapped so a
 * mismatch can never crash the app.
 */
@SuppressWarnings("unused")
public final class SearchScope {

    private static final String TAG = "MarketplaceOnly";
    private static final int VIEW_GONE = 8; // android.view.View.GONE
    private static final int MAX_NODES = 4000;
    private static final int MAX_DEPTH = 40;
    private static final int SCAN_DELAY_MS = 150;

    /** Lower-case, whitespace-normalised UI strings that mark a Facebook-wide search / Meta AI entry. */
    static final String[] PHRASES = {
            "search in all of facebook",
            "search all of facebook",
            "search all of fb",
            "search in all of fb",
            "search facebook for",
            "search with meta ai",
            "search using meta ai",
            "search by meta ai",
            "ask meta ai",
            "meta ai search",
    };

    /**
     * MobileConfig specifiers (the hex numbers of assets/rn_params*.txt) to force to false. Empty until a
     * logcat names the real flags; add the number of each flag here. Same convention as GroupSuggestions.
     */
    static final long[] BLOCKED_SPECS = {};

    private SearchScope() {
    }

    // ---------------------------------------------------------------------------------------------
    // Layer 0: the launcher of Facebook's search screen (verified in the dex, see Fingerprints.kt)
    // ---------------------------------------------------------------------------------------------

    /**
     * Callers that may NOT open the search screen: the profile screen's search entries, traced in the dex of
     * 582.0.0.50.54. A deny-list (not an allow-list) so Marketplace's own search button, whichever path it takes,
     * keeps working. Exact class names, plus the profile package prefix for anything launched from inside it.
     *   X.P9y  profile "More options" overflow section ("ProfileDynamicActionBarOverflowSection", entry point SEARCH_BOX)
     *   X.P9Y  profile search tap ("profile_search" / "search_all" / "return_to_global_search")
     *   X.P8e  ProfileFragment title-bar search icon ("title_bar_search_profile") -> Bap.A01 -> hQ5
     */
    static final String[] DENIED_CALLERS = {"X.P9y", "X.P9Y", "X.P8e"};
    static final String[] DENIED_CALLER_PREFIXES = {"com.facebook.timeline."};

    /**
     * Injected at the start of {@code X.hQ5.A01(Context, Bundle, FbUserSession, GraphSearchQuery, int)V}, the one
     * method that builds and starts Facebook's search activity. The patch returns early when this answers false,
     * i.e. when the call comes from the profile screen (profile > More options > Search). Everything else,
     * including Marketplace's own search, is allowed. Fails open: any error allows it.
     */
    public static boolean allowSearchLaunch() {
        try {
            StackTraceElement[] stack = new Throwable().getStackTrace();
            boolean allowed = isAllowedCaller(stack);
            if (!allowed) logOnce("blocked Facebook-wide search launch from " + firstExternalFrame(stack));
            return allowed;
        } catch (Throwable t) {
            return true;
        }
    }

    static boolean isAllowedCaller(StackTraceElement[] stack) {
        for (StackTraceElement frame : stack) {
            String cls = frame.getClassName();
            for (String denied : DENIED_CALLERS) {
                if (cls.equals(denied)) return false;
            }
            for (String prefix : DENIED_CALLER_PREFIXES) {
                if (cls.startsWith(prefix)) return false;
            }
        }
        return true;
    }

    private static String firstExternalFrame(StackTraceElement[] stack) {
        for (StackTraceElement frame : stack) {
            String cls = frame.getClassName();
            if (!cls.startsWith("X.hQ5") && !cls.startsWith(SearchScope.class.getName())) {
                return cls + "." + frame.getMethodName();
            }
        }
        return "?";
    }

    // ---------------------------------------------------------------------------------------------
    // Layer 1: MobileConfig flags
    // ---------------------------------------------------------------------------------------------

    private static final Set<String> logged = ConcurrentHashMap.newKeySet();

    /** Called with Facebook's value right before every name-based getBool* returns; returns the value to use. */
    public static boolean filterBoolByName(String name, boolean value) {
        try {
            if (name == null) return value;
            String lower = name.toLowerCase(Locale.ROOT);
            if (isFacebookWideSearchFlag(lower)) {
                if (value && !isInverted(lower)) {
                    logOnce("search flag " + name + ": true -> false");
                    return false;
                }
                logOnce("search flag " + name + " = " + value + " (kill-switch style name, left alone)");
            } else if (isNearMiss(lower)) {
                logOnce("search flag read, not overridden: " + name + " = " + value);
            }
        } catch (Throwable ignored) {
            // never break a flag read
        }
        return value;
    }

    /** Called with the packed specifier and Facebook's value right before every spec-based getBool* returns. */
    public static boolean filterBoolBySpec(long spec, boolean value) {
        try {
            if (!value) return value;
            for (long blocked : BLOCKED_SPECS) {
                // Default-true flags carry a 0x20 marker in the top byte (see Fingerprints.kt): compare without it.
                if (stripMarker(spec) == stripMarker(blocked)) {
                    logOnce("search flag spec 0x" + Long.toHexString(spec) + ": true -> false");
                    return false;
                }
            }
        } catch (Throwable ignored) {
            // never break a flag read
        }
        return value;
    }

    private static long stripMarker(long spec) {
        return spec & 0x00FFFFFFFFFFFFFFL;
    }

    /** Marketplace-scoped flag that is about searching beyond Marketplace or about Meta AI search. */
    static boolean isFacebookWideSearchFlag(String lower) {
        boolean marketplace = lower.contains("marketplace") || lower.contains("mp_") || lower.contains("_mp");
        return marketplace && isSearchish(lower) && isWideOrAi(lower);
    }

    /** Looks related but isn't Marketplace-scoped: only logged, never changed. */
    private static boolean isNearMiss(String lower) {
        return isSearchish(lower) && isWideOrAi(lower);
    }

    private static boolean isSearchish(String lower) {
        return lower.contains("search") || lower.contains("serp") || lower.contains("typeahead");
    }

    private static boolean isWideOrAi(String lower) {
        // Deliberately narrow: broader tokens (search_all, global_search, ...) can match ordinary Marketplace
        // search flags and break the search button.
        return lower.contains("meta_ai") || lower.contains("metaai") || lower.contains("meta-ai")
                || lower.contains("all_of_facebook");
    }

    /** "disable_x" / "hide_x" style names mean true = feature off; forcing false would turn it ON. */
    private static boolean isInverted(String lower) {
        return lower.contains("disable") || lower.contains("hide") || lower.contains("suppress")
                || lower.contains("kill") || lower.contains("block");
    }

    private static void logOnce(String msg) {
        if (logged.add(msg)) log(msg);
    }

    // ---------------------------------------------------------------------------------------------
    // Layer 2: hide the entries by their visible text
    // ---------------------------------------------------------------------------------------------

    private static volatile boolean installed;

    /**
     * Injected (no registers) next to the tab-controller hook. Registers once per process; every resumed
     * activity then gets a layout listener that rescans (throttled) and hides matching rows.
     */
    public static void install() {
        if (installed) return;
        try {
            Object app = Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app == null) return;
            final Class<?> callbacksType = Class.forName("android.app.Application$ActivityLifecycleCallbacks");
            Object callbacks = Proxy.newProxyInstance(callbacksType.getClassLoader(), new Class<?>[]{callbacksType},
                    new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) {
                            try {
                                if ("onActivityResumed".equals(method.getName()) && args != null && args.length > 0) {
                                    attach(args[0]);
                                }
                            } catch (Throwable ignored) {
                                // cosmetic only
                            }
                            return null; // all callbacks return void
                        }
                    });
            findMethod(app.getClass(), "registerActivityLifecycleCallbacks", callbacksType).invoke(app, callbacks);
            installed = true;
        } catch (Throwable ignored) {
            // no lifecycle access: the flag layer still works
        }
    }

    private static void attach(Object activity) throws Exception {
        Object window = call(activity, "getWindow");
        final Object decor = window == null ? null : call(window, "getDecorView");
        if (decor == null) return;
        final Class<?> listenerType = Class.forName("android.view.ViewTreeObserver$OnGlobalLayoutListener");
        final boolean[] pending = {false};
        final boolean overflow = activity.getClass().getName().endsWith("ProfileDynamicActionBarOverflowActivity");
        final Runnable scan = new Runnable() {
            @Override
            public void run() {
                pending[0] = false;
                try {
                    if (overflow) hideOverflowSearch(decor, 0, new int[]{MAX_NODES});
                    int hidden = hideMatches(decor);
                    if (hidden > 0) log("hid " + hidden + " Facebook-wide search entr" + (hidden == 1 ? "y" : "ies"));
                } catch (Throwable ignored) {
                    // cosmetic only
                }
            }
        };
        Object listener = Proxy.newProxyInstance(listenerType.getClassLoader(), new Class<?>[]{listenerType},
                new InvocationHandler() {
                    @Override
                    public Object invoke(Object proxy, Method method, Object[] args) {
                        try {
                            if ("onGlobalLayout".equals(method.getName()) && !pending[0]) {
                                pending[0] = true;
                                callArgs(decor, "postDelayed", new Class<?>[]{Runnable.class, long.class}, scan,
                                        (long) SCAN_DELAY_MS);
                            }
                        } catch (Throwable ignored) {
                            // cosmetic only
                        }
                        return null;
                    }
                });
        callArgs(call(decor, "getViewTreeObserver"), "addOnGlobalLayoutListener", new Class<?>[]{listenerType}, listener);
        scan.run();
    }

    /** Profile "..." menu: removes the row whose description is exactly "Search" (GONE + zero height, so no gap). */
    static void hideOverflowSearch(Object view, int depth, int[] budget) throws Exception {
        if (view == null || depth > MAX_DEPTH || budget[0]-- <= 0) return;
        if (getInt(view, "getVisibility") == VIEW_GONE) return;
        String t = textOf(view);
        if (t != null && "search".equals(t.trim().toLowerCase(Locale.ROOT))
                && view.getClass().getName().endsWith("LithoView")) {
            callVoid(view, "setVisibility", new Class<?>[]{int.class}, VIEW_GONE);
            Object lp = call(view, "getLayoutParams");
            if (lp != null) {
                lp.getClass().getField("height").setInt(lp, 0);
                callVoid(view, "setLayoutParams", new Class<?>[]{Class.forName("android.view.ViewGroup$LayoutParams")}, lp);
            }
            return;
        }
        if (hasMethod(view, "getChildCount")) {
            int n = getInt(view, "getChildCount");
            for (int i = 0; i < n; i++)
                hideOverflowSearch(callArgs(view, "getChildAt", new Class<?>[]{int.class}, i), depth + 1, budget);
        }
    }

    /** Hides the row of every view under {@code root} whose text matches {@link #PHRASES}; returns how many rows. */
    static int hideMatches(Object root) throws Exception {
        List<Object> matches = new ArrayList<>();
        int[] budget = {MAX_NODES};
        collect(root, 0, budget, matches);
        int hidden = 0;
        for (Object match : matches) {
            Object row = findRow(match, Math.max(1, getInt(root, "getHeight")));
            if (row != null && getInt(row, "getVisibility") != VIEW_GONE) {
                callVoid(row, "setVisibility", new Class<?>[]{int.class}, VIEW_GONE);
                hidden++;
            }
        }
        return hidden;
    }

    private static void collect(Object view, int depth, int[] budget, List<Object> out) throws Exception {
        if (view == null || depth > MAX_DEPTH || budget[0]-- <= 0) return;
        if (getInt(view, "getVisibility") == VIEW_GONE) return;
        if (matchesPhrase(textOf(view))) {
            out.add(view);
            return; // the row is hidden as a whole, no need to look inside
        }
        if (hasMethod(view, "getChildCount")) {
            int n = getInt(view, "getChildCount");
            for (int i = 0; i < n; i++) {
                collect(callArgs(view, "getChildAt", new Class<?>[]{int.class}, i), depth + 1, budget, out);
            }
        }
    }

    /** True when the (already lower-cased, trimmed) label is short and contains one of the phrases. */
    static boolean matchesPhrase(String text) {
        if (text == null) return false;
        String t = text.toLowerCase(Locale.ROOT).replaceAll("[\\s\\u00a0]+", " ").trim();
        if (t.isEmpty() || t.length() > 80) return false; // long strings are content, not a label
        for (String phrase : PHRASES) {
            if (t.contains(phrase)) return true;
        }
        return false;
    }

    private static String textOf(Object view) {
        try {
            if (hasMethod(view, "getText")) {
                Object text = call(view, "getText");
                if (text != null && !String.valueOf(text).isEmpty()) return String.valueOf(text);
            }
        } catch (Throwable ignored) {
            // not a text view
        }
        try {
            Object desc = call(view, "getContentDescription");
            return desc == null ? null : String.valueOf(desc);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /**
     * The view to hide for a matched label: climbs from the label while the parent is still "one row"
     * (shorter than a sixth of the screen, no input field, and at most one other text besides the label's own),
     * so a list holding several suggestions is never hidden as a whole. Falls back to the label itself.
     */
    private static Object findRow(Object label, int rootHeight) throws Exception {
        Object row = label;
        for (int i = 0; i < 6; i++) {
            Object parent = call(row, "getParent");
            if (parent == null || !hasMethod(parent, "getChildCount")) break;
            if (getInt(parent, "getHeight") > rootHeight / 6) break;
            if (containsInput(parent, 0)) break;
            if (countTexts(parent, 0) - countTexts(row, 0) > 1) break;
            row = parent;
        }
        return row;
    }

    private static boolean containsInput(Object view, int depth) throws Exception {
        if (view == null || depth > MAX_DEPTH) return false;
        String name = view.getClass().getName();
        if (name.contains("EditText") || name.contains("TextInput")) return true;
        if (!hasMethod(view, "getChildCount")) return false;
        int n = getInt(view, "getChildCount");
        for (int i = 0; i < n; i++) {
            if (containsInput(callArgs(view, "getChildAt", new Class<?>[]{int.class}, i), depth + 1)) return true;
        }
        return false;
    }

    private static int countTexts(Object view, int depth) throws Exception {
        if (view == null || depth > MAX_DEPTH) return 0;
        int count = 0;
        String text = textOf(view);
        if (text != null && !text.trim().isEmpty()) count++;
        if (hasMethod(view, "getChildCount")) {
            int n = getInt(view, "getChildCount");
            for (int i = 0; i < n; i++) {
                count += countTexts(callArgs(view, "getChildAt", new Class<?>[]{int.class}, i), depth + 1);
            }
        }
        return count;
    }

    // ---------------------------------------------------------------------------------------------
    // reflection helpers (same shape as MarketplaceOnly's)
    // ---------------------------------------------------------------------------------------------

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
        // interface-typed receivers (Proxy / abstract): fall back to public lookup
        try {
            return start.getMethod(name, params);
        } catch (NoSuchMethodException e) {
            throw new NoSuchMethodException(start.getName() + "." + name);
        }
    }
}
