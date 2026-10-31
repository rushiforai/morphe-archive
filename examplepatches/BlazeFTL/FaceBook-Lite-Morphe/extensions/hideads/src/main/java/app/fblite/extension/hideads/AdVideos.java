package app.fblite.extension.hideads;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.regex.Pattern;

/**
 * Ads that are videos, found by what the video says about itself. Every FbVideoView holds a props object whose
 * tracking JSON starts with "qid" and "mf_story_key", and for an ad it also holds "adid":"..." (seen on a Marketplace
 * ad video in Facebook Lite 530.0.0.8.106; organic videos have none). That is a mark in no language and no layout.
 *
 * For each list on screen the video views among its children are checked. For an ad, the list item whose component
 * tree refers to the video's props (or to its tracking string or id) is searched for in the background, and then:
 * in a list that pages (Reels) the item counts as sponsored for {@link SponsoredReels}; in any other list (feed,
 * Marketplace) the card is hidden, the way sponsored feed posts are: flagged hidden and given height 0. The card is the
 * highest part of the item that is at most 65% of the item's width (one card of a grid), else the whole item.
 * Names are for 530.0.0.8.106.
 */
final class AdVideos {
    private static final String TAG = "ads";
    private static final Pattern ADID = Pattern.compile("\"adid\"\\s*:\\s*\"?\\d+");
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final int SEARCH_BUDGET = 150000;

    private static boolean resolved;
    private static boolean failed;
    private static Class<?> videoClass;
    private static Class<?> component;
    private static Field propsField, fWidth, fHeight, fHidden;

