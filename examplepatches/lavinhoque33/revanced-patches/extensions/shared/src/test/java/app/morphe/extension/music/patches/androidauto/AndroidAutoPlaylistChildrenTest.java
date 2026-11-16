/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.extension.music.patches.androidauto;

import org.junit.Test;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoPlaylistChildren.*;
import static org.junit.Assert.*;

public class AndroidAutoPlaylistChildrenTest {
    private static final String ACCOUNT = "a".repeat(64);
    private static final Track FIRST = new Track("first", "First song", "Artist A", "https://art/first");
    private static final Track MIDDLE = new Track("middle", "Middle song", "Artist B", "https://art/middle");
    private static final Track LAST = new Track("last", "Last song", "Artist C", "https://art/last");
    private static final Page PAGE = new Page("PLone", List.of(FIRST, MIDDLE, LAST), "");

    @Test public void playAllPrecedesTracksWithoutFilteringUnavailablePositions() {
        List<Row> rows = rows(PAGE, false, Set.of("first", "last"), Map.of());
        assertEquals(4, rows.size());
        assertTrue(rows.get(0).playAll());
        assertFalse(rows.get(0).unavailable());
        assertEquals(List.of(FIRST, MIDDLE, LAST), rows.subList(1, 4).stream().map(Row::track).toList());
        assertEquals(List.of(0, 1, 2), rows.subList(1, 4).stream().map(Row::index).toList());
        assertFalse(rows.get(1).unavailable());
        assertTrue(rows.get(2).unavailable());
        assertFalse(rows.get(3).unavailable());
    }

    @Test public void onlineTracksStayAvailableWithoutCopiesAndRetainArtistAndArtwork() {
        var rows = rows(PAGE, true, Set.of(), Map.of());
        assertEquals(4, rows.size());
        assertFalse(rows.get(2).unavailable());
        assertEquals("Artist B", rows.get(2).track().artist());
        assertEquals("https://art/middle", rows.get(2).track().artwork());
        var deleted = rows(new Page("PLone", List.of(new Track("", "Deleted", "", "")), ""),
                true, Set.of(), Map.of());
        assertTrue(deleted.get(1).unavailable());
        assertEquals(Route.UNAVAILABLE, route(true, false, "", -1));
    }

    @Test public void catalogOnlyWithoutMetadataHasOneInertUnavailableRowOffline() {
        Page unknown = new Page("PLunknown", List.of(), "");
        var offline = rows(unknown, false, Set.of(), Map.of());
        assertEquals(1, offline.size());
        assertFalse(offline.get(0).playAll());
        assertTrue(offline.get(0).unavailable());
        assertNull(offline.get(0).track());
        var onlineFailure = rows(unknown, true, Set.of(), Map.of());
        assertEquals(2, onlineFailure.size());
        assertTrue(onlineFailure.get(0).playAll());
    }

    @Test public void savedCatalogOnlyPageShowsAllTracksUnavailableWithoutPretendingThereAreCopies() {
        var offline = rows(PAGE, false, Set.of(), Map.of());
        assertEquals(4, offline.size());
        for (Row row : offline) assertTrue(row.unavailable());
        assertEquals(Route.UNAVAILABLE, route(false, true, "", -1));
        assertEquals(Route.UNAVAILABLE, route(false, false, "middle", -1));
    }

    @Test public void videoAliasUsesTheCanonicalStoredSongWithoutChangingTheDisplayedRow() {
        var page = new Page("PLone", List.of(new Track("video", "Video title", "Artist", "")), "");
        var rows = rows(page, false, Set.of("song"), Map.of("video", "song"));
        assertFalse(rows.get(1).unavailable());
        assertEquals("video", rows.get(1).track().videoId());
    }

    @Test public void cachedTrackIdentityRoutesOnlineAndOfflineAtSelectionTime() {
        String id = trackId(ACCOUNT, "PLone", "last", 2);
        var selected = parseTrack(id, ACCOUNT);
        assertEquals(new Selection("PLone", "last", 2), selected);
        int ready = readyIndex(List.of("first", "middle", "last"), List.of("first", "last"),
                selected.videoId(), selected.index());
        assertEquals(1, ready);
        assertEquals(Route.ONLINE_TRACK, route(true, false, selected.videoId(), ready));
        assertEquals(Route.LOCAL_QUEUE, route(false, false, selected.videoId(), ready));
        assertEquals(Route.UNAVAILABLE, route(false, false, selected.videoId(), -1));
        assertEquals(Route.ONLINE_TRACK, route(true, false, selected.videoId(), -1));
        assertEquals(id, trackId(ACCOUNT, "PLone", "last", 2));
        assertNull(parseTrack(id, "b".repeat(64)));
    }

