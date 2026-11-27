package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ArtBleedTest {

    @Test
    public void coverZoomsToSixtyPercentOfTheHeightWithinItsLimits() {
        assertEquals(1404, ArtBleed.containerWidth(1080, 2340, 1f));  // the S21 FE: x1.3
        assertEquals(1536, ArtBleed.containerWidth(1440, 2560, 1f));  // the emulator: x1.067
        assertEquals(1000, ArtBleed.containerWidth(1000, 1000, 1f));  // never smaller than the width
        assertEquals(1600, ArtBleed.containerWidth(1000, 4000, 1f));  // at most x1.6
    }

    @Test
    public void blurStartsAtSeventyPercentOnTheSoftGrid() {
        assertEquals(980, ArtBleed.detailTop(1404, 1404)); // 982.8 down to a multiple of 4
        assertEquals(0, ArtBleed.detailTop(1404, 1404) % ArtBleed.SOFT_DIVISOR);
        assertEquals(0f, ArtBleed.blurRadiusAt(0.7f), 0);
        assertEquals(250f, ArtBleed.blurRadiusAt(1.55f), 1e-3);
        assertEquals(250f, ArtBleed.blurRadiusAt(3f), 1e-3);
    }

    @Test
    public void theBleedStartsWithTheCoversLastRow() {
        int w = 3, artH = 10, h = 20;
        int[] art = new int[w * artH];
        for (int y = 0; y < artH; y++) for (int x = 0; x < w; x++) art[y * w + x] = 0xFF000000 | (y * 20) << 8 | x;
        int[] c = ArtBleed.bleedCanvas(art, w, artH, h);
        for (int x = 0; x < w; x++) {
            assertEquals(art[(artH - 1) * w + x], c[artH * w + x]);
            assertEquals(art[x], c[x]);
        }
    }

    @Test
    public void toneIsDarkAndMuted() {
        for (int color : new int[]{0xFFFFFFFF, 0xFF000000, 0xFFFF0000, 0xFF2080FF}) {
            int[] art = new int[400];
            java.util.Arrays.fill(art, color);
            int tone = ArtBleed.bleedTone(art);
            float[] hsv = new float[3];
            int r = (tone >> 16) & 0xFF, g = (tone >> 8) & 0xFF, b = tone & 0xFF;
            float hi = Math.max(r, Math.max(g, b)) / 255f, lo = Math.min(r, Math.min(g, b)) / 255f;
            float l = (hi + lo) / 2;
            assertTrue("lightness " + l + " for " + Integer.toHexString(color), l >= 0.065f && l <= 0.305f);
        }
        assertEquals(0xFF4D4D4D, ArtBleed.bleedTone(new int[]{0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF})); // white: 30% grey
    }

    @Test
    public void aFlatCoverBleedsIntoItsTone() {
        int w = 40, h = 80;
        int[] art = new int[w * w];
        java.util.Arrays.fill(art, 0xFF808080);
        ArtBleed.Bleed coarse = ArtBleed.coarse(new int[100], w, w, h);
        coarse.tone = 0xFF101010;
        ArtBleed.Bleed full = ArtBleed.full(art, w, w, h, coarse);
        // the first blurred row is the cover; the last is pulled most of the way to the tone
        assertEquals(0xFF808080, full.detail[0]);
        int last = full.soft[full.soft.length - 1] & 0xFF;
        assertTrue("last row " + last, last < 0x30 && last > 0x10);
    }
}
