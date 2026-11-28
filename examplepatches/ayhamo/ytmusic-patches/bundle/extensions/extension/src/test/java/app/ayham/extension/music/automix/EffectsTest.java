package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.util.Map;

import org.junit.Test;

/** editor.md §12 (Effects, the mid band, noise), §13 (Looping) and spotify-mixes.md rule 10 (speed) on the phone. */
public class EffectsTest {
    private static final int B = 512;

    /** The reverb plays the impulse (normalized, at 0.7) sample for sample, across the blocks' edges. */
    @Test
    public void reverbIsTheImpulse() {
        float[][] h = FxBus.Convolver.impulse();
        double g = FxBus.Convolver.gain(h);
        for (int at : new int[]{0, 300, B - 1}) {
            FxBus.Convolver c = new FxBus.Convolver(B);
            int blocks = 6;
            float[] got = new float[2 * B * blocks];
            for (int k = 0; k < blocks; k++) {
                float[] in = new float[2 * B], out = new float[2 * B];
                if (at / B == k) {
                    in[2 * (at % B)] = 1f;      // left
                    in[2 * (at % B) + 1] = 0.5f; // right
                }
                c.run(in, out);
                System.arraycopy(out, 0, got, 2 * B * k, 2 * B);
            }
            double peak = 0;
            for (int n = 0; n < B * blocks; n++) {
                double wantL = n < at ? 0 : h[0][n - at] * g, wantR = n < at ? 0 : 0.5 * h[1][n - at] * g;
                peak = Math.max(peak, Math.abs(wantL));
                assertEquals("left " + n + " (impulse at " + at + ")", wantL, got[2 * n], 2e-5);
                assertEquals("right " + n, wantR, got[2 * n + 1], 2e-5);
            }
            assertTrue(peak > 1e-3);
        }
    }

    /** The impulse is 2.4 s long; once that much silence has gone through, nothing more rings. */
    @Test
    public void reverbStopsAfterItsTail() {
        FxBus.Convolver c = new FxBus.Convolver(B);
        float[] in = new float[2 * B], out = new float[2 * B];
        in[0] = 1f;
        c.run(in, out);
        in[0] = 0f;
        for (int k = 0; k < c.P + 2; k++) {
            java.util.Arrays.fill(out, 0f);
            c.run(in, out);
        }
        for (float v : out) assertEquals(0f, v, 0f);
        assertEquals(225, c.P); // 2.4 s at 48 kHz in blocks of 512
    }

    /** The delay: the sound again every delaySec, each 0.3 of the one before; the echo's repeats darker. */
    @Test
    public void delayLinesRepeat() {
        int d = 100;
        FxBus.Line line = new FxBus.Line(d / (double) Engine.SR, FxBus.DELAY_FEEDBACK, null);
        int n = 4 * d + 1;
        float[] in = new float[2 * n], out = new float[2 * n];
        in[0] = 1f;
        line.run(in, out, n);
        assertEquals(0f, out[0], 0f);
        assertEquals(1f, out[2 * d], 1e-6);
        assertEquals(0.3f, out[4 * d], 1e-6);
        assertEquals(0.09f, out[6 * d], 1e-6);
        // the echo: feedback 0.45 through a 3 kHz low-pass, so no repeat is louder than the one before
        Biquad tone = new Biquad(Biquad.LOWPASS, Engine.SR, 0, FxBus.ECHO_TONE_Q_DB);
        tone.setValue(FxBus.ECHO_TONE_HZ);
        FxBus.Line echo = new FxBus.Line(0.05, FxBus.ECHO_FEEDBACK, tone);
        int m = Engine.SR / 2;
        float[] ein = new float[2 * m], eout = new float[2 * m];
        for (int i = 0; i < 480; i++) ein[2 * i] = (float) Math.sin(2 * Math.PI * 440 * i / Engine.SR);
        echo.run(ein, eout, m);
        double prev = Double.MAX_VALUE;
        for (int r = 1; r <= 6; r++) {
            double e = 0;
            for (int i = r * 2400; i < r * 2400 + 2400; i++) e += eout[2 * i] * (double) eout[2 * i];
            assertTrue("repeat " + r, e < prev && e > 0);
            prev = e;
        }
    }

