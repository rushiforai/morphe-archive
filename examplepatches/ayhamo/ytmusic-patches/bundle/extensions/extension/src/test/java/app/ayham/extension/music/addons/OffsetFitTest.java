package app.ayham.extension.music.addons;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/**
 * The offset fit and the level on spec/addons/offset-map.md's synthetic songs (mulberry32 and the
 * song builder spelled out there), with the same checks as the extension's
 * scripts/addon_offset_fixtures.mjs. Where a JS run's value is given it is that script's output.
 */
public class OffsetFitTest {
    private static final int R = OffsetFit.FIT_RATE;
    private static final double SEC = 120;

    /** mulberry32: uniform in [0, 1). */
    static final class Mulberry32 {
        private int a;

        Mulberry32(int seed) {
            a = seed;
        }

        double next() {
            a += 0x6D2B79F5;
            int t = a;
            t = (t ^ (t >>> 15)) * (t | 1);
            t ^= t + (t ^ (t >>> 7)) * (t | 61);
            return ((t ^ (t >>> 14)) & 0xFFFFFFFFL) / 4294967296.0;
        }
    }

    /** The spec's song: 120 BPM, kick, off-beat hat, a chord every bar; scaled to peakDb. Float32 like the JS. */
    static float[] song(int seed, double seconds, double peakDb) {
        Mulberry32 rnd = new Mulberry32(seed);
        float[] x = new float[(int) Math.round(seconds * R)];
        int beats = (int) Math.ceil(seconds * 2);
        for (int b = 0; b < beats; b++) {
            double kick = 0.3 + 0.7 * rnd.next(), hat = 0.1 * rnd.next();
            int s0 = (int) Math.round(b * 0.5 * R);
            double[][] chord = null;
            if (b % 4 == 0) {
                chord = new double[3][];
                for (int c = 0; c < 3; c++) {
                    double f = 110 + 770 * rnd.next();
                    double g = 0.05 + 0.1 * rnd.next();
                    chord[c] = new double[]{f, g};
                }
            }
            for (int i = 0; i < 0.5 * R && s0 + i < x.length; i++) {
                double t = (double) i / R;
                x[s0 + i] = (float) (x[s0 + i] + kick * Math.exp(-8 * t) * Math.sin(2 * Math.PI * 60 * t));
                if (t >= 0.25) x[s0 + i] = (float) (x[s0 + i] + hat * Math.exp(-30 * (t - 0.25)) * (2 * rnd.next() - 1));
            }
            if (chord != null) {
                for (int i = 0; i < 2 * R && s0 + i < x.length; i++) {
                    double t = (double) (s0 + i) / R;
                    for (double[] c : chord) x[s0 + i] = (float) (x[s0 + i] + c[1] * Math.sin(2 * Math.PI * c[0] * t));
                }
            }
        }
        double peak = 0;
        for (float v : x) peak = Math.max(peak, Math.abs(v));
        double g = Math.pow(10, peakDb / 20) / peak;
        for (int i = 0; i < x.length; i++) x[i] = (float) (x[i] * g);
        return x;
    }

    static float[] song(int seed, double seconds) {
        return song(seed, seconds, -12);
    }

    static float[] cat(float[]... parts) {
        int n = 0;
        for (float[] p : parts) n += p.length;
        float[] out = new float[n];
        int o = 0;
        for (float[] p : parts) {
            System.arraycopy(p, 0, out, o, p.length);
            o += p.length;
        }
        return out;
    }

    static float[] silence(double sec) {
        return new float[(int) Math.round(sec * R)];
    }

    static float[] scale(float[] x, double db) {
        float[] out = new float[x.length];
        for (int i = 0; i < x.length; i++) out[i] = (float) (x[i] * Math.pow(10, db / 20));
        return out;
    }

