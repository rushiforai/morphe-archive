package app.template.extension.zalo.buglog;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Names the patches behind a crash. {@code [patched-by: ...]} lists the patches that modified a
 * Zalo method on the stack (from the registry the Bug log patch bakes at build time);
 * {@code [nezumi: ...]} lists the patches whose extension code is on the stack. Android-free so it
 * can be unit tested.
 */
final class Attribution {
    /** Frames in ANR traces ({@code at a.b.C.m(File:1)}) and tombstone text ({@code (a.b.C.m+12)}). */
    private static final Pattern TEXT_FRAME = Pattern.compile("(?:\\bat |\\()([A-Za-z_$][\\w$]*(?:\\.[A-Za-z_$][\\w$]*)+)\\.([\\w$<>-]+)[(+]");

    private static final int MAX_CAUSES = 16;

    /** "com.x.Y.method" to patch ids. */
    private final Map<String, Set<String>> byMethod = new HashMap<>();
    /** "com.x.Y" to patch ids. */
    private final Map<String, Set<String>> byClass = new HashMap<>();

    static final class Frame {
        final String className;
        final String methodName;

        Frame(String className, String methodName) {
            this.className = className;
            this.methodName = methodName;
        }
    }

    /**
     * Parses the baked registry: one {@code Lcom/x/Y;->method(args)R=patch-id} entry per line.
     * Malformed lines are skipped.
     */
    static Attribution parse(String registry) {
        Attribution result = new Attribution();
        if (registry == null) return result;
        for (String entry : registry.split("\n")) {
            int equals = entry.lastIndexOf('=');
            int arrow = entry.indexOf(";->");
            if (equals < 0 || arrow < 2 || entry.charAt(0) != 'L') continue;
            int paren = entry.indexOf('(', arrow);
            if (paren < 0 || paren > equals) continue;
            String className = entry.substring(1, arrow).replace('/', '.');
            String methodName = entry.substring(arrow + 3, paren);
            String id = entry.substring(equals + 1).trim();
            if (id.isEmpty()) continue;
            add(result.byMethod, className + '.' + methodName, id);
            add(result.byClass, className, id);
        }
        return result;
    }

    private static void add(Map<String, Set<String>> map, String key, String id) {
        Set<String> ids = map.get(key);
        if (ids == null) map.put(key, ids = new LinkedHashSet<>());
        ids.add(id);
    }

    boolean isEmpty() {
        return byMethod.isEmpty();
    }

    /**
     * Patches that modified a method on the stack. Exact method matches win; only when no frame
     * hits a modified method do frames in a modified class (or its outer class) count.
     */
    List<String> patchedBy(List<Frame> frames) {
        Set<String> methods = new LinkedHashSet<>();
        Set<String> classes = new LinkedHashSet<>();
        for (Frame frame : frames) {
            Set<String> ids = byMethod.get(frame.className + '.' + frame.methodName);
            if (ids != null) methods.addAll(ids);
            if (!methods.isEmpty()) continue;
            ids = byClass.get(frame.className);
            int nested = frame.className.indexOf('$');
            if (ids == null && nested > 0) ids = byClass.get(frame.className.substring(0, nested));
            if (ids != null) classes.addAll(ids);
        }
        return new ArrayList<>(methods.isEmpty() ? classes : methods);
    }

    /** Patches whose extension code is on the stack, innermost first. */
    static List<String> nezumiOwners(List<Frame> frames) {
        Set<String> ids = new LinkedHashSet<>();
        for (Frame frame : frames) {
            Patch owner = Patch.ownerOf(frame.className, frame.methodName);
            if (owner != null) ids.add(owner.id);
        }
        return new ArrayList<>(ids);
    }

    /** " [patched-by: a,b] [nezumi: c]", or "" when nothing on the stack is patched or extension code. */
    String labels(List<Frame> frames) {
        StringBuilder out = new StringBuilder();
        List<String> patched = patchedBy(frames);
        if (!patched.isEmpty()) out.append(" [patched-by: ").append(String.join(",", patched)).append(']');
        List<String> owners = nezumiOwners(frames);
        if (!owners.isEmpty()) out.append(" [nezumi: ").append(String.join(",", owners)).append(']');
        return out.toString();
    }

    /** Frames of the throwable and its causes. */
    static List<Frame> framesOf(Throwable failure) {
        List<Frame> frames = new ArrayList<>();
        int depth = 0;
        for (Throwable current = failure; current != null && depth < MAX_CAUSES; current = current.getCause(), depth++) {
            for (StackTraceElement element : current.getStackTrace()) {
                frames.add(new Frame(element.getClassName(), element.getMethodName()));
            }
        }
        return frames;
    }

    /**
     * The {@code "main"} thread's block of an ANR dump (from its header line to the next blank
     * line), or the whole text when there is no such block.
     */
    static String mainThreadSection(String trace) {
        if (trace == null) return null;
        int start = trace.startsWith("\"main\"") ? 0 : trace.indexOf("\n\"main\"");
        if (start < 0) {
            int indented = trace.indexOf("  \"main\"");
            if (indented < 0) return trace;
            start = indented;
        }
        int end = trace.indexOf("\n\n", start + 1);
        if (end < 0) end = trace.indexOf("\n  \n", start + 1);
        return end < 0 ? trace.substring(start) : trace.substring(start, end);
    }

    /** Frames found in trace text (ANR dumps, readable parts of native tombstones). */
    static List<Frame> framesOf(String text) {
        List<Frame> frames = new ArrayList<>();
        if (text == null) return frames;
        Matcher matcher = TEXT_FRAME.matcher(text);
        while (matcher.find()) frames.add(new Frame(matcher.group(1), matcher.group(2)));
        return frames;
    }
}
