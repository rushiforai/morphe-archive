package app.ayham.extension.music.automix;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

/**
 * The shared automix fixtures (spec/automix, the extension's master copy checked by
 * scripts/check-spec.ps1): our planner on the 5 real pairs against the extension's golden plans,
 * planned the way scripts/automix_fixtures.mjs does it.
 */
@SuppressWarnings("unchecked")
public class SpecFixturesTest {
    private static final double TOLERANCE = 1e-3;

    @Test
    public void plansMatchTheExtensionsGoldenPlans() throws Exception {
        File spec = specDir();
        File[] pairs = new File(spec, "automix/pairs").listFiles((d, n) -> n.endsWith(".json"));
        assertTrue("no pair files in " + spec, pairs != null && pairs.length > 0);
        Arrays.sort(pairs);
        List<String> diffs = new ArrayList<>();
        for (File f : pairs) {
            Map<String, Object> pair = (Map<String, Object>) Json.parse(read(f));
            Map<String, Object> golden = (Map<String, Object>) Json.parse(read(new File(spec, "automix/golden/" + f.getName())));
            for (int version = 1; version <= 3; version++) {
                // the goldens hold only the versions the extension still plays (2 and 3 since Phase 3)
                if (!golden.containsKey("v" + version)) continue;
                Map<String, Object> got = planPair(pair, version);
                compare(f.getName() + " v" + version, golden.get("v" + version), got, diffs);
            }
            // versions.md "Where a song is sung": planned with the pair's lyric lines, cut to plain LRC,
            // and mixed (the next song on its mask; the playing song on its old spans, lines or plain LRC)
            String[][] rows = {{"v3lyrics", "lines", ""}, {"v3lrc", "lrc", ""}, {"v3mixedOld", "old", "mixed"}, {"v3mixed", "lines", "mixed"}, {"v3mixedLrc", "lrc", "mixed"}};
            for (String[] r : rows) {
                assertTrue(f.getName() + " has no " + r[0], golden.containsKey(r[0]));
                compare(f.getName() + " " + r[0], golden.get(r[0]), planPair(pair, 3, r[1], !r[2].isEmpty()), diffs);
            }
            for (String k : golden.keySet())
                assertTrue(f.getName() + ": golden row " + k + " isn't planned here",
                        k.equals("pair") || k.equals("v2") || k.equals("v3") || java.util.Arrays.stream(rows).anyMatch(r -> r[0].equals(k)));
        }
        for (String d : diffs) System.out.println("DIFF " + d);
        assertTrue(diffs.size() + " differences from the golden plans (printed above): " + (diffs.isEmpty() ? "" : diffs.get(0)), diffs.isEmpty());
    }

    /**
     * The hard rules (the extension's PLAN.md, automix_fixtures.mjs MUST): Vaina Loca into SI NO ES
     * CONTIGO keeps the loop under Automix v2; Stereo Love into Midnight Sun (11% apart) is never a loop.
     */
    @Test
    public void automixV2KeepsTheHardRules() throws Exception {
        File spec = specDir();
        File[] pairs = new File(spec, "automix/pairs").listFiles((d, n) -> n.endsWith(".json"));
        assertTrue(pairs != null && pairs.length > 0);
        int checked = 0;
        for (File f : pairs) {
            String n = f.getName();
            if (!n.startsWith("1-") && !n.startsWith("2-")) continue;
            Object plays = planPair((Map<String, Object>) Json.parse(read(f)), 3).get("plays");
            if (n.startsWith("1-")) assertTrue(n + " under v3 must play a loop, plays " + plays, "loop".equals(plays));
            else assertTrue(n + " under v3 must never play a loop", !"loop".equals(plays));
            checked++;
        }
        assertTrue("both rule pairs present", checked == 2);
    }