    static float[] cut(float[] x, double fromSec, Double toSec) {
        int a = (int) Math.round(fromSec * R), b = toSec == null ? x.length : (int) Math.round(toSec * R);
        float[] out = new float[b - a];
        System.arraycopy(x, a, out, 0, out.length);
        return out;
    }

    private static float[] ytSamples;
    private static OffsetFit.Side ytSide;

    private static synchronized float[] yt() {
        if (ytSamples == null) ytSamples = song(1, SEC);
        return ytSamples;
    }

    private static synchronized OffsetFit.Side ytSide() {
        if (ytSide == null) ytSide = OffsetFit.Side.of(yt());
        return ytSide;
    }

    private static OffsetFit.Result fit(float[] ad) {
        return OffsetFit.fit(ytSide(), OffsetFit.Side.of(ad), 5);
    }

    private static void near(String what, Double got, double want, double tol) {
        assertTrue(what + ": got " + got + ", want " + want + " ±" + tol, got != null && Math.abs(got - want) <= tol);
    }

    // ---- the fit ----

    @Test
    public void shiftPlus07() {
        OffsetFit.Result r = fit(cat(silence(0.7), yt()));
        near("offset " + r, r.offsetSec, 0.7, 0.001);
        assertTrue(r.toString(), r.score >= 0.8 && r.checkScore >= 0.8);
        near("check at", r.checkSec, 70, 1e-6);   // JS: 70
    }

    @Test
    public void shiftMinus23() {
        OffsetFit.Result r = fit(cut(yt(), 2.3, null));
        near("offset " + r, r.offsetSec, -2.3, 0.001);
    }

    @Test
    public void shiftPlus11() {
        OffsetFit.Result r = fit(cat(silence(11), yt()));
        near("offset " + r, r.offsetSec, 11, 0.001);
    }

    @Test
    public void silentOpeningsReadFromTheFirstSound() {
        OffsetFit.Result r = OffsetFit.fit(OffsetFit.Side.of(cat(silence(1.5), yt())), OffsetFit.Side.of(cat(silence(0.4), yt())), 5);
        near("offset " + r, r.offsetSec, -1.1, 0.001);
        near("check at", r.checkSec, 71.5, 1e-6);   // JS: 71.5
    }

    @Test
    public void eightSecondsCutFromTheMiddleIsAnotherEdit() {
        OffsetFit.Result r = fit(cat(cut(yt(), 0, 50.0), cut(yt(), 58, null)));
        assertEquals(r.toString(), "different edit", r.none);
    }

    @Test
    public void twelveSecondsLongerIsRefusedForLength() {
        OffsetFit.Result r = fit(cat(yt(), song(7, 12)));
        assertEquals(r.toString(), "length", r.none);
        near("extra", r.extraSec, 12, 0.05);
    }

    @Test
    public void unrelatedSongOnTheSameBeatGridIsNoMatch() {
        OffsetFit.Result r = fit(song(2, SEC));
        assertEquals(r.toString(), "no match", r.none);
        near("coarse score (JS 0.78387)", r.score, 0.783872449066068, 0.005);
    }

    @Test
    public void sameLoudnessShapeOnNoiseIsNoMatch() {
        float[] y = yt();
        Mulberry32 rnd = new Mulberry32(5);
        double w = R * 0.01;
        float[] ad = new float[y.length];
        for (int i = 0; (i + 1) * w <= y.length; i++) {
            int a = (int) Math.round(i * w), b = (int) Math.round((i + 1) * w);
            double s = 0;
            for (int k = a; k < b; k++) s += (double) y[k] * y[k];
            double rms = Math.sqrt(s / (b - a)) * Math.sqrt(3);   // uniform noise in [-1, 1) has RMS 1/sqrt(3)
            for (int k = a; k < b; k++) ad[k] = (float) (rms * (2 * rnd.next() - 1));
        }
        OffsetFit.Result r = fit(ad);
        assertEquals(r.toString(), "no match", r.none);
        assertTrue(r.toString(), r.score >= 0.8 && r.fineScore != null && r.fineScore < 0.8);
    }

