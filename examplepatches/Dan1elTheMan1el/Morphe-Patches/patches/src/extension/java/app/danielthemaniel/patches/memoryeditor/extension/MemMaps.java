package app.danielthemaniel.patches.memoryeditor.extension;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/** Parses /proc/self/maps and sorts mappings into GameGuardian-style region categories. */
final class MemMaps {

    enum Category {
        JAVA_HEAP("Java heap", "Jh"),
        C_HEAP("C++ heap", "Ca"),
        C_DATA("C++ .data / .bss", "Cd"),
        ANON("Anonymous", "A"),
        STACK("Stack", "S"),
        OTHER("Other files", "O"),
        SKIP(null, "-");

        static final Category[] SELECTABLE = { JAVA_HEAP, C_HEAP, C_DATA, ANON, STACK, OTHER };

        final String label;
        final String code;

        Category(String label, String code) {
            this.label = label;
            this.code = code;
        }
    }

    static final class Region {
        long start, end;
        String perms, path;
        /** Basename of the library this mapping belongs to (incl. its .bss), else null. */
        String module;
        Category cat;

        long size() {
            return end - start;
        }

        /** Readable, writable, private, and in a category worth scanning. */
        boolean scannable() {
            return perms.length() >= 4 && perms.charAt(0) == 'r' && perms.charAt(1) == 'w'
                    && perms.charAt(3) == 'p' && cat != Category.SKIP;
        }
    }

    private MemMaps() { }

    static List<Region> read() {
        List<Region> out = new ArrayList<>(2048);
        String lastSo = null;
        long lastSoEnd = -1;
        try (BufferedReader r = new BufferedReader(new FileReader("/proc/self/maps"), 1 << 16)) {
            String line;
            while ((line = r.readLine()) != null) {
                Region g = parse(line);
                if (g == null) continue;
                boolean contiguousAfterSo = lastSo != null && g.start == lastSoEnd;
                g.cat = classify(g.path, contiguousAfterSo);
                if (g.path.startsWith("/")) {
                    String base = baseName(g.path);
                    if (base.endsWith(".so")) {
                        g.module = base;
                        lastSo = base;
                        lastSoEnd = g.end;
                    } else {
                        lastSo = null;
                    }
                } else if (contiguousAfterSo && g.cat == Category.C_DATA) {
                    g.module = lastSo; // .bss belongs to the library right before it
                    lastSoEnd = g.end;
                } else {
                    lastSo = null;
                }
                out.add(g);
            }
        } catch (IOException ignored) {
        }
        return out;
    }

    private static Region parse(String line) {
        try {
            int sp = line.indexOf(' ');
            int dash = line.indexOf('-');
            if (sp < 0 || dash < 0 || dash > sp) return null;
            Region g = new Region();
            g.start = Long.parseUnsignedLong(line.substring(0, dash), 16);
            g.end = Long.parseUnsignedLong(line.substring(dash + 1, sp), 16);
            g.perms = line.substring(sp + 1, Math.min(line.length(), sp + 5));
            // Skip offset, dev, inode; the rest (may contain spaces) is the path.
            int i = sp + 5, n = line.length();
            for (int f = 0; f < 3; f++) {
                while (i < n && line.charAt(i) == ' ') i++;
                while (i < n && line.charAt(i) != ' ') i++;
            }
            g.path = i < n ? line.substring(i).trim() : "";
            return g;
        } catch (RuntimeException e) {
            return null;
        }
    }

    private static Category classify(String p, boolean contiguousAfterSo) {
        if (p.isEmpty()) return contiguousAfterSo ? Category.C_DATA : Category.ANON;
        if (p.startsWith("[anon:dalvik-")) {
            if (p.contains("main space") || p.contains("region space") || p.contains("large object space")
                    || p.contains("non moving space") || p.contains("zygote space") || p.contains("alloc space")) {
                return Category.JAVA_HEAP;
            }
            return Category.SKIP; // JIT cache, card tables, mark bitmaps, …
        }
        if (p.equals("[heap]") || p.startsWith("[anon:libc_malloc") || p.startsWith("[anon:scudo")
                || p.startsWith("[anon:GWP-ASan")) {
            return Category.C_HEAP;
        }
        if (p.equals("[anon:.bss]")) return Category.C_DATA;
        if (p.startsWith("[stack") || p.startsWith("[anon:stack_and_tls") || p.startsWith("[anon:thread signal stack")) {
            return Category.STACK;
        }
        if (p.startsWith("[anon:")) return Category.ANON;
        if (p.startsWith("[")) return Category.SKIP;               // vdso, vvar, vectors
        if (p.startsWith("/dev/") || p.startsWith("/memfd:")) return Category.SKIP; // GPU / ashmem
        if (p.endsWith(".so") || p.contains(".so (deleted)")) return Category.C_DATA;
        return Category.OTHER;
    }

    static String baseName(String path) {
        int s = path.lastIndexOf('/');
        return s >= 0 ? path.substring(s + 1) : path;
    }

    /** Region containing addr (list must be sorted, as /proc/self/maps is), or null. */
    static Region find(List<Region> rs, long addr) {
        int lo = 0, hi = rs.size() - 1;
        while (lo <= hi) {
            int mid = (lo + hi) >>> 1;
            Region r = rs.get(mid);
            if (addr < r.start) hi = mid - 1;
            else if (addr >= r.end) lo = mid + 1;
            else return r;
        }
        return null;
    }

    /** Load base (lowest file mapping) of a library by basename, or -1. */
    static long moduleBase(List<Region> rs, String module) {
        long base = -1;
        for (Region r : rs) {
            if (module.equals(r.module) && r.path.startsWith("/") && (base == -1 || r.start < base)) {
                base = r.start;
            }
        }
        return base;
    }
}
