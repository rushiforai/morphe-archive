package app.hushmessenger.extension;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = {28, 36})
public class TonePaletteTest {

    @Test public void theFallbackPaletteHasThreeFamiliesOfThirteenTones() {
        TonePalette p = TonePalette.fallback();
        assertFalse(p.dynamic);
        // Each family has a tone for each step
        for (int family : new int[]{TonePalette.ACCENT, TonePalette.NEUTRAL, TonePalette.NEUTRAL_VARIANT}) {
            for (int tone : TonePalette.TONES) {
                int color = p.tone(family, tone);
                assertEquals("tone " + tone + " is opaque", 0xFF, (color >>> 24));
            }
        }
    }

    @Test public void toneZeroIsBlackAndToneHundredIsWhite() {
        TonePalette p = TonePalette.fallback();
        for (int family : new int[]{TonePalette.ACCENT, TonePalette.NEUTRAL, TonePalette.NEUTRAL_VARIANT}) {
            assertEquals("tone 0 is black", 0xFF000000, p.tone(family, 0));
            assertEquals("tone 100 is white", 0xFFFFFFFF, p.tone(family, 100));
        }
    }

    @Test public void sameLightnessPreservesLightness() {
        TonePalette p = TonePalette.fallback();
        int grey = 0xFF808080;
        int result = p.sameLightness(TonePalette.NEUTRAL, grey);
        double inputL = TonePalette.lstar(grey);
        double outputL = TonePalette.lstar(result);
        assertEquals("lightness preserved", inputL, outputL, 1.0);
    }

    @Test public void sameLightnessPreservesAlpha() {
        TonePalette p = TonePalette.fallback();
        int semiTransparent = 0x80404040;
        int result = p.sameLightness(TonePalette.NEUTRAL, semiTransparent);
        assertEquals("alpha preserved", 0x80, (result >>> 24));
    }

    @Test public void blackStaysBlack() {
        TonePalette p = TonePalette.fallback();
        int result = p.sameLightness(TonePalette.NEUTRAL, 0xFF000000);
        assertEquals("black stays black", 0xFF000000, result);
    }

    @Test public void whiteStaysWhite() {
        TonePalette p = TonePalette.fallback();
        int result = p.sameLightness(TonePalette.NEUTRAL, 0xFFFFFFFF);
        assertEquals("white stays white", 0xFFFFFFFF, result);
    }

    @Test public void lstarOfBlackIsZeroAndWhiteIsHundred() {
        assertEquals(0.0, TonePalette.lstar(0xFF000000), 0.01);
        assertEquals(100.0, TonePalette.lstar(0xFFFFFFFF), 0.01);
    }

    @Test public void lstarOfMidGreyIsAboutFifty() {
        // sRGB mid grey (119) gives L* close to 50
        double l = TonePalette.lstar(0xFF777777);
        assertTrue("L* of mid grey between 40 and 60: " + l, l >= 40 && l <= 60);
    }