    @Test
    public void silentYouTubeAudio() {
        OffsetFit.Result r = OffsetFit.fit(OffsetFit.Side.of(silence(SEC)), ytSide(), 5);
        assertEquals("silent", r.none);
    }

    @Test
    public void sixtySecondSongIsCheckedInItsMiddle() {
        float[] s = song(3, 60);
        OffsetFit.Result r = OffsetFit.fit(OffsetFit.Side.of(s), OffsetFit.Side.of(cat(silence(0.25), s)), 5);
        near("offset " + r, r.offsetSec, 0.25, 0.001);
        near("check at", r.checkSec, 20, 0.5);
    }

    @Test
    public void streamingInSmallChunksGivesTheSameSide() {
        float[] x = cat(silence(0.7), yt());
        OffsetFit.Side whole = OffsetFit.Side.of(x), bits = new OffsetFit.Side();
        for (int i = 0; i < x.length; i += 333) bits.add(x, i, Math.min(333, x.length - i));
        bits.finish();
        OffsetFit.Result a = OffsetFit.fit(ytSide(), whole, 5), b = OffsetFit.fit(ytSide(), bits, 5);
        assertEquals(a.offsetSec, b.offsetSec, 0);
        assertEquals(whole.lufs(), bits.lufs(), 0);
    }

    // ---- the level ----

    private static OffsetFit.Gain gain(float[] y, float[] ad) {
        return OffsetFit.sourceGainDb(OffsetFit.integratedLufs(y, R), OffsetFit.integratedLufs(ad, R), OffsetFit.PeakMeter.of(ad));
    }

    @Test
    public void fourDbQuieterGetsFourDb() {
        OffsetFit.Gain g = gain(yt(), scale(yt(), -4));
        near("gain " + g, g.gainDb, 4, 0.05);
        assertEquals(null, g.capped);
    }

    @Test
    public void nineDbQuieterIsCappedAtSix() {
        OffsetFit.Gain g = gain(yt(), scale(yt(), -9));
        near("gain " + g, g.gainDb, 6, 0.001);
        assertEquals("boost", g.capped);
        near("want", g.wantDb, 9, 0.05);
    }

    @Test
    public void boostNearFullScaleIsHeldAtMinusOneDbtp() {
        float[] loud = song(1, SEC, -0.5);
        OffsetFit.Gain g = gain(loud, scale(loud, -3));
        assertEquals(g.toString(), "peak", g.capped);
        assertTrue(g.toString(), g.gainDb < 3);
        near("true peak + gain", g.truePeakDb + g.gainDb, -1, 0.001);
        near("gain (JS 2.49296)", g.gainDb, 2.4929568086748572, 0.01);
    }

    @Test
    public void threeDbLouderIsCutWithoutAPeakCheck() {
        OffsetFit.Gain g = gain(yt(), scale(yt(), 3));
        near("gain " + g, g.gainDb, -3, 0.05);
        assertTrue(Double.isNaN(g.truePeakDb));
    }

    @Test
    public void kWeightingAt48k() {
        near("LUFS", sineLufs(48000), -23.01, 0.005);
    }

    @Test
    public void kWeightingAt22050() {
        near("LUFS", sineLufs(22050), -23.01, 0.05);
    }

    /** BS.1770: a 997 Hz sine at -20 dBFS in one channel reads -23.01 LUFS. */
    private static double sineLufs(int rate) {
        float[] s = new float[10 * rate];
        for (int i = 0; i < s.length; i++) s[i] = (float) (0.1 * Math.sin((2 * Math.PI * 997 * i) / rate));
        return OffsetFit.integratedLufs(s, rate);
    }

    @Test
    public void mulberry32MatchesTheReference() {
        // the first draws for seed 1, from the JS generator
        Mulberry32 r = new Mulberry32(1);
        assertEquals(0.6270739405881613, r.next(), 0);
        assertEquals(0.002735721180215478, r.next(), 0);
        assertEquals(0.5274470399599522, r.next(), 0);
    }

