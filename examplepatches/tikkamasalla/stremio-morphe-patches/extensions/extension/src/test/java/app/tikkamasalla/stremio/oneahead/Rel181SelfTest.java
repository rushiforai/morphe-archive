package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;

import java.io.File;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/** Release 1.8.1 proofs: preview auto rule, per-file tries, setting rename. Exit 1 on failure. */
public class Rel181SelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }

    static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }

    static String body(String source, String signature) {
        int from = source.indexOf(signature);
        if (from < 0) return "";
        return source.substring(from, source.indexOf("\n        }", from));
    }

    static void prefsKey() {
        ok("pref key unchanged", "oneahead_enabled".equals(app.tikkamasalla.stremio.introskip.IntroSkipPrefs.KEY_ONEAHEAD), null);
        ok("row renamed", "Fingerprint Lookahead".equals(app.tikkamasalla.stremio.introskip.IntroSkipSettings.T_ONEAHEAD), null);
        ok("row subtitle", "Finds skip times by matching audio across episodes".equals(app.tikkamasalla.stremio.introskip.IntroSkipSettings.S_ONEAHEAD), null);
    }

    static void previewRule() throws Exception {
        Class<?> seg = Class.forName("app.tikkamasalla.stremio.introskip.IntroSkipBridge$Segment", false,
                Rel181SelfTest.class.getClassLoader());
        Constructor<?> ctor = seg.getDeclaredConstructor(double.class, double.class, String.class, String.class,
                boolean.class, double.class, boolean.class);
        ctor.setAccessible(true);
        Method inferred = seg.getDeclaredMethod("inferred");
        inferred.setAccessible(true);
        Object postEd = ctor.newInstance(1500.04, 1512.0, "preview", "post-ed-tail", false, 0.0, false);
        Object tailChap = ctor.newInstance(1500.04, 1512.0, "preview", "tail-chapter", false, 0.0, false);
        Object subCue = ctor.newInstance(1500.04, 1512.0, "preview", "subtitle-cue", false, 0.0, false);
        Object liveCue = ctor.newInstance(1500.04, 1512.0, "preview", "live-cue", false, 0.0, false);
        Object online = ctor.newInstance(1500.04, 1512.0, "preview", "skipdb", false, 0.0, false);
        ok("stremio post-ed-tail inferred", (Boolean) inferred.invoke(postEd), null);
        ok("stremio tail-chapter inferred", (Boolean) inferred.invoke(tailChap), null);
        ok("stremio subtitle-cue inferred", (Boolean) inferred.invoke(subCue), null);
        ok("stremio live-cue inferred", (Boolean) inferred.invoke(liveCue), null);
        ok("stremio online not inferred", !(Boolean) inferred.invoke(online), null);
        String b = src("app/tikkamasalla/stremio/introskip/IntroSkipBridge.java");
        String wants = body(b, "private boolean wantsAuto(Segment segment)");
        ok("stremio wantsAuto previews on", wants.contains("isPreview()") && wants.contains("isPreviewsEnabled"), null);
        ok("stremio wantsAuto no inferred block", !wants.contains("segment.inferred()"), wants);
        ok("stremio wantsAuto keeps buttonOnly", wants.contains("segment.buttonOnly"), null);
        ok("stremio wantsAuto keeps credits", wants.contains("isCreditsAuto"), null);
        ok("stremio wantsAuto manual gate", wants.contains("isManualMode"), null);

        Class<?> vseg = Class.forName("net.gtvbox.videoplayer.IntroSkip$Seg", false,
                Rel181SelfTest.class.getClassLoader());
        Constructor<?> vctor = vseg.getDeclaredConstructor(int.class, int.class, String.class, String.class);
        vctor.setAccessible(true);
        Method vinferred = vseg.getDeclaredMethod("inferred");
        vinferred.setAccessible(true);
        Object vpost = vctor.newInstance(1500040, 1512000, "Preview", "post-ed-tail");
        Object vsub = vctor.newInstance(1500040, 1512000, "Preview", "subtitle-cue");
        ok("vimu inferred post-ed-tail", (Boolean) vinferred.invoke(vpost), null);
        ok("vimu inferred subtitle-cue", (Boolean) vinferred.invoke(vsub), null);
        String v = src("net/gtvbox/videoplayer/IntroSkip.java");
        ok("vimu no inferredPreview gate", !v.contains("inferredPreview"), null);
        ok("vimu auto previews on", v.contains(": !manualMode && !previewsOff;"), null);
    }

    static OneAheadPlanner.FileRef ref(String ep, long size, long hash) {
        return new OneAheadPlanner.FileRef(ep, "vid-" + ep, 42, size, hash, 1450,
                OneAheadPlanner.Container.MKV, false, false, "jpn", -1);
    }

    static List<OneAheadPlanner.FileRef> refs3() {
        List<OneAheadPlanner.FileRef> out = new ArrayList<>();
        for (int i = 0; i < 3; i++) out.add(ref("r" + i, 300_000_000L + i * 1000, 100 + i));
        return out;
    }

    static float[] noise(long seed, int n) {
        Random r = new Random(seed); float[] x = new float[n]; double lp = 0;
        for (int i = 0; i < n; i++) { lp = 0.7 * lp + 0.3 * r.nextGaussian(); x[i] = (float) (lp * 0.2); }
        return x;
    }

    static EpisodeFeatures synth(String id, long size, long hash, boolean finale) {
        long seed = (id == null ? 0 : id.hashCode()) & 0xFFFF;
        int sr = Track.SR, headN = 300 * sr, tailN = 300 * sr;
        float[] head = noise(seed, headN), tail = noise(seed + 7, tailN);
        float[] themeI = noise(4242, 90 * sr), themeC = noise(777, 90 * sr);
        System.arraycopy(themeI, 0, head, 10 * sr, themeI.length);
        System.arraycopy(themeC, 0, tail, 200 * sr, themeC.length);
        double dur = 1450, tailOff = dur - 300;
        return new EpisodeFeatures(id, size, hash, "jpn", dur, dur, finale,
                Track.build(0, head, 8), Track.build(tailOff, tail, 8));
    }

    static final class StubFetcher implements OneAheadRunner.FeatureFetcher {
        int calls = 0;
        boolean failIoOnce = false;
        boolean failedOnce = false;
        public EpisodeFeatures fetch(OneAheadPlanner.FilePlan fp, ByteBudget b, PlaybackGuard g) throws DemuxException {
            calls++;
            if (failIoOnce && !failedOnce) { failedOnce = true; throw new DemuxException(DemuxException.Kind.IO, "stub"); }
            long seed = fp.ref.episodeId.hashCode() & 0xFFFF;
            EpisodeFeatures e = synth(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash, fp.ref.finale);
            return new EpisodeFeatures(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash, "jpn",
                    fp.ref.durationSec, fp.ref.durationSec, fp.ref.finale, e.head, e.tail);
        }
    }

    static void attemptsPerFile(File dir) throws Exception {
        OneAheadStores.AttemptLog log = new OneAheadStores.AttemptLog(new File(dir, "a"));
        String day = "2026-11-02";
        String k1 = OneAheadStores.key("ep1", 1000, 0xabc);
        String k2 = OneAheadStores.key("ep1", 2000, 0xdef);
        ok("different release different key", !k1.equals(k2), k1 + " vs " + k2);
        ok("no tries blocked", !log.blockedToday(k1, day) && !log.blockedToday(k2, day), null);
        log.mark(k1, "show1", day);
        ok("one try not blocked", !log.blockedToday(k1, day) && log.attemptsToday(k1, day) == 1, null);
        ok("other file still free", !log.blockedToday(k2, day), null);
        log.mark(k1, "show1", day);
        ok("two tries blocked", log.blockedToday(k1, day) && log.attemptsToday(k1, day) == 2, null);
        ok("other file still free after two", !log.blockedToday(k2, day), null);
        OneAheadStores.AttemptLog log2 = new OneAheadStores.AttemptLog(new File(dir, "b"));
        String k3 = OneAheadStores.key("ep9", 1000, 0xabc);
        log2.mark(k3, "show1", day);
        ok("finished blocks retry", !log2.blockedToday(k3, day), null);
        log2.markDone(k3, day);
        ok("done blocks", log2.blockedToday(k3, day) && log2.finishedToday(k3, day), null);
        ok("done does not inflate tries", log2.attemptsToday(k3, day) == 1, String.valueOf(log2.attemptsToday(k3, day)));
        ok("done no double show count", log2.showEpisodesToday("show1", day) == 1, String.valueOf(log2.showEpisodesToday("show1", day)));

        OneAheadPlanner p = new OneAheadPlanner();
        OneAheadPlanner.Usage u = new OneAheadPlanner.Usage();
        u.targetAttemptsToday = 1; u.targetFinishedToday = false;
        ok("planner allows second try", p.plan(ref("t1", 325_000_000L, 999), refs3(), u).ok(), null);
        u.targetAttemptsToday = 2;
        ok("planner blocks third try", p.plan(ref("t1", 325_000_000L, 999), refs3(), u).refusal == OneAheadPlanner.Refusal.ALREADY_ATTEMPTED, null);
        u.targetAttemptsToday = 1; u.targetFinishedToday = true;
        ok("planner blocks finished", p.plan(ref("t1", 325_000_000L, 999), refs3(), u).refusal == OneAheadPlanner.Refusal.ALREADY_ATTEMPTED, null);
    }

    static void runnerPerFile(File dir) throws Exception {
        StubFetcher stub = new StubFetcher();
        OneAheadRunner runner = new OneAheadRunner(new File(dir, "r1"), stub,
                OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        List<OneAheadPlanner.FileRef> cands = Arrays.asList(
                ref("ra", 300_000_000L, 101), ref("rb", 300_001_000L, 102), ref("rc", 300_002_000L, 103));
        OneAheadPlanner.FileRef targetA = ref("epSame", 500_000_000L, 0xaaa);
        OneAheadRunner.Outcome o1 = runner.runOnce(targetA, cands, "show1");
        ok("first file done", o1.status == OneAheadRunner.Status.DONE, o1.status + "/" + o1.reason);
        OneAheadPlanner.FileRef targetB = ref("epSame", 600_000_000L, 0xbbb);
        OneAheadRunner.Outcome o2 = runner.runOnce(targetB, cands, "show1");
        ok("different release gets own try", o2.status == OneAheadRunner.Status.DONE, o2.status + "/" + o2.reason);
        OneAheadRunner.Outcome o3 = runner.runOnce(targetB, cands, "show1");
        ok("finished file never retried", o3.status == OneAheadRunner.Status.REFUSED
                && "ALREADY_ATTEMPTED".equals(o3.reason), String.valueOf(o3.reason));

        StubFetcher flaky = new StubFetcher();
        flaky.failIoOnce = true;
        OneAheadRunner runner2 = new OneAheadRunner(new File(dir, "r2"), flaky,
                OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadPlanner.FileRef targetC = ref("epFlaky", 500_000_000L, 0xccc);
        OneAheadRunner.Outcome f1 = runner2.runOnce(targetC, cands, "show1");
        ok("temporary ends as no-times", f1.status == OneAheadRunner.Status.NO_TIMES, f1.status + "/" + f1.reason);
        OneAheadRunner.Outcome f2 = runner2.runOnce(targetC, cands, "show1");
        ok("temporary gets one more try", f2.status == OneAheadRunner.Status.DONE, f2.status + "/" + f2.reason);
        OneAheadRunner.Outcome f3 = runner2.runOnce(targetC, cands, "show1");
        ok("done after retry never retried", f3.status == OneAheadRunner.Status.REFUSED, String.valueOf(f3.reason));

        StubFetcher stub3 = new StubFetcher();
        OneAheadRunner.DetectorFactory emptyDetectors = new OneAheadRunner.DetectorFactory() {
            public Detector create(boolean sparse) {
                Detector.Config c = new Detector.Config();
                c.minRefs = 10;
                return new Detector(c);
            }
        };
        OneAheadRunner runner3 = new OneAheadRunner(new File(dir, "r3"), stub3,
                emptyDetectors, PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadPlanner.FileRef targetD = ref("epNoSeg", 500_000_000L, 0xddd);
        OneAheadRunner.Outcome n1 = runner3.runOnce(targetD, cands, "show1");
        ok("no-segments", n1.status == OneAheadRunner.Status.NO_TIMES && "no-segments".equals(n1.reason),
                n1.status + "/" + n1.reason);
        OneAheadRunner.Outcome n2 = runner3.runOnce(targetD, cands, "show1");
        ok("no retry after no-segments", n2.status == OneAheadRunner.Status.REFUSED, String.valueOf(n2.reason));
    }

    public static void main(String[] a) throws Exception {
        prefsKey();
        previewRule();
        File dir = new File(a.length > 0 ? a[0] : "rel181-test-tmp");
        attemptsPerFile(new File(dir, "attempts"));
        runnerPerFile(new File(dir, "run"));
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
