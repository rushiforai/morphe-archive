package dev.twitchpatches.extension.settings;

import org.junit.Test;
import static org.junit.Assert.*;

public class SettingsNavigationTest {
    @Test public void nestedBackRestoresEachPageAndScrollPosition() {
        SettingsNavigation state = new SettingsNavigation((String) null);
        state.open("ui_settings", 180);
        state.open("ui_classic", 24);
        state.open("ui_classic_support", 80);
        assertEquals("ui_classic_support", state.current());
        assertEquals(0, state.scroll());
        assertTrue(state.back());
        assertEquals("ui_classic", state.current());
        assertEquals(80, state.scroll());
        assertTrue(state.back());
        assertEquals(24, state.scroll());
        assertTrue(state.back());
        assertNull(state.current());
        assertEquals(180, state.scroll());
        assertFalse(state.back());
    }

    @Test public void directEntryAndSavedStateKeepTheirOwnRoot() {
        SettingsNavigation state = new SettingsNavigation("ui_settings");
        state.open("ui_vertical", 90);
        state.saveScroll(45);
        SettingsNavigation restored = new SettingsNavigation(state.routes(), state.offsets());
        state.routes().clear();
        assertEquals("ui_vertical", restored.current());
        assertEquals(45, restored.scroll());
        assertTrue(restored.back());
        assertEquals("ui_settings", restored.current());
        assertEquals(90, restored.scroll());
        assertFalse(restored.back());
    }

    @Test public void openingAResultAndGoingBackRestoresSearchAndScroll() {
        SettingsNavigation state = new SettingsNavigation("ui_settings");
        state.search("classic bits");
        state.open("ui_classic_support", 160);
        assertEquals("", state.query());
        state.search("subscribe");
        SettingsNavigation restored = new SettingsNavigation(state.routes(), state.offsets(), state.queries(), state.browseOffsets());
        assertEquals("subscribe", restored.query());
        assertTrue(restored.back());
        assertEquals("classic bits", restored.query());
        assertEquals(160, restored.scroll());
        restored.search("");
        assertEquals(0, restored.scroll());
    }

    @Test public void clearingSearchRestoresBrowsePositionAfterSavedState() {
        SettingsNavigation state = new SettingsNavigation("ui_settings");
        state.search("hide", 320);
        state.search("hide bits", 80);
        state.saveScroll(24);
        SettingsNavigation restored = new SettingsNavigation(state.routes(), state.offsets(), state.queries(), state.browseOffsets());
        assertEquals(24, restored.scroll());
        restored.search("", 24);
        assertEquals(320, restored.scroll());
        restored.search("clip", 400);
        restored.search("", 0);
        assertEquals(400, restored.scroll());
    }
}
