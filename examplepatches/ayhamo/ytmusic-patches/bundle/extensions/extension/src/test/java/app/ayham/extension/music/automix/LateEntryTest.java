package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Collections;
import java.util.Map;

import org.junit.Test;

/**
 * mix-file.md rule 2 [all], B's late entry (window.in.delaySec, plan inDelaySec): the PC's
 * test_automix_plan.mjs cases. B is silent and unstarted that long into the mix, then starts at its
 * mix-in; the curves still run from the mix start.
 */
public class LateEntryTest {
    private static final String A = "rCwSRV7P6hY", B = "0X3Y2m9wj5c";

    private static MixOverride ov(String json) {
        return MixOverride.fromJson((Map<String, Object>) Json.parse(json));
    }

    private static String windowJson(MixOverride o) {
        return Json.write(o.toJson().get("window"));
    }

    @Test
    public void onTheMixInOnlyToTheMsUpTo60() {
        MixOverride o = ov("{\"v\":1,\"bars\":8,\"window\":{\"out\":{\"sec\":50,\"delaySec\":2},\"in\":{\"sec\":0,\"delaySec\":3.21749}}}");
        assertEquals("{\"out\":{\"sec\":50.0},\"in\":{\"sec\":0.0,\"delaySec\":3.217}}".replace(".0,", ",").replace(".0}", "}"),
                windowJson(o).replace(".0,", ",").replace(".0}", "}"));
        assertEquals(0, ov("{\"v\":1,\"window\":{\"in\":{\"sec\":0,\"delaySec\":0}}}").in.delaySec, 0);
        assertEquals(60, ov("{\"v\":1,\"window\":{\"in\":{\"sec\":0,\"delaySec\":99}}}").in.delaySec, 0);
        // a loop mix never plays it: no window at all
        MixOverride loop = ov("{\"v\":1,\"preset\":\"loop\",\"window\":{\"in\":{\"sec\":0,\"delaySec\":3}}}");
        assertNull(loop.in);
    }

    @Test
    public void aMixFileRoundTripAndTheChangesList() {
        MixOverride o = ov("{\"v\":1,\"bars\":8,\"window\":{\"in\":{\"sec\":0,\"delaySec\":3.217}}}");
        String file = MixFile.text(MixFile.write(Collections.singletonList(new MixFile.Mix(new MixFile.Song(A, null, null), new MixFile.Song(B, null, null), o))));
        assertTrue(file, file.contains("\"delaySec\": 3.217"));
        assertTrue(MixFile.same(o, MixFile.read(file).mixes.get(0).override));
        assertTrue(MixFile.changes(ov("{\"v\":1,\"bars\":8,\"window\":{\"in\":{\"sec\":0}}}"), o)
                .contains("mix-in: 0 s → 0 s, 3.217 s into the mix"));
    }

    @Test
    public void spotifysNegativeStartKeepsItsDelay() {
        String t1 = "{\"title\":\"One\",\"youtubeVideoId\":\"" + A + "\"}", t2 = "{\"title\":\"Two\",\"youtubeVideoId\":\"" + B + "\"}";
        MixFile.Read r = MixFile.read("{\"format\":\"spotify-mix-export\",\"version\":3,\"playlist\":{\"name\":\"T\",\"tracks\":[" + t1 + "," + t2 + "]},\"mixes\":["
                + "{\"index\":1,\"from\":" + t1 + ",\"to\":" + t2 + ",\"fromStartMs\":218142,\"toStartMs\":-1972,\"durationMs\":9919,\"bars\":4,\"fromBpm\":98,\"style\":{\"volume\":7,\"eq\":4,\"filter\":0}}]}");
        MixOverride o = r.mixes.get(0).override;
        assertEquals(0, o.in.sec, 0);
        assertEquals(1.972, o.in.delaySec, 0);
        assertEquals(218.142, o.out.sec, 1e-9);
        for (String n : r.notes) assertTrue(n, !n.contains("late"));
    }

    private static final String LANES = "\"preset\":\"custom\",\"bars\":8,\"lanes\":{\"volume\":\"overlap\",\"eq\":\"none\",\"effect\":\"none\"}";