    /**
     * The baseline (research/automix-baseline-2026-11-08.md, the extension's d26dc16): from the pair's
     * captured grids alone, Vaina Loca into SI NO ES CONTIGO plans a 4-bar loop at about 2:33 into
     * B's 4-bar loop at 9.60 s, 94 to 100 BPM, 12 bars, and YouTube's player takes over 34.4 s after
     * A's loop starts, at B's 0:24.0 (the recording's player clock).
     */
    @Test
    public void theBaselinePairPlansTwelveBarsNinetyFourToAHundred() throws Exception {
        File[] pairs = new File(specDir(), "automix/pairs").listFiles((d, n) -> n.startsWith("1-"));
        assertTrue(pairs != null && pairs.length == 1);
        Map<String, Object> pair = (Map<String, Object>) Json.parse(read(pairs[0]));
        List<Object> songs = (List<Object>) pair.get("songs");
        Map<String, Object> a = (Map<String, Object>) songs.get(0), b = (Map<String, Object>) songs.get(1);
        Analysis from = Analysis.fromJson((Map<String, Object>) a.get("analysis"));
        Analysis to = Analysis.fromJson((Map<String, Object>) b.get("analysis"));
        double pos = Math.max(30, from.durationSec - 95);
        Planner.Sung sung = new Planner.Sung();
        sung.out = spans(a.get("sung"));
        sung.in = spans(b.get("sung"));
        Planner.LoopPlan lp = Planner.planLoopMix(3, Planner.asOutgoing(from), audio(a), to, audio(b), pos + Planner.LOOP_SETUP_SEC, sung);
        assertTrue("no loop: " + lp, lp != null && lp.none == null);
        String got = lp.toString();
        assertTrue(got, lp.out.bars == 4 && Math.abs(lp.out.loopStart - 153.3) < 0.5);
        assertTrue(got, Math.abs(lp.in.loopStart - 9.60) < 0.02 && lp.in.bars == 4);
        assertTrue(got, Math.round(lp.out.bpm) == 94 && Math.round(lp.in.bpm / lp.fold) == 100);
        assertTrue(got, lp.enterBars == 4 && lp.rampBars == 3 && lp.totalBars == 12);
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        assertTrue("takes over at " + x.elementAt, Math.abs(x.elementAt - 34.4) < 0.1);
        assertTrue("released at " + x.releaseAt, Math.abs(x.releaseAt - 29.64) < 0.05);
        assertTrue("YT takes over at B's " + x.elementTrackTime, Math.abs(x.elementTrackTime - 24.0) < 0.05);
    }

    private static Map<String, Object> planPair(Map<String, Object> pair, int version) {
        return planPair(pair, version, null, false);
    }

    /** A song's sung spans from its captured line shapes (automix_fixtures.mjs spans): 'lrc' cuts them to plain LRC. */
    private static double[][] lineSpans(Map<String, Object> song, String lyrics) {
        return lineSpans(song, lyrics, false);
    }

    /** loop: read as the loop mix reads lines (Planner.loopSpansFromLines, automix_fixtures.mjs spans(s, loopSpansFromLines)). */
    private static double[][] lineSpans(Map<String, Object> song, String lyrics, boolean loop) {
        if (!(song.get("lines") instanceof List)) return null;
        List<Planner.LineShape> shapes = new ArrayList<>();
        for (Object o : (List<Object>) song.get("lines")) {
            Map<String, Object> l = (Map<String, Object>) o;
            double start = Json.num(l, "start");
            boolean lrc = "lrc".equals(lyrics);
            double end = lrc || !(l.get("end") instanceof Number) ? Double.NaN : Json.num(l, "end");
            double[][] wt = lrc ? null : spans(l.get("wordTimes"));
            shapes.add(new Planner.LineShape(start, end, (int) Json.num(l, "words"), wt));
        }
        double[][] sp = loop ? Planner.loopSpansFromLines(shapes) : Planner.sungSpansFromLines(shapes);
        return sp.length > 0 ? sp : null;
    }

