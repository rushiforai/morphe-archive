package dev.utaa.cutlog.extension.render;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class EffectMathTest {
    private static float[] apply(float[] columnMajor, float r, float g, float b) {
        return new float[] {
            columnMajor[0] * r + columnMajor[4] * g + columnMajor[8] * b,
            columnMajor[1] * r + columnMajor[5] * g + columnMajor[9] * b,
            columnMajor[2] * r + columnMajor[6] * g + columnMajor[10] * b,
        };
    }

    @Test
    public void zeroRotationIsIdentity() {
        float[] m = EffectMath.hueRotation(0f, 1f);
        float[] out = apply(m, 0.2f, 0.5f, 0.9f);
        assertEquals(0.2f, out[0], 0.001f);
        assertEquals(0.5f, out[1], 0.001f);
        assertEquals(0.9f, out[2], 0.001f);
        assertEquals(1f, m[15], 0f);
    }

    /** 灰色は色相を回しても灰色のまま。 */
    @Test
    public void keepsGray() {
        for (float degrees = 0; degrees < 360; degrees += 45) {
            float[] out = apply(EffectMath.hueRotation(degrees, 1f), 0.5f, 0.5f, 0.5f);
            for (float channel : out) {
                assertEquals(0.5f, channel, 0.002f);
            }
        }
    }

    @Test
    public void rotatesRedAwayFromRed() {
        float[] out = apply(EffectMath.hueRotation(120f, 1f), 1f, 0f, 0f);
        assertTrue("red should drop: " + out[0], out[0] < 0.5f);
    }

    @Test
    public void zeroIntensityIsIdentity() {
        float[] out = apply(EffectMath.hueRotation(120f, 0f), 1f, 0f, 0f);
        assertEquals(1f, out[0], 0.001f);
        assertEquals(0f, out[1], 0.001f);
    }

    @Test
    public void transformFlipsAndZooms() {
        float[] t = EffectMath.transform(true, false, 2f, 0f, 0f);
        assertEquals(-2f, t[0], 0f);
        assertEquals(2f, t[1], 0f);
        assertEquals(0f, t[2], 0f);
        assertEquals(0f, t[3], 0f);
    }

    /** 右端を見せるときは、画像を左へ動かす。拡大した分しか動かさないので、端が画面の端に揃う。 */
    @Test
    public void panStaysInsideZoomedImage() {
        float[] t = EffectMath.transform(false, false, 2f, 1f, -1f);
        assertEquals(-1f, t[2], 0f);
        assertEquals(-1f, t[3], 0f);
        // 拡大した画像の右端は 2 + (-1) = 1 で、画面の右端と一致する。
        assertEquals(1f, t[0] * 1f + t[2], 0f);
        float[] clamped = EffectMath.transform(false, false, 1.5f, 5f, 0f);
        assertEquals(-0.5f, clamped[2], 0.0001f);
    }

    /** 拡大していないときは動かさない。 */
    @Test
    public void noPanWithoutZoom() {
        float[] t = EffectMath.transform(false, true, 1f, 1f, 1f);
        assertEquals(0f, t[2], 0f);
        assertEquals(0f, t[3], 0f);
        assertEquals(-1f, t[1], 0f);
    }

    @Test
    public void rainbowCyclesEveryTwoSeconds() {
        assertEquals(0f, EffectMath.rainbowDegrees(0), 0.001f);
        assertEquals(180f, EffectMath.rainbowDegrees(1_000_000), 0.001f);
        assertEquals(0f, EffectMath.rainbowDegrees(2_000_000), 0.001f);
    }

    /** 揺れで動いても画面の端が見えないよう、移動量以上に拡大する。 */
    @Test
    public void shakeZoomsEnoughToHideEdges() {
        for (long t = 0; t < 3_000_000; t += 33_333) {
            float[] s = EffectMath.shake(t, 1f);
            // 正規化座標の画面の端は ±1。拡大で端は ±s[3] へ広がり、移動で dx だけずれる。
            assertTrue(s[3] - 1f >= Math.max(Math.abs(s[0]), Math.abs(s[1])));
        }
        float[] none = EffectMath.shake(1_234_567, 0f);
        assertEquals(0f, none[0], 0f);
        assertEquals(0f, none[1], 0f);
        assertEquals(1f, none[3], 0f);
    }
}
