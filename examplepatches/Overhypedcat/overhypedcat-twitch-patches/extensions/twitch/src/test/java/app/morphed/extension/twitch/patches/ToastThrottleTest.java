package app.morphed.extension.twitch.patches;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

public class ToastThrottleTest {
    private final ToastThrottle throttle = new ToastThrottle();

    @Test
    public void oneToastPerBreak() {
        // A 90 second break polls about 45 times: one toast.
        assertTrue(throttle.allow(true));
        for (int poll = 0; poll < 45; poll++) assertFalse(throttle.allow(true));

        throttle.breakOver();
        assertTrue(throttle.allow(true));
    }

    @Test
    public void singleBlocksAlwaysGetTheirToast() {
        assertTrue(throttle.allow(true));
        // A refused ad during the same break is its own block (its caller debounces it).
        assertTrue(throttle.allow(false));
        assertTrue(throttle.allow(false));
    }
}
