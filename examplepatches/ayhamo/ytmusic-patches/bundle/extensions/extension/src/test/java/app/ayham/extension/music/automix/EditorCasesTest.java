package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;

/**
 * The transition editor (spec/automix/editor.md): the shared cases of editor-cases.json (each
 * preset and lane as curves, saved window positions read back on a grid), the old picks'
 * migration, and how the planner plays an override (editor.md §9).
 */
@SuppressWarnings("unchecked")
public class EditorCasesTest {
    private static final double TOLERANCE = 1e-6;

    private static Map<String, Object> cases() throws Exception {
        for (File d = new File("").getAbsoluteFile(); d != null; d = d.getParentFile()) {
            File f = new File(d, "spec/automix/editor-cases.json");
            if (f.isFile()) return (Map<String, Object>) Json.parse(new String(Files.readAllBytes(f.toPath()), StandardCharsets.UTF_8));
        }
        throw new AssertionError("spec/automix/editor-cases.json not found above " + new File("").getAbsolutePath());
    }

    /** Every group of editor-cases.json is run here: a new group fails until it is, so "passes" never means "skipped". */
    @Test
    public void everyGroupOfTheCasesIsRun() throws Exception {
        List<String> run = java.util.Arrays.asList("notes", "curves", "windows", "plans", "draw");
        for (String group : cases().keySet()) assertTrue("editor-cases.json group \"" + group + "\" is not run by EditorCasesTest", run.contains(group));
    }

    @Test
    public void presetAndLaneCurvesMatchTheCases() throws Exception {
        List<String> diffs = new ArrayList<>();
        List<Object> cases = (List<Object>) cases().get("curves");
        assertEquals(27, cases.size());
        for (Object o : cases) {
            Map<String, Object> c = (Map<String, Object>) o;
            MixOverride ov = MixOverride.fromJson(c.get("override"));
            double D = ((Number) c.get("D")).doubleValue();
            double beat = c.get("beatSec") instanceof Number ? ((Number) c.get("beatSec")).doubleValue() : Double.NaN;
            Curves got = MixOverride.presetCurves(ov, D, beat);
            Object want = c.get("expect");
            if (want == null) {
                if (got != null) diffs.add(c.get("name") + ": expected refused, got " + Json.write(asJson(got)));
                continue;
            }
            if (got == null) {
                diffs.add(c.get("name") + ": refused");
                continue;
            }
            if (!same(want, asJson(got))) diffs.add(c.get("name") + ":\n  got  " + Json.write(asJson(got)) + "\n  want " + Json.write(want));
        }
        assertTrue(diffs.size() + " of " + cases.size() + " differ:\n" + String.join("\n", diffs), diffs.isEmpty());
    }

    @Test
    public void savedWindowPositionsReadBackAsTheCasesSay() throws Exception {
        List<String> diffs = new ArrayList<>();
        List<Object> cases = (List<Object>) cases().get("windows");
        assertEquals(8, cases.size());
        for (Object o : cases) {
            Map<String, Object> c = (Map<String, Object>) o;
            Map<String, Object> p = (Map<String, Object>) c.get("pos");
            MixOverride.Position pos = new MixOverride.Position(((Number) p.get("bar")).intValue(),
                    p.get("beat") instanceof Number ? ((Number) p.get("beat")).intValue() : 0,
                    p.get("nudgeMs") instanceof Number ? ((Number) p.get("nudgeMs")).intValue() : 0, ((Number) p.get("sec")).doubleValue());
            Map<String, Object> g = (Map<String, Object>) c.get("grid");
            MixOverride.Resolved r = g == null ? MixOverride.resolveWindow(pos, Double.NaN, Double.NaN)
                    : MixOverride.resolveWindow(pos, ((Number) g.get("downbeatSec")).doubleValue(), ((Number) g.get("beatSec")).doubleValue());
            Map<String, Object> got = new LinkedHashMap<>();
            got.put("sec", r.sec);
            got.put("moved", r.moved);
            got.put("snapped", r.snapped);
            Map<String, Object> want = (Map<String, Object>) c.get("expect");
            if (want.containsKey("bar")) got.put("bar", r.bar);
            if (!same(want, got)) diffs.add(c.get("name") + ": got " + Json.write(got) + ", want " + Json.write(want));
        }
        assertTrue(String.join("\n", diffs), diffs.isEmpty());
    }

