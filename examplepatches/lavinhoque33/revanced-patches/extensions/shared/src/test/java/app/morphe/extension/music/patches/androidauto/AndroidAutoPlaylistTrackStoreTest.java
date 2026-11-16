/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.androidauto;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.util.List;

import static org.junit.Assert.*;

public class AndroidAutoPlaylistTrackStoreTest {
    @Rule public TemporaryFolder temporary = new TemporaryFolder();
    private static final String ACCOUNT = "a".repeat(64);
    private static final AndroidAutoPlaylistChildren.Track TRACK = new AndroidAutoPlaylistChildren.Track(
            "video", "Song", "Artist", "https://art", new byte[]{10, 1, 42});
    private static final AndroidAutoPlaylistChildren.Page PAGE =
            new AndroidAutoPlaylistChildren.Page("OLAK5uy_album", List.of(TRACK, TRACK), "");

    @Test public void completeOrderedTracksAndNativeCommandsSurviveRestart() throws Exception {
        File directory = temporary.newFolder();
        var store = new AndroidAutoPlaylistTrackStore(directory);
        assertTrue(store.publish(ACCOUNT, "MPREb_album", 1, PAGE, true));
        var restored = new AndroidAutoPlaylistTrackStore(directory).read(ACCOUNT, "MPREb_album");
        assertEquals("OLAK5uy_album", restored.playlistId());
        assertEquals(2, restored.tracks().size());
        assertEquals("Song", restored.tracks().get(1).title());
        assertEquals("Artist", restored.tracks().get(1).artist());
        assertEquals("https://art", restored.tracks().get(1).artwork());
        assertArrayEquals(TRACK.command(), restored.tracks().get(1).command());
        assertEquals(1, directory.listFiles().length);
    }

    @Test public void incompleteAndTimedOutPagesNeverOverwriteTheCompleteSongList() throws Exception {
        var store = new AndroidAutoPlaylistTrackStore(temporary.newFolder());
        store.publish(ACCOUNT, "PLone", 1, PAGE, true);
        var partial = new AndroidAutoPlaylistChildren.Page("PLone", List.of(TRACK), "next");
        assertFalse(store.publish(ACCOUNT, "PLone", 2, partial, false));
        assertFalse(store.publish(ACCOUNT, "PLone", 3, partial, true));
        assertEquals(2, store.read(ACCOUNT, "PLone").tracks().size());
    }

    @Test public void accountAndPlaylistKeysNeverShareTrackSnapshots() throws Exception {
        var store = new AndroidAutoPlaylistTrackStore(temporary.newFolder());
        store.publish(ACCOUNT, "PLone", 1, PAGE, true);
        assertNull(store.read("b".repeat(64), "PLone"));
        assertNull(store.read(ACCOUNT, "PLtwo"));
        assertThrows(IllegalArgumentException.class, () -> store.read(ACCOUNT, "../PLone"));
    }

    @Test public void olderLoadCannotReplaceNewerCompletedSongList() throws Exception {
        var store = new AndroidAutoPlaylistTrackStore(temporary.newFolder());
        store.publish(ACCOUNT, "PLone", 10, PAGE, true);
        var empty = new AndroidAutoPlaylistChildren.Page("PLone", List.of(), "");
        assertFalse(store.publish(ACCOUNT, "PLone", 9, empty, true));
        assertEquals(2, store.read(ACCOUNT, "PLone").tracks().size());
        assertTrue(store.publish(ACCOUNT, "PLone", 11, empty, true));
        assertTrue(store.read(ACCOUNT, "PLone").tracks().isEmpty());
    }

    @Test public void oversizedNativeCommandCannotDestroyThePreviousCompletePage() throws Exception {
        var store = new AndroidAutoPlaylistTrackStore(temporary.newFolder());
        store.publish(ACCOUNT, "PLone", 1, PAGE, true);
        var huge = new AndroidAutoPlaylistChildren.Track("video", "Song", "", "", new byte[16 * 1024 + 1]);
        assertThrows(java.io.IOException.class, () -> store.publish(ACCOUNT, "PLone", 2,
                new AndroidAutoPlaylistChildren.Page("PLone", List.of(huge), ""), true));
        assertEquals(2, store.read(ACCOUNT, "PLone").tracks().size());
    }
}
