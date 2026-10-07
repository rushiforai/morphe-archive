package santodan.patches;

import app.morphe.patcher.patch.AppTarget;
import java.util.List;
import java.util.Map;

/** Explicit layouts verified against the original APKs; unknown versions fail closed. */
final class NuvioLayout {
    static final String BETA2 = "1.1.0-beta.2";
    static final String BETA4 = "1.1.0-beta.4";
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
        return List.of(new AppTarget(BETA2, false, null), new AppTarget(BETA4, false, null));
    }

    static boolean beta4(String version) {
        if (!BETA2.equals(version) && !BETA4.equals(version))
            throw new IllegalStateException("Unsupported NuvioTV version: " + version);
        return BETA4.equals(version);
    }

    static String type(String version, String original) {
        return beta4(version) ? TYPES.getOrDefault(original, original) : original;
    }

    static boolean newer(String owner) { return TYPES.containsValue(owner); }
    static String forOwner(String owner, String original) {
        return newer(owner) ? TYPES.getOrDefault(original, original) : original;
    }
}