    /**
     * lyrics null: as captured (the blend without lyrics, the loop on the captured spans). 'lines' or
     * 'lrc': both planned with the line shapes; mixed: the next song on its vocal mask, the playing
     * song on its old captured spans ('old'), its lines or plain LRC (automix_fixtures.mjs planPair).
     */
    private static Map<String, Object> planPair(Map<String, Object> pair, int version, String lyrics, boolean mixed) {
        List<Object> songs = (List<Object>) pair.get("songs");
        Map<String, Object> a = (Map<String, Object>) songs.get(0), b = (Map<String, Object>) songs.get(1);
        Analysis from = Analysis.fromJson((Map<String, Object>) a.get("analysis"));
        Analysis to = Analysis.fromJson((Map<String, Object>) b.get("analysis"));
        double pos = Math.max(30, from.durationSec - 95), earliest = pos + Mix.HAND_LEAD + 0.5;

        Planner.Settings s = new Planner.Settings();
        s.version = version;
        Planner.Sung sung = new Planner.Sung();
        if (lyrics == null) {
            sung.out = spans(a.get("sung"));
            sung.in = spans(b.get("sung"));
        } else if (mixed) {
            sung.out = "old".equals(lyrics) ? spans(a.get("sung")) : lineSpans(a, lyrics);
        } else {
            sung.out = lineSpans(a, lyrics);
            sung.in = lineSpans(b, lyrics);
        }
        // as captured, the extension plans the blend without sung spans; with lyrics, with them
        Planner.Plan blend = Planner.plan(s, (String) a.get("id"), (String) b.get("id"), from, to, from.durationSec, pos, earliest, lyrics == null ? null : sung);

        Analysis cur = Planner.asOutgoing(from);
        Object loop;
        Planner.LoopPlan lp = null;
        if (Planner.gridOk(cur) && Planner.gridOk(to)) {
            // the loop reads the lines as the baseline does; 'old' and the captured row keep the captured spans
            Planner.Sung loopSung = sung;
            if (lyrics != null && !"old".equals(lyrics)) {
                loopSung = new Planner.Sung();
                loopSung.out = lineSpans(a, lyrics, true);
                loopSung.in = mixed ? null : lineSpans(b, lyrics, true);
            }
            lp = Planner.planLoopMix(version, cur, audio(a), to, audio(b), pos + Planner.LOOP_SETUP_SEC, loopSung);
            loop = loopJson(lp);
        } else {
            loop = one("none", "beat grid too weak");
        }

        Map<String, Object> m = new LinkedHashMap<>();
        m.put("pos", pos);
        m.put("earliest", earliest);
        // what plays: the loop mix when it found bars (Automix v2: and it scores over the blend)
        Planner.Choice choice = Planner.loopOrBlend(version, blend, lp);
        m.put("plays", choice.loop ? "loop" : blend.style);
        if (choice.why != null) m.put("choice", choice.why);
        m.put("loop", loop);
        // Automix v2 with no loop mix: the curator blend (analysis-cases.md "The curator blend"), chosen
        // after the loop-or-blend score, which keeps the usual blend's numbers
        if (version == 3 && !choice.loop)
            blend = Planner.plan(s, (String) a.get("id"), (String) b.get("id"), from, to, from.durationSec, pos, earliest,
                    lyrics == null ? null : sung, null, 1, 1, true);
        m.put("blend", blendJson(blend));
        return m;
    }

    /** The decoded song as the extension's loop search reads it (automix_fixtures.mjs bufferOf, automix.js rms). */
    private static Planner.Audio audio(Map<String, Object> song) {
        double[] loud = Json.nums(song.get("loudness20Hz"));
        double decoded = Json.num(song, "decodedSec");
        final int rate = 320;
        float[] data = new float[loud.length * 16];
        for (int w = 0; w < loud.length; w++) Arrays.fill(data, w * 16, w * 16 + 16, (float) loud[w]);
        return new Planner.Audio() {
            @Override
            public double duration() {
                return decoded;
            }

            @Override
            public double rms(double from, double to) {
                int s = (int) Math.max(0, Math.floor(from * rate)), e = (int) Math.min(data.length, Math.floor(to * rate));
                double ss = 0;
                int n = 0;
                for (int i = s; i < e; i += 16) {
                    ss += data[i] * data[i];
                    n++;
                }
                return n > 0 ? Math.sqrt(ss / n) : 0;
            }
        };
    }

    private static double[][] spans(Object o) {
        if (!(o instanceof List)) return null;
        List<Object> l = (List<Object>) o;
        double[][] r = new double[l.size()][];
        for (int i = 0; i < r.length; i++) r[i] = Json.nums(l.get(i));
        return r;
    }

