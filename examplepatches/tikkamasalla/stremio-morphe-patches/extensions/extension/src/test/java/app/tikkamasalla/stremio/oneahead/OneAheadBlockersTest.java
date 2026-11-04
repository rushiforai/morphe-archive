package app.tikkamasalla.stremio.oneahead;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

/**
 * Standalone proofs for the four merge blockers (no JUnit, no device). Rules are run for real; the
 * Android glue cannot run on a PC, so its wiring is checked against the source text given by -Doa.src.
 * Each check turns red when the line of its fix is reverted (see the runner's mutants).
 */
public final class OneAheadBlockersTest {
    private static int total, fails;

    private static void check(String name, boolean ok) {
        total++;
        if (!ok) { fails++; System.out.println("FAIL " + name); }
    }

    private static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }

    private static final String ONEAHEAD = "app/tikkamasalla/stremio/oneahead/", INTRO = "app/tikkamasalla/stremio/introskip/";

    /** B1: a link not marked cached is never read. */
    private static void b1() throws Exception {
        String url = "https://cdn.example/x.mkv";
        check("B1 uncached target refused", "not-cached".equals(
                OneAheadGate.decideTarget(true, true, url, false, false, false, false)));
        check("B1 cached target runs", OneAheadGate.decideTarget(true, true, url, true, false, false, false) == null);
        String t = src(ONEAHEAD + "OneAheadTrigger.java");
        int gate = t.indexOf("OneAheadGate.decideTarget(");
        check("B1 first gate passes the flag", gate > 0 && t.startsWith("OneAheadGate.decideTarget(", gate)
                && t.indexOf("p.url, p.cached", gate) > gate && t.indexOf("p.url, p.cached", gate) < gate + 160);
        check("B1 gate is before the first read of the target", gate < t.indexOf("chaptersCoverBoth(p.url")
                && gate < t.indexOf("probe(p.url"));
        List<String[]> rows = Arrays.asList(new String[]{"u1", "a.mkv", "0", "100"}, new String[]{"u2", "b.mkv", "1", "900"});
        check("B1 references need the mark", "u2".equals(OneAheadGate.pickReference(rows, "")[0]));
        check("B1 no marked row, no reference", OneAheadGate.pickReference(
                Arrays.asList(new String[]{"u1", "a.mkv", "0", "100"}, new String[]{"u3", "c.mkv", "", "0"}), "") == null);
        check("B1 the trigger picks through that rule", t.contains("OneAheadGate.pickReference("));
    }

    /** B2: One-ahead fills only after real lookups finish; any real source of the type removes it. */
    private static void b2() throws Exception {
        List<OneAheadShow.Seg> segs = Arrays.asList(new OneAheadShow.Seg("OP", 5, 95), new OneAheadShow.Seg("credits", 1300, 1400));
        check("B2 nothing while lookups run", OneAheadShow.fill(new HashSet<String>(), segs, 1450, false).isEmpty());
        check("B2 fills after lookups", OneAheadShow.fill(new HashSet<String>(), segs, 1450, true).size() == 2);
        List<OneAheadShow.Seg> left = OneAheadShow.fill(new HashSet<String>(Arrays.asList("OP")), segs, 1450, true);
        check("B2 real intro removes One-ahead intro", left.size() == 1 && "credits".equals(left.get(0).label));
        check("B2 lookups need online and chapters", !OneAheadShow.lookupsDone(false, true) && !OneAheadShow.lookupsDone(true, false)
                && OneAheadShow.lookupsDone(true, true));
        String v = src("net/gtvbox/videoplayer/IntroSkip.java");
        check("B2 Vimu fill waits for lookups", v.contains("OneAheadShow.lookupsDone(onlineLookupDone(), chapterReads >= 1)"));
        int strip = v.indexOf("merged = stripOneAhead(merged);"), real = v.indexOf("if (isIntro && hasIntroType(merged)) continue;");
        check("B2 Vimu merge sees real sources only", strip > 0 && strip < real);
        int tail = v.indexOf("No preview from any source: check the tail after credits");
        check("B2 Vimu tail inference after the strip", strip < tail);
        check("B2 Vimu subtitle scan skips it", v.contains("if (s.credits() && !app.tikkamasalla.stremio.oneahead.OneAheadShow.isOneAhead(s.rule)) {\n                                credEndSec"));
        check("B2 Vimu weak chapter judged on real only", v.contains("overlapsMs(stripOneAhead(segments), pick.start, pick.end)"));
        String b = src(INTRO + "IntroSkipBridge.java");
        check("B2 Stremio fill waits for lookups", b.contains("OneAheadShow.lookupsDone(aniDone && introDone, !waitChapters)"));
        int append = b.indexOf("if (!oneAheadSegs.isEmpty() &&"), infer = b.indexOf("Chapterless file (or chapters failed)");
        check("B2 Stremio tail inference before the append", infer > 0 && infer < append);
    }

    /** B3: an equal duration is not proof; the hand-off dies on any file change. */
    private static void b3() {
        List<OneAheadShow.Seg> segs = new ArrayList<>();
        segs.add(new OneAheadShow.Seg("OP", 5, 95));
        // Texhnolyze e05 and e06 are 1397.9 and 1397.4 s: the 2 s rule passes between them.
        OneAheadShow.Handoff h = OneAheadShow.decode(OneAheadShow.encode(5000, 777, 1397.928, segs));
        check("B3 duration alone would pass", OneAheadShow.durationOk(h.durSec, 1397.428));
        check("B3 first tick binds", h.stillThisFile(7, 1000, 1397928));
        check("B3 same file stays", h.stillThisFile(7, 500000, 1397928));
        check("B3 viewer seek back stays", h.stillThisFile(7, 100000, 1397928));
        check("B3 next file drops it", !h.stillThisFile(8, 1000, 1397428));
        check("B3 stays dead", !h.stillThisFile(7, 2000, 1397928));
        OneAheadShow.Handoff g = OneAheadShow.decode(OneAheadShow.encode(5000, 777, 1397.928, segs));
        g.stillThisFile(7, 1000, 1397928);
        check("B3 a reported file change alone drops it", !g.stillThisFile(8, 1500, 1397428));
        OneAheadShow.Handoff u = OneAheadShow.decode(OneAheadShow.encode(5000, 777, 1397.928, segs));
        u.stillThisFile(7, 1200000, 1397928);
        check("B3 unreported next file (end to start) drops it", !u.stillThisFile(7, 3000, 1397928));
        OneAheadShow.Handoff w = OneAheadShow.decode(OneAheadShow.encode(5000, 777, 1397.928, segs));
        w.stillThisFile(7, 1200000, 1397928);
        w.stillThisFile(7, 0, 0); // the next file loading, no duration yet
        check("B3 a tick without duration does not hide the jump", !w.stillThisFile(7, 2000, 1397428));
        OneAheadShow.Handoff m = OneAheadShow.decode(OneAheadShow.encode(5000, 777, 1397.928, segs));
        m.stillThisFile(7, 500000, 1397928);
        check("B3 a jump to the start from mid-file drops it", !m.stillThisFile(7, 2000, 1397928));
    }

    /** The body of the method that starts at this signature, up to its first closing brace at method indent. */
    private static String body(String source, String signature) {
        int from = source.indexOf(signature);
        return from < 0 ? "" : source.substring(from, source.indexOf("\n        }", from));
    }

    /**
     * B4: a One-ahead segment behaves like any other source on both players: Auto mode skips, Manual mode shows
     * the button, credits follow the credits setting. Segment and Seg are the real classes, from the gradle output.
     */
    private static void b4() throws Exception {
        Class<?> seg = Class.forName("app.tikkamasalla.stremio.introskip.IntroSkipBridge$Segment", false,
                OneAheadBlockersTest.class.getClassLoader());
        Constructor<?> ctor = seg.getDeclaredConstructor(double.class, double.class, String.class, String.class,
                boolean.class, double.class, boolean.class);
        ctor.setAccessible(true);
        // Any button-only segment, such as a zero-start conflict, keeps the flag when trimmed.
        Object credits = ctor.newInstance(1300.0, 1400.0, "credits", "TheIntroDB", false, 0.0, true);
        Method ending = seg.getDeclaredMethod("endingAt", double.class);
        ending.setAccessible(true);
        Object cut = ending.invoke(credits, 1350.0);
        Field only = seg.getDeclaredField("buttonOnly"), end = seg.getDeclaredField("endSeconds");
        only.setAccessible(true);
        end.setAccessible(true);
        check("B4 trimmed segment stays button only", only.getBoolean(cut) && end.getDouble(cut) == 1350.0);
        Method inferred = seg.getDeclaredMethod("inferred");
        inferred.setAccessible(true);
        Object oaCredits = ctor.newInstance(1300.0, 1400.0, "credits", OneAheadResult.SOURCE, false, 0.0, false);
        Object oaIntro = ctor.newInstance(90.0, 180.0, "OP", OneAheadResult.SOURCE, false, 0.0, false);
        check("B4 Stremio: never counted as inferred", !(Boolean) inferred.invoke(oaCredits) && !(Boolean) inferred.invoke(oaIntro));
        String b = src(INTRO + "IntroSkipBridge.java");
        check("B4 trim uses the keeping copy", b.contains("segments.set(i, s.endingAt(preview.startSeconds));"));
        check("B4 trim leaves One-ahead alone", b.contains("if (!s.isCredits() || app.tikkamasalla.stremio.oneahead.OneAheadShow.isOneAhead(s.source)) continue;"));
        check("B4 Stremio builds it without the flag", b.contains("OneAheadResult.SOURCE,\n                                        false, 0.0));"));
        String wants = body(b, "private boolean wantsAuto(Segment segment)");
        check("B4 Stremio gate has no source special case", wants.length() > 0 && !wants.contains("neAhead"));
        check("B4 Stremio Auto skips, Manual is the button", wants.contains("return !IntroSkipPrefs.isManualMode(activity);"));
        check("B4 Stremio credits follow the credits setting", wants.contains("if (segment.isCredits()) return IntroSkipPrefs.isCreditsAuto(activity);"));
        check("B4 Stremio pre-skip asks the same gate", b.contains("wantsAuto(candidate), wasSkipped(candidate)"));
        check("B4 Stremio late job result holds inside a segment", b.contains("if (app.tikkamasalla.stremio.oneahead.OneAheadShow.isOneAhead(s.source) && at >= s.startSeconds && at < s.endSeconds) seekHoldKey = s.key();"));
        check("B4 Stremio only the mid-episode path holds", b.contains("maybeFetchOneAhead(true);") && b.contains("maybeFetchOneAhead(false);"));
        check("B4 Stremio preparation timing ignores it", body(b, "private double currentCreditsStartSeconds()").contains("isOneAhead")
                && body(b, "private double currentCreditsEndSeconds()").contains("isOneAhead"));
        String v = src("net/gtvbox/videoplayer/IntroSkip.java");
        check("B4 Vimu builds it without the flag", v.contains("\"One-ahead\", false, 0));"));
        check("B4 Vimu gate has no source special case", v.contains("boolean autoPending = seg != null && !creditsOff && !previewsOff && autoModeForSeg\n                && !seg.buttonOnly\n                && !currentBySeek"));
        check("B4 Vimu Auto skips, Manual is the button", v.contains(": !manualMode && !previewsOff && !inferredPreview;"));
        check("B4 Vimu credits follow the credits setting", v.contains("? VimuIntroSkipPrefs.CREDITS_AUTO.equals(creditsMode)"));
        check("B4 Vimu keeps a viewer seek across the fill", v.contains("inheritSeek = current != null && currentBySeek;\n            segments = next;"));
        check("B4 the hand-off carries no flag", !src("app/tikkamasalla/stremio/oneahead/OneAheadShow.java").contains("buttonOnly"));
        check("B4 setting text", src(INTRO + "IntroSkipSettings.java").contains("uses them like any other source"));
    }

    public static void main(String[] a) throws Exception {
        b1();
        b2();
        b3();
        b4();
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
