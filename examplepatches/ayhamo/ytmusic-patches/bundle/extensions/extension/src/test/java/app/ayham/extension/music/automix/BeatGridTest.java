package app.ayham.extension.music.automix;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class BeatGridTest {

    private static double[] ticks(double first, double interval, int n) {
        double[] t = new double[n];
        for (int i = 0; i < n; i++) t[i] = first + i * interval;
        return t;
    }

    @Test
    public void pickPeaksFindsSymmetricPeaksExactly() {
        float[] l = new float[40];
        java.util.Arrays.fill(l, -1f);
        for (int c : new int[]{5, 20, 33}) {
            l[c - 1] = 1f;
            l[c] = 3f;
            l[c + 1] = 1f;
        }
        assertArrayEquals(new double[]{5, 20, 33}, BeatGrid.pickPeaks(l), 1e-9);
    }

    @Test
    public void pickPeaksRefinesTowardsTheHigherNeighbour() {
        float[] l = new float[20];
        java.util.Arrays.fill(l, -1f);
        l[9] = 1f;
        l[10] = 3f;
        l[11] = 2f;
        double[] p = BeatGrid.pickPeaks(l);
        assertEquals(1, p.length);
        assertTrue(p[0] > 10 && p[0] <= 10.5);
    }

    @Test
    public void pickPeaksIgnoresNonPositiveLogits() {
        float[] l = new float[30];
        java.util.Arrays.fill(l, -2f);
        l[15] = -0.5f;
        assertEquals(0, BeatGrid.pickPeaks(l).length);
    }

    @Test
    public void tempoFromRegularBeats() {
        assertEquals(120, BeatGrid.tempoFromBeats(ticks(0.2, 0.5, 16)), 1e-9);
        assertEquals(0, BeatGrid.tempoFromBeats(ticks(0.2, 0.5, 5)), 0); // too few beats
        assertEquals(0, BeatGrid.tempoFromBeats(ticks(0, 2.0, 16)), 0); // 30 BPM: out of range
    }

    @Test
    public void gridConfidenceIsCappedAndZeroForTooFewBeats() {
        double[] beats = ticks(0, 0.5, 32);
        double[] strong = new double[32];
        java.util.Arrays.fill(strong, 20);
        double c = BeatGrid.gridConfidence(beats, strong);
        assertEquals(0.95, c, 1e-9);
        assertEquals(0, BeatGrid.gridConfidence(ticks(0, 0.5, 4), strong), 0);
    }

    @Test
    public void fitGridRecoversIntervalAndPhase() {
        double[] fit = BeatGrid.fitGrid(ticks(10.13, 0.4687, 64));
        assertNotNull(fit);
        assertEquals(0.4687, fit[0], 1e-4);
        // the offset is the phase within one beat: 10.13 mod 0.4687
        double want = 10.13 % 0.4687;
        assertEquals(want, fit[1], 2e-3);
        assertNull(BeatGrid.fitGrid(ticks(0, 0.5, 5)));
    }

    @Test
    public void normalizeIntervalFoldsInto70To180Bpm() {
        assertEquals(0.5, BeatGrid.normalizeInterval(0.25), 1e-12);  // 240 -> 120
        assertEquals(0.5, BeatGrid.normalizeInterval(1.0), 1e-12);   // 60 -> 120
        assertEquals(0.6, BeatGrid.normalizeInterval(0.6), 1e-12);   // 100 stays
        assertTrue(Double.isNaN(BeatGrid.normalizeInterval(Double.NaN)));
    }

    @Test
    public void trackBeatsSnapsDownbeatsToBeats() {
        int frames = 50 * 20; // 20 s at 50 fps
        float[] beat = new float[frames], down = new float[frames];
        java.util.Arrays.fill(beat, -5f);
        java.util.Arrays.fill(down, -5f);
        for (int f = 10; f < frames - 1; f += 25) { // a beat every 0.5 s from 0.2 s
            beat[f] = 5f;
            if (((f - 10) / 25) % 4 == 0) down[f + 1] = 5f; // a frame late: snapped to the beat
        }
        Analysis.BeatSide s = BeatGrid.trackBeats(beat, down, 30);
        assertNotNull(s);
        assertEquals(120, s.bpm, 1e-6);
        assertEquals(30.2, s.beats[0], 1e-9);
        assertEquals(30.2, s.downbeats[0], 1e-9);
        assertEquals(2.0, s.downbeats[1] - s.downbeats[0], 1e-9);
        Analysis.LocalGrid g = BeatGrid.localGrid(s);
        assertEquals(120, g.bpm, 0.05);
        assertEquals(30.2, g.firstDownbeatSec, 1e-9);
        assertTrue(g.gridConfidence >= 0 && g.gridConfidence <= 1);
    }

    @Test
    public void energyCurveIsNormalisedToItsPeak() {
        float[] pcm = new float[1000];
        for (int i = 0; i < 500; i++) pcm[i] = 0.1f;
        for (int i = 500; i < 1000; i++) pcm[i] = 0.4f;
        double[] c = BeatGrid.energyCurve(BeatGrid.of(pcm), 100, 1);
        assertEquals(10, c.length);
        assertEquals(0.25, c[0], 1e-6);
        assertEquals(1, c[9], 1e-6);
    }

    @Test
    public void introOutroFromEnergy() {
        double[] curve = {0.1, 0.2, 0.9, 0.9, 0.9, 0.9, 0.9, 0.3, 0.1, 0.1};
        double[] io = BeatGrid.introOutro(curve, 10, 100);
        assertEquals(20, io[0], 1e-9);
        assertEquals(70, io[1], 1e-9);
    }

    @Test
    public void contentEndFindsTrailingSilence() {
        int sr = 1000;
        short[] pcm = new short[sr * 25];
        for (int i = 0; i < sr * 20; i++) pcm[i] = (short) (Math.sin(i * 0.3) * 10000);
        double end = BeatGrid.contentEnd(BeatGrid.of(pcm, pcm.length), sr);
        assertEquals(20, end, 0.25);
        assertTrue(Double.isNaN(BeatGrid.contentEnd(BeatGrid.of(new short[100], 100), sr)));
    }

    @Test
    public void camelotWheel() {
        Analysis a = new Analysis();
        assertTrue(BeatGrid.camelot("C major", a));
        assertEquals(8, a.camelotNum);
        assertEquals('B', a.camelotLetter);
        assertTrue(BeatGrid.camelot("A minor", a));
        assertEquals(8, a.camelotNum);
        assertEquals('A', a.camelotLetter);
        // keys spelled with the real sharp and flat signs (the native analyser, older saved analyses)
        assertTrue(BeatGrid.camelot("E♭ minor", a));
        assertEquals(2, a.camelotNum);
        assertTrue(BeatGrid.camelot("F♯ major", a));
        assertEquals(2, a.camelotNum);
        assertEquals('B', a.camelotLetter);
        assertTrue(BeatGrid.camelot("A♭ minor", a));
        assertEquals(1, a.camelotNum);
        assertFalse(BeatGrid.camelot("H major", a));
        assertFalse(BeatGrid.camelot("C", a));
        assertFalse(BeatGrid.camelot(null, a));
    }
}