    @Test public void playAllRemainsAFullStockPlaylistOnlineAndReadyQueueOffline() {
        assertEquals(Route.ONLINE_PLAYLIST, route(true, true, "", -1));
        assertEquals(Route.LOCAL_QUEUE, route(false, true, "", 0));
        assertEquals(Route.UNAVAILABLE, route(false, true, "", -1));
        String all = AndroidAutoPlaylists.mediaId(ACCOUNT, "PLone");
        assertEquals("PLone", AndroidAutoPlaylists.parseId(all, ACCOUNT));
        assertNull(parseTrack(all, ACCOUNT));
        assertNull(parseList(all, ACCOUNT));
    }

    @Test public void duplicateTracksRetainTheirOccurrenceAfterMissingCopiesAreRemovedFromTheQueue() {
        var full = List.of("missing", "repeat", "middle", "repeat", "last");
        var ready = List.of("repeat", "middle", "repeat", "last");
        assertEquals(2, readyIndex(full, ready, "repeat", 3));
        assertEquals(0, readyIndex(full, ready, "repeat", 1));
        assertEquals(-1, readyIndex(full, ready, "missing", 0));
        Track repeated = new Track("first", "Repeated first", "", "", new byte[]{1});
        assertSame(repeated, selectedTrack(List.of(FIRST, MIDDLE, repeated), "first", 2));
        assertSame(MIDDLE, selectedTrack(PAGE.tracks(), "middle", 99));
        assertNull(selectedTrack(PAGE.tracks(), "unknown", 0));
    }

    @Test public void failedTimedOutAndPartialFetchesUseLocalTracksNotTheNetworkPrefix() {
        Page partial = new Page("PLone", List.of(FIRST), "more");
        assertSame(PAGE, choose(partial, false, PAGE));
        assertSame(PAGE, choose(null, false, PAGE));
        Page complete = new Page("PLone", List.of(MIDDLE, LAST), "");
        assertSame(complete, choose(complete, true, PAGE));
        assertEquals(List.of(MIDDLE, LAST), choose(complete, true, PAGE).tracks());
    }

    @Test public void downloadedSongsUsesTheSamePlayAllAndSongOrder() {
        var rows = rows(new Page("", List.of(MIDDLE, FIRST, LAST), ""), true,
                Set.of("first", "middle", "last"), Map.of());
        assertTrue(rows.get(0).playAll());
        assertEquals(List.of(MIDDLE, FIRST, LAST), rows.subList(1, 4).stream().map(Row::track).toList());
        assertEquals(new Selection("songs", "first", 1), parseTrack(trackId(ACCOUNT, "songs", "first", 1), ACCOUNT));
    }

    @Test public void malformedAndDeviceFileIdsNeverBecomePlaylistChildRequests() {
        String list = listId(ACCOUNT, "PLone");
        assertEquals("PLone", parseList(list, ACCOUNT));
        assertNull(parseList(list + "/extra", ACCOUNT));
        assertNull(parseList(list, "b".repeat(64)));
        String prefix = TRACK_PREFIX + ACCOUNT + "/";
        for (String suffix : List.of("", "songs", "songs/first", "songs/first/-1", "songs/first/x",
                "songs/first/9999999", "songs/first/1/2", "songs/a%2Fb/1", "/first/1")) {
            assertNull(suffix, parseTrack(prefix + suffix, ACCOUNT));
        }
        assertNull(parseTrack(AndroidAutoDownloadsData.playId(7, 0, 1), ACCOUNT));
        assertNull(parseList(AndroidAutoDownloadsData.playlistId(7), ACCOUNT));
        assertEquals(new Selection("PLone", "", 0), parseTrack(trackId(ACCOUNT, "PLone", "", 0), ACCOUNT));
        assertThrows(IllegalArgumentException.class, () -> trackId(ACCOUNT, "songs", "first", -1));
        assertThrows(IllegalArgumentException.class, () -> trackId(ACCOUNT, "songs", "a/b", 1));
        assertThrows(IllegalArgumentException.class, () -> listId(ACCOUNT, "a/b"));
    }
}
