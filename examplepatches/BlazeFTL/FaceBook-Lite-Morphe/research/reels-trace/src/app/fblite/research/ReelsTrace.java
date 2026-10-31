package app.fblite.research;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.widget.MediaController;

import java.io.FileWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Research only: logs the Reels tab's native views, video players, their pager and completion events to
 * cache/morphe_reels_trace.txt. Names are for Facebook Lite 530.0.0.8.106. Call run(application) from
 * the start of attachBaseContext with the Application (p0).
 */
public final class ReelsTrace {
    private static final String OUT = "/storage/emulated/0/Android/data/com.facebook.lite/cache/morphe_reels_trace.txt";
    private static final Handler HANDLER = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Object, Object> OBSERVED = new WeakHashMap<>();
    private static final List<Object> PROXIES = new ArrayList<>();
    private static final Set<String> CONFIG_LOGGED = new HashSet<>();
    private static Activity resumed;
    private static String lastTree = "";
    private static int lastIndex = -2;
    private static int lines;
    private static View lastPager;

    public static void run(Application application) {
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityResumed(Activity activity) {
                log("resumed " + activity.getClass().getName());
                resumed = activity;
                HANDLER.removeCallbacks(TICK);
                HANDLER.postDelayed(TICK, 1000);
            }

            public void onActivityPaused(Activity activity) {
                log("paused " + activity.getClass().getName());
                if (resumed == activity) resumed = null;
            }

            public void onActivityCreated(Activity a, Bundle b) { }
            public void onActivityStarted(Activity a) { }
            public void onActivityStopped(Activity a) { }
            public void onActivitySaveInstanceState(Activity a, Bundle b) { }
            public void onActivityDestroyed(Activity a) { }
        });
    }

    private static final Runnable TICK = new Runnable() {
        public void run() {
            Activity activity = resumed;
            if (activity == null) return;
            try {
                scan(activity.getWindow().getDecorView());
                java.io.File trigger = new java.io.File("/storage/emulated/0/Android/data/com.facebook.lite/cache/fblite-dump-reels");
                if (trigger.exists() && lastPager != null) {
                    trigger.delete();
                    dumpReels(lastPager);
                }
            } catch (Throwable t) {
                log("scan error " + t);
            }
            HANDLER.postDelayed(this, 1000);
        }
    };

    private static void scan(View root) throws Exception {
        StringBuilder tree = new StringBuilder();
        List<View> videos = new ArrayList<>();
        walk(root, 0, tree, videos);
        String t = tree.toString();
        if (!t.equals(lastTree)) {
            lastTree = t;
            log("TREE\n" + t);
        }
        for (View video : videos) describe(video);
    }

    private static void walk(View view, int depth, StringBuilder tree, List<View> videos) throws Exception {
        if (depth > 40 || view.getVisibility() != View.VISIBLE) return;
        String chain = chain(view.getClass());
        boolean interesting = chain.contains("RecyclerView") || chain.contains("FbVideoView") || chain.contains("X.2c5")
                || chain.contains("X.2c6") || chain.contains("Texture") || chain.contains("Surface") || hasPlayerField(view);
        if (interesting || depth < 6) {
            for (int i = 0; i < depth; i++) tree.append(' ');
            tree.append(chain).append(' ').append(view.getWidth()).append('x').append(view.getHeight())
                    .append(interesting ? " *" : "").append('\n');
        }
        if (chain.contains("FbVideoView")) videos.add(view);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) walk(group.getChildAt(i), depth + 1, tree, videos);
        }
    }

    private static String chain(Class<?> c) {
        StringBuilder sb = new StringBuilder(c.getName());
        for (Class<?> s = c.getSuperclass(); s != null && !s.getName().startsWith("android.") && !s.getName().startsWith("java."); s = s.getSuperclass()) {
            sb.append('<').append(s.getName());
        }
        return sb.toString();
    }

    private static boolean hasPlayerField(Object o) {
        for (Class<?> c = o.getClass(); c != null && !c.getName().startsWith("android."); c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (MediaController.MediaPlayerControl.class.isAssignableFrom(f.getType())) return true;
            }
        }
        return false;
    }

    private static Object call(Object target, String method) {
        try {
            Method m = target.getClass().getMethod(method);
            return m.invoke(target);
        } catch (Throwable t) {
            return "?" + t.getClass().getSimpleName();
        }
    }

    private static Object field(Object target, String name) {
        for (Class<?> c = target.getClass(); c != null; c = c.getSuperclass()) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(target);
            } catch (NoSuchFieldException ignored) {
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    private static void describe(View video) throws Exception {
        Object id = call(video, "getVideoId");
        Object player = field(video, "A0G");
        String state = "";
        if (player instanceof MediaController.MediaPlayerControl) {
            MediaController.MediaPlayerControl p = (MediaController.MediaPlayerControl) player;
            state = " pos=" + p.getCurrentPosition() + "/" + p.getDuration() + " playing=" + p.isPlaying();
        }
        String key = String.valueOf(id);
        if (CONFIG_LOGGED.add(key)) {
            Object config = call(video, "getVideoExtraConfig");
            StringBuilder cfg = new StringBuilder();
            if (config != null) {
                for (String f : new String[] {"A1k", "A0S", "A1G", "A0Z", "A0e", "A0k", "A03", "A02"}) {
                    Object v = field(config, f);
                    String s = String.valueOf(v);
                    if (s.length() > 600) s = s.substring(0, 600);
                    cfg.append(f).append('=').append(s).append(' ');
                }
            }
            Object a0f = field(video, "A0F");
            log("VIDEO " + key + " " + video.getClass().getName() + " " + video.getWidth() + "x" + video.getHeight()
                    + " autoscrollAction=" + (a0f == null ? "noA0F" : String.valueOf(field(a0f, "A04"))) + " config: " + cfg);
            observe(video, key);
        }
        // Pager: nearest RecyclerView ancestor.
        View rv = null;
        for (Object p = video.getParent(); p instanceof View; p = ((View) p).getParent()) {
            if (chain(p.getClass()).contains("X.0zb")) {
                rv = (View) p;
                break;
            }
        }
        String pager = "noPager";
        if (rv != null) lastPager = rv;
        if (rv != null) {
            Object lm = field(rv, "A05");
            Object snap = field(rv, "A07");
            Object index = lm == null ? null : field(lm, "A03");
            Object count = lm == null ? null : call(lm, "A0W");
            pager = "rv=" + System.identityHashCode(rv) + " " + rv.getWidth() + "x" + rv.getHeight() + " horizontal=" + call(rv, "AQS")
                    + " snapMode=" + (snap == null ? null : field(snap, "A02")) + " handler=" + (field(rv, "A08") != null)
                    + " index=" + index + " count=" + count;
            int idx = index instanceof Integer ? (Integer) index : -1;
            if (idx != lastIndex) {
                log("INDEX " + lastIndex + " -> " + idx);
                lastIndex = idx;
            }
        }
        if ((SystemClock.uptimeMillis() / 1000) % 3 == 0) log("tick " + key + state + " " + pager);
    }

    private static void dumpReels(View rv) throws Exception {
        Object lm = field(rv, "A05");
        List<?> items = (List<?>) field(lm, "A0E");
        log("REELS current=" + field(lm, "A03") + " items=" + (items == null ? -1 : items.size()));
        if (items == null) return;
        Class<?> gp = Class.forName("X.0gp", false, rv.getClass().getClassLoader());
        Class<?> gs = Class.forName("X.0gs", false, rv.getClass().getClassLoader());
        for (int i = 0; i < items.size(); i++) {
            Object item = items.get(i);
            Object wrapper = field(item, "A0B");
            Object component = wrapper == null ? null : field(wrapper, "A03");
            StringBuilder texts = new StringBuilder();
            int[] counts = new int[4];
            if (component != null) walkComponent(component, gp, gs, 0, texts, counts);
            Object meta = component != null && gs.isInstance(component) ? declared(component, gs, "A0K") : null;
            String t = texts.toString();
            int[] marks = new int[3];
            if (component != null) marks(component, gp, 0, marks);
            log("REEL idx=" + i + " snap=" + field(item, "A0N") + " id=" + field(item, "A0J") + " h=" + field(item, "A01")
                    + " D=" + field(item, "A0D") + " E=" + field(item, "A0E") + " F=" + field(item, "A0F") + " G=" + field(item, "A0G")
                    + " comp=" + (component == null ? null : component.getClass().getName())
                    + " meta=" + (meta == null ? null : field(meta, "A09") + "/" + field(meta, "A0B"))
                    + " MARKS hW.A32=" + marks[0] + " nN.A2t=" + marks[1] + " gwA04L3=" + marks[2]
                    + " nodes=" + counts[0] + " A2X=" + counts[1] + " A2k=" + counts[2] + " A0M=" + counts[3]
                    + " text=" + (t.length() > 300 ? t.substring(0, 300) : t));
        }
    }

    private static void deepComponent(String label, Object node, Class<?> gp, Class<?> gs, int depth) throws Exception {
        if (node == null || depth > 30) return;
        StringBuilder sb = new StringBuilder();
        for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object v = f.get(node);
                if (v == null) continue;
                String s;
                if (v instanceof Boolean) { if (!(Boolean) v) continue; s = "T"; }
                else if (v instanceof Number) { double d = ((Number) v).doubleValue(); if (d == 0 || d == -1 || d == -128 || d == -32768 || d == -32767 || d == 2147483647) continue; s = v.toString(); }
                else if (v instanceof String) { if (((String) v).isEmpty()) continue; s = "\"" + (((String) v).length() > 40 ? ((String) v).substring(0, 40) : v) + "\""; }
                else if (v instanceof List) s = "L" + ((List<?>) v).size();
                else s = v.getClass().getName().replace("X.", "");
                sb.append(c.getName().replace("X.", "")).append('.').append(f.getName()).append('=').append(s).append(' ');
            }
        }
        String text = "";
        try { Object t = node.getClass().getMethod("AIW").invoke(node); if (t != null) text = " TEXT=" + t; } catch (NoSuchMethodException ignored) { }
        StringBuilder pad = new StringBuilder();
        for (int i = 0; i < depth; i++) pad.append('.');
        log("DEEP " + label + " " + pad + node.getClass().getName() + text + " | " + sb);
        try {
            Object children = node.getClass().getMethod("AF0").invoke(node);
            if (children instanceof List) for (Object c : (List<?>) children) deepComponent(label, c, gp, gs, depth + 1);
        } catch (NoSuchMethodException ignored) {
        }
    }

    private static void marks(Object node, Class<?> gp, int depth, int[] marks) throws Exception {
        if (node == null || depth > 30) return;
        String name = node.getClass().getName();
        if (name.equals("X.0hW") && (Boolean) declared(node, gp, "A32")) marks[0]++;
        if (name.equals("X.0nN") && (Boolean) declared(node, gp, "A2t")) marks[1]++;
        if (name.equals("X.0gw")) {
            Object l = declared(node, node.getClass(), "A04");
            if (l instanceof List && ((List<?>) l).size() == 3) marks[2]++;
        }
        try {
            Object children = node.getClass().getMethod("AF0").invoke(node);
            if (children instanceof List) for (Object c : (List<?>) children) marks(c, gp, depth + 1, marks);
        } catch (NoSuchMethodException ignored) {
        }
    }

    private static Object declared(Object target, Class<?> c, String name) throws Exception {
        Field f = c.getDeclaredField(name);
        f.setAccessible(true);
        return f.get(target);
    }

    private static void walkComponent(Object node, Class<?> gp, Class<?> gs, int depth, StringBuilder texts, int[] counts) throws Exception {
        if (node == null || depth > 40 || counts[0] > 4000) return;
        counts[0]++;
        if (gp.isInstance(node)) {
            if ((Boolean) declared(node, gp, "A2X")) counts[1]++;
            if ((Boolean) declared(node, gp, "A2k")) counts[2]++;
        }
        if (gs.isInstance(node) && declared(node, gs, "A0M") != null) counts[3]++;
        try {
            Method aiw = node.getClass().getMethod("AIW");
            Object s = aiw.invoke(node);
            if (s != null && texts.length() < 1500) texts.append(s).append(" | ");
        } catch (NoSuchMethodException ignored) {
        }
        try {
            Object children = node.getClass().getMethod("AF0").invoke(node);
            if (children instanceof List) for (Object c : (List<?>) children) walkComponent(c, gp, gs, depth + 1, texts, counts);
        } catch (NoSuchMethodException ignored) {
        }
    }

    private static void observe(View video, final String key) {
        try {
            Object observers = field(video, "A0I");
            if (observers == null || OBSERVED.containsKey(observers)) {
                if (observers == null) log("no A0I for " + key);
                return;
            }
            Class<?> listener = Class.forName("X.1cF", false, video.getClass().getClassLoader());
            Object proxy = Proxy.newProxyInstance(listener.getClassLoader(), new Class<?>[] {listener}, new InvocationHandler() {
                public Object invoke(Object p, Method m, Object[] args) {
                    if (m.getDeclaringClass() == Object.class) {
                        if (m.getName().equals("hashCode")) return System.identityHashCode(p);
                        if (m.getName().equals("equals")) return p == args[0];
                        return "ReelsTraceProxy";
                    }
                    if (!m.getName().equals("AfP") || (SystemClock.uptimeMillis() / 1000) % 5 == 0) {
                        StringBuilder a = new StringBuilder();
                        if (args != null) for (Object o : args) a.append(o).append(',');
                        log("EVENT " + key + " " + m.getName() + "(" + a + ")");
                    }
                    return null;
                }
            });
            PROXIES.add(proxy);
            Method add = observers.getClass().getMethod("A02", listener);
            add.invoke(observers, proxy);
            OBSERVED.put(observers, Boolean.TRUE);
            log("observing " + key);
        } catch (Throwable t) {
            log("observe error " + key + " " + t);
        }
    }

    private static void log(String s) {
        if (lines++ > 20000) return;
        try {
            FileWriter w = new FileWriter(OUT, true);
            w.write(SystemClock.uptimeMillis() + " " + s + "\n");
            w.close();
        } catch (Throwable ignored) {
        }
    }
}
