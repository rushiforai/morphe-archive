package santodan.patches;

import app.morphe.patcher.patch.AppTarget;
import java.util.List;
import java.util.Map;

/** Explicit layouts verified against the original APKs; unknown versions fail closed. */
final class NuvioLayout {
    static final String BETA2 = "1.1.0-beta.2";
    static final String BETA4 = "1.1.0-beta.4";
    static final String BETA5 = "1.1.0-beta.5";
    private static final ThreadLocal<String> ACTIVE = ThreadLocal.withInitial(() -> BETA4);
    static void use(String version) { modern(version); ACTIVE.set(version); }
    private static final Map<String, String> BETA5_TYPES = Map.ofEntries(
        Map.entry("Lba/a2;", "Lba/b2;"),
        Map.entry("Lba/d3;", "Lba/e3;"),
        Map.entry("Lba/e2;", "Lba/f2;"),
        Map.entry("Lba/i1;", "Lba/j1;"),
        Map.entry("Lba/n3;", "Lba/o3;"),
        Map.entry("Lba/o3;", "Lba/p3;"),
        Map.entry("Lba/s3;", "Lba/t3;"),
        Map.entry("Lja/i2;", "Lja/g2;"),
        Map.entry("Lka/l9;", "Lka/n9;"),
        Map.entry("Lka/d1;", "Lka/e1;"),
        Map.entry("Lka/t7;", "Lka/v7;"),
        Map.entry("Lv9/i4;", "Lv9/h4;"),
        Map.entry("Lla/aa;", "Lla/ba;"),
        Map.entry("Lla/e5;", "Lla/f5;"),
        Map.entry("Lla/h5;", "Lla/i5;"),
        Map.entry("Lla/t5;", "Lla/u5;"),
        Map.entry("Lla/w1;", "Lla/y1;"),
        Map.entry("Lla/z3;", "Lla/b4;"),
        Map.entry("Lsa/eb;", "Lsa/db;"),
        Map.entry("Lsa/o3;", "Lsa/p3;")
    );
    static String current(String type) {
        if (!BETA5.equals(ACTIVE.get())) return type;
        int end = type.indexOf(';');
        String owner = end < 0 ? type : type.substring(0, end + 1);
        return BETA5_TYPES.getOrDefault(owner, owner) + (end < 0 ? "" : type.substring(end + 1));
    }
    static List<AppTarget> modernTargets() {
        return List.of(new AppTarget(BETA4, false, null), new AppTarget(BETA5, false, null));
    }
    static final Map<String, String> TYPES = Map.ofEntries(
        Map.entry("Lja/md;", "Lv9/yc;"), Map.entry("Lza/z4;", "Lla/t5;"),
        Map.entry("Lja/cc;", "Lba/w5;"), Map.entry("La/a;", "Lio/sentry/o;"),
        Map.entry("Lcom/nuvio/tv/data/local/rb;", "Lcom/nuvio/tv/data/local/cc;"),
        Map.entry("Lfb/h3;", "Lsa/o3;"), Map.entry("Lfb/sj;", "Lsa/og;"),
        Map.entry("Lfb/c2;", "Lsa/h6;"), Map.entry("Lfb/lj;", "Lsa/ig;"),
        Map.entry("Lca/b0;", "Lo9/a0;"), Map.entry("Lca/a0;", "Lo9/z;"),
        Map.entry("Lca/b1;", "Lo9/a1;")
    );

    static List<AppTarget> targets() {
        return List.of(new AppTarget(BETA2, false, null), new AppTarget(BETA4, false, null), new AppTarget(BETA5, false, null));
    }

    static boolean modern(String version) {
        if (!BETA2.equals(version) && !BETA4.equals(version) && !BETA5.equals(version))
            throw new IllegalStateException("Unsupported NuvioTV version: " + version);
        return !BETA2.equals(version);
    }

    static String type(String version, String original) {
        use(version);
        return modern(version) ? current(TYPES.getOrDefault(original, original)) : original;
    }

    static boolean newer(String owner) { return TYPES.values().stream().map(NuvioLayout::current).anyMatch(owner::equals); }
    static String forOwner(String owner, String original) {
        return newer(owner) ? current(TYPES.getOrDefault(original, original)) : original;
    }
}
