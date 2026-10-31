package santodan.patches;

import software.santodan.nuvio.NuvioNative;

import app.morphe.patcher.patch.AppTarget;
import java.util.List;

/** Exact compatibility for the latest workspace NuvioTV release. */
final class NuvioLayout {
    static final String BETA7 = "1.1.0-beta.7"; // Historical verifier compilation only.
    static final String BETA8 = "1.1.0-beta.8"; // Historical verifier compilation only.
    static final String LATEST = NuvioNative.VERSION;
    static boolean recent(String version) { return LATEST.equals(version); }
    static void use(String version) {
        if (!recent(version)) throw new IllegalStateException("Unsupported NuvioTV version: " + version);
    }
    static List<AppTarget> targets() { return List.of(new AppTarget(LATEST, null, false, null, null)); }
    static List<AppTarget> modernTargets() { return targets(); }
    static boolean modern(String version) { use(version); return true; }
}
