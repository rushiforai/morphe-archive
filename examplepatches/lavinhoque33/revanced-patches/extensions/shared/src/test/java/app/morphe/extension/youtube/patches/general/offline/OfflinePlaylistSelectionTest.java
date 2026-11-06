/*
 * Copyright (C) 2026 lavinhoque33
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-05.
 */
package app.morphe.extension.youtube.patches.general.offline;

import org.junit.Test;
import java.util.List;
import java.util.Set;
import static org.junit.Assert.*;

public class OfflinePlaylistSelectionTest {
    private static List<OfflinePlaylistSelection.Item> items() {
        return OfflinePlaylistSelection.from(List.of(
                new OfflinePlaylist.Entry("abcdefghijk", "First", 123_000),
                new OfflinePlaylist.Entry("lmnopqrstuv", "Second", 456_000),
                new OfflinePlaylist.Entry("0123456789_", "Third", 0)),
                Set.of("lmnopqrstuv", "abcdefghijk_audio")::contains);
    }

    @Test public void alreadyDownloadedVideosStartUncheckedButKeepTheirPlaylistIndex() {
        OfflinePlaylistSelection model = new OfflinePlaylistSelection(items());
        assertEquals(2, model.selectedCount());
        assertEquals(2, model.get(1).index());
        assertFalse(model.get(1).selected());
        assertTrue(model.get(1).alreadyDownloaded());
        assertEquals(123_000, model.get(0).lengthMs());
    }

    @Test public void allNoneAndIndividualSelectionKeepOriginalOrder() {
        OfflinePlaylistSelection model = new OfflinePlaylistSelection(items());
        model.selectAll(false);
        assertEquals(0, model.selectedCount());
        assertTrue(model.selectedItems().isEmpty());
        model.select(2, true);
        model.select(0, true);
        assertEquals(List.of("abcdefghijk", "0123456789_"), model.selectedItems().stream()
                .map(OfflinePlaylistSelection.Item::videoId).toList());
        model.selectAll(true);
        assertEquals(3, model.selectedCount());
    }

    @Test public void audioAndVideoKeysAndExistingStatusAreIndependent() {
        OfflinePlaylistSelection model = new OfflinePlaylistSelection(items());
        assertEquals("abcdefghijk", model.get(0).key());
        assertFalse(model.get(0).alreadyDownloaded());
        model.edit(0, true, 720);
        assertEquals("abcdefghijk_audio", model.get(0).key());
        assertTrue(model.get(0).alreadyDownloaded());
        model.edit(1, true, Integer.MAX_VALUE);
        assertFalse(model.get(1).alreadyDownloaded());
        assertFalse(model.get(1).selected());
        model.select(1, true);
        assertTrue(model.selectedItems().get(1).audioOnly());
    }

    @Test public void globalCapIsAnUpperBoundWithoutLosingIndividualChoices() {
        OfflinePlaylistSelection model = new OfflinePlaylistSelection(items());
        model.edit(0, false, 720);
        model.heightLimit = 480;
        List<OfflinePlaylistSelection.Item> snapshot = model.selectedItems();
        assertEquals(480, snapshot.get(0).heightLimit());
        model.heightLimit = 1080;
        assertEquals(720, model.selectedItems().get(0).heightLimit());
        assertEquals(1080, model.selectedItems().get(1).heightLimit());
        model.edit(0, true, 360);
        assertFalse(snapshot.get(0).audioOnly());
        assertEquals(480, snapshot.get(0).heightLimit());
    }
}