    @Test public void accentFamilyCarriesColour() {
        TonePalette p = TonePalette.fallback();
        // The fallback accent at tone 50 should not be a pure grey (it's blue-tinted)
        int accent50 = p.tone(TonePalette.ACCENT, 50);
        int r = (accent50 >> 16) & 0xFF, g = (accent50 >> 8) & 0xFF, b = accent50 & 0xFF;
        int spread = Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b));
        assertTrue("accent at 50 is not grey, spread=" + spread, spread > 15);
    }

    @Test public void neutralFamilyIsNearGrey() {
        TonePalette p = TonePalette.fallback();
        // The fallback neutral at tone 50 should be close to grey (spread < 10)
        int neutral50 = p.tone(TonePalette.NEUTRAL, 50);
        int r = (neutral50 >> 16) & 0xFF, g = (neutral50 >> 8) & 0xFF, b = neutral50 & 0xFF;
        int spread = Math.max(r, Math.max(g, b)) - Math.min(r, Math.min(g, b));
        assertTrue("neutral at 50 is near grey, spread=" + spread, spread <= 10);
    }

    @Test public void tonesAreMonotonicallyBrighter() {
        TonePalette p = TonePalette.fallback();
        for (int family : new int[]{TonePalette.ACCENT, TonePalette.NEUTRAL}) {
            double prev = -1;
            for (int tone : TonePalette.TONES) {
                double l = TonePalette.lstar(p.tone(family, tone));
                assertTrue("family " + family + " tone " + tone + " brighter than previous", l >= prev);
                prev = l;
            }
        }
    }

    /** #115: a theme's two colours make a palette with the same shape as the wallpaper's. */
    @Test public void aPaletteFromTwoColoursKeepsTheirHuesAtEveryTone() {
        int pink = 0xFFE1306C, plum = 0xFF1A1418;
        for (TonePalette p : new TonePalette[]{TonePalette.fromSeeds(pink, plum), TonePalette.fromAccent(pink)}) {
            assertFalse(p.dynamic);
            for (int family : new int[]{TonePalette.ACCENT, TonePalette.NEUTRAL, TonePalette.NEUTRAL_VARIANT}) {
                assertEquals("tone 0 is black", 0xFF000000, p.tone(family, 0));
                assertEquals("tone 100 is white", 0xFFFFFFFF, p.tone(family, 100));
                double prev = -1;
                for (int tone : TonePalette.TONES) {
                    double l = TonePalette.lstar(p.tone(family, tone));
                    assertEquals("family " + family + " tone " + tone + " sits at its tone", tone, l, 0.6);
                    assertTrue("family " + family + " tone " + tone + " brighter than previous", l >= prev);
                    prev = l;
                }
            }
            // The accent keeps the seed's hue where there's room for colour.
            for (int tone : new int[]{30, 40, 50, 60, 70, 80})
                assertEquals("accent tone " + tone, hue(pink), hue(p.tone(TonePalette.ACCENT, tone)), 6);
        }
        TonePalette two = TonePalette.fromSeeds(pink, plum);
        assertEquals(two.tone(TonePalette.NEUTRAL, 50), two.tone(TonePalette.NEUTRAL_VARIANT, 50));
        // The plum is barely coloured (chroma about 4), so a step of rounding moves its hue further.
        assertEquals("neutral tone 50", hue(plum), hue(two.tone(TonePalette.NEUTRAL, 50)), 15);
        assertTrue("the neutral is no more colourful than its seed", chroma(two.tone(TonePalette.NEUTRAL, 50)) <= chroma(plum) + 1.5);
        // On its own, the accent's neutrals are its hue, barely tinted.
        TonePalette one = TonePalette.fromAccent(pink);
        assertEquals(TonePalette.NEUTRAL_CHROMA, chroma(one.tone(TonePalette.NEUTRAL, 50)), 1.5);
        assertEquals("neutral tone 50", hue(pink), hue(one.tone(TonePalette.NEUTRAL, 50)), 15);
        // A grey seed stays grey.
        int grey = TonePalette.fromSeeds(pink, 0xFF333333).tone(TonePalette.NEUTRAL, 50);
        assertEquals(((grey >> 16) & 0xFF), grey & 0xFF);
        assertEquals(((grey >> 8) & 0xFF), grey & 0xFF);
    }

    /** CIE Lab hue in degrees and chroma, worked from sRGB so the test doesn't share the palette's code. */
    private static double[] lch(int color) {
        double[] linear = new double[3];
        for (int i = 0; i < 3; i++) {
            double c = ((color >> (16 - 8 * i)) & 0xFF) / 255.0;
            linear[i] = c <= 0.04045 ? c / 12.92 : Math.pow((c + 0.055) / 1.055, 2.4);
        }
        double x = (0.4124 * linear[0] + 0.3576 * linear[1] + 0.1805 * linear[2]) / 0.95047;
        double y = 0.2126 * linear[0] + 0.7152 * linear[1] + 0.0722 * linear[2];
        double z = (0.0193 * linear[0] + 0.1192 * linear[1] + 0.9505 * linear[2]) / 1.08883;
        double fx = f(x), fy = f(y), fz = f(z);
        double a = 500 * (fx - fy), b = 200 * (fy - fz);
        return new double[]{Math.toDegrees(Math.atan2(b, a)), Math.hypot(a, b)};
    }

    private static double f(double t) {
        return t > 216.0 / 24389.0 ? Math.cbrt(t) : (24389.0 / 27.0 * t + 16) / 116;
    }

    private static double hue(int color) { return lch(color)[0]; }

    private static double chroma(int color) { return lch(color)[1]; }

    @Test(expected = IllegalArgumentException.class)
    public void anUnknownToneThrows() {
        TonePalette.fallback().tone(TonePalette.ACCENT, 42);
    }
}
