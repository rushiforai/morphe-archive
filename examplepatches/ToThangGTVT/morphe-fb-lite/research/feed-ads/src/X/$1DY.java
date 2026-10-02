package X;

import android.os.SystemClock;

import java.io.File;
import java.io.FileWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/** Trace-only wrapper of X.1DY (props decoder). Delegates to the original and logs feed posts. Research only. */
public abstract class $1DY {
    private static final String OUT = "/storage/emulated/0/Android/data/com.facebook.lite/cache/fblite-ads.txt";
    private static Method a00, a01, a02;
    private static boolean loadFailed;
    private static final List<Object[]> pending = new ArrayList<>();
    private static int lines;
    private static Field fA0K, fA1b, fA0x, fA0i, fA29, fA1H, fA1I, fA1J, fA18, fA0v, fA2c;
    private static Method mAF0, mAIW;
    private static Class<?> textClass;
    private static java.lang.ref.WeakReference<Object> lastFeed;
    private static long lastTriggerCheck;
    private static final boolean HIDE = new File("/storage/emulated/0/Android/data/com.facebook.lite/cache/fblite-hide-ads").exists();
    private static int hiddenLogged;
    private static Field fA2X, fA2k, fA0M;
    private static final String TRIGGER = "/storage/emulated/0/Android/data/com.facebook.lite/cache/fblite-dump-feed";

    public static Object A00($0gn a, $0Fu b, int c) {
        return call(0, new Object[] {a, b, c});
    }

    public static void A01($1Hr a, $0Fu b, int c, boolean d) {
        call(1, new Object[] {a, b, c, d});
    }

    public static void A02($0gs a, $0Fu b, int c, boolean d) {
        processPending();
        call(2, new Object[] {a, b, c, d});
        try {
            field("A0K");
            if (fA0K.get(a) != null) {
                Object parent = fA18.get(a);
                if (parent != null && ((Short) fA1b.get(parent)) == 30001) lastFeed = new java.lang.ref.WeakReference<Object>(parent);
            }
            if (HIDE) hideAds();
            long now = SystemClock.uptimeMillis();
            if (now - lastTriggerCheck > 1000) {
                lastTriggerCheck = now;
                File trigger = new File(TRIGGER);
                if (trigger.exists()) {
                    trigger.delete();
                    dumpFeed();
                }
            }
            Object meta = fA0K.get(a);
            if (meta != null) synchronized (pending) {
                pending.add(new Object[] {a, SystemClock.uptimeMillis()});
            }
        } catch (Throwable t) {
            log("trace error " + t);
        }
    }

    public static boolean A03(byte b, int i) {
        return (b & (1 << (i % 8))) != 0;
    }

