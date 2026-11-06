/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-01.
 */
package app.morphe.extension.music.patches.androidauto;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoDownloadsData.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertFalse;

import org.junit.Test;

import java.util.List;
import java.nio.charset.StandardCharsets;

public class AndroidAutoDownloadsDataTest {
    @Test
    public void rootFallbackOnlyHandlesAnUnansweredEmptyRoot() {
        assertTrue(needsRootFallback(true, 0, false));
        assertFalse(needsRootFallback(true, 2, false));
        assertFalse(needsRootFallback(false, 0, false));
        assertFalse(needsRootFallback(true, 0, true));
        assertFalse(needsRootFallback(true, 1, true));
    }

    @Test
    public void localPlayIdsCarryTheWholeQueueAndSelectedIndex() {
        var request = new PlayRequest(12, 3, 8);
        assertEquals(request, parsePlayId(playId(12, 3, 8)));
        assertEquals("ytm://music.youtube.com/sideloaded/internal/playlists/12", playlistUri(12));
        for (String invalid : new String[]{PREFIX + "play/12/8/8", PREFIX + "play/12/-1/8",
                PREFIX + "play/12/0/0", PREFIX + "play/12/0/8/extra", PREFIX + "play/12//8",
                PREFIX + "play/12/2147483648/9", ROOT_ID}) {
            assertNull(parsePlayId(invalid));
        }
    }

    @Test
    public void sideloadedCommandMatchesTheStockWireLayoutWithoutShuffle() {
        byte[] expected = ("\252\276\350\355\004\074\022\070"
                + "ytm://music.youtube.com/sideloaded/internal/playlists/12"
                + "\030\003").getBytes(StandardCharsets.ISO_8859_1);
        assertArrayEquals(expected, playCommand(new PlayRequest(12, 3, 8)));
    }

    @Test
    public void playlistIdsRoundTripWithoutAcceptingOtherRoutes() {
        for (long id : new long[]{0, 1, 93, Long.MAX_VALUE}) {
            assertEquals(id, parsePlaylistId(playlistId(id)));
        }
        for (String invalid : new String[]{ROOT_ID, PREFIX + "playlist/-1", PREFIX + "playlist/",
                PREFIX + "playlist/1/2", PREFIX + "playlist/+1", PREFIX + "playlist/9223372036854775808",
                "https://example.org/playlist/1"}) {
            assertEquals(-1, parsePlaylistId(invalid));
        }
        assertEquals(-1, parsePlaylistId(null));
    }

    @Test(expected = IllegalArgumentException.class)
    public void negativePlaylistIdsCannotBePublished() {
        playlistId(-1);
    }

    @Test
    public void queueOrderUsesNativePositionNotMediaIdOrInputOrder() {
        var later = new Track(2, 41, "Later", "Artist", "Album", 123000, 100, 2000);
        var first = new Track(700, 0, "First", "Artist", "Album", 456000, 100, 2000);
        var middle = new Track(1, 9, "Middle", "Artist", "Album", 789000, 100, 2000);
        var playlist = playlist(3, "PLdownload", "Ordered", "Not in a playlist", List.of(later, first, middle));
        assertEquals(List.of(first, middle, later), playlist.tracks());
        assertEquals("Ordered", playlist.title());
    }

    @Test
    public void singlesBucketUsesItsLocalizedTitleAndKeepsItsNativeOrder() {
        var newest = new Track(90, 0, "New", "", "", 1000, 100, 2000);
        var oldest = new Track(10, 1, "Old", "", "", 1000, 100, 2000);
        var bucket = playlist(12, UNSORTED_KEY, "Stale language", "Not in a playlist", List.of(oldest, newest));
        assertEquals("Not in a playlist", bucket.title());
        assertEquals(List.of(newest, oldest), bucket.tracks());
        assertEquals(List.of(bucket), nonemptyPlaylists(List.of(bucket)));
    }

    @Test
    public void emptyPlaylistsIncludingEmptySinglesAreHidden() {
        var empty = playlist(1, "PLempty", "Empty", "Not in a playlist", List.of());
        var singles = playlist(2, UNSORTED_KEY, "Old title", "Not in a playlist", List.of());
        var song = new Track(5, 0, "Song", "Artist", "Album", 1000, 100, 2000);
        var populated = playlist(3, "PLsaved", "Saved", "Not in a playlist", List.of(song));
        assertTrue(nonemptyPlaylists(List.of(empty, singles)).isEmpty());
        assertEquals(List.of(populated), nonemptyPlaylists(List.of(empty, populated, singles)));
    }
}
