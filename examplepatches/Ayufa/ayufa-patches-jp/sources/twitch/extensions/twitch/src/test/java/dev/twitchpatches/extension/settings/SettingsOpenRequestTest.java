package dev.twitchpatches.extension.settings;

import org.junit.Test;
import static org.junit.Assert.*;

public class SettingsOpenRequestTest {
    @Test public void directGroupSurvivesDeferredOpeningAndRootRequestResetsIt() {
        SettingsOpenRequest request = new SettingsOpenRequest();
        request.request("ui_settings");
        assertFalse(request.consume(false, false));
        assertEquals("ui_settings", request.groupKey());
        assertTrue(request.consume(true, false));
        assertEquals("ui_settings", request.groupKey());
        request.request();
        assertTrue(request.consume(true, false));
        assertNull(request.groupKey());
    }

    @Test public void themeRecreationRetainsTapUntilActivityResumes() {
        SettingsOpenRequest request = new SettingsOpenRequest();
        request.request();
        assertFalse(request.consume(false, false));
        assertTrue(request.consume(true, false));
        assertFalse(request.consume(true, false));
    }

    @Test public void repeatedTapsDoNotStackPages() {
        SettingsOpenRequest request = new SettingsOpenRequest();
        request.request();
        request.request();
        assertFalse(request.consume(true, true));
        assertFalse(request.consume(true, false));
        request.request();
        assertTrue(request.consume(true, false));
    }
}
