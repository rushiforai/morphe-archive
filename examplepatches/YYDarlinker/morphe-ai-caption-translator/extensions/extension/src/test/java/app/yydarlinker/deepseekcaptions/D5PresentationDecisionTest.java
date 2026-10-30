package app.yydarlinker.deepseekcaptions;

import static org.junit.Assert.*;

import android.graphics.Rect;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

/** Focused gaps around the real Overlay-to-decision and prefetch regression probes. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 35)
public class D5PresentationDecisionTest {
    private static final int SCREEN_W = 2736, SCREEN_H = 1264;

    @Test
    public void fullDestinationPrefetchDoesNotClearReducedMemoryOrSampling() {
        CaptionPresentationDecision decision = new CaptionPresentationDecision();
        Rect reduced = new Rect(0, 0, 1478, 831);
        CaptionPresentationClass.Kind next = decision.classToCommit(
                reduced, SCREEN_W, SCREEN_H, false, "WATCH_WHILE_MAXIMIZED");
        assertEquals(CaptionPresentationClass.Kind.REDUCED, next);
        assertEquals(1478, decision.prepareClassCommit(next, reduced, SCREEN_W, SCREEN_H, false));
        decision.finishClassCommit(next);
        assertNull(decision.classToCommit(
                reduced, SCREEN_W, SCREEN_H, false, "WATCH_WHILE_MAXIMIZED"));
        assertEquals(1478, decision.reducedWidth());
        assertEquals(1360, decision.baseWidth());
        assertFalse(decision.sampleStableWidth(1901, 1000, true));
        assertFalse(decision.sampleStableWidth(1901, 1000, true));

        CaptionPresentationClass.Kind target = decision.prefetchClass(
                "watch_while_sliding_maximized_fullscreen", SCREEN_W, SCREEN_H, false);
        assertEquals(CaptionPresentationClass.Kind.FULL, target);
        assertEquals(2067, decision.prefetchWidth(target, reduced, SCREEN_W, SCREEN_H, false));
        assertEquals(CaptionPresentationClass.Kind.REDUCED, decision.currentClass());
        assertEquals(1360, decision.frameWidth());
        assertEquals(1360, decision.baseWidth());
        assertEquals(1478, decision.reducedWidth());
        assertTrue("prefetch did not reset the prior two samples",
                decision.sampleStableWidth(1901, 1000, true));

        int videoWidth = decision.prepareClassCommit(target, reduced, SCREEN_W, SCREEN_H, false);
        assertEquals(2247, videoWidth);
        assertEquals(0, decision.reducedWidth());
        assertEquals(2067, decision.frameWidth());
        assertEquals("glyph settings are read between numeric and class commit",
                CaptionPresentationClass.Kind.REDUCED, decision.currentClass());
        decision.finishClassCommit(target);
        assertEquals(CaptionPresentationClass.Kind.FULL, decision.currentClass());
        assertFalse("class commit reset the sample run", decision.sampleStableWidth(1901, 1000, true));
    }

    @Test
    public void stablePlanPreservesGatePaddingQuantizationAndBaseRestore() {
        CaptionPresentationDecision decision = new CaptionPresentationDecision();
        Rect full = new Rect(0, 0, 2247, 1264);
        CaptionPresentationClass.Kind target = decision.classToCommit(
                full, SCREEN_W, SCREEN_H, false, "WATCH_WHILE_FULLSCREEN");
        decision.prepareClassCommit(target, full, SCREEN_W, SCREEN_H, false);
        decision.finishClassCommit(target);
        assertFalse(decision.sampleStableWidth(980, 1000, true));
        assertFalse(decision.sampleStableWidth(980, 1000, true));
        assertFalse(decision.sampleStableWidth(980, 1000, true));
        assertFalse(decision.sampleStableWidth(979, 1000, false));
        assertFalse(decision.sampleStableWidth(979, 1000, false));
        assertTrue(decision.sampleStableWidth(979, 1000, true));
        int wide = decision.stableWide(979);
        assertEquals(901, wide);
        assertTrue(decision.replanStableWidth(wide, 11));
        assertEquals("11px padding is added after quantizing the inner width", 899, decision.frameWidth());
        assertEquals(2067, decision.baseWidth());
        assertFalse(decision.sampleStableWidth(2460, 899, true));
        assertFalse(decision.sampleStableWidth(2460, 899, true));
        assertTrue(decision.sampleStableWidth(2460, 899, true));
        assertTrue(decision.replanStableWidth(decision.stableWide(2460), 0));
        assertEquals("wide restore is the exact base, not a new quantized value", 2067,
                decision.frameWidth());
        decision.resetSamples();
        assertEquals(2067, decision.frameWidth());
        decision.clear();
        assertNull(decision.currentClass());
        assertEquals(0, decision.frameWidth());
        assertEquals(0, decision.baseWidth());
        assertEquals(0, decision.reducedWidth());
    }
}
