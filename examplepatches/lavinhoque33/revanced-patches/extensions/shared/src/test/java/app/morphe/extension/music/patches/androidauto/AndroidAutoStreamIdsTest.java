/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 */
package app.morphe.extension.music.patches.androidauto;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoStreamIds.PlayRequest;
import static org.junit.Assert.*;

import org.junit.Test;

public class AndroidAutoStreamIdsTest {
    private static final String PREFIX = AndroidAutoDownloadsData.PREFIX;

    @Test public void idsLiveInTheStreamBranchOfTheDownloadsPrefix() {
        assertEquals(PREFIX + "stream", AndroidAutoStreamIds.FOLDER_ID);
        assertEquals(PREFIX + "stream/source/OLAK5uy_abc-1", AndroidAutoStreamIds.sourceId("OLAK5uy_abc-1"));
        assertEquals(PREFIX + "stream/play/songs/4/9", AndroidAutoStreamIds.playId("songs", 4, 9));
        assertEquals(PREFIX + "stream/all/PLxyz/9", AndroidAutoStreamIds.playAllId("PLxyz", 9));
    }

    @Test public void streamIdsAreNeverTheDeviceFileIds() {
        for (String id : new String[]{AndroidAutoStreamIds.FOLDER_ID, AndroidAutoStreamIds.sourceId("songs"),
                AndroidAutoStreamIds.playId("songs", 0, 1), AndroidAutoStreamIds.playAllId("songs", 1)}) {
            assertTrue(id, AndroidAutoStreamIds.isStream(id));
            assertEquals(id, -1, AndroidAutoDownloadsData.parsePlaylistId(id));
            assertNull(id, AndroidAutoDownloadsData.parsePlayId(id));
        }
        assertFalse(AndroidAutoStreamIds.isStream(AndroidAutoDownloadsData.ROOT_ID));
        assertFalse(AndroidAutoStreamIds.isStream(AndroidAutoDownloadsData.playlistId(7)));
        assertFalse(AndroidAutoStreamIds.isStream(AndroidAutoDownloadsData.playId(7, 0, 1)));
        assertFalse(AndroidAutoStreamIds.isStream(PREFIX + "streamer"));
        assertFalse(AndroidAutoStreamIds.isStream(null));
    }

    @Test public void deviceFileIdsAreNeverStreamPlayIds() {
        assertNull(AndroidAutoStreamIds.parsePlay(AndroidAutoDownloadsData.playId(7, 0, 1)));
        assertNull(AndroidAutoStreamIds.parseSource(AndroidAutoDownloadsData.playlistId(7)));
    }

    @Test public void playIdRoundTrips() {
        assertEquals(new PlayRequest("OLAK5uy_abc", 2, 12),
                AndroidAutoStreamIds.parsePlay(AndroidAutoStreamIds.playId("OLAK5uy_abc", 2, 12)));
        assertEquals(new PlayRequest("songs", 0, 1),
                AndroidAutoStreamIds.parsePlay(AndroidAutoStreamIds.playId("songs", 0, 1)));
    }

    @Test public void playAllStartsAtTheFirstSong() {
        assertEquals(new PlayRequest("PLxyz", 0, 9),
                AndroidAutoStreamIds.parsePlay(AndroidAutoStreamIds.playAllId("PLxyz", 9)));
    }

    @Test public void sourceIdRoundTrips() {
        assertEquals("MPREb_a-B", AndroidAutoStreamIds.parseSource(AndroidAutoStreamIds.sourceId("MPREb_a-B")));
        assertNull(AndroidAutoStreamIds.parseSource(AndroidAutoStreamIds.FOLDER_ID));
        assertNull(AndroidAutoStreamIds.parseSource(null));
    }

    @Test public void malformedPlayIdsAreRejected() {
        String play = PREFIX + "stream/play/";
        for (String id : new String[]{play, play + "songs", play + "songs/1", play + "songs/1/2/3", play + "songs/x/3",
                play + "songs/-1/3", play + "songs/3/3", play + "songs/4/3", play + "songs//3", play + "/1/3",
                play + "a%2Fb/1/3", play + "a b/1/3", play + "songs/1/3999999999", play + "songs/1/0",
                PREFIX + "stream/all/", PREFIX + "stream/all/songs", PREFIX + "stream/all/songs/0",
                PREFIX + "stream/all/songs/x", PREFIX + "stream/all//3", PREFIX + "stream/all/songs/3/4"}) {
            assertNull(id, AndroidAutoStreamIds.parsePlay(id));
        }
        assertNull(AndroidAutoStreamIds.parsePlay(null));
        assertNull(AndroidAutoStreamIds.parsePlay(AndroidAutoStreamIds.FOLDER_ID));
    }

    @Test public void malformedSourceIdsAreRejected() {
        String source = PREFIX + "stream/source/";
        for (String id : new String[]{source, source + "a/b", source + "a b", source + "..", source + "a?b",
                source + "x".repeat(65)}) {
            assertNull(id, AndroidAutoStreamIds.parseSource(id));
        }
    }

    @Test public void builderRejectsWhatItCouldNotParse() {
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamIds.sourceId("a/b"));
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamIds.sourceId(""));
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamIds.playId("songs", -1, 3));
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamIds.playId("songs", 3, 3));
        assertThrows(IllegalArgumentException.class, () -> AndroidAutoStreamIds.playAllId("songs", 0));
        assertFalse(AndroidAutoStreamIds.isValidSource("a/b"));
        assertTrue(AndroidAutoStreamIds.isValidSource("songs"));
    }
}
