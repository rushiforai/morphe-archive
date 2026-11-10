package app.morphed.extension.twitch.patches;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class AdBreakIndicatorTest {
    @Test
    public void miniPlayerGetsNoLabel() {
        // Measured on the emulator: the mini player at [639..1058] in a 1080 px window.
        assertTrue(AdBreakIndicator.isMiniPlayer(639, 419, 1080));
        // While it grows back from picture in picture: [157..575], over half as wide but off-centre.
        assertTrue(AdBreakIndicator.isMiniPlayer(157, 418, 1080));
    }

    @Test
    public void streamScreensKeepTheLabel() {
        assertFalse(AdBreakIndicator.isMiniPlayer(0, 1080, 1080)); // stream screen
        assertFalse(AdBreakIndicator.isMiniPlayer(1, 1079, 1080)); // past broadcast
        assertFalse(AdBreakIndicator.isMiniPlayer(0, 2400, 2400)); // full screen
        // Full screen with the video narrower than the screen: centred.
        assertFalse(AdBreakIndicator.isMiniPlayer(133, 2133, 2400)); // 16:9 on a 20:9 screen
        assertFalse(AdBreakIndicator.isMiniPlayer(400, 1600, 2400)); // 4:3
    }

    @Test
    public void unknownSizesAreNotAMiniPlayer() {
        assertFalse(AdBreakIndicator.isMiniPlayer(0, 0, 1080));
        assertFalse(AdBreakIndicator.isMiniPlayer(639, 419, 0));
    }
}
