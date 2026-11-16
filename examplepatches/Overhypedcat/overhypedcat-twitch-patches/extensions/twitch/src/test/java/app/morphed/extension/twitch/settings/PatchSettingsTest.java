package app.morphed.extension.twitch.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/** Song removal is off until switched on, and remembered per channel (as Mor's filter). */
public class PatchSettingsTest {
    @Test
    public void songRemovalIsRememberedPerChannel() {
        PatchSettings.setForTest(true, false);
        List<String> told = new ArrayList<>();
        PatchSettings.Listener listener = (key, on) -> told.add(key + "=" + on);
        PatchSettings.addListener(listener);
        try {
            PatchSettings.watching("channel:a");
            assertFalse("off until switched on", PatchSettings.songRemoval());
            PatchSettings.set(PatchSettings.SONG_REMOVAL, true);
            assertTrue(PatchSettings.songRemoval());

            PatchSettings.watching("channel:b");
            assertFalse("another channel is still off", PatchSettings.songRemoval());
            PatchSettings.watching("channel:a");
            assertTrue("back on the first one: on again", PatchSettings.songRemoval());
            assertTrue(PatchSettings.songRemovalFor("channel:a"));
            assertFalse(PatchSettings.songRemovalFor("channel:b"));

            PatchSettings.set(PatchSettings.SONG_REMOVAL, false);
            assertFalse(PatchSettings.songRemovalFor("channel:a"));
            // switched on; b watched (off); a watched (on again); switched off
            assertEquals("[song_removal=true, song_removal=false, song_removal=true, song_removal=false]", told.toString());
        } finally {
            PatchSettings.removeListener(listener);
        }
    }

    @Test
    public void withoutAStreamThereIsNothingToSwitch() {
        PatchSettings.setForTest(true, false);
        PatchSettings.set(PatchSettings.SONG_REMOVAL, true);
        assertFalse(PatchSettings.songRemoval());
    }

    @Test
    public void aSwitchWithNoStreamGoesBackOff() {
        PatchSettings.setForTest(true, false);
        List<String> told = new ArrayList<>();
        PatchSettings.Listener listener = (key, on) -> told.add(key + "=" + on);
        PatchSettings.addListener(listener);
        try {
            PatchSettings.set(PatchSettings.SONG_REMOVAL, true);
            assertEquals("the switch is told to go back", "[song_removal=false]", told.toString());
        } finally {
            PatchSettings.removeListener(listener);
        }
    }

    @Test
    public void aPastBroadcastHasItsOwnSwitch() {
        PatchSettings.setForTest(true, false);
        PatchSettings.watching("channel:a");
        assertFalse(PatchSettings.watchingVideo());
        PatchSettings.set(PatchSettings.SONG_REMOVAL, true);
        PatchSettings.watching("vod:123");
        assertTrue(PatchSettings.watchingVideo());
        assertFalse("its channel being on doesn't switch it on", PatchSettings.songRemoval());
    }
}
