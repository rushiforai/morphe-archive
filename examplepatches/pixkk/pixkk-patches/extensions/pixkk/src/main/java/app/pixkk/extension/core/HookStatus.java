package app.pixkk.extension.core;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/** What the reflection helpers found and missed in TikTok's classes, kept for a look in the log. */
final class HookStatus {
    private static final List<String> MISSING = new CopyOnWriteArrayList<>();

    private HookStatus() {
    }

    static List<String> missing(String family) {
        return new ArrayList<>(MISSING);
    }

    static void missingMember(String family, String kind, String owner, String name) {
        String entry = family + ": " + kind + " " + owner + "#" + name;
        if (!MISSING.contains(entry)) {
            MISSING.add(entry);
            Logger.printDebug(() -> "missing " + entry);
        }
    }

    static void bound(String family, String member) {
    }
}