    private static Planner.Plan go(String window) {
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 200, 0.9);
        return Planner.plan(new Planner.Settings(), "a", "b", a, b, 200, 20, 24.5, null, ov("{\"v\":1," + LANES + ",\"window\":" + window + "}"), 1, 1, false);
    }

    @Test
    public void thePlanCarriesItTheCurvesUnchanged() {
        Planner.Plan base = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":0}}");
        Planner.Plan p = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":0,\"delaySec\":3.2}}");
        assertTrue(p.style, "blend".equals(p.style) || "crossfade".equals(p.style));
        assertEquals(3.2, p.inDelaySec, 0);
        assertEquals(0, base.inDelaySec, 0);
        assertEquals(base.mixInTrackTime, p.mixInTrackTime, 0);
        assertEquals(base.durationSec, p.durationSec, 0);
        // past the mix's end: held at its length − 0.5 s, with a warning
        Planner.Plan far = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":0,\"delaySec\":40}}");
        assertEquals(Math.round((far.durationSec - 0.5) * 1e3) / 1e3, far.inDelaySec, 0);
        assertTrue(String.valueOf(far.warnings), far.warnings.stream().anyMatch(w -> w.contains("past the mix's end")));
        // the kick lock leaves it
        assertTrue(!Planner.kickLockAllowed(p));
    }

    /** A mix-in inside B (not 0:00): nothing of B before t0 + delay, and B from its mix-in then. */
    @Test
    public void aLateEntryFromInsideB() {
        Planner.Plan p = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":30,\"delaySec\":3.2}}");
        assertEquals(3.2, p.inDelaySec, 0);
        assertTrue(String.valueOf(p.mixInTrackTime), p.mixInTrackTime > 29);
        Mix m = Mix.blend(p, "a", "b", 200);
        assertEquals(m.t0 + 3.2, m.inStart, 1e-9);
        // the deck's first point: B's mix-in at t0 + 3.2, no pre-roll before it
        assertEquals(m.t0 + 3.2, m.in.knotT[0], 1e-9);
        assertEquals(p.mixInTrackTime, m.in.knotP[0], 1e-9);
        assertEquals(p.mixInTrackTime, m.in.trackAt(m.inStart), 1e-9);
        // a pause, a Next or an abort during the delay: B at its mix-in, not before it
        for (double t : new double[]{m.t0 - 1, m.t0, m.t0 + 1, m.t0 + 3.1})
            assertEquals("at " + t, Math.round(p.mixInTrackTime * 1000), Engine.incomingSpotMs(m, t));
        assertEquals(Math.round((p.mixInTrackTime + 1.8 * p.rate) * 1000), Engine.incomingSpotMs(m, m.t0 + 5));
    }

    /**
     * mix-file.md rule 2, "A while B is held": Automix's own blend keeps the two at equal power with
     * a trim (1/sqrt(rise + fall)) worked out from B's heard gain. While B is held, A plays its own
     * curve untrimmed (it dipped up to 3 dB: BitChord audit 1b #7); from B's entry the trim follows
     * B's 10 ms rise, no step over 1 dB per 10 ms; after it, the mix is the one without a delay.
     */
    @Test
    public void aDoesntDipWhileBIsHeld() {
        Analysis a = PlannerTest.song("a", 120, 200, 0.9), b = PlannerTest.song("b", 120, 200, 0.9);
        Planner.Settings s = new Planner.Settings();
        s.version = 2;
        Planner.Plan base = Planner.plan(s, "a", "b", a, b, 200, 20, 24.5, null, ov("{\"v\":1,\"window\":{\"out\":{\"sec\":150},\"in\":{\"sec\":0}}}"), 1, 1, false);
        Planner.Plan p = Planner.plan(s, "a", "b", a, b, 200, 20, 24.5, null, ov("{\"v\":1,\"window\":{\"out\":{\"sec\":150},\"in\":{\"sec\":0,\"delaySec\":3.2}}}"), 1, 1, false);
        // the kind of mix this rule is about: Automix's own blend, no preset curves, no ladder shape
        assertTrue(p.toString(), p.v2 && "blend".equals(p.style) && p.shape == null && p.preset == null);
        assertEquals(3.2, p.inDelaySec, 0);
        Mix now = Mix.blend(base, "a", "b", 200), late = Mix.blend(p, "a", "b", 200);
        double entry = late.inStart - late.t0;
        // B never heard: the trim A has alone, which is none
        float[][] alone = Mix.djShape(p.style, p.clash, late.D, p.bpm, p.swapAt, 8000, late.D + 1);
        double dipped = 0;
        for (double t = 0.05; t < entry - 0.01; t += 0.05) {
            double heard = late.out.gain.at(late.t0 + t), own = alone[1][(int) Math.round(t / late.D * 7999)];
            assertEquals("A at " + t + " s while B is held", own, heard, 0.01);
            dipped = Math.max(dipped, heard - now.out.gain.at(now.t0 + t));
        }
        assertTrue("without the rule A dipped here (" + dipped + ")", dipped > 0.01);
        // across B's entry: no step in the output (A and B as heard, by power) over 1 dB per 10 ms
        java.util.function.DoubleUnaryOperator out = (t) -> {
            double ga = late.out.gain.at(late.t0 + t), gb = late.in.gain.at(late.t0 + t) * Engine.lateGain(late.t0 + t, late.inStart);
            return Math.sqrt(ga * ga + gb * gb);
        };
        for (double t = entry - 0.05; t < entry + 0.1; t += 0.001) {
            double step = 20 * Math.log10(out.applyAsDouble(t + 0.01) / out.applyAsDouble(t));
            assertTrue("the output at " + t + " s moves " + step + " dB", Math.abs(step) <= 1.0);
        }
        // once B is in, the same as the mix without a delay
        for (double t = entry + 0.05; t < late.D; t += 0.25)
            assertEquals("A at " + t + " s", now.out.gain.at(now.t0 + t), late.out.gain.at(late.t0 + t), 0.01);
    }

    /** B's gain 0 until the delay ends, whatever the curve says, then up to the curve within 10 ms. */
    @Test
    public void bRisesToItsCurveWithin10Ms() {
        double s0 = 103.2;
        assertEquals(0, Engine.lateGain(100, s0), 0);
        assertEquals(0, Engine.lateGain(s0 - 1e-6, s0), 0);
        assertEquals(0, Engine.lateGain(s0, s0), 0);
        assertEquals(0.5, Engine.lateGain(s0 + 0.005, s0), 1e-9);
        assertEquals(1, Engine.lateGain(s0 + 0.010, s0), 0);
        assertEquals(1, Engine.lateGain(s0 + 5, s0), 0);
        // no late entry: untouched
        assertEquals(1, Engine.lateGain(0, 0), 0);
    }

    @Test
    public void aShapedOrHandedOverMixStartsBWithIt() {
        MixOverride o = ov("{\"v\":1,\"window\":{\"in\":{\"sec\":0,\"delaySec\":3}}}");
        for (String kind : new String[]{"shape", "glide", "handoff", "fallback", "filter"}) {
            Planner.Plan p = new Planner.Plan();
            p.style = "blend";
            p.durationSec = 16;
            if (kind.equals("shape")) p.shape = "dropin";
            if (kind.equals("glide")) p.glide = new Planner.Glide(1.02, 4, 0.5);
            if (kind.equals("handoff")) {
                p.style = "crossfade";
                p.handoff = true;
            }
            if (kind.equals("fallback")) p.fallback = true;
            if (kind.equals("filter")) p.style = "filter";
            Planner.lateEntry(p, o);
            assertEquals(kind, 0, p.inDelaySec, 0);
            assertEquals(kind, Collections.singletonList("B's late start (3 s) isn't played in this kind of mix: B starts with it"), p.warnings);
        }
    }

    @Test
    public void bIsSilentAndUnstartedUntilTheOffsetTheCurvesFromTheMixStart() {
        Planner.Plan base = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":0}}");
        Planner.Plan p = go("{\"out\":{\"sec\":150},\"in\":{\"sec\":0,\"delaySec\":3.2}}");
        Mix now = Mix.blend(base, "a", "b", 200), late = Mix.blend(p, "a", "b", 200);
        assertEquals(0, now.inStart, 0);
        assertEquals(now.t0, now.in.knotT[0], 1e-9);
        // late: B's first point 3.2 s into the mix, at its mix-in; the deck is silent before it
        assertEquals(late.t0 + 3.2, late.inStart, 1e-9);
        assertEquals(late.t0 + 3.2, late.in.knotT[0], 1e-9);
        assertEquals(p.mixInTrackTime, late.in.knotP[0], 1e-9);
        // B's place counted from its late start
        assertEquals(p.mixInTrackTime + 6.8 * p.rate, late.in.trackAt(late.t0 + 10), 1e-9);
        // the fades still run from the mix start, over the whole mix
        for (double t : new double[]{-1, 0, 1, 3.2, 5, 10, late.D, late.D + 1}) {
            assertEquals("in at " + t, now.in.gain.at(now.t0 + t), late.in.gain.at(late.t0 + t), 1e-9);
            assertEquals("out at " + t, now.out.gain.at(now.t0 + t), late.out.gain.at(late.t0 + t), 1e-9);
        }
        // a pause or a Next before B comes in leaves B at its mix-in
        assertEquals(Math.round(p.mixInTrackTime * 1000), Engine.incomingSpotMs(late, late.t0 + 1));
        // the take-over (YT's player) counts B from its late start, past the mix's end too
        assertEquals(now.in.trackAt(now.elementAt) - 3.2 * p.rate, late.in.trackAt(late.elementAt), 1e-9);
    }
}
