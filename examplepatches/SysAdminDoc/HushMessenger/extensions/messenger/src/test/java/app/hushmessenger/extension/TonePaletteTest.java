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

    @Test(expected = IllegalArgumentException.class)
    public void anUnknownToneThrows() {
        TonePalette.fallback().tone(TonePalette.ACCENT, 42);
    }
}
