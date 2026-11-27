package app.ayham.extension.music.automix;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.junit.Assume;
import org.junit.Test;

/**
 * spec/automix/spotify-benchmark.md, the phone's part (rules 4 and 5), offline and local only: run by
 * scripts/spotify-bench.ps1, skipped otherwise.
 *
 * <p>SPOTIFY_BENCH is the shared bench folder (key.json, and phone/ is written here). BENCH_WAV holds
 * each song of the key as &lt;videoId&gt;.wav, bench/audio's file decoded at its own rate (the script
 * decodes it with ffmpeg, standing in for the phone's MediaCodec). SPOTIFY_EXPORTS is the folder of the
 * four exports. Each song goes through the phone's analyser as a decoded song does
 * (AnalysisRealSongsTest.analyse) and is written to phone/&lt;videoId&gt;.json; one already there is
 * read back unless BENCH_REDO is set. Then every export mix whose two songs are both in the key is
 * planned: Auto with the app's default settings, the blend planner (no loop mix), pos 30 s, earliest
 * 34.5 s, no lyrics (each analysis' own vocal mask), written to phone/plans.json.
 */
public class SpotifyBenchTest {
    static final String[] EXPORTS = {"budget-dj-mix", "dj-club-mixes", "heavenly-transitions", "rap-mixes"};
    static final double POS = 30, EARLIEST = 34.5;