    private static Object call(int which, Object[] args) {
        if (!load()) throw new IllegalStateException("original X.1DY not loaded");
        try {
            return (which == 0 ? a00 : which == 1 ? a01 : a02).invoke(null, args);
        } catch (InvocationTargetException e) {
            Throwable cause = e.getCause();
            if (cause instanceof RuntimeException) throw (RuntimeException) cause;
            if (cause instanceof Error) throw (Error) cause;
            throw new RuntimeException(cause);
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    private static synchronized boolean load() {
        if (a02 != null) return true;
        if (loadFailed) return false;
        try {
            final ClassLoader app = $1DY.class.getClassLoader();
            ClassLoader hide = new ClassLoader(app) {
                @Override
                protected Class<?> loadClass(String name, boolean resolve) throws ClassNotFoundException {
                    if (name.equals("X.1DY")) throw new ClassNotFoundException(name);
                    return super.loadClass(name, resolve);
                }
            };
            Class<?> loaderClass = Class.forName("X.09K", false, app);
            Object loader = loaderClass.getField("A0A").get(null);
            for (dalvik.system.DexFile dex : (dalvik.system.DexFile[]) loaderClass.getField("A02").get(loader)) {
                if (dex == null || dex.getName().endsWith(".apk")) continue;
                try {
                    Class<?> orig = new dalvik.system.PathClassLoader(dex.getName(), hide).loadClass("X.1DY");
                    Class<?> gn = Class.forName("X.0gn", false, app), fu = Class.forName("X.0Fu", false, app);
                    Class<?> hr = Class.forName("X.1Hr", false, app), gs = Class.forName("X.0gs", false, app);
                    a00 = orig.getMethod("A00", gn, fu, int.class);
                    a01 = orig.getMethod("A01", hr, fu, int.class, boolean.class);
                    a02 = orig.getMethod("A02", gs, fu, int.class, boolean.class);
                    log("original X.1DY from " + dex.getName());
                    return true;
                } catch (ClassNotFoundException ignored) {
                }
            }
            log("original X.1DY not found");
        } catch (Throwable t) {
            log("load error " + t);
        }
        loadFailed = true;
        return false;
    }

    private static Field field(String name) throws Exception {
        if (fA0K == null) {
            Class<?> gp = Class.forName("X.0gp"), gs = Class.forName("X.0gs");
            fA0K = gs.getDeclaredField("A0K");
            fA1b = gp.getDeclaredField("A1b");
            fA0x = gp.getDeclaredField("A0x");
            fA0i = gp.getDeclaredField("A0i");
            fA29 = gp.getDeclaredField("A29");
            fA1H = gp.getDeclaredField("A1H");
            fA1I = gp.getDeclaredField("A1I");
            fA1J = gp.getDeclaredField("A1J");
            fA18 = gp.getDeclaredField("A18");
            fA0v = gp.getDeclaredField("A0v");
            fA2c = gp.getDeclaredField("A2c");
            textClass = Class.forName("X.0hQ");
            mAIW = textClass.getMethod("AIW");
            mAF0 = Class.forName("X.0gn").getMethod("AF0");
        }
        switch (name) {
            case "A0K": return fA0K;
            default: throw new IllegalArgumentException(name);
        }
    }

    private static void processPending() {
        List<Object[]> ready = new ArrayList<>();
        long now = SystemClock.uptimeMillis();
        synchronized (pending) {
            for (int i = pending.size() - 1; i >= 0; i--) {
                if (now - (Long) pending.get(i)[1] > 1500) ready.add(pending.remove(i));
            }
        }
        for (Object[] p : ready) {
            try {
                describe(p[0]);
            } catch (Throwable t) {
                log("describe error " + t);
            }
        }
    }

    private static void describe(Object post) throws Exception {
        if (lines > 4000) return;
        field("A0K");
        Object meta = fA0K.get(post);
        StringBuilder texts = new StringBuilder();
        StringBuilder keys = new StringBuilder();
        walk(post, 0, texts, keys);
        String all = texts.toString();
        boolean flagged = all.contains("tài trợ") || all.contains("Sponsored") || all.contains("Được tài");
        Object parent = fA18.get(post);
        String parentInfo = "none";
        if (parent != null) {
            List<?> siblings = (List<?>) mAF0.invoke(parent);
            parentInfo = fA1b.get(parent) + " idx=" + (siblings != null ? siblings.indexOf(post) : -1);
        }
        StringBuilder m = new StringBuilder();
        for (String f : new String[] {"A09", "A0B", "A0C", "A03", "A02", "A0D", "A04", "A05", "A00", "A01", "A0A", "A07", "A08"}) {
            Object v = meta.getClass().getField(f).get(meta);
            String s = String.valueOf(v);
            if (s.length() > 40) s = s.substring(0, 40);
            m.append(f).append('=').append(s).append(' ');
        }
        byte[] e = (byte[]) meta.getClass().getField("A0E").get(meta);
        m.append("A0E.len=").append(e == null ? -1 : e.length);
        log((flagged ? "AD " : "-- ") + "post#" + System.identityHashCode(post) + " " + post.getClass().getName()
                + " id=" + fA1b.get(post) + " y=" + fA0x.get(post) + " h=" + fA0i.get(post) + " w=" + fA29.get(post)
                + " hidden=" + fA2c.get(post) + " key=" + fA1H.get(post) + "/" + fA1I.get(post) + "/" + fA1J.get(post)
                + " parent=" + parentInfo + " | " + m + " | keys:" + keys + " | text:" + (all.length() > 160 ? all.substring(0, 160) : all));
    }

    private static void dumpFeed() {
        try {
            Object feed = lastFeed != null ? lastFeed.get() : null;
            if (feed == null) {
                log("dump: no feed container yet");
                return;
            }
            List<?> children = (List<?>) mAF0.invoke(feed);
            log("dump: feed " + System.identityHashCode(feed) + " children=" + (children == null ? -1 : children.size()));
            if (children == null) return;
            int organicDumped = 0;
            for (int i = 0; i < children.size(); i++) {
                Object child = children.get(i);
                String groupText = subtreeText(child);
                boolean isAd = groupText.contains("tài trợ") || groupText.contains("Sponsored");
                if (false && (isAd || (organicDumped < 1 && groupText.contains("bình luận") == false && fA0v.get(child).equals(fA0v.get(children.get(Math.min(i + 1, children.size() - 1)))) && ((Integer) fA0v.get(child)) != 0)) && i >= 2) {
                    if (!isAd) organicDumped++;
                    for (int j = Math.max(0, i - 2); j <= Math.min(children.size() - 1, i + 1); j++) {
                        deepDump("G" + i + (isAd ? "AD" : "ORG") + " child idx=" + j, children.get(j), 0);
                    }
                }
                StringBuilder texts = new StringBuilder();
                StringBuilder keys = new StringBuilder();
                int[] count = new int[1];
                StringBuilder classes = new StringBuilder();
                walk2(child, 0, texts, keys, count, classes);
                Object meta = Class.forName("X.0gs").isInstance(child) ? fA0K.get(child) : null;
                String all = texts.toString();
                boolean flagged = all.contains("tài trợ") || all.contains("Sponsored");
                log((flagged ? "AD " : "-- ") + "idx=" + i + " " + child.getClass().getName() + " id=" + fA1b.get(child)
                        + " y=" + fA0x.get(child) + " h=" + fA0i.get(child) + " v=" + fA0v.get(child)
                        + " meta=" + (meta == null ? "null" : meta.getClass().getField("A09").get(meta) + "/" + meta.getClass().getField("A0B").get(meta))
                        + " key=" + fA1H.get(child) + "/" + fA1I.get(child) + "/" + fA1J.get(child)
                        + " nodes=" + count[0] + " feat=" + features(child) + " keys:" + keys
                        + " text:" + (all.length() > 200 ? all.substring(0, 200) : all));
            }
        } catch (Throwable t) {
            log("dump error " + t);
        }
    }

    private static void hideAds() throws Exception {
        Object feed = lastFeed != null ? lastFeed.get() : null;
        if (feed == null) return;
        if (fA2X == null) {
            Class<?> gp = Class.forName("X.0gp");
            fA2X = gp.getDeclaredField("A2X");
            fA2k = gp.getDeclaredField("A2k");
            fA0M = Class.forName("X.0gs").getDeclaredField("A0M");
        }
        List<?> children = (List<?>) mAF0.invoke(feed);
        if (children == null) return;
        java.util.Set<Integer> groups = new java.util.HashSet<>();
        for (Object child : children) {
            int group = (Integer) fA0v.get(child);
            if (group != 0 && (Boolean) fA2X.get(child) && (Boolean) fA2k.get(child) && fA0M.get(child) != null) groups.add(group);
        }
        if (groups.isEmpty()) return;
        for (Object child : children) {
            if (!groups.contains((Integer) fA0v.get(child))) continue;
            if (!(Boolean) fA2c.get(child)) {
                if (hiddenLogged++ < 200) log("hide group " + fA0v.get(child) + " h=" + fA0i.get(child) + " text=" + subtreeText(child).replace("\n", " ").substring(0, Math.min(60, subtreeText(child).length())));
                fA2c.set(child, true);
            }
            if ((Integer) fA0i.get(child) != 0) fA0i.set(child, 0);
        }
    }

    private static String features(Object node) throws Exception {
        StringBuilder sb = new StringBuilder();
        Class<?> gp = Class.forName("X.0gp"), gs = Class.forName("X.0gs");
        for (String f : new String[] {"A2X", "A2k", "A2a", "A25", "A37", "A0e", "A2t"}) {
            Field fd = gp.getDeclaredField(f);
            fd.setAccessible(true);
            sb.append(f).append('=').append(fd.get(node)).append(',');
        }
        for (String f : new String[] {"A0M", "A0N", "A0P", "A0q", "A0y", "A0E"}) {
            Field fd = gs.getDeclaredField(f);
            fd.setAccessible(true);
            Object v = fd.get(node);
            sb.append(f).append('=').append(v == null ? "-" : (v instanceof Boolean || v instanceof Number) ? v.toString() : "obj").append(',');
        }
        return sb.toString();
    }

    private static String subtreeText(Object node) throws Exception {
        StringBuilder texts = new StringBuilder();
        walk2(node, 0, texts, new StringBuilder(), new int[1], new StringBuilder());
        return texts.toString();
    }

    private static void deepDump(String label, Object node, int depth) throws Exception {
        if (node == null || depth > 2) return;
        StringBuilder sb = new StringBuilder();
        for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            for (Field f : c.getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object v = f.get(node);
                if (v == null) continue;
                String s;
                if (v instanceof Boolean) { if (!(Boolean) v) continue; s = "T"; }
                else if (v instanceof Number) { if (((Number) v).doubleValue() == 0) continue; s = v.toString(); }
                else if (v instanceof String) { s = "\"" + (((String) v).length() > 60 ? ((String) v).substring(0, 60) : v) + "\""; }
                else if (v instanceof byte[]) s = "byte[" + ((byte[]) v).length + "]";
                else if (v instanceof int[]) s = "int[" + ((int[]) v).length + "]";
                else if (v instanceof List) s = "List(" + ((List<?>) v).size() + ")";
                else s = v.getClass().getName();
                sb.append(c.getName().substring(2)).append('.').append(f.getName()).append('=').append(s).append(' ');
            }
        }
        log("DEEP " + label + " d" + depth + " " + node.getClass().getName() + " " + sb);
        Method af0 = null;
        try { af0 = node.getClass().getMethod("AF0"); } catch (NoSuchMethodException ignored) { }
        if (af0 == null) return;
        Object children = af0.invoke(node);
        if (!(children instanceof List)) return;
        int n = 0;
        for (Object c : (List<?>) children) { if (n++ > 6) break; deepDump(label, c, depth + 1); }
    }

    private static void walk2(Object node, int depth, StringBuilder texts, StringBuilder keys, int[] count, StringBuilder classes) throws Exception {
        if (node == null || depth > 40 || count[0] > 3000) return;
        count[0]++;
        if (depth <= 1 && classes.length() < 200) classes.append(depth).append(':').append(node.getClass().getName()).append(',');
        if (textClass.isInstance(node)) {
            Object s = mAIW.invoke(node);
            if (s != null && texts.length() < 2000) texts.append(s).append(" ¦ ");
        }
        Object k = fA1H.get(node);
        if (k != null && keys.length() < 400) keys.append(depth).append(':').append(fA1b.get(node)).append(':').append(k).append('/').append(fA1I.get(node)).append('/').append(fA1J.get(node)).append(' ');
        Method af0 = null;
        try {
            af0 = node.getClass().getMethod("AF0");
        } catch (NoSuchMethodException ignored) {
        }
        if (af0 == null) return;
        Object children = af0.invoke(node);
        if (!(children instanceof List)) return;
        for (Object c : (List<?>) children) walk2(c, depth + 1, texts, keys, count, classes);
    }

    private static void walk(Object node, int depth, StringBuilder texts, StringBuilder keys) throws Exception {
        if (node == null || depth > 40 || texts.length() > 2000) return;
        if (textClass.isInstance(node)) {
            Object s = mAIW.invoke(node);
            if (s != null) texts.append(s).append(" ¦ ");
        }
        Object k = fA1H.get(node);
        if (k != null && keys.length() < 300) keys.append(depth).append(':').append(fA1b.get(node)).append(':').append(k).append('/').append(fA1I.get(node)).append(' ');
        if (!Class.forName("X.0gn").isInstance(node)) return;
        List<?> children = (List<?>) mAF0.invoke(node);
        if (children == null) return;
        for (Object c : children) walk(c, depth + 1, texts, keys);
    }

    static void log(String s) {
        lines++;
        try {
            FileWriter w = new FileWriter(OUT, true);
            w.write(System.currentTimeMillis() + " " + s.replace('\n', ' ') + "\n");
            w.close();
        } catch (Throwable ignored) {
        }
    }
}
