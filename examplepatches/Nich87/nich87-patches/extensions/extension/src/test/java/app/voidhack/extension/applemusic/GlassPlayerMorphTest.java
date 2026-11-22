package app.voidhack.extension.applemusic;

import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class GlassPlayerMorphTest {
    private final GlassPlayerMorph frame = new GlassPlayerMorph();

    @Test public void progressCanBeInitializedFromTheLaidOutSheet() {
        assertEquals(1f, GlassPlayerMorph.progressAt(16, 16, 816), 0f);
        assertEquals(0.995f, GlassPlayerMorph.progressAt(20, 16, 816), 0.00001f);
        assertEquals(0.5f, GlassPlayerMorph.progressAt(416, 16, 816), 0f);
        assertEquals(0f, GlassPlayerMorph.progressAt(816, 16, 816), 0f);
        assertEquals(0f, GlassPlayerMorph.progressAt(900, 16, 816), 0f);
        assertEquals(0f, GlassPlayerMorph.progressAt(0, 0, 0), 0f);
    }

    @Test public void halfExpandedOutlineInterpolatesFromTheRestingPill() {
        assertTrue(update(0.5f));
        assertEquals(4, frame.left);
        assertEquals(6, frame.top);
        assertEquals(386, frame.right);
        assertEquals(437, frame.bottom);
        assertEquals(15f, frame.radius, 0f);
        assertEquals(128, frame.metadataAlpha);
        assertEquals(0, frame.glassAlpha);
        assertEquals(0, frame.miniAlpha);
    }

    @Test public void glassAndMetadataFadeMonotonicallyDuringDismissal() {
        int previousGlass = 0;
        int previousMetadata = 255;
        for (int i = 99; i > 0; i--) {
            assertTrue(update(i / 100f));
            assertTrue(frame.glassAlpha >= previousGlass);
            assertTrue(frame.metadataAlpha <= previousMetadata);
            assertEquals(0, frame.miniAlpha);
            previousGlass = frame.glassAlpha;
            previousMetadata = frame.metadataAlpha;
        }
        assertEquals(254, previousGlass);
        assertEquals(0, previousMetadata);
    }

    @Test public void directionChangesDoNotChangeTheFrameAtTheSameProgress() {
        assertTrue(update(0.14f));
        int alpha = frame.glassAlpha;
        float radius = frame.radius;
        assertEquals(128, alpha);
        assertTrue(update(0.04f));
        assertTrue(update(0.14f));
        assertEquals(alpha, frame.glassAlpha);
        assertEquals(radius, frame.radius, 0f);
    }

    @Test public void bothEndpointsRestoreTheirNativeLayersEvenWhenSkippedTo() {
        assertFalse(update(1f));
        assertEquals(0, frame.miniAlpha);
        assertEquals(255, frame.metadataAlpha);
        assertFalse(update(0f));
        assertEquals(255, frame.miniAlpha);
        assertEquals(0, frame.glassAlpha);
        assertEquals(0, frame.metadataAlpha);
        assertTrue(update(0.1f));
        assertFalse(update(1f));
        assertEquals(0, frame.miniAlpha);
        assertEquals(0, frame.glassAlpha);
    }

    @Test public void reducedMotionAndMissingGeometryLeaveMiniGlassAvailable() {
        assertFalse(frame.update(0.2f, false, 8, 12, 376, 72, 396, 802));
        assertEquals(255, frame.miniAlpha);
        assertEquals(0, frame.glassAlpha);
        assertFalse(frame.update(0.2f, true, 0, 0, 0, 0, 396, 802));
        assertEquals(255, frame.miniAlpha);
        assertEquals(0, frame.glassAlpha);
        assertTrue(update(0.2f));
        assertEquals(0, frame.miniAlpha);
        assertTrue(frame.glassAlpha > 0);
    }

    private boolean update(float progress) {
        return frame.update(progress, true, 8, 12, 376, 72, 396, 802);
    }
}