    // ---- guided (ours: the phone's Dolby Atmos, placed by a stereo file's offset) ----

    /** Another mix of the song: YouTube's audio with a second part laid over it. */
    private static float[] otherMix(double shiftSec) {
        float[] y = yt(), o = scale(song(9, SEC), -3), m = new float[y.length];
        for (int i = 0; i < y.length; i++) m[i] = 0.6f * y[i] + o[i];
        return cat(silence(shiftSec), m);
    }

    @Test
    public void guidedFindsTheOffsetNearTheStereoOne() {
        OffsetFit.Result r = OffsetFit.guided(ytSide(), OffsetFit.Side.of(otherMix(0.7)), 0.74, 5);
        assertEquals(r.toString(), null, r.none);
        near("offset " + r, r.offsetSec, 0.7, 0.002);
    }

    @Test
    public void guidedKeepsTheStereoOffsetWhenNothingAgrees() {
        OffsetFit.Result r = OffsetFit.guided(ytSide(), OffsetFit.Side.of(cat(silence(0.7), song(2, SEC))), 0.7, 5);
        assertEquals(r.toString(), null, r.none);
        near("offset " + r, r.offsetSec, 0.7, 0.1);
    }

    @Test
    public void guidedRefusesALongerFile() {
        OffsetFit.Result r = OffsetFit.guided(ytSide(), OffsetFit.Side.of(cat(otherMix(0), song(7, 12))), 0, 5);
        assertEquals(r.toString(), "length", r.none);
    }

    // ---- the streamed copy's 12 s window (ours) ----

    /** The addon copy known only over [winSec, winSec + 12) of its own time: silence elsewhere. */
    private static OffsetFit.Result window(float[] ad, double winSec) {
        float[] w = new float[ad.length];
        int a = (int) Math.round(winSec * R), b = Math.min(ad.length, (int) Math.round((winSec + OffsetFit.WINDOW_SEC) * R));
        System.arraycopy(ad, a, w, a, b - a);
        return OffsetFit.window(ytSide(), OffsetFit.Side.of(w), winSec, OffsetFit.WINDOW_SEC);
    }

    /** Poker Face's addon copy is 117 ms behind YouTube's: every window finds it. */
    @Test
    public void aWindowFindsTheOffset() {
        float[] ad = cut(yt(), 0.117, null);
        for (double at : new double[]{5, 40, 90}) {
            OffsetFit.Result r = window(ad, at);
            near("offset at " + at + " s " + r, r.offsetSec, -0.117, 0.001);
        }
        near("a lead-in", window(cat(silence(2.3), yt()), 50).offsetSec, 2.3, 0.001);
    }

    /** offset-map.md, Window check: shifts of seconds either way, at 15 s and 75 s, within 1 ms. */
    @Test
    public void aWindowFindsShiftsOfSeconds() {
        for (double shift : new double[]{0.7, -2.3, -0.1172, 11, -9}) {
            float[] ad = shift > 0 ? cat(silence(shift), yt()) : cut(yt(), -shift, null);
            for (double at : new double[]{15, 75}) {
                OffsetFit.Result r = window(ad, at);
                assertTrue("shift " + shift + " at " + at + " s: " + r, r.none == null && r.score >= 0.8 && r.coarseScore >= 0.8);
                near("shift " + shift + " at " + at + " s", r.offsetSec, shift, 0.001);
            }
        }
    }

    @Test
    public void aWindowRefusesAnotherSong() {
        OffsetFit.Result r = window(song(2, SEC), 40);
        assertEquals(r.toString(), "no match", r.none);
    }

    @Test
    public void aSilentWindowIsNoAnswer() {
        OffsetFit.Result r = window(cat(silence(60), cut(yt(), 60, null)), 20);
        assertEquals(r.toString(), "silent", r.none);
    }
}
