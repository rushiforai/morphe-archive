package app.tikkamasalla.stremio.introskip;

import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;

/**
 * Auto-pick must never start playback after the viewer presses a remote key on the stream
 * list; with no key pressed it keeps picking as before. Pure gates run by reflection (the
 * enclosing class holds Android statics); wiring is checked on the source. Exit 1 on failure.
 */
public class AutoPickKeyCancelSelfTest {
    static int fails = 0, total = 0;

    static void ok(String name, boolean cond, String info) {
        total++;
        if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }

    static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }

    static String region(String source, String fromSig, String toSig) {
        int from = source.indexOf(fromSig);
        if (from < 0) return "";
        int to = source.indexOf(toSig, from + fromSig.length());
        return to < 0 ? source.substring(from) : source.substring(from, to);
    }

    static int count(String source, String needle) {
        int n = 0, i = 0;
        while ((i = source.indexOf(needle, i)) >= 0) {
            n++;
            i += needle.length();
        }
        return n;
    }

    /** Static pure-gate call; null means the method is absent or threw (counted as a failure by callers). */
    static Boolean callGate(String classSuffix, String method, Class<?>[] sig, Object... args) {
        try {
            Class<?> c = Class.forName("app.tikkamasalla.stremio.introskip.StreamAutoPick$" + classSuffix,
                    false, AutoPickKeyCancelSelfTest.class.getClassLoader());
            Method m = c.getDeclaredMethod(method, sig);
            m.setAccessible(true);
            Object r = m.invoke(null, args);
            return r instanceof Boolean ? (Boolean) r : null;
        } catch (Throwable t) {
            return null;
        }
    }

    static void expect(String name, Boolean got, boolean want) {
        ok(name, got != null && got == want, got == null ? "missing/threw" : "got " + got);
    }

    static final Class<?>[] KEY_SIG = {int.class, long.class, long.class};
    static final Class<?>[] GATE6 = {boolean.class, boolean.class, boolean.class, long.class, boolean.class, boolean.class};
    static final Class<?>[] GATE7 = {boolean.class, boolean.class, boolean.class, long.class, boolean.class, boolean.class, boolean.class};
    static final Class<?>[] ARM5 = {boolean.class, boolean.class, boolean.class, boolean.class, boolean.class};

    static void keyTable() {
        // KeyEvent codes: UP 19, DOWN 20, LEFT 21, RIGHT 22, CENTER 23, BACK 4, VOL_UP 24, POWER 26, HOME 3.
        long arm = 1000L, after = 1400L;
        expect("key LEFT cancels", callGate("PortGate", "interactionCancels", KEY_SIG, 21, after, arm), true);
        expect("key RIGHT cancels", callGate("PortGate", "interactionCancels", KEY_SIG, 22, after, arm), true);
        expect("key UP cancels", callGate("PortGate", "interactionCancels", KEY_SIG, 19, after, arm), true);
        expect("key DOWN cancels", callGate("PortGate", "interactionCancels", KEY_SIG, 20, after, arm), true);
        expect("key CENTER cancels pending", callGate("PortGate", "interactionCancels", KEY_SIG, 23, after, arm), true);
        expect("key BACK cancels", callGate("PortGate", "interactionCancels", KEY_SIG, 4, after, arm), true);
        expect("volume ignored by design", callGate("PortGate", "interactionCancels", KEY_SIG, 24, after, arm), false);
        expect("power ignored by design", callGate("PortGate", "interactionCancels", KEY_SIG, 26, after, arm), false);
        expect("home ignored by design", callGate("PortGate", "interactionCancels", KEY_SIG, 3, after, arm), false);
        expect("key before arm not counted", callGate("PortGate", "interactionCancels", KEY_SIG, 22, 999L, arm), false);
        expect("key at arm counted", callGate("PortGate", "interactionCancels", KEY_SIG, 22, 1000L, arm), true);
    }

    static void untouchedStillPicks() {
        expect("no key: complete list picks at dwell",
                callGate("Gate", "shouldAutoPick", GATE6, false, false, false, 1200L, false, true), true);
        expect("no key: cached picks at 4s",
                callGate("Gate", "shouldAutoPick", GATE6, false, false, false, 4000L, true, false), true);
        expect("no key: uncached picks at 8s",
                callGate("Gate", "shouldAutoPick", GATE6, false, false, false, 8000L, false, false), true);
        expect("no key: too early waits",
                callGate("Gate", "shouldAutoPick", GATE6, false, false, false, 1000L, true, false), false);
    }

    static void classicGateKeyed() {
        expect("keyed: dwell pick blocked",
                callGate("Gate", "shouldAutoPick", GATE7, false, false, false, 1200L, false, true, true), false);
        expect("keyed: 4s cached pick blocked",
                callGate("Gate", "shouldAutoPick", GATE7, false, false, false, 4000L, true, false, true), false);
        expect("keyed: 8s pick blocked",
                callGate("Gate", "shouldAutoPick", GATE7, false, false, false, 8000L, false, false, true), false);
        expect("keyed: late pick blocked",
                callGate("Gate", "shouldAutoPick", GATE7, false, false, false, 45000L, true, true, true), false);
        expect("not keyed: dwell pick kept",
                callGate("Gate", "shouldAutoPick", GATE7, false, false, false, 1200L, false, true, false), true);
    }

    static void portArmGuard() {
        expect("port arm: all clear arms",
                callGate("PortGate", "shouldArm", ARM5, true, false, false, false, false), true);
        expect("port arm: key-cancelled stays off",
                callGate("PortGate", "shouldArm", ARM5, true, false, false, false, true), false);
    }

    static void wiring() throws Exception {
        String s = src("app/tikkamasalla/stremio/introskip/StreamAutoPick.java");
        String onStreams = region(s, "public static void onStreams", "public static void onEpisodeSelected");
        String schedule = region(s, "private static void schedule(", "private static void logTop");
        ok("classic observer consults key state", onStreams.contains("userKeyed(fragment)"), null);
        ok("classic timers consult key state", schedule.contains("userKeyed(fragment)"), null);
        ok("window watcher feeds classic key state", count(s, "noteWindowKey(") >= 2, "count " + count(s, "noteWindowKey("));
        ok("classic path installs window watcher", count(s, "PortWatch.install(") >= 2, "count " + count(s, "PortWatch.install("));
        ok("port re-arm guard state present", count(s, "portCancelId") >= 3, "count " + count(s, "portCancelId"));
        ok("classic key times use uptime", count(s, "FIRST_UPTIME") >= 3, "count " + count(s, "FIRST_UPTIME"));
        ok("browsing refreshes port guard", s.contains("portCancelAt = eventTime"), null);
    }

    public static void main(String[] args) throws Exception {
        keyTable();
        untouchedStillPicks();
        classicGateKeyed();
        portArmGuard();
        wiring();
        System.out.println("TOTAL " + (total - fails) + "/" + total);
        if (fails > 0) System.exit(1);
    }
}
