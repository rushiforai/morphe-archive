package app.tikkamasalla.stremio.oneahead;

import app.tikkamasalla.stremio.oneahead.demux.ByteBudget;
import app.tikkamasalla.stremio.oneahead.demux.DemuxException;
import app.tikkamasalla.stremio.oneahead.demux.PlaybackGuard;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

/**
 * Reference cap: stored references first, stop at 3 usable. The Streamer read a
 * fifth reference for 8 minutes with 4 stored ones loaded; the uncached one
 * here is listed (and priced) first, so only the fix keeps it unfetched.
 */
public final class OneAheadRefStopSelfTest {
    static int fails = 0, total = 0;
    static void ok(String name, boolean cond, String info) {
        total++; if (!cond) fails++;
        System.out.println((cond ? "ok   " : "FAIL ") + name + (info == null ? "" : "  " + info));
    }
    static String src(String rel) throws Exception {
        String root = System.getProperty("oa.src", "extensions/extension/src/main/java");
        return new String(Files.readAllBytes(Paths.get(root, rel)), StandardCharsets.UTF_8).replace("\r\n", "\n");
    }
    static OneAheadPlanner.FileRef ref(String ep, long size, long hash) {
        return new OneAheadPlanner.FileRef(ep, "vid-" + ep, 42, size, hash, 1450,
                OneAheadPlanner.Container.MKV, false, false, "jpn", -1);
    }
    static float[] noise(long seed, int n) {
        Random r = new Random(seed); float[] x = new float[n]; double lp = 0;
        for (int i = 0; i < n; i++) { lp = 0.7 * lp + 0.3 * r.nextGaussian(); x[i] = (float) (lp * 0.2); }
        return x;
    }
    static EpisodeFeatures synth(String id, long size, long hash) {
        int sr = Track.SR;
        long sd = id.hashCode() & 0xFFFF;
        float[] head = noise(sd, 300 * sr), tail = noise(sd + 7, 300 * sr);
        float[] themeI = noise(4242, 90 * sr), themeC = noise(777, 90 * sr);
        System.arraycopy(themeI, 0, head, 10 * sr, themeI.length);
        System.arraycopy(themeC, 0, tail, 200 * sr, themeC.length);
        return new EpisodeFeatures(id, size, hash, "jpn", 1450, 1450, false,
                Track.build(0, head, 8), Track.build(1450 - 300, tail, 8));
    }
    static final class CountingFetcher implements OneAheadRunner.FeatureFetcher {
        final List<String> fetched = new ArrayList<>();
        public EpisodeFeatures fetch(OneAheadPlanner.FilePlan fp, ByteBudget b, PlaybackGuard g) {
            fetched.add(fp.ref.episodeId);
            return synth(fp.ref.episodeId, fp.ref.fileSize, fp.ref.headHash);
        }
    }
    public static void main(String[] a) throws Exception {
        String runnerSrc = src("app/tikkamasalla/stremio/oneahead/OneAheadRunner.java");
        ok("agreement still needs 2", runnerSrc.contains("c.minRefs = 2"), null);
        ok("refs-lost gate unchanged", runnerSrc.contains("refs.size() < 2"), null);
        File dir = new File(a.length > 0 ? a[0] : "refstop-test-tmp");
        CountingFetcher seed = new CountingFetcher();
        OneAheadRunner r1 = new OneAheadRunner(dir, seed, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-02");
        List<OneAheadPlanner.FileRef> stored = Arrays.asList(ref("s1", 300_000_101L, 101), ref("s2", 300_000_102L, 102),
                ref("s3", 300_000_103L, 103), ref("s4", 300_000_104L, 104));
        OneAheadRunner.Outcome o1 = r1.runOnce(ref("tSeed", 300_000_000L, 999), stored, "show1");
        ok("seed run caches 4 refs", o1.status == OneAheadRunner.Status.DONE, o1.status + "/" + o1.reason);
        CountingFetcher probe = new CountingFetcher();
        OneAheadRunner r2 = new OneAheadRunner(dir, probe, OneAheadRunner.defaultDetectors(), PlaybackGuard.NONE, () -> "2026-11-03");
        List<OneAheadPlanner.FileRef> cands = new ArrayList<>();
        cands.add(ref("u1", 299_000_000L, 1)); // uncached, smallest: the planner prices it first
        cands.addAll(stored);
        OneAheadRunner.Outcome o2 = r2.runOnce(ref("tSeed", 300_000_000L, 999), cands, "show1");
        ok("run still finds segments", o2.status == OneAheadRunner.Status.DONE, o2.status + "/" + o2.reason);
        ok("uncached fifth reference never read", !probe.fetched.contains("u1"), String.valueOf(probe.fetched));
        ok("no refetch at all (3 stored reused)", probe.fetched.isEmpty(), String.valueOf(probe.fetched));
        System.out.println("TOTAL " + total + " FAIL " + fails);
        System.exit(fails == 0 ? 0 : 1);
    }
}
