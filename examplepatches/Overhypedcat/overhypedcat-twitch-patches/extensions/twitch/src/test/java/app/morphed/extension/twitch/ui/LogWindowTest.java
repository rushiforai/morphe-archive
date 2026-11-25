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
        assertEquals(350, landscapeHeight);              // at least 200 dp on the short one, not the portrait 512
        assertTrue(landscapeHeight < 720 / 2);           // the video stays in view
        assertEquals(1056, LogWindow.widthFor(1600, DENSITY)); // two thirds of the wide screen
        assertEquals(525, LogWindow.widthFor(720, DENSITY));   // 300 dp at least, inside a margin
    }

    @Test
    public void neverLargerThanTheScreen() {
        assertEquals(300, LogWindow.heightFor(300, DENSITY));
        assertTrue(LogWindow.widthFor(400, DENSITY) <= 400 - 42);
        assertEquals(0, LogWindow.widthFor(10, DENSITY));
    }
}
