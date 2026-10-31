package app.fblite.extension.video;

import android.content.Context;
import android.view.View;

import java.lang.ref.Reference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.nio.charset.StandardCharsets;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;

import app.fblite.extension.settings.MorpheLog;

/**
 * Reflective search through a video's objects for what the download needs: the DASH manifest and video
 * addresses. Everything is found by value, not by field name, so obfuscated names do not matter. Also
 * dumps the same objects to the debug log to see where Facebook keeps them.
 */
final class ObjectScan {
    /** Order of the roots handed to {@link #run} and {@link VideoDownloader.Source#roots}. */
    static final String[] ROOT_NAMES = {"props", "command", "player", "view"};

    static final class Hit {
        final String path;
        final String text;

        Hit(String path, String text) {
            this.path = path;
            this.text = text;
        }
    }

    private static final int MAX_NODES = 1500;
    private static final int MAX_DEPTH = 4;
    private static final int MAX_ELEMENTS = 64;

    final List<Hit> manifests = new ArrayList<>();
    final List<Hit> urls = new ArrayList<>();
    /** Long JSON texts (video settings), for the debug log. */
    final List<Hit> jsons = new ArrayList<>();
    int nodes;
    private final Set<String> seenText = new LinkedHashSet<>();

    private ObjectScan() {
    }

    static ObjectScan run(Object[] roots) {
        ObjectScan scan = new ObjectScan();
        try {
            scan.walk(roots);
        } catch (Throwable t) {
            VideoFeatures.log("Scan stopped", t);
        }
        return scan;
    }

    /** The first manifest text, or null. */
    String manifest() {
        return manifests.isEmpty() ? null : manifests.get(0).text;
    }

    private void walk(Object[] roots) {
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        ArrayDeque<Object[]> queue = new ArrayDeque<>();
        for (int i = 0; i < roots.length; i++) {
            Object root = roots[i];
            if (root != null && seen.put(root, Boolean.TRUE) == null) {
                queue.add(new Object[] {root, 0, i < ROOT_NAMES.length ? ROOT_NAMES[i] : "root" + i});
            }
        }
        while (!queue.isEmpty() && nodes < MAX_NODES) {
            Object[] entry = queue.poll();
            Object node = entry[0];
            int depth = (Integer) entry[1];
            String path = (String) entry[2];
            nodes++;
            for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                Field[] fields;
                try {
                    fields = c.getDeclaredFields();
                } catch (Throwable t) {
                    continue;
                }
                for (Field f : fields) {
                    if (Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
                    Object value;
                    try {
                        f.setAccessible(true);
                        value = f.get(node);
                    } catch (Throwable t) {
                        continue;
                    }
                    if (value == null) continue;
                    visit(value, path + "." + f.getName(), depth, seen, queue);
                }
            }
        }
    }

    private void visit(Object value, String path, int depth, IdentityHashMap<Object, Boolean> seen, ArrayDeque<Object[]> queue) {
        if (value instanceof Reference) {
            value = ((Reference<?>) value).get();
            if (value == null) return;
        } else if (value instanceof AtomicReference) {
            value = ((AtomicReference<?>) value).get();
            if (value == null) return;
        }
        if (value instanceof CharSequence) {
            classify(path, value.toString());
        } else if (value instanceof byte[]) {
            byte[] bytes = (byte[]) value;
            if (bytes.length > 64 && bytes.length < 256 * 1024) {
                String head = new String(bytes, 0, Math.min(bytes.length, 8), StandardCharsets.ISO_8859_1);
                if (head.startsWith("<MPD") || head.startsWith("<?xml") || head.startsWith("http")) {
                    classify(path, new String(bytes, StandardCharsets.UTF_8));
                }
            }
        } else if (value instanceof char[]) {
            char[] chars = (char[]) value;
            if (chars.length > 64 && chars.length < 256 * 1024) classify(path, new String(chars));
        } else if (value instanceof Map) {
            try {
                int count = 0;
                for (Map.Entry<?, ?> e : ((Map<?, ?>) value).entrySet()) {
                    if (++count > MAX_ELEMENTS) break;
                    String key = String.valueOf(e.getKey());
                    if (key.length() > 24) key = key.substring(0, 24);
                    visitElement(e.getValue(), path + "{" + key + "}", depth, seen, queue);
                }
            } catch (Throwable ignored) {
                // Changed while reading.
            }
        } else if (value instanceof Iterable) {
            try {
                int count = 0;
                for (Object element : (Iterable<?>) value) {
                    if (++count > MAX_ELEMENTS) break;
                    visitElement(element, path + "[" + (count - 1) + "]", depth, seen, queue);
                }
            } catch (Throwable ignored) {
                // Changed while reading.
            }
        } else if (value instanceof Object[]) {
            Object[] array = (Object[]) value;
            for (int i = 0; i < array.length && i < MAX_ELEMENTS; i++) visitElement(array[i], path + "[" + i + "]", depth, seen, queue);
        } else if (depth < MAX_DEPTH && isAppObject(value) && seen.put(value, Boolean.TRUE) == null) {
            queue.add(new Object[] {value, depth + 1, path});
        }
    }

