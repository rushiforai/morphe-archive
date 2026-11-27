package app.ayham.extension.music.automix;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class SoftHandoverTest {
    /** Lined up (the same song within a few ms): the two shares sum to 1 all the way, so the level stays flat. */
    @Test
    public void linedUpIsEqualGain() {
        for (double t = -0.1; t <= 1.1; t += 0.05)
            assertEquals(1, Engine.softOut(t, true) + Engine.softIn(t, true), 1e-6);
        assertEquals(0.5f, Engine.softIn(0.5, true), 1e-6);
    }

    /** Not lined up (uncorrelated): equal power, the squares sum to 1. */
    @Test
    public void notLinedUpIsEqualPower() {
        for (double t = 0; t <= 1; t += 0.05) {
            float o = Engine.softOut(t, false), i = Engine.softIn(t, false);
            assertEquals(1, o * o + i * i, 1e-6);
        }
    }

    @Test
    public void theEndsAreWhole() {
        assertEquals(1f, Engine.softOut(0, true), 0);
        assertEquals(0f, Engine.softOut(1, false), 1e-6);
        assertEquals(1f, Engine.softIn(1, false), 1e-6);
        assertEquals(0f, Engine.softIn(0, true), 0);
    }
}
