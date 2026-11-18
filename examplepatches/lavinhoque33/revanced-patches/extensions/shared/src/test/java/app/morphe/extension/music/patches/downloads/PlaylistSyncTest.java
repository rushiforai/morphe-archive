/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.function.UnaryOperator;

public class PlaylistSyncTest {
    private static final String PLAYLIST = "PLtest";
    private static final String FIRST = "firstSongId";
    private static final String SECOND = "secondTrack";
    private static final String THIRD = "thirdSongId";
    private static final String UNAVAILABLE = PlaylistPage.UNAVAILABLE;

    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void commitsNativeContinuationsInOrderWithDuplicatesAndUnavailableRows() throws Exception {
        byte[] initial = firstPage(PLAYLIST, "next", row(FIRST), unavailable());
        byte[] later = continuation(null, row(SECOND), row(FIRST));
        var snapshot = PlaylistSyncPage.fetch(PLAYLIST, token -> token == null ? initial : later);
        assertEquals(List.of(FIRST, UNAVAILABLE, SECOND, FIRST), snapshot.tracks());
        byte[] renderer = snapshot.browseBytes();
        assertTrue(PlaylistSyncPage.matchesSavedPrefix(PLAYLIST, renderer, snapshot.tracks()));
        assertFalse(PlaylistSyncPage.matchesSavedPrefix(PLAYLIST, renderer, List.of(FIRST, UNAVAILABLE)));
        assertFalse(OfflineBrowsePagesLogic.isContinuation(renderer));
        assertEquals(4, OfflineBrowsePagesLogic.frameworkUpdatesSize(renderer));
    }

    @Test public void rejectsEmptyForeignTruncatedAndRepeatedPages() {
        byte[] initial = firstPage(PLAYLIST, "next", row(FIRST));
        byte[] later = continuation(null, row(SECOND));
        assertThrows(IOException.class, () -> PlaylistSyncPage.fetch(PLAYLIST, token -> firstPage("PLother", null)));
        assertThrows(IOException.class, () -> PlaylistSyncPage.fetch(PLAYLIST, token -> firstPage(PLAYLIST, null)));
        assertThrows(IOException.class, () -> PlaylistSyncPage.fetch(PLAYLIST, token ->
                token == null ? initial : Arrays.copyOf(later, later.length - 1)));
        assertThrows(IOException.class, () -> PlaylistSyncPage.fetch(PLAYLIST, token ->
                token == null ? initial : continuation("next", row(SECOND))));
        assertThrows(IOException.class, () -> PlaylistSyncPage.fetch(PLAYLIST, token ->
                token == null ? initial : firstPage(PLAYLIST, null, row(SECOND))));
    }

    @Test public void staleOnlineRendererDoesNotMatchSavedQueue() {
        byte[] original = firstPage(PLAYLIST, "next", row(FIRST));
        assertTrue(PlaylistSyncPage.matchesSavedPrefix(PLAYLIST, original, List.of(FIRST, SECOND)));
        byte[] changed = firstPage(PLAYLIST, null, row(THIRD), row(FIRST));
        assertFalse(PlaylistSyncPage.matchesSavedPrefix(PLAYLIST, changed, List.of(FIRST, SECOND)));
    }

    @Test public void onlyNewIdsCanTriggerTransfersAndAliasesReuseAnOwnedCopy() {
        List<String> previous = List.of(FIRST, UNAVAILABLE, SECOND);
        assertEquals(Set.of(), PlaylistSyncPlan.additions(previous, List.of(SECOND, FIRST, FIRST)));
        assertEquals(Set.of(THIRD), PlaylistSyncPlan.additions(previous, List.of(THIRD, THIRD, UNAVAILABLE, FIRST)));
        assertEquals(SECOND, OfflineCopyStore.copyId(THIRD, Set.of(SECOND), Map.of(THIRD, SECOND)));
        assertEquals(THIRD, OfflineCopyStore.copyId(THIRD, Set.of(SECOND, THIRD), Map.of(THIRD, SECOND)));
    }

    @Test public void savedTapUsesTheSelectedOccurrenceAfterUnavailableRows() {
        List<String> full = List.of(FIRST, UNAVAILABLE, SECOND, THIRD);
        List<OfflineWatchNext.Item> queue = List.of(item(FIRST), item(SECOND), item(FIRST));
        UnaryOperator<String> aliases = id -> THIRD.equals(id) ? FIRST : id;
        assertEquals(2, PlaylistSyncPlan.readyIndex(full, queue, FIRST, 3, aliases));
        assertEquals(1, PlaylistSyncPlan.readyIndex(full, queue, SECOND, 2, aliases));
        assertEquals(0, PlaylistSyncPlan.readyIndex(full, queue, FIRST, 2, aliases));
    }

