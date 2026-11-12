/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-08.
 * Modified by lavinhoque33, 2026-11-10
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.patches.downloads.OfflineLibraryLogic.SourceRow;
import static org.junit.Assert.*;

import com.google.protobuf.CodedInputStream;

import org.junit.Test;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OfflineLibraryLogicTest {
    private static OfflineCopyMetadata metadata(String id, String title) {
        return new OfflineCopyMetadata(id, title, "Artist " + id, null, 185_000, null, 1, "online");
    }

    private static OfflineSourceStore.Source source(String id, String title, String... videoIds) {
        return new OfflineSourceStore.Source(id, title, "", "", List.of(videoIds), 1);
    }

    private static OfflineSourceStore.Track track(String id, boolean stored) {
        return new OfflineSourceStore.Track(id, stored ? metadata(id, "Title " + id) : null);
    }

    // region rows

    @Test public void sourceRowsKeepTheOrderCountSongsAndTakeTheCoverOfTheFirstStoredSong() {
        List<SourceRow> rows = OfflineLibraryLogic.sourceRows(
                List.of(source("PLb", "B", "x", "y"), source("OLAK5uy_a", "A", "p", "q", "r")),
                Map.of("PLb", List.of(track("x", false), track("y", true)),
                        "OLAK5uy_a", List.of(track("p", true), track("q", true), track("r", false)))::get);
        assertEquals(List.of(new SourceRow("PLb", "B", 2, 1, "y", null),
                new SourceRow("OLAK5uy_a", "A", 3, 2, "p", null)), rows);
    }

    @Test public void aSourceKeepsItsRecordedCoverAndASongItsRecordedUrl() {
        OfflineSourceStore.Source recorded =
                new OfflineSourceStore.Source("PLa", "A", "", "https://img/a", List.of("x"), 1);
        List<SourceRow> sources = OfflineLibraryLogic.sourceRows(List.of(recorded),
                Map.of("PLa", List.of(track("x", true)))::get);
        assertEquals("https://img/a", sources.get(0).thumbnailUrl());
    }

    @Test public void aSourceWithoutAnySongIsLeftOutAndOneWithoutStoredDataHasNoCover() {
        List<SourceRow> rows = OfflineLibraryLogic.sourceRows(
                List.of(source("PLa", "A", "x"), source("PLb", "B", "y")),
                Map.of("PLa", List.<OfflineSourceStore.Track>of(), "PLb", List.of(track("y", false)))::get);
        assertEquals(List.of(new SourceRow("PLb", "B", 1, 0, null, null)), rows);
    }

    @Test public void noPlaylistIsOneRowWithTheCoverOfItsFirstSong() {
        List<OfflineWatchNext.Item> songs = List.of(new OfflineWatchNext.Item("a", "A", "", "", 1000, null),
                new OfflineWatchNext.Item("b", "B", "", "", 1000, null));

        assertEquals(new SourceRow("songs", "No Playlist", 2, 2, "a", null),
                OfflineLibraryLogic.noPlaylistRow("songs", "No Playlist", songs));
    }

    @Test public void noPlaylistHasNoRowWithoutSongs() {
        assertNull(OfflineLibraryLogic.noPlaylistRow("songs", "No Playlist", List.of()));
    }

    // endregion

    // region text and bytes

    @Test public void durationTextHasMinutesAndHours() {
        assertEquals("", OfflineLibraryLogic.durationText(0));
        assertEquals("0:05", OfflineLibraryLogic.durationText(5_400));
        assertEquals("3:07", OfflineLibraryLogic.durationText(187_000));
        assertEquals("10:00", OfflineLibraryLogic.durationText(600_000));
        assertEquals("1:02:03", OfflineLibraryLogic.durationText(3_723_000));
    }

    @Test public void subtitleJoinsWhateverIsKnown() {
        assertEquals("Artist · 3:07", OfflineLibraryLogic.songSubtitle("Artist", 187_000));
        assertEquals("Artist", OfflineLibraryLogic.songSubtitle("Artist", 0));
        assertEquals("3:07", OfflineLibraryLogic.songSubtitle("", 187_000));
        assertEquals("", OfflineLibraryLogic.songSubtitle("", 0));
    }

    @Test public void browseCommandIsTheBrowseEndpointWithThePageInField2() throws Exception {
        byte[] bytes = OfflineLibraryLogic.browseCommand(OfflineLibraryLogic.DOWNLOADS_BROWSE_ID);
        CodedInputStream command = CodedInputStream.newInstance(bytes);
        assertEquals(48_687_626 << 3 | 2, command.readTag());
        CodedInputStream endpoint = CodedInputStream.newInstance(command.readByteArray());
        assertTrue(command.isAtEnd());
        assertEquals(2 << 3 | 2, endpoint.readTag());
        assertEquals("FEmusic_offline",
                new String(endpoint.readByteArray(), StandardCharsets.UTF_8));
        assertTrue(endpoint.isAtEnd());
    }

    // endregion
}
