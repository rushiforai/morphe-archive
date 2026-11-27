package app.ayham.extension.music.features;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class MixLookTest {
    @Test
    public void theFillSweepsToTheEndInsteadOfFollowingTheSong() {
        assertEquals(0f, PlayerScreen.mixLook(0, 1f)[0], 1e-4);
        float half = PlayerScreen.mixLook(350, 1f)[0];
        assertTrue("FastOutSlowIn is past halfway at half time: " + half, half > 0.6f && half < 0.9f);
        assertEquals(1f, PlayerScreen.mixLook(700, 1f)[0], 1e-3);
        assertEquals(1f, PlayerScreen.mixLook(9_000, 0.1f)[0], 1e-3); // stays full for the whole blend
    }

    @Test
    public void theFillPulsesOnTheBeatOnceFadedIn() {
        assertEquals(0.92f, PlayerScreen.mixLook(0, 0.1f)[1], 1e-4);       // full before the pulse fades in
        assertEquals(0.92f, PlayerScreen.mixLook(2_000, 1f)[1], 1e-4);     // on a beat
        assertEquals(0.092f, PlayerScreen.mixLook(2_000, 0.1f)[1], 1e-4);  // between beats: 10%
    }

    @Test
    public void theLabelFollowsTheSweepAndThePulse() {
        assertEquals(0f, PlayerScreen.mixLook(0, 1f)[2], 1e-4);
        assertEquals(0.85f, PlayerScreen.mixLook(2_000, 1f)[2], 1e-4);
        assertEquals(0.85f * 0.55f, PlayerScreen.mixLook(2_000, 0.1f)[2], 1e-4);
    }

    @Test
    public void fastOutSlowInEnds() {
        assertEquals(0f, PlayerScreen.fastOutSlowIn(0f), 1e-4);
        assertEquals(1f, PlayerScreen.fastOutSlowIn(1f), 1e-4);
    }
}