    private static Object loopJson(Planner.LoopPlan lp) {
        if (lp == null) return null;
        if (lp.none != null) return one("none", lp.none);
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("out", sideJson(lp.out));
        m.put("in", sideJson(lp.in));
        m.put("fold", lp.fold);
        m.put("enterBars", (double) lp.enterBars);
        m.put("rampBars", (double) lp.rampBars);
        m.put("exitBars", lp.exitBars);
        m.put("totalBars", (double) lp.totalBars);
        m.put("curves", curvesJson(lp.curves));
        return m;
    }

    private static Map<String, Object> sideJson(Planner.LoopSide s) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("key", s.key);
        m.put("loop", Arrays.asList(s.loopStart, s.loopEnd));
        m.put("bars", (double) s.bars);
        m.put("beatSec", s.beatSec);
        m.put("bpm", s.bpm);
        m.put("vocal", s.vocal);
        m.put("checkedBy", s.checkedBy);
        return m;
    }

    /** The plan as the extension's planner returns it: a hand-over or bridge has only its own fields. */
    private static Map<String, Object> blendJson(Planner.Plan p) {
        Map<String, Object> m = new LinkedHashMap<>();
        if (p.handoff || p.bridge) {
            m.put("style", p.style);
            m.put("fallback", p.fallback);
            m.put(p.handoff ? "handoff" : "bridge", true);
            m.put("reason", p.reason);
            m.put("mixOutTrackTime", p.mixOutTrackTime);
            m.put("durationSec", p.durationSec);
            m.put("mixInTrackTime", p.mixInTrackTime);
            m.put("rate", p.rate);
            m.put("bars", (double) p.bars);
            m.put("swapDb", p.swapDb);
            m.put("barSec", p.barSec);
            m.put("bpm", null);
            m.put("inBpm", null);
            if (p.bridge) m.put("trim", trimJson(p.trim));
            m.put("curves", curvesJson(p.curves));
            return m;
        }
        if ("filter".equals(p.style)) {
            // automix.js filterMix's own fields
            m.put("style", p.style);
            m.put("fallback", p.fallback);
            m.put("reason", p.reason);
            m.put("v2", p.v2);
            m.put("clash", p.clash);
            m.put("rerouted", p.rerouted);
            if (p.anchor != null) m.put("anchor", anchorJson(p.anchor));
            m.put("mixOutTrackTime", p.mixOutTrackTime);
            m.put("durationSec", p.durationSec);
            m.put("mixInTrackTime", p.mixInTrackTime);
            m.put("rate", p.rate);
            m.put("bars", (double) p.bars);
            m.put("swapDb", p.swapDb);
            m.put("barSec", p.barSec);
            m.put("bpm", p.bpm);
            m.put("inBpm", p.inBpm);
            m.put("curves", curvesJson(p.curves));
            return m;
        }
        m.put("style", p.style);
        if (p.shape != null) m.put("shape", p.shape);
        if ("muffle".equals(p.shape)) m.put("muffleLead", p.muffleLead);
        m.put("fallback", p.fallback);
        m.put("reason", p.reason);
        if (p.v3) {
            m.put("subBassContrast", p.subBassContrast);
            m.put("swapAt", p.swapAt);
            m.put("swapMoved", p.swapMoved);
            if (p.harmonic == null) {
                m.put("harmonic", null);
            } else {
                Map<String, Object> h = new LinkedHashMap<>();
                h.put("score", p.harmonic.score);
                h.put("confidence", p.harmonic.confidence);
                h.put("keyScore", p.harmonic.keyScore);
                h.put("chromaScore", p.harmonic.chromaScore);
                h.put("severeClash", p.harmonic.severeClash);
                h.put("short", p.harmonic.shortBlend);
                m.put("harmonic", h);
            }
            m.put("trim", trimJson(p.trim));
        }
        // every blend carries its glide (null: none), Classic's too
        if (p.glide == null) {
            m.put("glide", null);
        } else {
            Map<String, Object> g = new LinkedHashMap<>();
            g.put("q", p.glide.q);
            g.put("beats", (double) p.glide.beats);
            g.put("beatOutSec", p.glide.beatOutSec);
            m.put("glide", g);
        }
        m.put("v2", p.v2);
        m.put("clash", p.clash);
        m.put("rerouted", p.rerouted);
        m.put("vocalsBy", p.vocalsBy);
        m.put("keyClash", p.keyClash);
        if (p.anchor != null) m.put("anchor", anchorJson(p.anchor));
        if (p.curator) m.put("curator", true);
        if (p.echo != null) {
            Map<String, Object> e = new LinkedHashMap<>();
            e.put("beats", (double) p.echo.beats);
            e.put("delaySec", p.echo.delaySec);
            e.put("feedback", p.echo.feedback);
            e.put("cutSec", p.echo.cutSec);
            m.put("echo", e);
        }
        m.put("mixOutTrackTime", p.mixOutTrackTime);
        m.put("durationSec", p.durationSec);
        m.put("mixInTrackTime", p.mixInTrackTime);
        m.put("rate", p.rate);
        m.put("outRate", p.outRate);
        m.put("rampBeats", (double) p.rampBeats);
        m.put("rampSongSec", p.rampSongSec);
        m.put("beatSec", p.beatSec);
        m.put("bars", (double) p.bars);
        m.put("swapDb", p.swapDb);
        m.put("barSec", p.barSec);
        m.put("bpm", p.bpm);
        m.put("outBpm", p.outBpm);
        m.put("inBpm", p.inBpm);
        m.put("curves", curvesJson(p.curves));
        return m;
    }

    private static Map<String, Object> anchorJson(Planner.Anchor a) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("kind", a.kind);
        m.put("sec", a.sec);
        m.put("score", a.score);
        return m;
    }

    private static Map<String, Object> trimJson(Planner.Trim t) {
        if (t == null) return null;
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("diffDb", t.diffDb);
        m.put("outDb", t.outDb);
        m.put("inDb", t.inDb);
        return m;
    }

    private static Map<String, Object> curvesJson(Curves c) {
        if (c == null) return null;
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("durationSec", c.durationSec);
        m.put("out", deckJson(c.out));
        m.put("in", deckJson(c.in));
        return m;
    }

    private static Map<String, Object> deckJson(Map<String, double[][]> deck) {
        Map<String, Object> m = new LinkedHashMap<>();
        for (Map.Entry<String, double[][]> e : deck.entrySet()) {
            List<Object> pts = new ArrayList<>();
            for (double[] p : e.getValue()) pts.add(Arrays.asList(p[0], p[1]));
            m.put(e.getKey(), pts);
        }
        return m;
    }

    private static void compare(String path, Object want, Object got, List<String> diffs) {
        if (got instanceof Double && ((Double) got).isNaN()) got = null;
        if (want instanceof Number && got instanceof Number) {
            double w = ((Number) want).doubleValue(), g = ((Number) got).doubleValue();
            if (Math.abs(w - g) > TOLERANCE) diffs.add(path + ": want " + w + ", got " + g);
        } else if (want instanceof Map && got instanceof Map) {
            Map<String, Object> w = (Map<String, Object>) want, g = (Map<String, Object>) got;
            for (String k : w.keySet()) compare(path + "." + k, w.get(k), g.get(k), diffs);
            for (String k : g.keySet()) if (!w.containsKey(k)) diffs.add(path + "." + k + ": not in the golden plan");
        } else if (want instanceof List && got instanceof List) {
            List<Object> w = (List<Object>) want, g = (List<Object>) got;
            if (w.size() != g.size()) diffs.add(path + ": want " + w + ", got " + g);
            else for (int i = 0; i < w.size(); i++) compare(path + "[" + i + "]", w.get(i), g.get(i), diffs);
        } else if (want == null ? got != null : !want.equals(got)) {
            diffs.add(path + ": want " + want + ", got " + got);
        }
    }

    private static Map<String, Object> one(String k, Object v) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put(k, v);
        return m;
    }

    /** spec/ at the repo root, found from wherever Gradle runs the test. */
    private static File specDir() {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File s = new File(d, "spec/automix");
            if (s.isDirectory()) return s.getParentFile();
        }
        throw new AssertionError("spec/ not found above " + new File("").getAbsolutePath());
    }

    private static String read(File f) throws Exception {
        return new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8);
    }
}
