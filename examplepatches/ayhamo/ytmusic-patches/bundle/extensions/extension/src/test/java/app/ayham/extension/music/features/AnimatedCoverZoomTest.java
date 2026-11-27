package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class AnimatedCoverZoomTest {
    @Test
    public void theZoomHoldsOnceTheBarsAreCroppedOff() {
        float z = AnimatedCover.nextZoom(1f, 1.173913f);   // bars seen
        assertEquals(1.173913f, z, 1e-4);
        assertEquals(z, AnimatedCover.nextZoom(z, 1f), 1e-6); // cropped off: no zoom out
    }

    @Test
    public void aZoomedFrameIsNotMeasuredAgain() {
        // read before the new zoom is drawn, the bars are still there: no second zoom on top
        assertEquals(1.173913f, AnimatedCover.nextZoom(1.173913f, 1.173913f), 1e-6);
        assertEquals(1f, AnimatedCover.nextZoom(1f, 1f), 1e-6);
        assertEquals(1.6f, AnimatedCover.nextZoom(1f, 2f), 1e-6);
    }
}
