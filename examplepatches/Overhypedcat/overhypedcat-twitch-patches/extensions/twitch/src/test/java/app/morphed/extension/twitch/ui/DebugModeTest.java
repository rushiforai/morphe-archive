package app.morphed.extension.twitch.ui;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/** The Debug mode row says whether it logs, and whether its window was closed meanwhile. */
public class DebugModeTest {
    @Test
    public void theRowTellsAClosedWindowFromOff() {
        assertEquals("Off", DebugMode.rowText(false, false));
        assertEquals("Off", DebugMode.rowText(false, true));
        assertEquals("On", DebugMode.rowText(true, false));
        assertEquals("On, log window closed", DebugMode.rowText(true, true));
    }
}
