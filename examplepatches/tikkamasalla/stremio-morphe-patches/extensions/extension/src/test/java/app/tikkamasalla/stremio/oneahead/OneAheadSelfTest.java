package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/** Standalone tests (no JUnit): java app.tikkamasalla.stremio.oneahead.OneAheadSelfTest. Exit 1 on any failure. */
public class OneAheadSelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }
    static final OneAheadPlanner P = new OneAheadPlanner();

    static OneAheadPlanner.FileRef ref(String ep, long size, long hash, double dur,
                                       OneAheadPlanner.Container c, boolean finale, boolean cached, String lang) {
        return new OneAheadPlanner.FileRef(ep, "vid-" + ep, 42, size, hash, dur, c, finale, cached, lang, -1);
    }
    static List<OneAheadPlanner.FileRef> refs(int n, boolean cached) {
        List<OneAheadPlanner.FileRef> out = new ArrayList<>();
        for (int i = 0; i < n; i++) out.add(ref("r" + i, 300_000_000L + i * 1000, 100 + i, 1450,
                OneAheadPlanner.Container.MKV, false, cached, "jpn"));
        return out;
    }
    static OneAheadPlanner.FileRef target() {
        return ref("t1", 325_000_000L, 999, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn");
    }

    static void plannerTests() {
        ok("plan ok 3 refs", P.plan(target(), refs(3, false), new OneAheadPlanner.Usage()).ok(), null);
        ok("refuse 2 refs NO_REFS", P.plan(target(), refs(2, false), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.NO_REFS, null);
        ok("finale ref does not count", P.plan(target(), withFinale(), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.NO_REFS, null);
        ok("duplicate ref does not count", P.plan(target(), withDup(), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.NO_REFS, null);
        ok("language clash does not count", P.plan(target(), withLang(), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.NO_REFS, null);
        ok("max 5 refs", P.plan(target(), refs(7, false), new OneAheadPlanner.Usage()).plan.refs.size() == 5, null);
        ok("cached refs cost 0", P.plan(target(), refs(3, true), new OneAheadPlanner.Usage()).plan.refs.get(0).estimatedBytes == 0, null);
        // No refusal by bitrate: a 106 Mbit/s MKV episode (19 GB / 1450 s) plans; its windows cost about 8 GB.
        OneAheadPlanner.FileRef hot = ref("t1", 19_200_000_000L, 999, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn");
        ok("106 Mbit MKV plans", P.plan(hot, refs(3, true), new OneAheadPlanner.Usage()).ok(), null);
        OneAheadPlanner.FileRef hotMp4 = ref("t1", 19_200_000_000L, 999, 1450, OneAheadPlanner.Container.MP4, false, false, "jpn");
        ok("106 Mbit MP4 plans", P.plan(hotMp4, refs(3, true), new OneAheadPlanner.Usage()).ok(), null);
        // The MP4 request fuse does not bite on a full cold plan of six MP4 files.
        List<OneAheadPlanner.FileRef> mp4Refs = new ArrayList<>();
        for (int i = 0; i < 5; i++) mp4Refs.add(ref("p" + i, 900_000_000L + i, 800 + i, 1450, OneAheadPlanner.Container.MP4, false, false, "jpn"));
        ok("six MP4 files plan", P.plan(hotMp4, mp4Refs, new OneAheadPlanner.Usage()).ok(), null);
        OneAheadPlanner.Usage u = new OneAheadPlanner.Usage(); u.targetAttemptedToday = true;
        ok("refuse already attempted", P.plan(target(), refs(3, false), u).refusal == OneAheadPlanner.Refusal.ALREADY_ATTEMPTED, null);
        u = new OneAheadPlanner.Usage(); u.showEpisodesToday = OneAheadPlanner.MAX_SHOW_EPS_PER_DAY;
        ok("refuse episode over the show's daily limit", P.plan(target(), refs(3, false), u).refusal == OneAheadPlanner.Refusal.SHOW_DAILY_LIMIT, null);
        u = new OneAheadPlanner.Usage(); u.bytesToday = OneAheadPlanner.DAY_CAP - 1_000_000L;
        ok("refuse day budget", P.plan(target(), refs(3, false), u).refusal == OneAheadPlanner.Refusal.DAY_BUDGET, null);
        ok("refuse invalid target", P.plan(ref("t", 0, 0, 0, OneAheadPlanner.Container.MKV, false, false, null),
                refs(3, false), new OneAheadPlanner.Usage()).refusal == OneAheadPlanner.Refusal.INVALID_TARGET, null);
        // Per-file cap: a plan total over the file cap is fine when every file is under it.
        List<OneAheadPlanner.FileRef> big = new ArrayList<>();
        for (int i = 0; i < 3; i++) big.add(ref("b" + i, 20_000_000_000L, 200 + i, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn"));
        OneAheadPlanner.Outcome o = P.plan(target(), big, new OneAheadPlanner.Usage());
        ok("plan total over the file cap allowed per-file", o.ok() && o.plan.target.mode == OneAheadPlanner.Mode.FULL
                && o.plan.estimatedBytes > OneAheadPlanner.FILE_CAP, o.ok() ? String.valueOf(o.plan.estimatedBytes) : String.valueOf(o.refusal));
        // Sparse is dropped: a target whose full windows exceed the file cap is refused, never probed.
        OneAheadPlanner.FileRef bigTarget = ref("t1", 30_000_000_000L, 999, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn");
        ok("target over file cap refused", P.plan(bigTarget, refs(3, false), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.EPISODE_BUDGET, null);
        // A reference whose full windows exceed the file cap is skipped.
        List<OneAheadPlanner.FileRef> hugeRefs = new ArrayList<>();
        for (int i = 0; i < 3; i++) hugeRefs.add(ref("h" + i, 30_000_000_000L, 300 + i, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn"));
        ok("oversize refs skipped -> NO_REFS", P.plan(target(), hugeRefs, new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.NO_REFS, null);
        // Finale flag passes through the plan untouched (detector gate depends on it).
        OneAheadPlanner.FileRef fin = ref("t9", 325_000_000L, 999, 1450, OneAheadPlanner.Container.MKV, true, false, "jpn");
        ok("finale target planned, flag kept", P.plan(fin, refs(3, false), new OneAheadPlanner.Usage()).ok()
                && P.plan(fin, refs(3, false), new OneAheadPlanner.Usage()).plan.target.ref.finale, null);
        // Regression cases:
        OneAheadPlanner.FileRef mp4 = ref("t1", 100_000_000L, 999, 1450, OneAheadPlanner.Container.MP4, false, false, "jpn");
        ok("MP4 target plannable with cached refs", P.plan(mp4, refs(3, true), new OneAheadPlanner.Usage()).ok(), null);
        OneAheadPlanner.Usage du = new OneAheadPlanner.Usage(); du.bytesToday = OneAheadPlanner.DAY_CAP - 450_000_000L;
        List<OneAheadPlanner.FileRef> mid = new ArrayList<>();
        for (int i = 0; i < 3; i++) mid.add(ref("m" + i, 290_000_000L, 700 + i, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn"));
        OneAheadPlanner.Outcome dpo = P.plan(target(), mid, du);
        ok("plan over day-left refused", !dpo.ok() && dpo.refusal == OneAheadPlanner.Refusal.DAY_BUDGET,
                String.valueOf(dpo.refusal));
        ok("refuse target without file identity", P.plan(ref("t1", 325_000_000L, 0, 1450,
                OneAheadPlanner.Container.MKV, false, false, "jpn"), refs(3, false), new OneAheadPlanner.Usage()).refusal
                == OneAheadPlanner.Refusal.INVALID_TARGET, null);
    }
    static List<OneAheadPlanner.FileRef> withFinale() {
        List<OneAheadPlanner.FileRef> r = refs(2, false);
        r.add(ref("rf", 400_000_000L, 555, 1450, OneAheadPlanner.Container.MKV, true, false, "jpn"));
        return r;
    }
    static List<OneAheadPlanner.FileRef> withDup() {
        List<OneAheadPlanner.FileRef> r = refs(2, false);
        r.add(ref("rd", 325_000_000L, 999, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn")); // same file as target
        return r;
    }
    static List<OneAheadPlanner.FileRef> withLang() {
        List<OneAheadPlanner.FileRef> r = refs(2, false);
        r.add(ref("rl", 400_000_000L, 556, 1450, OneAheadPlanner.Container.MKV, false, false, "eng"));
        return r;
    }

    // ---- synthetic features: shared 90 s themes over per-episode noise ----
    static float[] noise(long seed, int n) {
        Random r = new Random(seed); float[] x = new float[n]; double lp = 0;
        for (int i = 0; i < n; i++) { lp = 0.7 * lp + 0.3 * r.nextGaussian(); x[i] = (float) (lp * 0.2); }
        return x;
    }
    static EpisodeFeatures synth(String id, long seed, boolean finale) {
        int sr = Track.SR, headN = 300 * sr, tailN = 300 * sr;
        float[] head = noise(seed, headN), tail = noise(seed + 7, tailN);
        float[] themeI = noise(4242, 90 * sr), themeC = noise(777, 90 * sr);
        System.arraycopy(themeI, 0, head, 10 * sr, themeI.length);
        System.arraycopy(themeC, 0, tail, 200 * sr, themeC.length);
        double dur = 1450, tailOff = dur - 300;
        return new EpisodeFeatures(id, 300_000_000L + seed, 1000 + seed, "jpn", dur, dur, finale,
                Track.build(0, head, 8), Track.build(tailOff, tail, 8));
    }

    static final class StubFetcher implements OneAheadRunner.FeatureFetcher {
        int calls = 0; boolean failCodec = false;
        public EpisodeFeatures fetch(OneAheadPlanner.FilePlan fp, ByteBudget b, PlaybackGuard g) throws DemuxException {
            calls++;
            if (failCodec) throw new DemuxException(DemuxException.Kind.DECODER_MISSING, "stub");
            long seed = fp.ref.episodeId.hashCode() & 0xFFFF;
            EpisodeFeatures e = synth(fp.ref.episodeId, seed, fp.ref.finale);
            return new EpisodeFeatures(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash, "jpn",
                    fp.ref.durationSec, fp.ref.durationSec, fp.ref.finale, e.head, e.tail);
        }
    }

    static OneAheadPlanner.FileRef sref(String ep, boolean finale) {
        return ref(ep, 300_000_000L + (ep.hashCode() & 0xFFFF), 1000 + (ep.hashCode() & 0xFFFF), 1450,
                OneAheadPlanner.Container.MKV, finale, false, "jpn");
    }

    static void runnerTests(File dir) throws Exception {
        StubFetcher stub = new StubFetcher();
        OneAheadRunner runner = new OneAheadRunner(dir, stub, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        List<OneAheadPlanner.FileRef> cands = Arrays.asList(sref("ra", false), sref("rb", false), sref("rc", false));
        OneAheadRunner.Outcome o = runner.runOnce(sref("target1", false), cands, "show1");
        ok("runner finds segments", o.status == OneAheadRunner.Status.DONE && o.result != null && !o.result.segments.isEmpty(),
                o.status + "/" + o.reason + " calls=" + stub.calls);
        ok("result source and identity", o.result != null && OneAheadResult.SOURCE.equals(o.result.segments.get(0).source)
                && runner.results().load("vid-target1", o.result.fileSize, o.result.headHash) != null, null);
        ok("result rejects other file", runner.results().load("vid-target1", 1, 2) == null, null);
        int callsAfterFirst = stub.calls;
        OneAheadRunner runner2 = new OneAheadRunner(dir, stub, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-03");
        OneAheadRunner.Outcome o2 = runner2.runOnce(sref("target2", false), cands, "show1");
        ok("resume reuses cached refs (no refetch)", o2.status == OneAheadRunner.Status.DONE && stub.calls == callsAfterFirst + 1,
                "calls " + callsAfterFirst + "->" + stub.calls + " " + o2.reason);
        OneAheadRunner.Outcome o3 = runner2.runOnce(sref("target2", false), cands, "show1");
        ok("one attempt per episode per day", o3.status == OneAheadRunner.Status.REFUSED
                && "ALREADY_ATTEMPTED".equals(o3.reason), String.valueOf(o3.reason));
        // Codec failure: no times, no crash, and the attempt is spent (no retry loop).
        StubFetcher bad = new StubFetcher(); bad.failCodec = true;
        OneAheadRunner runner3 = new OneAheadRunner(new File(dir, "bad"), bad, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadRunner.Outcome o4 = runner3.runOnce(sref("tx", false), cands, "show1");
        ok("codec error ends as no-times", o4.status == OneAheadRunner.Status.NO_TIMES, String.valueOf(o4.reason));
        OneAheadRunner.Outcome o5 = runner3.runOnce(sref("tx", false), cands, "show1");
        ok("failed attempt not retried same day", o5.status == OneAheadRunner.Status.REFUSED, String.valueOf(o5.reason));
        // A target over the per-file cap is refused before any fetch (sparse is dropped).
        StubFetcher stub5 = new StubFetcher();
        OneAheadRunner runner5 = new OneAheadRunner(new File(dir, "sp"), stub5, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadPlanner.FileRef bigT = ref("sptarget", 30_000_000_000L, 424242, 1450, OneAheadPlanner.Container.MKV, false, false, "jpn");
        OneAheadRunner.Outcome o6 = runner5.runOnce(bigT, cands, "show1");
        ok("oversize target refused, nothing fetched", o6.status == OneAheadRunner.Status.REFUSED
                && "EPISODE_BUDGET".equals(o6.reason) && stub5.calls == 0,
                o6.status + "/" + o6.reason + " calls=" + stub5.calls);
        // Cancelled guard: no times.
        PlaybackGuard cancel = new PlaybackGuard() {
            public boolean shouldPause() { return false; }
            public boolean isCancelled() { return true; }
        };
        OneAheadRunner runner4 = new OneAheadRunner(new File(dir, "cx"), new StubFetcher(), OneAheadRunner.defaultDetectors(), cancel, () -> "2026-11-02");
        ok("cancel ends as no-times/refused", runner4.runOnce(sref("tc", false), cands, "show1").status != OneAheadRunner.Status.DONE, null);
        // A cancel burns one try per file: temporary, so one retry stays open, show count 1.
        OneAheadStores.AttemptLog cxLog = new OneAheadStores.AttemptLog(new File(dir, "cx"));
        String tcKey = OneAheadStores.key("tc", sref("tc", false).fileSize, sref("tc", false).headHash);
        ok("cancel burns one try", cxLog.attemptsToday(tcKey, "2026-11-02") == 1
                && !cxLog.blockedToday(tcKey, "2026-11-02")
                && cxLog.showEpisodesToday("show1", "2026-11-02") == 1, null);
        OneAheadRunner again = new OneAheadRunner(new File(dir, "cx"), new StubFetcher(), OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadRunner.Outcome o7 = again.runOnce(sref("tc", false), cands, "show1");
        ok("episode runs again after a cancel", o7.status == OneAheadRunner.Status.DONE, o7.status + "/" + o7.reason);
        // A cancel during a reference stops the run at once and keeps the attempt.
        final int[] cancelCalls = {0};
        OneAheadRunner.FeatureFetcher cancelAtRef = (fp, b, g) -> {
            cancelCalls[0]++;
            if (fp.ref.episodeId.equals("ra")) throw new DemuxException(DemuxException.Kind.CANCELLED, "stub");
            return new StubFetcher().fetch(fp, b, g);
        };
        OneAheadRunner midCancel = new OneAheadRunner(new File(dir, "mc"), cancelAtRef, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadRunner.Outcome o9 = midCancel.runOnce(sref("mct", false), cands, "show1");
        ok("cancel at a reference stops the run", o9.status == OneAheadRunner.Status.NO_TIMES && "cancelled".equals(o9.reason)
                && cancelCalls[0] == 2, o9.reason + " calls=" + cancelCalls[0]);
        ok("that cancel keeps the attempt", !midCancel.attemptedToday("mct"), null);
        OneAheadRunner.Outcome o10 = midCancel.runOnce(sref("mct2", false), Arrays.asList(sref("rx", false), sref("ry", false), sref("rz", false)), "show1");
        ok("different file runs after a cancel, then blocks when done", o10.status == OneAheadRunner.Status.DONE
                && midCancel.attemptedToday("mct2", sref("mct2", false).fileSize, sref("mct2", false).headHash),
                o10.status + "/" + o10.reason);
        // Written after every file, and the attempt before the first: a killed process keeps both.
        final File logDir = new File(dir, "log");
        final long[] seenAtSecond = {-1};
        final boolean[] markedAtFirst = {false};
        OneAheadRunner.FeatureFetcher counting = (fp, b, g) -> {
            OneAheadStores.AttemptLog l = new OneAheadStores.AttemptLog(logDir);
            if (fp.ref.episodeId.equals("cnt")) markedAtFirst[0] = l.attemptsToday(OneAheadStores.key(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash), "2026-11-02") == 1;
            if (fp.ref.episodeId.equals("ra")) seenAtSecond[0] = l.bytesToday("2026-11-02");
            b.add(1000);
            return new StubFetcher().fetch(fp, b, g);
        };
        OneAheadRunner counted = new OneAheadRunner(logDir, counting, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        OneAheadRunner.Outcome o8 = counted.runOnce(sref("cnt", false), cands, "show1");
        ok("attempt written before the first fetch", markedAtFirst[0], null);
        ok("bytes written after each file", seenAtSecond[0] == 1000, String.valueOf(seenAtSecond[0]));
        ok("bytes not counted twice", new OneAheadStores.AttemptLog(logDir).bytesToday("2026-11-02") == o8.bytesFetched
                && o8.bytesFetched == 4000, String.valueOf(o8.bytesFetched));
    }

    static void storeTests(File dir) throws Exception {
        OneAheadStores.FeatureStore fs = new OneAheadStores.FeatureStore(new File(dir, "f"));
        EpisodeFeatures e = synth("epA", 11, false);
        String k = OneAheadStores.key("epA", e.fileSize, e.headHash);
        fs.save(k, e);
        ok("feature round trip", fs.load(k) != null && fs.load(k).fileSize == e.fileSize, null);
        File f = new File(dir, "f/" + k + ".oafc");
        byte[] bytes = Files.readAllBytes(f.toPath()); bytes[bytes.length / 2] ^= 0x40;
        Files.write(f.toPath(), bytes);
        ok("corrupt feature rejected as miss", fs.load(k) == null && !f.exists(), null);
        // A feature file of the old version (its duration could be the meta runtime) is a miss, and is removed.
        fs.save(k, e);
        ok("current feature found by episode", k.equals(fs.keyForEpisode("epA")), null);
        byte[] oldVersion = Files.readAllBytes(f.toPath()); oldVersion[5] = 1;
        Files.write(f.toPath(), oldVersion);
        ok("old cache version not offered", fs.keyForEpisode("epA") == null && !f.exists(), null);
        // Result corruption and version: flip a byte, load must give null.
        OneAheadStores.ResultStore rs = new OneAheadStores.ResultStore(new File(dir, "r"));
        OneAheadResult r = new OneAheadResult("vid1", 123, 456, OneAheadResult.DETECTOR_VERSION);
        r.segments.add(new OneAheadResult.Segment("intro", 10, 100, true));
        rs.save(r);
        ok("result round trip + eof flag", rs.load("vid1", 123, 456) != null && rs.load("vid1", 123, 456).segments.get(0).eofAgree, null);
        File rf = new File(dir, "r/" + OneAheadStores.key("vid1", 0, 0) + ".oars");
        byte[] rb = Files.readAllBytes(rf.toPath()); rb[10] ^= 1; Files.write(rf.toPath(), rb);
        ok("corrupt result rejected", rs.load("vid1", 123, 456) == null, null);
        OneAheadStores.AttemptLog alog = new OneAheadStores.AttemptLog(new File(dir, "a"));
        alog.addBytes("2026-11-02", 150_000_000L); alog.addBytes("2026-11-02", 150_000_000L);
        ok("identical byte lines both count", alog.bytesToday("2026-11-02") == 300_000_000L,
                String.valueOf(alog.bytesToday("2026-11-02")));
        boolean leaksUrl = false;
        for (File x : new File(dir, "r").listFiles()) if (new String(Files.readAllBytes(x.toPath()), "ISO-8859-1").contains("http")) leaksUrl = true;
        ok("no URL written to disk", !leaksUrl, null);
    }

    static void finaleDetectorTest() {
        // Credits ending at the target's file end, but at a different distance from the refs' ends:
        // a finale must reject them (Ghost Hound e22), a normal episode accepts them.
        Detector det = new Detector(new Detector.Config());
        for (boolean finale : new boolean[]{true, false}) {
            EpisodeFeatures t = new EpisodeFeatures("t", 1, 1, "jpn", 600, 600, finale,
                    Track.build(0, noise(1, 4000), 8), Track.build(300, noise(2, 4000), 8));
            List<Detector.Cand> cands = new ArrayList<>();
            for (int i = 0; i < 3; i++) {
                Detector.Cand c = new Detector.Cand();
                c.ref = i; c.start = 500; c.end = 590; c.ncc = 0.99; c.density = 1.0;
                c.eofTarget = 10; c.eofRef = 40; cands.add(c);
            }
            Detector.Segment s = det.decide(false, t, cands, new ArrayList<>());
            ok(finale ? "finale rejects credits without eof agreement" : "non-finale accepts same credits",
                    finale ? s == null : s != null, s == null ? "null" : s.toString());
        }
    }

    public static void main(String[] a) throws Exception {
        plannerTests(); finaleDetectorTest();
        File dir = new File(a.length > 0 ? a[0] : "oneahead-test-tmp");
        storeTests(dir); runnerTests(new File(dir, "run"));
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
