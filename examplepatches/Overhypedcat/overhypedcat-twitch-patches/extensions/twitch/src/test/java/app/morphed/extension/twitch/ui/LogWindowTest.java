package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

/** The log window's size follows the screen it is on (turned around, split, resized). */
public class LogWindowTest {
    private static final float DENSITY = 1.75f; // 280 dpi

    @Test
    public void portraitAndLandscapeEachGetTheirOwnSize() {
        int portraitHeight = LogWindow.heightFor(1600, DENSITY);
        int landscapeHeight = LogWindow.heightFor(720, DENSITY);
        assertEquals(512, portraitHeight);               // a third of the tall screen
        assertEquals(324, landscapeHeight);              // 45% of the short one at most, not the portrait 512
        assertTrue(landscapeHeight < 720 / 2);           // the video stays in view
        assertEquals(800, LogWindow.widthFor(1600, DENSITY));  // half the wide screen
        assertEquals(525, LogWindow.widthFor(720, DENSITY));   // 300 dp at least, inside a margin
    }

    @Test
    public void neverLargerThanTheScreen() {
        assertEquals(135, LogWindow.heightFor(300, DENSITY)); // never most of the screen
        assertTrue(LogWindow.widthFor(400, DENSITY) <= 400 - 42);
        assertEquals(0, LogWindow.widthFor(10, DENSITY));
    }
}
