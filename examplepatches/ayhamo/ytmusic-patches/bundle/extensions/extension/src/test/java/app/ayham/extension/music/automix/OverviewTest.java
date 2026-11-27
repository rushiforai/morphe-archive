package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class OverviewTest {
    /** A pick as saved before the editor ({style, bars}), migrated as it's read (editor.md §1). */
    static MixOverride pick(String style, int bars) {
        java.util.Map<String, Object> m = new java.util.LinkedHashMap<>();
        m.put("style", style);
        m.put("bars", bars);
        return MixOverride.fromJson(m);
    }

    private static Planner.Plan plan(MixOverride pick, double inBpm) {
        return Planner.plan(new Planner.Settings(), "a", "b", PlannerTest.song("a", 120, 200, 0.9), PlannerTest.song("b", inBpm, 180, 0.9),
                200, 60, 60 + PlannerTest.EARLIEST_LEAD, null, pick);
    }

    // the overview's per-pair pick (automix.js plan's pick)

    @Test
    public void aFadePickedIsAPlainCrossfade() {
        Planner.Plan p = plan(pick("crossfade", 0), 120);
        assertTrue(p.fallback);
        assertEquals("crossfade", p.style);
        assertEquals("picked in the overview", p.reason);
    }

    @Test
    public void beatMatchOffFromTheEditorSaysSo() {
        // automix.js: "picked in the overview" only for a migrated pick (preset "auto" after migratePick)
        MixOverride off = new MixOverride();
        off.beatMatch = "off";
        assertEquals("beat match off", plan(off, 120).reason);
        assertTrue(pick("crossfade", 0).migrated);
        assertFalse(MixOverride.normalize(pick("crossfade", 0)).migrated);
        assertFalse(pick("loop", 0).migrated);
        assertFalse(pick(null, 8).migrated);
    }

    @Test
    public void aFilterPickedKeepsItsLength() {
        // the 8-bar cap is Automix's own: an old {filter, 16} pick keeps its 16 bars (editor.md §6)
        Planner.Plan p = plan(pick("filter", 16), 120);
        assertEquals("filter", p.style);
        assertEquals("picked in the overview", p.reason);
        assertEquals(16, p.bars);
    }

    @Test
    public void aLengthPickedComesBeforeTheSetting() {
        Planner.Plan auto = plan(null, 120), four = plan(pick(null, 4), 120);
        assertEquals("blend", four.style);
        assertEquals(4, four.bars);
        assertTrue(auto.bars != 4 || auto.durationSec == four.durationSec);
    }

    @Test
    public void onlyAPickedLoopOrAutoLeavesTheLoopMixIn() {
        // Automix: noLoop = an override that isn't Loop (crossfade.js loopPicked, noLoop)
        assertFalse(pick("blend", 0).loop());
        assertFalse(pick("filter", 0).loop());
        assertFalse(pick("crossfade", 0).loop());
        assertFalse(pick(null, 8).loop());
        assertTrue(pick("loop", 0).loop());
        assertEquals(null, pick(null, 0));
    }

    // the overview's lanes on the mix's clock (automix-overview.js lanes)

    /** mix-file.md rule 2: B silent and unstarted until its late entry, then from its mix-in; after the mix at its playlist speed. */
    @Test
    public void bStartsAtItsLateEntryAndRunsOnAtItsSpeed() {
        Overview o = new Overview();
        o.plan = plan(null, 126);
        o.curves = o.plan.curves;
        o.D = o.plan.durationSec;
        Planner.Plan p = o.plan;
        p.inDelaySec = 3;
        p.speedIn = 1.03;
        assertTrue(Double.isNaN(o.inTrack(2.9)));
        assertEquals(p.mixInTrackTime, o.inTrack(3), 1e-9);
        assertEquals(p.mixInTrackTime + 2 * p.rate, o.inTrack(5), 1e-9);
        assertEquals(p.mixInTrackTime + (o.D - 3) * p.rate + 5 * 1.03, o.inTrack(o.D + 5), 1e-9);
    }

    @Test
    public void blendLanesFollowThePlan() {
        Overview o = new Overview();
        o.plan = plan(null, 126); // the next song faster: the playing one is brought up to its tempo
        o.curves = o.plan.curves;
        o.D = o.plan.durationSec;
        Planner.Plan p = o.plan;
        assertEquals(p.mixOutTrackTime - 2, o.outTrack(-2), 1e-9);
        assertEquals(p.mixOutTrackTime + 3 * p.outRate, o.outTrack(3), 1e-9);
        assertTrue(Double.isNaN(o.outTrack(o.D + 1)));
        assertTrue(Double.isNaN(o.inTrack(-1)));
        assertEquals(p.mixInTrackTime + 2 * p.rate, o.inTrack(2), 1e-9);
        assertEquals(p.mixInTrackTime + o.D * p.rate + 5, o.inTrack(o.D + 5), 1e-9);
        // the volume from the plan's curves: full, then gone
        assertEquals(1, o.gainOut(-3), 1e-9);
        assertEquals(0, o.gainOut(o.D + 3), 1e-9);
        assertEquals(0, o.gainIn(-3), 1e-9);
        assertEquals(1, o.gainIn(o.D + 3), 1e-9);
        // a beat every 60/bpm, bars on every 4th
        java.util.List<double[]> beats = o.beats(0, 4);
        assertEquals(60 / p.bpm, beats.get(1)[0] - beats.get(0)[0], 1e-9);
        assertEquals(1, beats.get(0)[1], 0);
        assertEquals(0, beats.get(1)[1], 0);
    }

    @Test
    public void loopLanesRepeatTheLoops() {
        Overview o = new Overview();
        o.loop = PlannerTest.loopPlan();
        o.x = Planner.loopSchedule(o.loop, 0);
        o.curves = Curves.loop(o.loop);
        o.D = o.x.elementAt;
        assertEquals(o.loop.out.loopStart - 1, o.outTrack(-1), 1e-9);
        assertEquals(o.loop.out.loopStart, o.outTrack(0), 1e-9);
        assertTrue(Double.isNaN(o.outTrack(o.x.releaseAt + 1)));
        assertEquals(o.loop.in.loopEnd + 2, o.inTrack(o.x.releaseAt + 2), 1e-9);
        assertEquals(1, o.gainOut(0), 1e-9);
        assertEquals(0, o.gainOut(o.x.releaseAt), 1e-9);
        assertEquals("loop", o.style());
        assertTrue(o.describe().startsWith("Loop mix · " + o.loop.totalBars + " bars"));
    }

    /** A blend's header as editor.md §7's table has it. */
    private static String header(String shape, double bpm, double outBpm, double inBpm) {
        Overview o = new Overview();
        o.plan = new Planner.Plan();
        o.plan.style = "blend";
        o.plan.shape = shape;
        o.plan.bars = 8;
        o.plan.bpm = bpm;
        o.plan.outBpm = outBpm;
        o.plan.inBpm = inBpm;
        o.D = 15.04;
        return o.describe();
    }

    @Test
    public void theHeaderNamesThePlan() {
        // A's and B's BPM when they round apart (A 94, B 100: the plan's 97 is neither)
        assertEquals("Blend · 8 bars · 94→100 BPM · 15.0 s", header(null, 97, 94, 100));
        // they round together: the plan's BPM, even when it rounds apart from B's
        assertEquals("Blend · 8 bars · 97 BPM · 15.0 s", header(null, 97, 100.2, 99.6));
        assertEquals("Drop-in · 8 bars · 120 BPM · 15.0 s", header("dropin", 120, Double.NaN, Double.NaN));
        Overview f = new Overview();
        f.plan = new Planner.Plan();
        f.plan.style = "crossfade";
        f.plan.handoff = true;
        f.plan.reason = "keys clash";
        f.D = 1.5;
        assertEquals("Hand-over · 1.5 s · keys clash", f.describe());
    }

    @Test
    public void clockReadsMinutesAndSeconds() {
        assertEquals("0:07", Overview.clock(7.4));
        assertEquals("3:20", Overview.clock(200));
    }

    @Test
    public void biquadBandsSplitLowAndHigh() throws Exception {
        // a 50 Hz tone lands in the low band; the high band stays near silent
        double[] lp = Waves.biquad(true, 200, 22050), hp = Waves.biquad(false, 2500, 22050);
        double l1 = 0, l2 = 0, ly1 = 0, ly2 = 0, h1 = 0, h2 = 0, hy1 = 0, hy2 = 0, lowPeak = 0, highPeak = 0;
        for (int i = 0; i < 22050; i++) {
            double x = Math.sin(2 * Math.PI * 50 * i / 22050.0);
            double lo = lp[0] * x + lp[1] * l1 + lp[2] * l2 - lp[3] * ly1 - lp[4] * ly2;
            l2 = l1; l1 = x; ly2 = ly1; ly1 = lo;
            double hi = hp[0] * x + hp[1] * h1 + hp[2] * h2 - hp[3] * hy1 - hp[4] * hy2;
            h2 = h1; h1 = x; hy2 = hy1; hy1 = hi;
            if (i > 2000) {
                lowPeak = Math.max(lowPeak, Math.abs(lo));
                highPeak = Math.max(highPeak, Math.abs(hi));
            }
        }
        assertTrue("low " + lowPeak, lowPeak > 0.9);
        assertTrue("high " + highPeak, highPeak < 0.01);
    }
}
