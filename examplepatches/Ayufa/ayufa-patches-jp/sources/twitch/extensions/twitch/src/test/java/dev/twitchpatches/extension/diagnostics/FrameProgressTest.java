package dev.twitchpatches.extension.diagnostics;

import org.junit.Test;
import static org.junit.Assert.*;

public final class FrameProgressTest {
    @Test public void countsRenderedProgressSeparatelyFromDecodedAndDroppedFrames() {
        FrameProgress progress = new FrameProgress();
        assertEquals("frame counter baseline", progress.sample(1000, 100, 90, 10));
        assertNull(progress.sample(2000, 160, 145, 15));
        assertEquals("frames elapsedMs=5000 decoded=300 rendered=270 dropped=30",
                progress.sample(6000, 400, 360, 40));
        assertEquals("frames elapsedMs=5000 decoded=0 rendered=0 dropped=0",
                progress.sample(11000, 400, 360, 40));
    }

    @Test public void resetsAndInvalidCountersCannotPretendToBeForwardProgress() {
        FrameProgress progress = new FrameProgress();
        assertNull(progress.sample(0, -1, 0, 0));
        assertEquals("frame counter baseline", progress.sample(0, 100, 100, 0));
        assertEquals("frame counter baseline", progress.sample(6000, 1, 1, 0));
        assertEquals("frames elapsedMs=5000 decoded=20 rendered=20 dropped=0",
                progress.sample(11000, 21, 21, 0));
        assertEquals("frame counter baseline", progress.sample(1000, 21, 21, 0));
    }
}
