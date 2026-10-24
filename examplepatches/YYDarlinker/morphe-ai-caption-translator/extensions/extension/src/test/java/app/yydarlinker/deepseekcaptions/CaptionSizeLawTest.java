package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/**
 * The continuous size law in isolation. The function is pure: it only reads its arguments, so the
 * same assertions hold for landscape, portrait and any screen density.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 28)
public class CaptionSizeLawTest {
    private static final int TIER = 2;
    private static final int SCREEN_SHORT = 1264;
    private static final int SCREEN_LONG = 2736;
    private static final float DETAIL_RATIO = 9f / 16f;

    @Test
    public void endpointsAreExactlyTheExistingFullAndDetailSizes() {
        assertEquals(
                55.5f,
                CaptionOverlay.glyphHeightPxForVideo(
                        TIER, SCREEN_LONG, SCREEN_SHORT, SCREEN_SHORT),
                .001f);
        assertEquals(
                44.5f,
                CaptionOverlay.glyphHeightPxForVideo(
                        TIER, SCREEN_LONG, SCREEN_SHORT, SCREEN_SHORT * DETAIL_RATIO),
                .001f);
    }

    @Test
    public void ratioFromOneToNineSixteenthsIsMonotonic() {
        float previous = Float.POSITIVE_INFINITY;
        for (int i = 0; i <= 30; i++) {
            float r = 1f - (1f - DETAIL_RATIO) * i / 30f;
            float glyph =
                    CaptionOverlay.glyphHeightPxForVideo(
                            TIER, SCREEN_LONG, SCREEN_SHORT, SCREEN_SHORT * r);
            assertTrue("glyph must not grow when the video shrinks: " + glyph, glyph <= previous + .0001f);
            previous = glyph;
        }
    }

    @Test
    public void theLawIsIndependentOfOrientation() {
        float landscape =
                CaptionOverlay.glyphHeightPxForVideo(
                        TIER, SCREEN_LONG, SCREEN_SHORT, SCREEN_SHORT * .75f);
        float portrait =
                CaptionOverlay.glyphHeightPxForVideo(
                        TIER, SCREEN_SHORT, SCREEN_LONG, SCREEN_SHORT * .75f);
        assertEquals(landscape, portrait, .0001f);
    }

    @Test
    public void valuesOutsideTheEndpointsAreClamped() {
        assertEquals(
                55.5f,
                CaptionOverlay.glyphHeightPxForVideo(TIER, SCREEN_LONG, SCREEN_SHORT, 99999f),
                .001f);
        assertEquals(
                44.5f,
                CaptionOverlay.glyphHeightPxForVideo(TIER, SCREEN_LONG, SCREEN_SHORT, 1f),
                .001f);
    }
}