    /** A steady song as the plans cases give it ({bpm, sec, downbeatSec}): every beat sure, flat energy (editor_cases.mjs song). */
    private static Analysis steady(String id, Map<String, Object> c) {
        double bpm = ((Number) c.get("bpm")).doubleValue(), sec = ((Number) c.get("sec")).doubleValue();
        Analysis a = new Analysis();
        a.fileKey = id;
        a.bpm = bpm;
        a.beatIntervalSec = 60 / bpm;
        a.firstDownbeatSec = ((Number) c.get("downbeatSec")).doubleValue();
        a.gridConfidence = 1;
        a.durationSec = sec;
        a.energyCurve = new double[(int) Math.ceil(sec / (a.beatIntervalSec * 16))];
        java.util.Arrays.fill(a.energyCurve, 1);
        a.energy = 1;
        a.introEndSec = 0;
        a.outroStartSec = sec - 20;
        a.tailGridKnown = false; // no tailGrid in the case: the song's own grid at its end too
        return a;
    }

    @Test
    public void overridesPlayTheWindowsTheCasesSay() throws Exception {
        List<String> diffs = new ArrayList<>();
        List<Object> cases = (List<Object>) cases().get("plans");
        assertEquals(11, cases.size());
        for (Object o : cases) {
            Map<String, Object> c = (Map<String, Object>) o;
            int engine = ((Number) c.get("engine")).intValue();
            Planner.Settings s = new Planner.Settings();
            s.version = engine;
            Analysis from = steady("a", (Map<String, Object>) c.get("out")), to = steady("b", (Map<String, Object>) c.get("in"));
            double pos = ((Number) c.get("pos")).doubleValue();
            // an override with a speed is planned with it (spotify-mixes.md rule 10, editor-cases notes)
            MixOverride ov = MixOverride.fromJson(c.get("override"));
            boolean speeds = ov != null && ov.hasSpeed();
            Planner.Plan p = speeds ? Planner.plan(s, "a", "b", from, to, from.durationSec, pos, pos + 4.5, null, ov, ov.speedOut, ov.speedIn)
                    : Planner.plan(s, "a", "b", from, to, from.durationSec, pos, pos + 4.5, null, ov);
            Map<String, Object> got = new LinkedHashMap<>();
            got.put("style", p.style);
            got.put("bars", (double) p.bars);
            got.put("durationSec", p.durationSec);
            got.put("mixOutTrackTime", p.mixOutTrackTime);
            got.put("mixInTrackTime", p.mixInTrackTime);
            got.put("glide", p.glide != null);
            got.put("kickLock", engine == 3 && Planner.kickLockAllowed(p));
            got.put("warnings", p.warnings != null ? new ArrayList<Object>(p.warnings) : new ArrayList<>());
            if (speeds) {
                got.put("outRate", Math.round((p.outRate > 0 ? p.outRate : 1) * 1e6) / 1e6);
                got.put("rate", Math.round(p.rate * 1e6) / 1e6);
                got.put("speedOut", p.speedOut);
                got.put("speedIn", p.speedIn);
            }
            Object want = c.get("expect");
            if (!same(want, got)) diffs.add(c.get("name") + ":\n  got  " + Json.write(got) + "\n  want " + Json.write(want));
        }
        assertTrue(diffs.size() + " of " + cases.size() + " differ:\n" + String.join("\n", diffs), diffs.isEmpty());
    }

    private static double num(Object v) {
        return ((Number) v).doubleValue();
    }

    private static Planner.Glide glideOf(Object json) {
        if (!(json instanceof Map)) return null;
        Map<String, Object> g = (Map<String, Object>) json;
        return new Planner.Glide(num(g.get("q")), (int) num(g.get("beats")), num(g.get("beatOutSec")));
    }