    private void visitElement(Object element, String path, int depth, IdentityHashMap<Object, Boolean> seen, ArrayDeque<Object[]> queue) {
        if (element == null) return;
        if (element instanceof CharSequence) {
            classify(path, element.toString());
        } else if (depth < MAX_DEPTH && isAppObject(element) && seen.put(element, Boolean.TRUE) == null) {
            queue.add(new Object[] {element, depth + 1, path});
        }
    }

    private void classify(String path, String text) {
        if (isManifest(text)) {
            if (seenText.add("m" + text.hashCode())) manifests.add(new Hit(path, text));
            // The video's settings JSON holds a copy of the manifest and may hold more addresses.
            if (text.charAt(0) == '{' && seenText.add("j" + text.hashCode())) {
                jsons.add(new Hit(path, text));
                jsonUrls(path, text);
            }
        } else if (text.startsWith("http://") || text.startsWith("https://")) {
            if (seenText.add("u" + text)) urls.add(new Hit(path, text));
        } else if (text.length() > 200 && text.charAt(0) == '{') {
            // A JSON text (the video's settings) can carry addresses, such as another quality's file.
            if (seenText.add("j" + text.hashCode())) {
                jsons.add(new Hit(path, text));
                jsonUrls(path, text);
            }
        }
    }

    private void jsonUrls(String path, String text) {
        int found = 0;
        int i = 0;
        int length = text.length();
        while (found < 40 && (i = text.indexOf("http", i)) >= 0) {
            if (!text.startsWith("https:", i) && !text.startsWith("http:", i)) {
                i += 4;
                continue;
            }
            StringBuilder sb = new StringBuilder();
            int j = i;
            while (j < length) {
                char c = text.charAt(j);
                if (c == '\\') {
                    if (j + 1 < length && text.charAt(j + 1) == '/') {
                        sb.append('/');
                        j += 2;
                        continue;
                    }
                    if (j + 5 < length && text.charAt(j + 1) == 'u') {
                        try {
                            sb.append((char) Integer.parseInt(text.substring(j + 2, j + 6), 16));
                            j += 6;
                            continue;
                        } catch (NumberFormatException ignored) {
                            // Not an escape.
                        }
                    }
                    break;
                }
                if (c == '"' || c == '<' || c == '>' || c == ' ' || c == '\n') break;
                sb.append(c);
                j++;
            }
            String url = sb.toString();
            if (url.length() > 20 && seenText.add("u" + url)) {
                urls.add(new Hit(path + "{json}", url));
                found++;
            }
            i = Math.max(j, i + 4);
        }
    }

    static boolean isManifest(String text) {
        return text.length() > 64 && text.contains("<MPD") && text.contains("BaseURL");
    }

    static boolean isAppObject(Object value) {
        if (value instanceof View || value instanceof Context) return false;
        String name = value.getClass().getName();
        return name.startsWith("com.facebook.") || name.startsWith("X.") || name.startsWith("com.moblica.");
    }

