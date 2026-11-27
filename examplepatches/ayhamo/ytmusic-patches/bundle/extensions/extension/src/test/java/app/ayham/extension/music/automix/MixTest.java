package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class MixTest {

    @Test
    public void laneSetLinearAndExponential() {
        Mix.Lane l = new Mix.Lane(20);
        assertEquals(20, l.at(5), 0); // no events: its resting value
        l.set(20, 0).exp(2000, 10).lin(0, 20).set(7, 30);
        assertEquals(20, l.at(-1), 0);
        assertEquals(200, l.at(5), 1e-9);    // halfway up an exponential ramp: the geometric mean
        assertEquals(2000, l.at(10), 1e-9);
        assertEquals(1000, l.at(15), 1e-9);  // halfway down a linear ramp
        assertEquals(0, l.at(25), 0);        // a set holds the previous value until its time
        assertEquals(7, l.at(30), 0);
        assertEquals(7, l.at(1e6), 0);
    }

    @Test
    public void laneCurveIsSpreadEvenly() {
        Mix.Lane l = new Mix.Lane(0).curve(new float[]{0, 1, 0}, 10, 2);
        assertEquals(0, l.at(10), 0);
        assertEquals(0.5, l.at(10.5), 1e-9);
        assertEquals(1, l.at(11), 1e-9);
        assertEquals(0, l.at(12), 1e-9);
    }

    @Test
    public void equalPowerShapes() {
        float[] in = Mix.ep(true), out = Mix.ep(false);
        assertEquals(Mix.EP, in.length);
        assertEquals(0, in[0], 1e-7);
        assertEquals(1, in[Mix.EP - 1], 1e-7);
        for (int i = 0; i < Mix.EP; i++) assertEquals(1, in[i] * in[i] + out[i] * out[i], 1e-6);
    }

    @Test
    public void djShapesStayInRange() {
        for (String style : new String[]{"blend", "filter"}) {
            for (double clash : new double[]{0, 0.5, 1}) {
                float[][] s = Mix.djShape(style, clash, 16, 124);
                int n = s[0].length;
                for (float[] lane : s) assertEquals(n, lane.length);
                for (int i = 0; i < n; i++) {
                    assertTrue(s[0][i] >= 0 && s[0][i] <= 1.0001);
                    assertTrue(s[1][i] >= 0 && s[1][i] <= 1.0001);
                    for (int k = 2; k < 5; k++) assertTrue(s[k][i] >= 19.9 && s[k][i] <= 20000.1);
                }
                assertEquals(0, s[0][0], 1e-6);       // incoming silent at the start
                assertEquals(1, s[1][0], 1e-6);       // outgoing full at the start
                assertEquals(0, s[1][n - 1], 1e-6);   // and gone at the end
            }
        }
    }

    @Test
    public void blendKnotsAndGainsFollowThePlan() {
        Planner.Plan p = Planner.plan(new Planner.Settings(), "a", "b", PlannerTest.song("a", 120, 200, 0.9),
                PlannerTest.song("b", 120, 180, 0.9), 200, 60, 60 + PlannerTest.EARLIEST_LEAD, null);
        Mix m = Mix.blend(p, "a", "b", 200);
        assertEquals(p.mixOutTrackTime - Mix.HAND_LEAD, m.takeoverSong, 1e-9);
        assertEquals(Mix.HAND_LEAD, m.t0, 1e-9);
        assertEquals(p.durationSec, m.D, 1e-9);
        // the outgoing deck plays on from the takeover at rate 1, reaching the blend on time
        assertEquals(m.takeoverSong, m.out.trackAt(0), 1e-9);
        assertEquals(p.mixOutTrackTime, m.out.trackAt(m.t0), 1e-9);
        assertEquals(1, m.out.rateAt(m.t0 + 1), 1e-9);
        // the incoming deck starts at its cue when the blend starts
        assertEquals(p.mixInTrackTime, m.in.trackAt(m.t0), 1e-9);
        assertEquals(p.mixInTrackTime + 2, m.in.trackAt(m.t0 + 2), 1e-9);
        // equal power gains (version 1)
        assertEquals(1, m.out.gain.at(m.t0), 1e-6);
        assertEquals(Math.sqrt(0.5), m.out.gain.at(m.t0 + m.D / 2), 1e-6);
        assertEquals(Math.sqrt(0.5), m.in.gain.at(m.t0 + m.D / 2), 1e-6);
        assertEquals(0, m.out.gain.at(m.t0 + m.D), 0);
        assertEquals(1, m.in.gain.at(m.t0 + m.D), 0);
        // YT is asked for the next song before the deck needs it, and before the outgoing song ends
        assertTrue(m.askAt <= m.elementAt - Mix.NEXT_LEAD);
        assertTrue(m.askAt < m.outEnd);
        assertTrue(m.in.needFrom <= p.mixInTrackTime && m.in.needTo > m.in.trackAt(m.elementAt));
    }

    @Test
    public void speedUpRampReachesTheBlendOnTheBeat() {
        Planner.Plan p = Planner.plan(new Planner.Settings(), "a", "b", PlannerTest.song("a", 120, 200, 0.9),
                PlannerTest.song("b", 126, 180, 0.9), 200, 60, 60 + PlannerTest.EARLIEST_LEAD, null);
        Mix m = Mix.blend(p, "a", "b", 200);
        assertEquals(p.mixOutTrackTime, m.out.trackAt(m.t0), 1e-9);
        assertEquals(p.outRate, m.out.rateAt(m.t0 + 0.5), 1e-9);
        // during the ramp it never runs slower than 1 or faster than the target
        for (double t = Mix.HAND_LEAD; t < m.t0; t += 0.05) {
            double r = m.out.rateAt(t);
            assertTrue(r >= 1 - 1e-9 && r <= p.outRate + 1e-9);
        }
    }

    @Test
    public void theIncomingDeckGlidesBackAsThePlansCurvesSay() {
        Planner.Plan p = Planner.plan(new Planner.Settings(), "a", "b", PlannerTest.song("a", 120, 200, 0.9),
                PlannerTest.song("b", 126, 180, 0.9), 200, 60, 60 + PlannerTest.EARLIEST_LEAD, null);
        p.rate = 1.05; // the next song stretched 5% through the blend
        Mix m = Mix.blend(p, "a", "b", 200);
        double end = m.t0 + m.D;
        assertEquals(1.05, m.in.rateAt(end - 0.1), 1e-9);
        // 0.25% every 0.25 s (about 20 steps over 5 s), never a jump bigger than one step
        double glideEnd = end + Math.ceil(Math.abs(p.rate - 1) / Mix.GLIDE_STEP) * Mix.GLIDE_STEP_SEC;
        double prev = 1.05;
        for (double t = end + 0.01; t < glideEnd; t += 0.25) {
            double r = m.in.rateAt(t);
            assertTrue(r <= prev + 1e-9 && prev - r <= Mix.GLIDE_STEP + 1e-9);
            prev = r;
        }
        assertEquals(1, m.in.rateAt(glideEnd + 0.1), 1e-9);
        // the curves the overview draws end the glide at the same time
        double[][] glide = Curves.blend(p).in.get("rate");
        assertEquals(glideEnd - m.t0, glide[glide.length - 1][0], 1e-9);
        assertTrue(m.elementAt >= glideEnd);
    }

    @Test
    public void loopMixDecksWrapAndRelease() {
        Planner.LoopPlan lp = PlannerTest.loopPlan();
        Mix m = Mix.loop(lp, "a", "b", 200);
        assertEquals("loop", m.style);
        assertEquals(190.5, m.takeoverSong, 1e-9);
        assertEquals(20, m.D, 1e-9);
        // the outgoing 4-bar loop (8 s) repeats
        assertEquals(190.5, m.out.trackAt(0), 1e-9);
        assertEquals(190.5, m.out.trackAt(8), 1e-9);
        assertEquals(191.5, m.out.trackAt(9), 1e-9);
        // the incoming loop repeats until its release, then plays on past it
        assertEquals(4.5, m.in.trackAt(12), 1e-9);
        assertEquals(8.5, m.in.trackAt(16), 1e-9);
        assertEquals(10.5, m.in.trackAt(18), 1e-9);
        assertEquals(1, m.out.gain.at(0), 1e-9);
        assertEquals(0, m.out.gain.at(16), 1e-9);
        assertEquals(1, m.in.gain.at(13), 1e-9);
        assertTrue(m.askAt <= m.elementAt - Mix.NEXT_LEAD);
    }

    // the seek bar's pulse during a mix (crossfade.js stepPulse)

    @Test
    public void pulseIsFullOnTheBeatAndRestsBetween() {
        double[] beats = {0, 0.5, 1.0, 1.5};
        assertEquals(1, Mix.pulse(beats, 0.5), 1e-9);
        assertEquals(1, Mix.pulse(beats, 1.0), 1e-9);
        // halfway between two beats: cos = -1, so only the rest level
        assertEquals(Mix.PULSE_REST, Mix.pulse(beats, 0.75), 1e-9);
        for (double t = 0; t < 1.5; t += 0.01) {
            double v = Mix.pulse(beats, t);
            assertTrue(v >= Mix.PULSE_REST - 1e-9 && v <= 1 + 1e-9);
        }
    }

    @Test
    public void pulseFollowsATempoRamp() {
        // beats closing in (a tempo ramp): each one still lands at full brightness
        double[] beats = {0, 0.64, 1.26, 1.86, 2.44};
        for (double b : new double[]{0.64, 1.26, 1.86}) assertEquals(1, Mix.pulse(beats, b), 1e-9);
        assertEquals(Mix.PULSE_REST, Mix.pulse(beats, (1.26 + 1.86) / 2), 1e-9);
    }

    @Test
    public void pulseBreathesWithoutBeats() {
        assertEquals(1, Mix.pulse(null, 0), 1e-9);
        assertEquals(Mix.PULSE_REST, Mix.pulse(null, Mix.BREATH_SEC / 2), 1e-9);
        assertEquals(1, Mix.pulse(null, Mix.BREATH_SEC), 1e-9);
    }

    @Test
    public void blendBeatsCoverTheBlendOnTheOutgoingSpeed() {
        Planner.Plan p = Planner.plan(new Planner.Settings(), "a", "b", PlannerTest.song("a", 120, 200, 0.9),
                PlannerTest.song("b", 120, 180, 0.9), 200, 60, 60 + PlannerTest.EARLIEST_LEAD, null);
        Mix m = Mix.blend(p, "a", "b", 200);
        assertTrue(m.beats != null && m.beats.length > 4);
        for (int k = 1; k < m.beats.length; k++) assertTrue("rising at " + k, m.beats[k] > m.beats[k - 1]);
        // 120 BPM at rate 1: half a second apart through the blend, ending at its end
        assertEquals(0.5, m.beats[m.beats.length - 1] - m.beats[m.beats.length - 2], 1e-6);
        assertEquals(m.t0 + m.D, m.beats[m.beats.length - 1], 0.5);
        assertEquals(m.t0 + m.D, m.pulseEnd(), 1e-9);
    }

    /** The baseline's gains (the extension's d26dc16): no trim, linear, A out by the release. */
    @Test
    public void theLoopMixPlaysTheBaselinesGains() {
        Planner.LoopPlan lp = PlannerTest.loopPlan();
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        Mix m = Mix.loop(lp, "a", "b", 200);
        assertEquals(1, m.out.gain.at(0), 1e-9);
        assertEquals(1, m.out.gain.at(x.enterEnd / 2), 1e-9);
        assertEquals(1, m.out.gain.at(x.enterEnd), 1e-9);
        assertEquals(0.8, m.out.gain.at((x.enterEnd + x.rampEnd) / 2), 1e-6);
        assertEquals(0.6, m.out.gain.at(x.rampEnd), 1e-6);
        assertEquals(0, m.out.gain.at(x.releaseAt), 1e-9);
        assertEquals(0, m.in.gain.at(0), 1e-9);
        assertEquals(0.275, m.in.gain.at(x.enterEnd / 2), 1e-6);
        assertEquals(0.55, m.in.gain.at(x.enterEnd), 1e-6);
        assertEquals(1, m.in.gain.at(x.rampEnd), 1e-6);
        assertEquals(1, m.in.gain.at(x.releaseAt), 1e-9);
        assertEquals(20, m.out.hpHz.at(x.rampEnd), 1e-6);
        assertEquals(1500, m.out.hpHz.at(x.releaseAt), 1e-3);
    }

    /** The bass swap: -18 dB lowshelf on both decks, swapped over one bar centred on the ramp's middle. */
    @Test
    public void theLoopMixSwapsTheBassOverOneBarAtTheRampsMiddle() {
        Planner.LoopPlan lp = PlannerTest.loopPlan();
        Planner.LoopSchedule x = Planner.loopSchedule(lp, 0);
        Mix m = Mix.loop(lp, "a", "b", 200);
        double from = x.mid - x.bar / 2, to = x.mid + x.bar / 2;
        assertTrue(x.mid > x.enterEnd && x.mid < x.rampEnd);
        assertEquals(-18, Planner.BASS_CUT_DB, 0);
        assertEquals(0, m.out.lowDb.at(from), 1e-9);
        assertEquals(-18, m.in.lowDb.at(from), 1e-9);
        assertEquals(-9, m.out.lowDb.at(x.mid), 1e-6);   // half way: each at -9 dB
        assertEquals(-9, m.in.lowDb.at(x.mid), 1e-6);
        assertEquals(-18, m.out.lowDb.at(to), 1e-9);
        assertEquals(0, m.in.lowDb.at(to), 1e-9);
        assertEquals(-18, m.in.lowDb.at(0), 1e-9);       // B's bass is cut from its entry
    }

    @Test
    public void loopBeatsRunToTheHandover() {
        Mix m = Mix.loop(PlannerTest.loopPlan(), "a", "b", 200);
        assertTrue(m.beats != null && m.beats.length > 4);
        assertEquals(0, m.beats[0], 1e-9);
        assertEquals(m.elementAt, m.pulseEnd(), 1e-9);
        assertEquals(m.elementAt, m.beats[m.beats.length - 1], 1e-6);
    }
}