    @Test public void previousRendererAndQueueSurviveCancellationAndColdReload() throws Exception {
        File manifest = temporary.newFile("sources.json");
        OfflineSourceStore store = new OfflineSourceStore(manifest);
        store.remember(PLAYLIST, null, List.of(FIRST), 1);
        byte[] first = firstPage(PLAYLIST, null, row(FIRST));
        assertTrue(store.replacePlaylist(store.get(PLAYLIST), List.of(FIRST), store.stageBrowsePage(first),
                2, () -> true));
        File staged = store.stageBrowsePage(firstPage(PLAYLIST, null, row(SECOND), row(FIRST)));
        assertFalse(store.replacePlaylist(store.get(PLAYLIST), List.of(SECOND, FIRST), staged, 3, () -> false));

        OfflineSourceStore reloaded = new OfflineSourceStore(manifest);
        reloaded.ensureLoaded();
        assertEquals(List.of(FIRST), reloaded.get(PLAYLIST).videoIds());
        assertArrayEquals(first, reloaded.readBrowsePage(PLAYLIST));
        assertFalse(staged.exists());
    }

    @Test public void removedOrReplacedSourceCannotBeResurrectedByOldWork() throws Exception {
        OfflineSourceStore store = new OfflineSourceStore(temporary.newFile("sources.json"));
        store.remember(PLAYLIST, null, List.of(FIRST), 1);
        var previous = store.get(PLAYLIST);
        File staged = store.stageBrowsePage(firstPage(PLAYLIST, null, row(SECOND)));
        store.remove(PLAYLIST);
        assertFalse(store.replacePlaylist(previous, List.of(SECOND), staged, 3, () -> true));
        assertNull(store.get(PLAYLIST));

        store.remember(PLAYLIST, null, List.of(THIRD), 4);
        assertFalse(store.replacePlaylist(previous, List.of(SECOND), staged, 5, () -> true));
        assertEquals(List.of(THIRD), store.get(PLAYLIST).videoIds());
        store.clear();
        assertFalse(staged.exists());
    }

    @Test public void explicitRemovalHonorsSharedPendingAndIndividualOwnership() {
        var sources = Map.of(PLAYLIST, List.of(FIRST, SECOND, THIRD), "pending", List.of(FIRST));
        var removal = CopyOwnership.removing(PLAYLIST, sources, Set.of(SECOND), Set.of(FIRST, SECOND, THIRD));
        assertEquals(List.of(THIRD), removal.deleteCopies());
        assertEquals(List.of(SECOND), removal.deleteVideos());
        assertEquals(List.of(FIRST, SECOND), removal.kept());
    }

    @Test public void onlyValidatedUnmeteredInternetWifiIsEligible() {
        assertTrue(PlaylistSyncPlan.wifiEligible(true, true, true, true));
        assertFalse(PlaylistSyncPlan.wifiEligible(false, true, true, true));
        assertFalse(PlaylistSyncPlan.wifiEligible(true, false, true, true));
        assertFalse(PlaylistSyncPlan.wifiEligible(true, true, false, true));
        assertFalse(PlaylistSyncPlan.wifiEligible(true, true, true, false));
    }

    private static OfflineWatchNext.Item item(String id) {
        return new OfflineWatchNext.Item(id, "Song", "Artist", "", 1000, null);
    }

    private static byte[] firstPage(String id, String token, byte[]... rows) {
        byte[] section = wrap(49_399_797, wrap(1, wrap(175_617_300, shelf(id, token, rows))));
        byte[] contents = wrap(58_173_949, wrap(1, wrap(58_174_010, wrap(4, section))));
        return new ProtoWriter().message(9, contents).message(777, new byte[]{8, 1}).toByteArray();
    }

    private static byte[] continuation(String token, byte[]... rows) {
        return new ProtoWriter().message(10, wrap(175_617_300, shelf(null, token, rows)))
                .message(777, new byte[]{16, 1}).toByteArray();
    }

    private static byte[] shelf(String id, String token, byte[]... rows) {
        ProtoWriter shelf = new ProtoWriter();
        if (id != null) shelf.string(1, id);
        for (byte[] row : rows) shelf.message(3, row);
        if (token != null) shelf.message(10, wrap(52_047_593, new ProtoWriter().string(1, token).toByteArray()));
        return shelf.toByteArray();
    }

    private static byte[] row(String id) {
        return wrap(161_429_595, wrap(5, OnlineWatchCommand.build(id, PLAYLIST, 0)));
    }

    private static byte[] unavailable() {
        return wrap(161_429_595, new ProtoWriter().message(3, new byte[0])
                .message(12, new ProtoWriter().string(1, "set video ID").toByteArray()).toByteArray());
    }

    private static byte[] wrap(int field, byte[] bytes) {
        return new ProtoWriter().message(field, bytes).toByteArray();
    }
}