    /** The mid band: a peaking filter at 1 kHz, Q 0.7; at 0 dB it passes the sound unchanged. */
    @Test
    public void midBand() {
        Biquad flat = new Biquad(Biquad.PEAKING, Engine.SR, 1000, 0.7);
        flat.setValue(0);
        float[] s = sine(1000, 4800), t = s.clone();
        flat.process(t, 0, 4800);
        for (int i = 0; i < t.length; i++) assertEquals(s[i], t[i], 1e-5);
        Biquad cut = new Biquad(Biquad.PEAKING, Engine.SR, 1000, 0.7);
        cut.setValue(-18);
        float[] u = sine(1000, 9600);
        cut.process(u, 0, 9600);
        assertEquals(-18, 20 * Math.log10(rms(u, 4800) / rms(sine(1000, 9600), 4800)), 0.3);
    }

    /** The noise follows its deck's level (YT's volume), as the decks and the sends do (extension audit M6). */
    @Test
    public void noiseFollowsTheDeckLevel() {
        int block = 4800, control = 48;
        float[] full = new float[2 * block], half = new float[2 * block], silent = new float[2 * block];
        float[] in = new float[2 * block];
        for (float[][] run : new float[][][]{{full, {1f}}, {half, {0.5f}}}) {
            Mix m = new Mix();
            m.noise = true;
            m.out.noise.set(1, 0);
            new FxBus(m, block, control).run(in, in, 0, run[1][0], 1f, run[0]);
        }
        assertEquals(0.5, rms(half, 0) / rms(full, 0), 1e-6);
        Mix m = new Mix();
        m.noise = true;
        m.out.noise.set(1, 0);
        new FxBus(m, block, control).run(in, in, 0, 0f, 1f, silent);
        assertEquals(0, rms(silent, 0), 0);
    }

    /** The tails ring on after the window: the next song's player waits for them. */
    @Test
    public void tails() {
        Mix m = new Mix();
        assertEquals(0, FxBus.tailSec(m), 0);
        m.fx = true;
        m.echoSec = 0.3;
        m.delaySec = 0.2;
        // the echo's 0.3 s repeats down to -60 dB (8.65 of them) outlast the reverb's 2.4 s
        assertEquals(0.3 * Math.log(1e-3) / Math.log(FxBus.ECHO_FEEDBACK), FxBus.tailSec(m), 1e-9);
        m.echoSec = 0.1;
        assertEquals(FxBus.REVERB_SEC, FxBus.tailSec(m), 1e-9);
    }