    /** props -> is an ad. */
    private static final Map<Object, Boolean> AD_PROPS = new WeakHashMap<>();
    /** Item trees that hold an ad video, in lists that page. */
    private static final Map<Object, Boolean> AD_TREES = new WeakHashMap<>();
    /** props -> the item tree found for it. */
    private static final Map<Object, Object> FOUND = new WeakHashMap<>();
    private static final Map<Object, Long> LAST_TRY = new WeakHashMap<>();
    private static final Map<Object, Integer> TRIES = new WeakHashMap<>();
    private static final Set<Object> SEARCHING = Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>());
    private static final Map<Class<?>, Field[]> FIELDS = new HashMap<>();
    private static int failures;

    private AdVideos() {
    }

    /** True when the item tree holds an ad video (only known after {@link #scan} found it). */
    static boolean isAdTree(Object tree) {
        return tree != null && AD_TREES.containsKey(tree);
    }

    /** Looks at the video views among a list's children. Called for every list on screen, twice a second. */
    static void scan(View pager) {
        if (failed || !(pager instanceof ViewGroup)) return;
        try {
            if (!resolve(pager.getClass().getClassLoader()) || !AdTrace.ensure()) return;
            ViewGroup group = (ViewGroup) pager;
            Object[] items = null;
            Boolean snapping = null;
            for (int i = 0; i < group.getChildCount(); i++) {
                // The video can sit deep in an item (Marketplace cards are views inside a row view).
                View holder = group.getChildAt(i);
                List<View> videos = new ArrayList<>();
                collectVideos(holder, 0, videos);
                for (View child : videos) {
                    Object props = propsField.get(child);
                    if (props == null) continue;
                    Boolean ad = AD_PROPS.get(props);
                    String json = null;
                    if (ad == null) {
                        json = adJson(props, 0);
                        ad = json != null;
                        AD_PROPS.put(props, ad);
                        if (ad) {
                            AdLog.log(TAG, "AD VIDEO id=" + stringField(props, "A0b") + " view=" + child.getWidth() + "x" + child.getHeight()
                                    + " in list " + pager.getWidth() + "x" + pager.getHeight() + " | " + AdLog.cut(json, 160));
                        }
                    }
                    if (!ad) continue;
                    if (items == null) {
                        items = AdTrace.snapshot(listOf(pager));
                        snapping = isSnapping(pager);
                    }
                    handle(pager, props, items, snapping, holder);
                }
            }
            failures = 0;
        } catch (Throwable t) {
            if (++failures >= 5) failed = true;
            AdLog.log(TAG, "AD VIDEO scan failed (" + failures + "/5)", t);
        }
    }

    private static void collectVideos(View view, int depth, List<View> out) {
        if (videoClass.isInstance(view)) {
            out.add(view);
            return;
        }
        if (depth > 8 || !(view instanceof ViewGroup)) return;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) collectVideos(group.getChildAt(i), depth + 1, out);
    }

    /** The adapter position of a list's child view, which is its index in the item list; -1 when unknown. */
    private static int positionOf(View pager, View child) {
        try {
            return (Integer) pager.getClass().getMethod("getChildAdapterPosition", View.class).invoke(pager, child);
        } catch (Throwable t) {
            return -1;
        }
    }

    private static void handle(View pager, Object props, Object[] items, boolean snapping, View holder) throws Exception {
        Object tree = FOUND.get(props);
        if (tree != null) {
            if (snapping) AD_TREES.put(tree, Boolean.TRUE);
            return;
        }
        // The list knows which item a child view shows, so no search is needed.
        int position = positionOf(pager, holder);
        if (position >= 0 && position < items.length) {
            Object item = treeOf(items[position]);
            if (item != null) {
                List<Object> path = new ArrayList<>();
                path.add(item);
                AdLog.log(TAG, "AD VIDEO sits in item " + position + " of " + items.length + ": " + AdTrace.describe(item));
                finish(pager, props, new Located(position, item, path), snapping, true);
                return;
            }
        }
        long now = SystemClock.uptimeMillis();
        Long last = LAST_TRY.get(props);
        Integer tries = TRIES.get(props);
        if (SEARCHING.contains(props) || (last != null && now - last < 4000) || (tries != null && tries >= 4)) return;
        SEARCHING.add(props);
        LAST_TRY.put(props, now);
        TRIES.put(props, tries == null ? 1 : tries + 1);
        final Object[] needles = {props, adJson(props, 0), stringField(props, "A0b")};
        final View list = pager;
        final boolean pages = snapping;
        new Thread(new Runnable() {
            @Override
            public void run() {
                Located found = null;
                try {
                    int[] budget = {SEARCH_BUDGET};
                    for (int i = 0; i < items.length && found == null; i++) {
                        Object itemTree = treeOf(items[i]);
                        if (itemTree == null) continue;
                        List<Object> path = new ArrayList<>();
                        if (dfs(itemTree, 0, budget, needles, path)) found = new Located(i, itemTree, path);
                    }
                } catch (Throwable t) {
                    AdLog.log(TAG, "AD VIDEO search failed", t);
                }
                final Located result = found;
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        SEARCHING.remove(props);
                        finish(list, props, result, pages);
                    }
                });
            }
        }, "FbLiteAdLocate").start();
    }

    private static final class Located {
        final int index;
        final Object tree;
        final List<Object> path;

        Located(int index, Object tree, List<Object> path) {
            this.index = index;
            this.tree = tree;
            this.path = path;
        }
    }

    private static void finish(View pager, Object props, Located found, boolean snapping) {
        finish(pager, props, found, snapping, false);
    }

    private static void finish(View pager, Object props, Located found, boolean snapping, boolean wholeItem) {
        try {
            if (found == null) {
                AdLog.log(TAG, "AD VIDEO: no item of the list refers to its props, tracking string or id (try " + TRIES.get(props) + ")");
                return;
            }
            FOUND.put(props, found.tree);
            AdLog.log(TAG, "AD VIDEO belongs to item " + found.index + ", path: " + describePath(found.path));
            if (snapping) {
                AD_TREES.put(found.tree, Boolean.TRUE);
                return;
            }
            // Whole item: Marketplace puts two ads (and their advertiser names) in one row item.
            Object target = wholeItem ? found.tree : hideTarget(found.path);
            int depth = found.path.indexOf(target);
            AdLog.log(TAG, "AD VIDEO hiding " + AdTrace.label(target) + " (path depth " + depth + " of " + (found.path.size() - 1)
                    + ", width " + fWidth.get(target) + " of item width " + fWidth.get(found.path.get(0)) + ", height " + fHeight.get(target) + " -> 0)");
            fHidden.setBoolean(target, true);
            fHeight.setInt(target, 0);
            pager.requestLayout();
            pager.invalidate();
        } catch (Throwable t) {
            AdLog.log(TAG, "AD VIDEO hide failed", t);
        }
    }

    /** One card of a grid when the video sits in a part up to 65% of the item's width, else the whole item. */
    private static Object hideTarget(List<Object> path) throws Exception {
        int rootWidth = fWidth.getInt(path.get(0));
        Object target = null;
        for (int i = path.size() - 1; i >= 0; i--) {
            int w = fWidth.getInt(path.get(i));
            if (w <= 0) continue;
            if (rootWidth > 0 && w <= rootWidth * 0.65f) target = path.get(i);
            else break;
        }
        return target != null ? target : path.get(0);
    }

    private static String describePath(List<Object> path) {
        StringBuilder sb = new StringBuilder();
        try {
            for (Object node : path) {
                if (sb.length() > 0) sb.append(" > ");
                sb.append(AdTrace.label(node)).append("{w=").append(fWidth.get(node)).append(",h=").append(fHeight.get(node)).append('}');
            }
        } catch (Throwable t) {
            sb.append("?");
        }
        return sb.toString();
    }

    // ------------------------------------------------------------------------------------ search

    private static boolean dfs(Object node, int depth, int[] budget, Object[] needles, List<Object> path) {
        if (node == null || depth > 40 || --budget[0] < 0) return false;
        path.add(node);
        if (holds(node, needles)) return true;
        for (Object child : AdTrace.children(node)) if (dfs(child, depth + 1, budget, needles, path)) return true;
        path.remove(path.size() - 1);
        return false;
    }

    private static boolean holds(Object node, Object[] needles) {
        for (Field f : fields(node.getClass())) {
            try {
                Object v = f.get(node);
                if (v == null) continue;
                if (matches(v, needles)) return true;
                if (v instanceof Map) {
                    int n = 0;
                    for (Object value : ((Map<?, ?>) v).values()) {
                        if (++n > 64) break;
                        if (value != null && matches(value, needles)) return true;
                    }
                }
            } catch (Throwable ignored) {
                // Changed while reading.
            }
        }
        return false;
    }

    private static boolean matches(Object value, Object[] needles) {
        for (Object needle : needles) {
            if (needle == null) continue;
            if (value == needle) return true;
            if (needle instanceof String && value instanceof String && value.equals(needle)) return true;
        }
        return false;
    }

    private static Field[] fields(Class<?> c) {
        synchronized (FIELDS) {
            Field[] cached = FIELDS.get(c);
            if (cached != null) return cached;
            List<Field> all = new ArrayList<>();
            for (Class<?> k = c; k != null && k != Object.class; k = k.getSuperclass()) {
                for (Field f : k.getDeclaredFields()) {
                    if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                    try {
                        f.setAccessible(true);
                        all.add(f);
                    } catch (Throwable ignored) {
                    }
                }
            }
            cached = all.toArray(new Field[0]);
            FIELDS.put(c, cached);
            return cached;
        }
    }

    // ------------------------------------------------------------------------------------ props

    /** The tracking JSON of a video's props when it names an ad, else null. Searched by value, two objects deep. */
    private static String adJson(Object props, int depth) {
        if (props == null || depth > 2) return null;
        for (Field f : fields(props.getClass())) {
            try {
                Object v = f.get(props);
                if (v instanceof CharSequence) {
                    String s = v.toString();
                    if (s.length() > 20 && s.charAt(0) == '{' && ADID.matcher(s).find()) return s;
                } else if (v != null && !(v instanceof View) && isAppObject(v)) {
                    String inner = adJson(v, depth + 1);
                    if (inner != null) return inner;
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    private static boolean isAppObject(Object v) {
        String n = v.getClass().getName();
        return n.startsWith("X.") || n.startsWith("com.facebook.");
    }

    private static String stringField(Object target, String name) {
        try {
            Object v = read(target, name);
            return v instanceof String ? (String) v : null;
        } catch (Throwable t) {
            return null;
        }
    }

    // ------------------------------------------------------------------------------------ app objects

    private static boolean resolve(ClassLoader loader) throws Exception {
        if (resolved) return true;
        videoClass = Class.forName("com.facebook.lite.widget.video.FbVideoView", false, loader);
        propsField = videoClass.getDeclaredField("A0F");
        propsField.setAccessible(true);
        component = Class.forName("X.0gp", false, loader);
        fWidth = component.getDeclaredField("A29");
        fHeight = component.getDeclaredField("A0i");
        fHidden = component.getDeclaredField("A2c");
        fWidth.setAccessible(true);
        fHeight.setAccessible(true);
        fHidden.setAccessible(true);
        resolved = true;
        return true;
    }

    private static List<?> listOf(View pager) throws Exception {
        Object layout = read(pager, "A05");
        Object list = layout == null ? null : read(layout, "A0E");
        return list instanceof List ? (List<?>) list : new ArrayList<Object>();
    }

    private static boolean isSnapping(View pager) {
        try {
            Object snap = read(pager, "A07");
            return snap != null && ((Integer) read(snap, "A02")) != 0;
        } catch (Throwable t) {
            return false;
        }
    }

    private static Object treeOf(Object item) {
        try {
            Object wrapper = read(item, "A0B");
            return wrapper == null ? null : read(wrapper, "A03");
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object read(Object target, String name) throws Exception {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
                // Try the superclass.
            }
        }
        throw new NoSuchFieldException(name);
    }
}
