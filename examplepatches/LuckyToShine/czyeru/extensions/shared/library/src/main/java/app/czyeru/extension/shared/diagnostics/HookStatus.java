/*
 * Adapted from Hushfeed (https://github.com/SysAdminDoc/hushfeed), GPL-3.0.
 */
package app.czyeru.extension.shared.diagnostics;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import app.czyeru.extension.shared.Logger;

/**
 * Hook status for code ported from Hushfeed: which hook families ran, and which could not find
 * what they needed. Each distinct state is logged once (debug logging), and the missing ones can
 * be listed. Hushfeed shows these in its diagnostic report; here they go to the log.
 */
public final class HookStatus {
    private static final Set<String> SEEN = ConcurrentHashMap.newKeySet();
    private static final Set<String> MISSING = ConcurrentHashMap.newKeySet();

    private HookStatus() {
    }

    /** A hook ran and found what it needed. */
    public static void bound(String family, String name) {
        once(family + ": " + name, false);
    }

    /** A view id the hook looks for is not in this build. */
    public static void missingViewId(String family, String name) {
        once(family + ": missing view id " + name, true);
    }

    /** A view id that was missing turned up after all. */
    public static void recoveredViewId(String family, String name) {
        MISSING.remove(family + ": missing view id " + name);
        once(family + ": recovered view id " + name, false);
    }

    /** A member the hook reads by name is not in this build. */
    public static void missingMember(String family, String kind, String owner, String name) {
        once(family + ": missing " + kind + " " + owner + "." + name, true);
    }

    /** A hook threw and was skipped. */
    public static void threw(String family, String name, Throwable failure) {
        String key = family + ": " + name + " threw " + failure.getClass().getSimpleName();
        if (SEEN.add(key)) {
            MISSING.add(key);
            Logger.printException(() -> "Hook status " + key, failure);
        }
    }

    /** Every missing or failed state seen so far. */
    public static List<String> missing() {
        List<String> list = new ArrayList<>(MISSING);
        Collections.sort(list);
        return list;
    }

    /** The missing or failed states of one family. */
    public static List<String> missing(String family) {
        List<String> list = new ArrayList<>();
        for (String entry : MISSING) {
            if (entry.startsWith(family + ": ")) list.add(entry);
        }
        Collections.sort(list);
        return list;
    }

    private static void once(String key, boolean missing) {
        if (!SEEN.add(key)) return;
        if (missing) MISSING.add(key);
        Logger.printDebug(() -> "Hook status " + key);
    }
}
