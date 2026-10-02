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
 * Names are for Facebook Lite 530.0.0.8.106. Any reflection error turns this off.
 */
public final class SponsoredReels {
    private static final long SCAN_INTERVAL_MS = 500;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Component tree -> sponsored. A reel does not become organic, so results are kept. */
    private static final WeakHashMap<Object, Boolean> SPONSORED = new WeakHashMap<>();

    private static Activity resumed;
    private static boolean disabled;
    private static long lastSkip;
    private static Class<?> component, pagerClass, textClass;
    private static Field a32, a2z, children;
    private static Method childList;

    private SponsoredReels() {
    }

    /** Called at the start of Application.attachBaseContext. */
    public static void install(Application application) {
        try {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityResumed(Activity activity) {
                    if (!activity.getClass().getName().equals("com.facebook.lite.MainActivity")) return;
                    resumed = activity;
                    MAIN.removeCallbacks(SCAN);
                    MAIN.postDelayed(SCAN, SCAN_INTERVAL_MS);
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (resumed != activity) return;
                    resumed = null;
                    MAIN.removeCallbacks(SCAN);
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
            Activity activity = resumed;
            if (activity == null || disabled) return;
            try {
                if (component == null) resolve(activity.getClassLoader());
                scan(activity.getWindow().getDecorView());
            } catch (Throwable t) {
                disabled = true;
                Log.e(OriginalClass.TAG, "Skipping sponsored reels failed, turning it off", t);
            }
            MAIN.postDelayed(this, SCAN_INTERVAL_MS);
        }
    };

    private static void scan(View view) throws Exception {
        if (view.getVisibility() != View.VISIBLE) return;
        if (pagerClass.isInstance(view)) {
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
        int current = (Integer) field(layout, layout.getClass(), "A03");
        boolean currentSponsored = markUnsnappable(items, current);
        // The snap handler searches its own item list, which may hold other item objects.
        Object snapItems = field(snap, snap.getClass(), "A04");
        if (snapItems != items && snapItems instanceof List) markUnsnappable((List<?>) snapItems, -1);

        long now = SystemClock.uptimeMillis();
        if (currentSponsored && now - lastSkip > 700) {
            Method nextSnap = snap.getClass().getMethod("A00", pager.getClass().getClassLoader().loadClass("X.0yV"), int.class, int.class);
            int next = (Integer) nextSnap.invoke(null, snapItems, current + 1, 1);
            debug("Sponsored reel at " + current + " is current, moving to " + next);
            if (next > current) {
                handler.getClass().getMethod("A04", int.class).invoke(handler, next);
                lastSkip = now;
            }
        }
    }

    /** Makes sponsored items unsnappable. Returns whether the item at current is sponsored. */
    private static boolean markUnsnappable(List<?> items, int current) throws Exception {
        boolean currentSponsored = false;
        for (int i = 0; i < items.size(); i++) {
            Object item = items.get(i);
            Object wrapper = field(item, item.getClass(), "A0B");
            Object tree = wrapper == null ? null : field(wrapper, wrapper.getClass(), "A03");
            if (tree == null || !isSponsored(tree)) continue;
            Field snappable = item.getClass().getDeclaredField("A0N");
            snappable.setBoolean(item, false);
            a2z.setBoolean(tree, false);
            if (i == current) currentSponsored = true;
        }
        return currentSponsored;
    }

    private static boolean isSponsored(Object tree) throws Exception {
        Boolean cached = SPONSORED.get(tree);
        if (cached != null) return cached;
        boolean sponsored = countFlaggedText(tree, 0) >= 2;
        SPONSORED.put(tree, sponsored);
        if (DEBUG) debug((sponsored ? "SPONSORED " : "organic ") + text(tree, 0, new StringBuilder()));
        return sponsored;
    }

    private static int countFlaggedText(Object node, int depth) throws Exception {
        if (node == null || depth > 30) return 0;
        int count = textClass.isInstance(node) && a32.getBoolean(node) ? 1 : 0;
        if (childList.getDeclaringClass().isInstance(node)) {
            Object list = childList.invoke(node);
            if (list instanceof List) {
                for (Object child : (List<?>) list) {
                    count += countFlaggedText(child, depth + 1);
                    if (count >= 2) return count;
                }
            }
        }
        return count;
    }

    private static final String DEBUG_DIR = "/storage/emulated/0/Android/data/com.facebook.lite/cache/";
    private static final boolean DEBUG = new java.io.File(DEBUG_DIR + "fblite-hideads-debug").exists();

    private static String text(Object node, int depth, StringBuilder out) throws Exception {
        if (node == null || depth > 30 || out.length() > 160) return out.toString();
        try {
            Object s = node.getClass().getMethod("AIW").invoke(node);
            if (s != null && !s.toString().isEmpty()) out.append(s).append(" | ");
        } catch (NoSuchMethodException ignored) {
        }
        if (childList.getDeclaringClass().isInstance(node)) {
            Object list = childList.invoke(node);
            if (list instanceof List) for (Object child : (List<?>) list) text(child, depth + 1, out);
        }
        return out.toString();
    }

    private static void debug(String message) {
        if (!DEBUG) return;
        try {
            java.io.FileWriter writer = new java.io.FileWriter(DEBUG_DIR + "fblite-hideads.log", true);
            writer.write(System.currentTimeMillis() + " " + message.replace('\n', ' ') + "\n");
            writer.close();
        } catch (Throwable ignored) {
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
