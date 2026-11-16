/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-14
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.androidauto;

import org.junit.Test;

import java.util.List;

import static app.morphe.extension.music.patches.androidauto.AndroidAutoPlaylists.*;
import static org.junit.Assert.*;

public class AndroidAutoPlaylistsTest {
    private static final String ACCOUNT = "a".repeat(64);
    private static final Labels LABELS = new Labels("Album", "Unavailable offline",
            "Partially downloaded · %1$d of %2$d tracks available offline", "Available offline");

    private static AndroidAutoPlaylistCatalog.Entry entry(String id) {
        return new AndroidAutoPlaylistCatalog.Entry(id, "Catalog " + id, "Owner", "https://art/" + id);
    }

    private static Source source(String id, String canonical, int total, int ready, boolean album) {
        return new Source(id, canonical, "Download " + id, total, ready, album, "cover");
    }

    @Test public void catalogOrderWinsAndMissingSourcesAppendInSourceOrderWithSongsLast() {
        List<Row> rows = merge(List.of(entry("VLPLone"), entry("PLtwo"), entry("PLone")), List.of(
                source("songs", "songs", 2, 2, false), source("PLthree", "PLthree", 4, 4, false),
                source("PLone", "PLone", 10, 3, false), source("OLAKalbum", "OLAKalbum", 8, 8, true)), false);
        assertEquals(List.of("PLone", "PLtwo", "PLthree", "OLAKalbum", "songs"),
                rows.stream().map(row -> row.entry().id()).toList());
        assertEquals("Catalog VLPLone", rows.get(0).entry().title());
        assertEquals("https://art/VLPLone", rows.get(0).entry().artwork());
        assertEquals(Availability.PARTIAL, rows.get(0).availability());
        assertEquals(Availability.UNAVAILABLE, rows.get(1).availability());
        assertEquals(Availability.READY, rows.get(2).availability());
    }

    @Test public void mappedAlbumPagesAndAudioPlaylistsDeduplicateWithoutDroppingAlbumLabel() {
        List<Row> rows = merge(List.of(entry("VLOLAK5uy_album")), List.of(
                source("MPREb_page", "OLAK5uy_album", 6, 5, true),
                source("OLAK5uy_album", "OLAK5uy_album", 6, 6, true)), false);
        assertEquals(1, rows.size());
        assertEquals("OLAK5uy_album", rows.get(0).source().id());
        assertEquals("Owner · Album · Available offline", subtitle(rows.get(0), LABELS));
    }

    @Test public void allCatalogRowsRemainOfflineAndSubtitlesDistinguishPartialUnavailableAndReady() {
        List<Row> rows = merge(List.of(entry("PLempty"), entry("PLpartial"), entry("PLready")), List.of(
                source("PLpartial", "PLpartial", 7, 2, false), source("PLready", "PLready", 3, 3, false)), false);
        assertEquals(3, rows.size());
        assertEquals("Owner · Unavailable offline", subtitle(rows.get(0), LABELS));
        assertEquals("Owner · Partially downloaded · 2 of 7 tracks available offline", subtitle(rows.get(1), LABELS));
        assertEquals("Owner · Available offline", subtitle(rows.get(2), LABELS));
        assertEquals("Owner", subtitle(merge(List.of(entry("PLempty")), List.of(), true).get(0), LABELS));
    }

    @Test public void missingAndGenuinelyEmptyCatalogsDoNotInventPlaylists() {
        assertTrue(merge(List.of(), List.of(), false).isEmpty());
        List<Row> rows = merge(List.of(), List.of(source("PLpending", "PLpending", 8, 0, false),
                source("songs", "songs", 2, 2, false), source("songs", "songs", 2, 2, false)), false);
        assertEquals(1, rows.size());
        assertEquals("songs", rows.get(0).entry().id());
    }

    @Test public void cachedCardRoutesAtTapTimeWithoutLosingUncachedOnlineTracks() {
        String card = mediaId(ACCOUNT, "VLPLone");
        String id = parseId(card, ACCOUNT);
        assertEquals("PLone", id);
        assertEquals(AndroidAutoPlaylistChildren.Route.ONLINE_PLAYLIST,
                AndroidAutoPlaylistChildren.route(true, true, "", -1));
        assertEquals(AndroidAutoPlaylistChildren.Route.LOCAL_QUEUE,
                AndroidAutoPlaylistChildren.route(false, true, "", 0));
        assertEquals(AndroidAutoPlaylistChildren.Route.UNAVAILABLE,
                AndroidAutoPlaylistChildren.route(false, true, "", -1));
        assertNull(parseId(card, "b".repeat(64)));
        assertNull(parseId(card + "/extra", ACCOUNT));
        assertEquals(card, mediaId(ACCOUNT, "PLone"));
    }

    @Test public void downloadedSongsKeepsItsSortedSourceQueueAndAlbumsKeepTheirCanonicalNativeId() {
        var songs = source("songs", "songs", 3, 3, false);
        var album = source("MPREb_album", "OLAK5uy_album", 4, 4, true);
        var rows = merge(List.of(), List.of(songs, album), false);
        assertEquals(List.of("OLAK5uy_album", "songs"), rows.stream().map(row -> row.entry().id()).toList());
        assertEquals("MPREb_album", rows.get(0).source().id());
        assertEquals(2, AndroidAutoPlaylistChildren.readyIndex(List.of("one", "two", "three"),
                List.of("one", "two", "three"), "three", 2));
    }

    @Test public void streamOnlyLibraryNeverCreatesDeviceDownloadsAndMixedDownloadsKeepSeparateDestinations() {
        List<Row> streams = merge(List.of(), List.of(source("PLstream", "PLstream", 3, 3, false)), false);
        assertEquals(1, streams.size());
        assertFalse(showDeviceDownloads(true, 0));
        assertTrue(showDeviceDownloads(true, 1));
        assertFalse(showDeviceDownloads(false, 1));
        assertEquals(List.of("PLstream"), streams.stream().map(row -> row.entry().id()).toList());
    }
}