    /** editor.md §3's new shapes, §12 rule 4's Effects shapes and §13's Looping lane as plan curves. */
    @Test
    public void shapesToCurves() {
        double D = 16, beat = 0.5;
        Curves c = MixOverride.presetCurves(ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"fadeInFadeOut\",\"eq\":\"longBassCut\",\"effect\":\"noiseOutEnd\",\"fx\":\"echo34CutEnd\",\"looping\":\"loop4\"}}"), D, beat);
        same(new double[][]{{0, 1}, {8, 1}, {16, 0}}, c.out.get("gain"));
        same(new double[][]{{0, 0}, {8, 1}}, c.in.get("gain"));
        same(new double[][]{{0, 0}, {8, -18}}, c.out.get("bassDb"));
        same(new double[][]{{8, 0}, {16, 1}}, c.out.get("noise"));
        same(new double[][]{{12, 0}, {16, 0.5}}, c.out.get("echoSend"));
        assertEquals(0.375, c.fxTime[0], 1e-9); // ¾ beat
        assertEquals(0.25, c.fxTime[1], 1e-9);  // the delay's default ½ beat
        assertEquals(4, c.loopBeats);
        // no Effects or Looping lane: no times, no loop
        Curves n = MixOverride.presetCurves(ov("{\"preset\":\"smooth\"}"), D, beat);
        assertNull(n.fxTime);
        assertEquals(0, n.loopBeats);
        // a Looping lane that isn't one: the lanes are not valid
        assertNull(ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\",\"looping\":\"loop3\"}}"));
    }

    /** §12 rule 1, §13 rule 1: a none Effects or Looping lane is not stored, and missing reads as none. */
    @Test
    public void noneLanesAreNotStored() {
        MixOverride o = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\",\"fx\":\"none\",\"looping\":\"none\"}}");
        Map<String, Object> l = lanes(o);
        assertFalse(l.containsKey("fx"));
        assertFalse(l.containsKey("looping"));
        assertEquals("none", o.lanes()[MixOverride.FX]);
        assertEquals("none", o.lanes()[MixOverride.LOOPING]);
        MixOverride r = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\",\"fx\":\"reverbOutCenter\",\"looping\":\"loop16\"}}");
        assertEquals("reverbOutCenter", lanes(r).get("fx"));
        assertEquals("loop16", lanes(r).get("looping"));
    }

    /** An Effects drawing keeps its echo and delay times; a time not offered is dropped. */
    @Test
    public void effectsDrawingTimes() {
        MixOverride o = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\",\"fx\":{\"unit\":\"beat\",\"out\":{\"echo\":[[0,0],[16,0.8]]},\"in\":{},\"echoBeats\":1,\"delayBeats\":0.25}}}");
        Map<String, Object> fx = (Map<String, Object>) lanes(o).get("fx");
        assertEquals(1.0, ((Number) fx.get("echoBeats")).doubleValue(), 0);
        assertFalse(fx.containsKey("delayBeats"));
        Curves c = MixOverride.presetCurves(o, 8, 0.5, 0.5, null);
        same(new double[][]{{0, 0}, {8, 0.8}}, c.out.get("echoSend"));
        assertEquals(0.5, c.fxTime[0], 1e-9); // 1 beat of 0.5 s
        // an amount past 1 is held to 1
        MixOverride big = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":{\"unit\":\"sec\",\"out\":{\"noise\":[[0,2]]},\"in\":{}},\"fx\":\"none\"}}");
        assertEquals(1, big.drawn[2].out.get("noise")[0][1], 0);
        // the shape as a drawing (Draw…) carries its time
        Object d = MixOverride.shapeDrawing("fx", "delay34CutEnd", 8, 0.5, null, "beat");
        assertEquals(0.75, ((MixOverride.Drawing) d).delayBeats, 0);
    }

    /** spotify-mixes.md rule 10: each song's speed, 0.5..2 to 0.00001, a 1 left out; the song keeps it while it plays. */
    @Test
    public void speeds() {
        MixOverride a = ov("{\"bars\":4,\"speed\":{\"out\":0.970571,\"in\":1.00001}}");
        assertEquals(0.97057, a.speedOut, 0);
        assertTrue(Double.isNaN(a.speedIn));
        assertEquals("{\"out\":0.97057}", Json.write(a.toJson().get("speed")));
        // a speed alone is an override (the PC keeps it too)
        MixOverride only = ov("{\"speed\":{\"in\":1.03228}}");
        assertEquals(1.03228, only.speedIn, 0);
        assertNull(ov("{\"speed\":{\"in\":3}}"));
        // the song's speed: the mix that brought it in, else the one taking it out, else 1
        assertEquals(1.03228, MixOverride.songSpeed(only, a), 0);
        assertEquals(0.97057, MixOverride.songSpeed(null, a), 0);
        assertEquals(1, MixOverride.songSpeed(null, null), 0);
        assertEquals("x1", MixFile.speedText(new MixOverride()));
        assertEquals("A x0.97057 B x1", MixFile.speedText(a));
        assertTrue(MixFile.changes(null, a).contains("speed: x1 → A x0.97057 B x1"));
    }

    /** The import's confirm names an Effects or Looping lane only when a side has one. */
    @Test
    public void changeLines() {
        MixOverride a = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\"}}");
        MixOverride b = ov("{\"preset\":\"custom\",\"lanes\":{\"volume\":\"smooth\",\"eq\":\"none\",\"effect\":\"none\",\"fx\":\"reverbCutEnd\",\"looping\":\"loop2\"}}");
        assertTrue(MixFile.changes(a, a).isEmpty());
        assertEquals(java.util.Arrays.asList("effects: none → reverbCutEnd", "looping: none → loop2"), MixFile.changes(a, b));
    }

    // ---------------------------------------------------------------------------------------------

    private static MixOverride ov(String json) {
        return MixOverride.fromJson(Json.parse(json));
    }

    @SuppressWarnings("unchecked")
    private static Map<String, Object> lanes(MixOverride o) {
        return (Map<String, Object>) o.toJson().get("lanes");
    }

    private static void same(double[][] want, double[][] got) {
        String w = java.util.Arrays.deepToString(want), g = java.util.Arrays.deepToString(got);
        assertEquals(w + " vs " + g, want.length, got == null ? -1 : got.length);
        for (int i = 0; i < want.length; i++) {
            assertEquals(w + " vs " + g, want[i][0], got[i][0], 1e-9);
            assertEquals(w + " vs " + g, want[i][1], got[i][1], 1e-9);
        }
    }

    /** The new chips draw in their lanes: mid as dB, noise and the sends as 0..1 amounts; undo brings the Effects and Looping lanes back. */
    @Test
    public void drawChips() {
        assertEquals(1, DrawEdit.laneOf("midDb"));
        assertEquals(2, DrawEdit.laneOf("noise"));
        assertEquals(3, DrawEdit.laneOf("reverbSend"));
        assertEquals("echoSend", DrawEdit.firstKey(3));
        assertEquals(0.4, DrawEdit.value("delaySend", DrawEdit.norm("delaySend", 0.4)), 1e-9);
        assertEquals(1, DrawEdit.norm("midDb", 0), 1e-9);
        assertEquals(MixOverride.CUT_DB, DrawEdit.value("midDb", 0), 1e-9);
        MixOverride.Drawing d = DrawEdit.start(3, null, "beat");
        assertEquals(1, DrawEdit.points(d, "echoSend", true).length);
        assertEquals(0, DrawEdit.points(d, "delaySend", false)[0][1], 0);
        assertTrue(d.out.containsKey("reverb"));
        MixOverride o = new MixOverride();
        o.preset = "custom";
        o.volume = "smooth";
        o.eq = "none";
        o.effect = "none";
        o.looping = "loop4";
        DrawEdit.Undo u = new DrawEdit.Undo();
        u.push("p", o, 0);
        MixOverride drawn = DrawEdit.withDrawing(o, o.lanes(), MixOverride.FX, d, 8);
        assertEquals(MixOverride.DRAW, drawn.fx);
        assertEquals("loop4", drawn.looping);
        MixOverride back = u.undo("p", drawn);
        assertNull(back.fx);
        assertEquals("loop4", back.looping);
    }

    /** editor.md §2: Spotify's presets, their lanes, no length of their own, and No transition. */
    @Test
    public void spotifyPresets() {
        assertEquals(java.util.Arrays.asList("auto", "custom", "smooth", "rise", "wave", "blend", "slam", "melt", "afterglow", "surge", "dissolve", "none", "loop"),
                java.util.Arrays.asList(MixOverride.PRESETS));
        assertEquals("fadeInFadeOut", MixOverride.lanesOf("melt")[0]);
        assertEquals("reverbOutCenter", MixOverride.lanesOf("afterglow")[3]);
        assertEquals("echoHalfOutEnd", MixOverride.lanesOf("dissolve")[3]);
        for (String p : MixOverride.PRESETS) {
            MixOverride o = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"" + p + "\"}"));
            // (auto stores nothing; custom without its lanes isn't valid)
            if (p.equals("auto") || p.equals("custom")) assertNull(o);
            else {
                assertEquals(p, o.preset);
                assertEquals(p, 0, o.pinnedBars());
            }
        }
        MixOverride none = MixOverride.fromJson(Json.parse("{\"v\":1,\"preset\":\"none\",\"bars\":8}"));
        assertTrue(none.noTransition());
        assertEquals(0, none.pinnedBars());
        assertNull(none.lanes());
    }

    /** spotify-mixes.md rule 10: A at speedOut, B at speedIn, no ramp or glide, B held at its speed after the mix. */
    @Test
    public void songSpeedsPlay() {
        Planner.Settings s = new Planner.Settings();
        s.version = 3;
        // Stay x0.97 into Cold Water x1.03 (BUDGET #5): tempos 100 and 94.2 BPM, matched at 97 by the speeds
        Analysis a = PlannerTest.song("a", 100, 200, 0.9), b = PlannerTest.song("b", 94.2, 180, 0.9);
        Planner.Plan auto = Planner.plan(s, "a", "b", a, b, a.durationSec, 60, 60 + PlannerTest.EARLIEST_LEAD, null, null);
        assertTrue(auto.rampBeats > 0 || auto.glide != null || auto.rate != 1);
        Planner.Plan p = Planner.plan(s, "a", "b", a, b, a.durationSec, 60, 60 + PlannerTest.EARLIEST_LEAD, null, null, 0.97057, 1.03228);
        assertEquals("blend", p.style);
        assertEquals(0.97057, p.speedOut, 0);
        assertEquals(1.03228, p.speedIn, 0);
        assertEquals(0.97057, p.outRate, 0);
        // B at A's played tempo (spotify-mixes.md 333b2fc5 rule 10)
        double played = 0.97057 * 100 / 94.2;
        assertEquals(played, p.rate, 1e-12);
        assertEquals(0, p.rampBeats);
        assertNull(p.glide);
        assertTrue(p.toString().contains("playlist speeds x0.97057 / x1.03228"));
        // the curves hold both rates through the mix; after it B goes back to its own speed (rule 10:
        // under 0.2% away, a step at the mix's end, as automix.js blendCurves draws it)
        assertEquals("[[0.0, 0.97057], [" + p.durationSec + ", 0.97057]]", java.util.Arrays.deepToString(p.curves.out.get("rate")));
        assertEquals("[[0.0, " + p.rate + "], [" + p.durationSec + ", " + p.rate + "], [" + p.durationSec + ", 1.03228]]",
                java.util.Arrays.deepToString(p.curves.in.get("rate")));
        Mix m = Mix.blend(p, "a", "b", 200);
        // the hand lead at A's speed, as YT played it, and B on at its speed for YT to take over at
        assertEquals(p.mixOutTrackTime - Mix.HAND_LEAD * 0.97057, m.takeoverSong, 1e-9);
        assertEquals(p.mixOutTrackTime, m.out.trackAt(m.t0), 1e-6);
        assertEquals(0.97057, m.out.rateAt(m.t0 + m.D / 2), 1e-6);
        assertEquals(played, m.in.rateAt(m.t0 + m.D / 2), 1e-6);
        assertEquals(1.03228, m.in.rateAt(m.elementAt), 1e-6);
        assertEquals(1.03228, m.home, 0);
        // both at x1: the planner's own tempo, as before
        Planner.Plan one = Planner.plan(s, "a", "b", a, b, a.durationSec, 60, 60 + PlannerTest.EARLIEST_LEAD, null, null, 1, 1);
        assertTrue(Double.isNaN(one.speedOut));
        assertEquals(auto.toString(), one.toString());
        assertEquals(1, Mix.blend(one, "a", "b", 200).home, 0);
        // a song's speed: the mix that brought it in, else the one taking it out, else 1
        MixOverride in = MixOverride.fromJson(Json.parse("{\"v\":1,\"speed\":{\"in\":1.03228}}"));
        MixOverride out = MixOverride.fromJson(Json.parse("{\"v\":1,\"speed\":{\"out\":1.03228,\"in\":1.03333}}"));
        assertEquals(1.03228, MixOverride.songSpeed(in, out), 0);
        assertEquals(1.03228, MixOverride.songSpeed(null, out), 0);
        assertEquals(1, MixOverride.songSpeed(null, null), 0);
    }

    private static float[] sine(double hz, int n) {
        float[] b = new float[2 * n];
        for (int i = 0; i < n; i++) b[2 * i] = b[2 * i + 1] = (float) Math.sin(2 * Math.PI * hz * i / Engine.SR);
        return b;
    }

    private static double rms(float[] b, int from) {
        double e = 0;
        for (int i = 2 * from; i < b.length; i += 2) e += b[i] * (double) b[i];
        return Math.sqrt(e / ((b.length - 2 * from) / 2.0));
    }
}