    /** Reads a field from the object or one of its superclasses. */
    static Object field(Object target, String name) throws NoSuchFieldException, IllegalAccessException {
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

    // ------------------------------------------------------------------------------------ debug dump

    /** Logs the non-default fields of an object and the app objects below it, one line per field. */
    static void dump(String tag, String name, Object root, int maxDepth, int maxLines) {
        if (root == null || !MorpheLog.enabled()) return;
        int[] lines = new int[1];
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        try {
            dump(tag, name, root, 0, maxDepth, maxLines, lines, seen);
        } catch (Throwable t) {
            MorpheLog.log(tag, "dump of " + name + " stopped", t);
        }
        if (lines[0] >= maxLines) MorpheLog.log(tag, "dump of " + name + " cut at " + maxLines + " lines");
    }

    private static void dump(String tag, String path, Object node, int depth, int maxDepth, int maxLines, int[] lines,
            IdentityHashMap<Object, Boolean> seen) throws Exception {
        if (seen.put(node, Boolean.TRUE) != null) return;
        MorpheLog.log(tag, path + " : " + node.getClass().getName());
        lines[0]++;
        List<Object[]> children = new ArrayList<>();
        for (Class<?> c = node.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
            Field[] fields;
            try {
                fields = c.getDeclaredFields();
            } catch (Throwable t) {
                continue;
            }
            for (Field f : fields) {
                if (lines[0] >= maxLines) return;
                if (Modifier.isStatic(f.getModifiers())) continue;
                Object value;
                try {
                    f.setAccessible(true);
                    value = f.get(node);
                } catch (Throwable t) {
                    continue;
                }
                if (value == null) continue;
                String childPath = path + "." + f.getName();
                String summary = summarize(value);
                if (summary != null) {
                    MorpheLog.log(tag, "  " + childPath + " = " + summary);
                    lines[0]++;
                } else if (depth < maxDepth && isAppObject(value)) {
                    children.add(new Object[] {childPath, value});
                }
            }
        }
        for (Object[] child : children) dump(tag, (String) child[0], child[1], depth + 1, maxDepth, maxLines, lines, seen);
    }

    /** A short text for a leaf value, or null when it is an object to descend into (or a default value to skip). */
    private static String summarize(Object v) {
        if (v instanceof Boolean) return ((Boolean) v) ? "true" : "";
        if (v instanceof Number) {
            double d = ((Number) v).doubleValue();
            if (d == 0 || d == -1 || d == Integer.MIN_VALUE || d == Short.MIN_VALUE || d == Byte.MIN_VALUE) return "";
            return v.toString();
        }
        if (v instanceof CharSequence) {
            String s = v.toString();
            if (s.isEmpty()) return "";
            if (isManifest(s)) return "DASH MANIFEST len=" + s.length();
            if (s.startsWith("http")) return MorpheLog.url(s);
            return "\"" + (s.length() > 100 ? s.substring(0, 100) + "…(" + s.length() + ")" : s) + "\"";
        }
        if (v instanceof byte[]) return "byte[" + ((byte[]) v).length + "]";
        if (v instanceof char[]) return "char[" + ((char[]) v).length + "]";
        if (v instanceof Map) {
            Map<?, ?> m = (Map<?, ?>) v;
            return m.isEmpty() ? "" : v.getClass().getSimpleName() + "{" + m.size() + "} " + sample(m.entrySet());
        }
        if (v instanceof Iterable) {
            try {
                int n = 0;
                for (Object ignored : (Iterable<?>) v) n++;
                return n == 0 ? "" : v.getClass().getSimpleName() + "[" + n + "] " + sample((Iterable<?>) v);
            } catch (Throwable t) {
                return v.getClass().getSimpleName() + "[?]";
            }
        }
        if (v instanceof Object[]) {
            Object[] a = (Object[]) v;
            return a.length == 0 ? "" : v.getClass().getSimpleName() + " " + sample(java.util.Arrays.asList(a));
        }
        if (v instanceof Reference || v instanceof AtomicReference) return v.getClass().getSimpleName();
        if (v instanceof View || v instanceof Context) return v.getClass().getName();
        if (isAppObject(v)) return null;
        return v.getClass().getName();
    }

    private static String sample(Iterable<?> items) {
        StringBuilder sb = new StringBuilder("(");
        int n = 0;
        try {
            for (Object o : items) {
                if (n++ >= 3) {
                    sb.append("…");
                    break;
                }
                String s = o instanceof CharSequence ? (o.toString().startsWith("http") ? MorpheLog.url(o.toString()) : o.toString()) : String.valueOf(o);
                if (s.length() > 80) s = s.substring(0, 80) + "…";
                sb.append(s).append("; ");
            }
        } catch (Throwable ignored) {
        }
        return sb.append(')').toString();
    }
}