    @SuppressWarnings("unchecked")
    @Test
    public void phoneAnalysesAndPlansForTheSpotifyBenchmark() throws Exception {
        String bench = System.getenv("SPOTIFY_BENCH"), wavs = System.getenv("BENCH_WAV"), exports = System.getenv("SPOTIFY_EXPORTS");
        Assume.assumeTrue("SPOTIFY_BENCH, BENCH_WAV and SPOTIFY_EXPORTS not set: the benchmark runs only on request",
                bench != null && wavs != null && exports != null);
        String outName = System.getenv("BENCH_OUT");
        File keyFile = new File(bench, "key.json"), out = new File(bench, outName != null ? outName : "phone");
        Assume.assumeTrue("no " + keyFile + " yet", keyFile.isFile());
        assertTrue("can't make " + out, out.isDirectory() || out.mkdirs());
        boolean redo = System.getenv("BENCH_REDO") != null;
        Map<String, Object> key = (Map<String, Object>) Json.parse(read(keyFile));
        Map<String, Object> songs = (Map<String, Object>) key.get("songs");
        assertTrue("key.json has no songs", songs != null && !songs.isEmpty());

        AnalysisCasesRealTest.setUp();
        // BENCH_THREADS songs at once (default 1); BENCH_IDS (comma-separated) analyses only those
        int threads = System.getenv("BENCH_THREADS") != null ? Integer.parseInt(System.getenv("BENCH_THREADS")) : 1;
        java.util.Set<String> only = System.getenv("BENCH_IDS") == null ? null
                : new java.util.HashSet<>(java.util.Arrays.asList(System.getenv("BENCH_IDS").split(",")));
        Map<String, Analysis> analyses = java.util.Collections.synchronizedMap(new LinkedHashMap<>());
        java.util.concurrent.atomic.AtomicInteger fresh = new java.util.concurrent.atomic.AtomicInteger(), missing = new java.util.concurrent.atomic.AtomicInteger(),
                failed = new java.util.concurrent.atomic.AtomicInteger();
        java.util.concurrent.ExecutorService pool = java.util.concurrent.Executors.newFixedThreadPool(threads);
        List<java.util.concurrent.Future<?>> jobs = new ArrayList<>();
        for (String id : songs.keySet()) {
            if (only != null && !only.contains(id)) continue;
            jobs.add(pool.submit(() -> {
                File json = new File(out, id + ".json"), wav = new File(wavs, id + ".wav");
                try {
                    if (json.isFile() && !redo) {
                        analyses.put(id, Analysis.fromJson((Map<String, Object>) Json.parse(read(json))));
                        return;
                    }
                    if (!wav.isFile()) {
                        missing.incrementAndGet();
                        System.out.println(id + ": no decoded audio, left out");
                        return;
                    }
                    long t0 = System.nanoTime();
                    Analysis a = AnalysisRealSongsTest.analyse(id, AnalysisRealSongsTest.read(wav));
                    Map<String, Object> j = new LinkedHashMap<>();
                    j.put("side", "phone");
                    j.put("videoId", id);
                    j.putAll(a.toJson());
                    Files.write(json.toPath(), Json.write(j).getBytes(StandardCharsets.UTF_8));
                    analyses.put(id, a);
                    fresh.incrementAndGet();
                    System.out.println(String.format(Locale.US, "%s: %.1f s, %.2f BPM (conf %.2f), key %s, %d vocal windows, %d ms",
                            id, a.durationSec, a.bpm, a.gridConfidence, a.keyName, a.vocals.size(), (System.nanoTime() - t0) / 1000000));
                } catch (Throwable e) {
                    failed.incrementAndGet();
                    System.out.println(id + ": analysis failed: " + e);
                }
            }));
        }
        for (java.util.concurrent.Future<?> f : jobs) f.get();
        pool.shutdown();

        // rule 5: the export mixes, planned on these analyses
        Planner.Settings s = new Planner.Settings();
        s.version = 2;   // the app's default (Automix.settings): Classic, Auto bars, not key-aware
        List<Object> plans = new ArrayList<>();
        for (String name : EXPORTS) {
            File f = new File(exports, name + ".json");
            if (!f.isFile()) {
                System.out.println(f + ": missing, its mixes left out");
                continue;
            }
            Map<String, Object> ex = (Map<String, Object>) Json.parse(read(f));
            for (Object o : (List<Object>) ex.get("mixes")) {
                Map<String, Object> m = (Map<String, Object>) o;
                String from = videoId(m.get("from")), to = videoId(m.get("to"));
                Analysis a = from == null ? null : analyses.get(from), b = to == null ? null : analyses.get(to);
                if (a == null || b == null) continue;
                Planner.Plan p = Planner.plan(s, from, to, a, b, a.durationSec, POS, EARLIEST, new Planner.Sung());
                Map<String, Object> j = new LinkedHashMap<>();
                j.put("playlist", name);
                j.put("index", ((Number) m.get("index")).intValue());
                j.put("from", from);
                j.put("to", to);
                j.put("style", p.style);
                j.put("mixOutTrackTime", round(p.mixOutTrackTime));
                j.put("mixInTrackTime", round(p.mixInTrackTime));
                j.put("durationSec", round(p.durationSec));
                j.put("bars", p.bars);
                plans.add(j);
            }
        }
        Map<String, Object> doc = new LinkedHashMap<>();
        doc.put("format", "spotify-bench-plans");
        doc.put("version", 1);
        doc.put("app", "phone");
        doc.put("analysisVersion", Analysis.VERSION);
        doc.put("plans", plans);
        if (only == null) Files.write(new File(out, "plans.json").toPath(), Json.write(doc).getBytes(StandardCharsets.UTF_8));
        System.out.println(String.format(Locale.US, "spotify bench, phone: %d songs in the key, %d analysed now, %d read back, %d without audio, %d failed; %d plans",
                songs.size(), fresh.get(), analyses.size() - fresh.get(), missing.get(), failed.get(), plans.size()));
        assertTrue("no song analysed", !analyses.isEmpty());
    }

    @SuppressWarnings("unchecked")
    private static String videoId(Object side) {
        Object v = side instanceof Map ? ((Map<String, Object>) side).get("youtubeVideoId") : null;
        return v instanceof String && !((String) v).isEmpty() ? (String) v : null;
    }

    private static Object round(double v) {
        return Double.isNaN(v) || Double.isInfinite(v) ? null : Math.round(v * 1000) / 1000.0;
    }

    private static String read(File f) throws Exception {
        return new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
    }
}