    /** editor_cases.mjs counted: each drawing as the number of points (volume) or curves kept per deck. */
    private static Object counted(Map<String, Object> o) {
        if (o == null || !(o.get("lanes") instanceof Map)) return o;
        Map<String, Object> lanes = new LinkedHashMap<>();
        for (Map.Entry<String, Object> e : ((Map<String, Object>) o.get("lanes")).entrySet()) {
            Object v = e.getValue();
            if (v instanceof Map) {
                Map<String, Object> d = (Map<String, Object>) v, n = new LinkedHashMap<>();
                for (String side : new String[]{"out", "in"}) {
                    Object deck = d.get(side);
                    n.put(side, (double) (deck instanceof List ? ((List<?>) deck).size() : ((Map<?, ?>) deck).size()));
                }
                v = n;
            }
            lanes.put(e.getKey(), v);
        }
        Map<String, Object> r = new LinkedHashMap<>(o);
        r.put("lanes", lanes);
        return r;
    }

    @Test
    public void drawnCurvesMatchTheCases() throws Exception {
        List<String> diffs = new ArrayList<>();
        int n = 0;
        for (Object o : (List<Object>) cases().get("draw")) {
            Map<String, Object> c = (Map<String, Object>) o;
            if (c.get("name") == null) continue; // the group's _about
            n++;
            String fn = (String) c.get("fn");
            Object got;
            switch (fn) {
                case "pointCurves": {
                    Planner.Glide glide = glideOf(c.get("glide"));
                    double D = c.get("D") instanceof Number ? num(c.get("D")) : Planner.glideSteps(glide.q, glide.beats, glide.beatOutSec).total;
                    Map<String, Object> lanes = (Map<String, Object>) c.get("lanes");
                    MixOverride.Drawing[] drawn = new MixOverride.Drawing[3];
                    for (int k = 0; k < 3; k++) drawn[k] = MixOverride.Drawing.read(MixOverride.LANES[k], lanes.get(MixOverride.LANES[k]));
                    Curves pc = MixOverride.pointCurves(drawn, D, num(c.get("beatSec")), glide);
                    Map<String, Object> m = new LinkedHashMap<>();
                    m.put("out", side(pc.out));
                    m.put("in", side(pc.in));
                    got = m;
                    break;
                }
                case "presetCurves": {
                    double beat = num(c.get("beatSec"));
                    Curves pc = MixOverride.presetCurves(MixOverride.fromJson(c.get("override")), num(c.get("D")), beat, beat, null);
                    got = pc == null ? null : asJson(pc);
                    break;
                }
                case "normalizeOverride": {
                    MixOverride ov = MixOverride.fromJson(c.get("override"));
                    Map<String, Object> m = ov == null ? null : (Map<String, Object>) Json.parse(Json.write(ov.toJson()));
                    got = Boolean.TRUE.equals(c.get("count")) ? counted(m) : m;
                    break;
                }
                case "shapeDrawing": {
                    Object d = MixOverride.shapeDrawing((String) c.get("lane"), (String) c.get("shape"), num(c.get("D")), num(c.get("beatSec")), null, (String) c.get("unit"));
                    got = d instanceof MixOverride.Drawing ? Json.parse(Json.write(((MixOverride.Drawing) d).toJson((String) c.get("lane")))) : d;
                    break;
                }
                case "plan": {
                    Planner.Settings s = new Planner.Settings();
                    s.version = 2; // editor_cases.mjs load(null): the extension's default engine
                    Analysis from = steady("a", (Map<String, Object>) c.get("out")), to = steady("b", (Map<String, Object>) c.get("in"));
                    double pos = num(c.get("pos"));
                    Planner.Plan p = Planner.plan(s, "a", "b", from, to, from.durationSec, pos, pos + 4.5, null, MixOverride.fromJson(c.get("override")));
                    Map<String, Object> m = new LinkedHashMap<>();
                    m.put("style", p.style);
                    m.put("bars", (double) p.bars);
                    m.put("durationSec", Math.round(p.durationSec * 1e6) / 1e6);
                    m.put("outRate", Math.round((p.outRate > 0 ? p.outRate : 1) * 1e6) / 1e6);
                    m.put("rate", Math.round(p.rate * 1e6) / 1e6);
                    Map<String, Object> out = side(p.curves.out), in = side(p.curves.in);
                    m.put("gainOut", out.get("gain"));
                    m.put("gainIn", in.get("gain"));
                    got = m;
                    break;
                }
                default:
                    throw new AssertionError("unknown fn " + fn);
            }
            if (!same(c.get("expect"), got)) diffs.add(c.get("name") + ":\n  got  " + Json.write(got) + "\n  want " + Json.write(c.get("expect")));
        }
        assertEquals(17, n);
        assertTrue(diffs.size() + " of " + n + " differ:\n" + String.join("\n", diffs), diffs.isEmpty());
    }

