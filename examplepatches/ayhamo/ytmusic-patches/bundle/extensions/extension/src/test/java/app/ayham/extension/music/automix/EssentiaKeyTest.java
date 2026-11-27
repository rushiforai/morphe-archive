package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** analysis-cases.md "The key [all]" (107d0f51): Essentia's KeyExtractor, ported. */
public class EssentiaKeyTest {
    /** Notes as A-relative semitones, each with its first 4 harmonics, 12 s at 44.1 kHz. */
    private static float[] chord(double... semis) {
        float[] x = new float[EssentiaKey.SR * 12];
        for (double s : semis) {
            double f = 220 * Math.pow(2, s / 12);
            for (int h = 1; h <= 4; h++)
                for (int i = 0; i < x.length; i++) x[i] += (float) (0.1 / h * Math.sin(2 * Math.PI * f * h * i / EssentiaKey.SR));
        }
        return x;
    }

    @Test
    public void aMajorTriadIsItsMajorKey() {
        float[] c = chord(3, 7, 10, 15);   // C E G C
        EssentiaKey.Key k = EssentiaKey.of(c, c.length);
        assertEquals("C major", k.name);
        assertTrue(k.strength > 0.5);
    }

    @Test
    public void aMinorTriadIsItsMinorKey() {
        float[] c = chord(0, 3, 7, 12);   // A C E A
        assertEquals("A minor", EssentiaKey.of(c, c.length).name);
        c = chord(9, 12, 16);   // F# A C#
        assertEquals("F# minor", EssentiaKey.of(c, c.length).name);
    }

    @Test
    public void silenceIsMinorAtZero() {
        float[] c = new float[EssentiaKey.SR * 3];
        EssentiaKey.Key k = EssentiaKey.of(c, c.length);
        assertEquals("A minor", k.name);
        assertEquals(0, k.strength, 1e-12);
    }

    /** The tables are used as they are, the correlation over σ = √Σ(x − x̄)². */
    @Test
    public void theProfileOfATableIsThatTableAtOne() {
        double[] maj = {1, 0, 0.42, 0, 0.53, 0.37, 0, 0.77, 0, 0.38, 0.21, 0.30};
        EssentiaKey.Key k = EssentiaKey.key(maj);
        assertEquals("A major", k.name);
        assertEquals(1, k.strength, 1e-9);
        double[] shifted = new double[12];
        for (int i = 0; i < 12; i++) shifted[(i + 3) % 12] = maj[i];
        assertEquals("C major", EssentiaKey.key(shifted).name);
    }

    @Test
    public void everyKeyNameMapsOntoTheWheel() {
        for (String n : EssentiaKey.NOTES)
            for (String m : new String[]{" major", " minor"}) assertTrue(n + m, BeatGrid.camelot(n + m, new Analysis()));
    }
}