    @Test
    public void aDrawingSurvivesItsJsonAndAShapePickedOverItDropsIt() {
        MixOverride o = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":{\"unit\":\"beat\",\"out\":[[0,1],[8,1],[8,0]],\"in\":[[0,0],[8,0],[8,1]]},\"eq\":\"centerBassSwap\",\"effect\":{\"unit\":\"sec\",\"out\":{\"hp\":[[0,20],[4,1000]]},\"in\":{}}}}");
        assertTrue(o.hasDrawing());
        String text = Json.write(o.toJson());
        assertEquals(text, Json.write(MixOverride.fromJson(Json.parse(text)).toJson()));
        assertEquals(text, Json.write(o.copy().toJson()));
        assertTrue(text, text.contains("\"effect\":{\"unit\":\"sec\",\"out\":{\"hp\":[[0.0,20.0],[4.0,1000.0]]},\"in\":{}}")
                || text.contains("\"effect\":{\"unit\":\"sec\",\"out\":{\"hp\":[[0,20],[4,1000]]},\"in\":{}}"));
        o.drawn[0] = null;
        o.volume = "smooth";
        MixOverride n = MixOverride.normalize(o);
        assertFalse(n.lanes()[0], MixOverride.DRAW.equals(n.lanes()[0]));
        assertTrue(n.hasDrawing()); // the effect drawing stays
    }

    /** Curves as editor-cases.json writes them: durationSec, then out and in, each curve name in the case's order. */
    private static Map<String, Object> asJson(Curves c) {
        Map<String, Object> m = new LinkedHashMap<>();
        m.put("durationSec", c.durationSec);
        m.put("out", side(c.out));
        m.put("in", side(c.in));
        return m;
    }

    private static Map<String, Object> side(Map<String, double[][]> curves) {
        Map<String, Object> m = new LinkedHashMap<>();
        for (Map.Entry<String, double[][]> e : curves.entrySet()) {
            List<Object> pts = new ArrayList<>();
            for (double[] p : e.getValue()) {
                List<Object> pt = new ArrayList<>();
                pt.add(p[0]);
                pt.add(p[1]);
                pts.add(pt);
            }
            m.put(e.getKey(), pts);
        }
        return m;
    }

    /** Numbers within TOLERANCE; maps by key (order free); lists element by element. */
    private static boolean same(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) return Math.abs(((Number) a).doubleValue() - ((Number) b).doubleValue()) <= TOLERANCE;
        if (a instanceof List && b instanceof List) {
            List<?> x = (List<?>) a, y = (List<?>) b;
            if (x.size() != y.size()) return false;
            for (int i = 0; i < x.size(); i++) if (!same(x.get(i), y.get(i))) return false;
            return true;
        }
        if (a instanceof Map && b instanceof Map) {
            Map<?, ?> x = (Map<?, ?>) a, y = (Map<?, ?>) b;
            if (!x.keySet().equals(y.keySet())) return false;
            for (Object k : x.keySet()) if (!same(x.get(k), y.get(k))) return false;
            return true;
        }
        return a == null ? b == null : a.equals(b);
    }

    // ── the override itself (editor.md §1) ──

    private static Object json(String s) {
        return Json.parse(s);
    }

    @Test
    public void oldPicksMigrateAsTheyAreRead() {
        MixOverride loop = MixOverride.fromJson(json("{\"style\":\"loop\",\"bars\":0}"));
        assertEquals("loop", loop.preset);
        MixOverride blend = MixOverride.fromJson(json("{\"style\":\"blend\",\"bars\":8}"));
        assertNull(blend.preset);
        assertEquals("blend", blend.family);
        assertEquals(8, blend.bars);
        MixOverride filter = MixOverride.fromJson(json("{\"style\":\"filter\",\"bars\":0}"));
        assertEquals("filter", filter.family);
        MixOverride fade = MixOverride.fromJson(json("{\"style\":\"crossfade\",\"bars\":0}"));
        assertEquals("off", fade.beatMatch);
        assertNull(fade.family);
        // Auto and Auto: no override at all
        assertNull(MixOverride.fromJson(json("{\"style\":null,\"bars\":0}")));
        // a loop keeps its own length: the bars of an old loop pick are dropped
        assertEquals(0, MixOverride.fromJson(json("{\"style\":\"loop\",\"bars\":8}")).bars);
    }

    @Test
    public void nothingButAutoIsNoOverride() {
        assertNull(MixOverride.fromJson(json("{\"v\":1,\"preset\":\"auto\",\"beatMatch\":\"auto\"}")));
        // a lock alone keeps nothing: Auto is the reset
        assertNull(MixOverride.fromJson(json("{\"v\":1,\"lock\":true}")));
        MixOverride o = new MixOverride();
        o.preset = "smooth";
        o.family = "blend";
        o.bars = 3; // not a length the editor offers
        MixOverride n = MixOverride.normalize(o);
        assertEquals("smooth", n.preset);
        assertNull("picking a preset drops a migrated family", n.family);
        assertEquals(0, n.bars);
        // custom needs its lanes
        o = new MixOverride();
        o.preset = "custom";
        assertNull(MixOverride.normalize(o));
    }

    @Test
    public void anOverrideSurvivesItsJson() {
        MixOverride o = new MixOverride();
        o.preset = "custom";
        o.volume = "overlap";
        o.eq = "endBassSwap";
        o.effect = "hpIn";
        o.bars = 16;
        o.beatMatch = "glide";
        o.out = new MixOverride.Position(80, 2, 37, 192.4567);
        o.in = new MixOverride.Position(-1, 0, 0, -0.75);
        o.lock = true;
        o.engine = 3;
        o.savedAt = 1763400000000L;
        String text = Json.write(MixOverride.normalize(o).toJson());
        MixOverride back = MixOverride.fromJson(Json.parse(text));
        assertEquals(text, Json.write(back.toJson()));
        assertEquals(40, back.out.nudgeMs); // 10 ms steps
        assertEquals(192.457, back.out.sec, 1e-9);
        assertTrue(back.lock);
        assertTrue(text, text.startsWith("{\"v\":1,\"preset\":\"custom\",\"lanes\":{\"volume\":\"overlap\",\"eq\":\"endBassSwap\",\"effect\":\"hpIn\"},\"bars\":16"));
    }

    @Test
    public void snappingFindsTheNearestDownbeatOrBeat() {
        MixOverride.Position p = MixOverride.snap(33.4, 1.25, 0.5, false);
        assertEquals(16, p.bar);
        assertEquals(0, p.beat);
        assertEquals(33.25, p.sec, 1e-9);
        p = MixOverride.snap(33.8, 1.25, 0.5, true);
        assertEquals(16, p.bar);
        assertEquals(1, p.beat);
        assertEquals(33.75, p.sec, 1e-9);
        p = MixOverride.snap(0.2, 1.25, 0.5, true);
        assertEquals(-1, p.bar);
        assertEquals(2, p.beat);
        assertEquals(0.25, p.sec, 1e-9);
        assertEquals(p.sec, MixOverride.resolveWindow(p, 1.25, 0.5).sec, 1e-9);
    }

    // ── the planner with an override (editor.md §4, §6, §9) ──

    private static Planner.Plan plan(Planner.Settings s, Analysis a, Analysis b, MixOverride ov) {
        return Planner.plan(s, "a", "b", a, b, a.durationSec, 60, 60 + PlannerTest.EARLIEST_LEAD, null, ov);
    }

    private static MixOverride ov(String json) {
        return MixOverride.fromJson(Json.parse(json));
    }

    @Test
    public void aPresetReplacesTheCurvesAndKeepsTheTempo() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 123, 180, 0.9);
        Planner.Plan auto = plan(s, a, b, null);
        Planner.Plan wave = plan(s, a, b, ov("{\"preset\":\"wave\"}"));
        assertEquals("blend", wave.style);
        assertEquals("wave", wave.preset);
        assertFalse(wave.fallback);
        Curves want = MixOverride.presetCurves(ov("{\"preset\":\"wave\"}"), wave.durationSec, wave.beatSec);
        assertEquals(java.util.Arrays.deepToString(want.out.get("gain")), java.util.Arrays.deepToString(wave.curves.out.get("gain")));
        assertEquals(java.util.Arrays.deepToString(want.in.get("lowpassHz")), java.util.Arrays.deepToString(wave.curves.in.get("lowpassHz")));
        // the planner's tempo stays: the next song's speed-up (or glide) as Auto plays it
        assertEquals(java.util.Arrays.deepToString(auto.curves.in.get("rate")), java.util.Arrays.deepToString(wave.curves.in.get("rate")));
        assertEquals(auto.rate, wave.rate, 0);
        assertTrue(wave.toString().contains("[editor: wave"));
    }

    @Test
    public void slamKeepsThePairsLengthWithItsCutOnTheCentre() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 180, 0.9);
        Planner.Plan p = plan(s, a, b, ov("{\"preset\":\"slam\"}"));
        // no preset sets a length (editor.md §2): Auto's own
        assertEquals(plan(s, a, b, null).bars, p.bars);
        double[][] g = p.curves.out.get("gain");
        assertEquals(p.durationSec / 2, g[1][0], 1e-6);
        assertEquals(p.durationSec / 2 + MixOverride.CUT_RAMP_SEC, g[2][0], 1e-6);
    }

    @Test
    public void syncIsOneTempoAndGlideMovesIt() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        // 6% apart: Auto glides (over 4%), Sync holds one tempo, Glide glides
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 127.2, 180, 0.9);
        assertNotNull(plan(s, a, b, null).glide);
        Planner.Plan sync = plan(s, a, b, ov("{\"beatMatch\":\"sync\"}"));
        assertNull(sync.glide);
        assertEquals("blend", sync.style);
        // tempo only moves up: the next song faster, so the playing one is brought up to it
        assertEquals(1, sync.rate, 1e-9);
        assertTrue(sync.outRate > 1.05);
        Planner.Plan glide = plan(s, a, PlannerTest.song("b", 121.2, 180, 0.9), ov("{\"beatMatch\":\"glide\"}"));
        assertNotNull("Glide asks for the glide even under 4%", glide.glide);
    }

    @Test
    public void syncAlwaysBeatMatchesHoweverFarApart() {
        // editor.md §6, only Automix has rules: Sync and Glide always beat-match (folded, at most about 41%)
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 133.2, 180, 0.9);
        Planner.Plan p = plan(s, a, b, ov("{\"beatMatch\":\"sync\",\"bars\":8}"));
        assertEquals("blend", p.style);
        assertEquals(8, p.bars);
        assertEquals(133.2 / 120, p.outRate, 1e-9);
        if (p.warnings != null) for (String w : p.warnings) assertFalse(w, w.contains("stretches at most"));
        Planner.Plan g = plan(s, a, PlannerTest.song("b", 160, 180, 0.9), ov("{\"beatMatch\":\"glide\",\"bars\":8}"));
        assertEquals("blend", g.style);
        assertNotNull("33% apart, Glide still glides", g.glide);
        // Auto: Automix decides, so a pair outside its limits still plays without beat match
        Planner.Plan auto = plan(s, a, b, ov("{\"bars\":8}"));
        assertEquals("crossfade", auto.style);
        assertEquals(16, auto.durationSec, 1e-9); // 8 bars of the playing song, as picked
    }

    @Test
    public void beatMatchOffWithAPresetStillPlaysOnOurDecks() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Planner.Plan p = plan(s, PlannerTest.song("a", 120, 200, 0.9), PlannerTest.song("b", 120, 180, 0.9), ov("{\"preset\":\"melt\",\"beatMatch\":\"off\"}"));
        assertEquals("crossfade", p.style);
        assertEquals("melt", p.preset);
        assertFalse("a preset can't play on Morphe's crossfade", p.fallback);
        // with beat match off the swap is 2% of the window either side of the centre
        double D = p.durationSec;
        assertEquals(0.48 * D, p.curves.out.get("bassDb")[0][0], 1e-5);
    }

    @Test
    public void aWindowIsClampedWithTheReasonShown() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 180, 0.9);
        // A's mix-out asked at bar 97 (194.5 s): an 8 s window has to start by 191.7 s to end by 199.7 s,
        // so it moves back onto the last downbeat that fits (bar 95, 190.5 s)
        MixOverride o = ov("{\"window\":{\"out\":{\"bar\":97,\"sec\":194.5},\"in\":{\"bar\":4,\"sec\":8.5}}}");
        Planner.Plan p = plan(s, a, b, o);
        assertEquals("blend", p.style);
        assertEquals(190.5, p.mixOutTrackTime, 1e-9);
        assertNotNull(p.warnings);
        assertTrue(String.join("; ", p.warnings), p.warnings.get(0).startsWith("the mix-out moved to"));
        assertEquals(8.5, p.mixInTrackTime, 1e-9);
        // a window the grid allows plays where it was put
        Planner.Plan q = plan(s, a, b, ov("{\"window\":{\"out\":{\"bar\":80,\"sec\":160.5}}}"));
        assertEquals(160.5, q.mixOutTrackTime, 1e-9);
        assertNull(q.warnings);
    }

    @Test
    public void theEnginePlaysThePresetsPoints() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 180, 0.9);
        Planner.Plan slam = plan(s, a, b, ov("{\"preset\":\"slam\"}"));
        Mix m = Mix.blend(slam, "a", "b", 200);
        double c = m.t0 + m.D / 2;
        // the cut: full until the centre, gone 8 ms later; the next song the other way round
        assertEquals(1, m.out.gain.at(c - 0.01), 1e-9);
        assertEquals(0, m.out.gain.at(c + 0.01), 1e-9);
        assertEquals(0, m.in.gain.at(c - 0.01), 1e-9);
        assertEquals(1, m.in.gain.at(c + 0.01), 1e-9);
        assertEquals(0.5, m.out.gain.at(c + 0.004), 1e-6);
        Planner.Plan melt = plan(s, a, b, ov("{\"preset\":\"melt\"}"));
        m = Mix.blend(melt, "a", "b", 200);
        // the next song's high-pass opens from 1 kHz to 20 Hz over the first half, exponentially
        assertEquals(1000, m.in.hpHz.at(m.t0), 1e-6);
        assertEquals(Math.sqrt(1000 * 20), m.in.hpHz.at(m.t0 + m.D / 4), 1e-3);
        assertEquals(20, m.in.hpHz.at(m.t0 + m.D / 2 + 0.1), 1e-6);
        // the playing song's bass goes at the centre, the next song's comes in
        assertEquals(0, m.out.lowDb.at(m.t0 + 0.1), 1e-9);
        assertEquals(MixOverride.CUT_DB, m.out.lowDb.at(m.t0 + m.D - 0.1), 1e-9);
        assertEquals(MixOverride.CUT_DB, m.in.lowDb.at(m.t0 + 0.1), 1e-9);
        assertEquals(0, m.in.lowDb.at(m.t0 + m.D - 0.1), 1e-9);
    }
}
