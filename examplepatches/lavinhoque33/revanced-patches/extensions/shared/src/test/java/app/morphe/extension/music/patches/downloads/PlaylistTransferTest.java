/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-19.
 * Written by lavinhoque33, 2026-11-18.
 */
package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertArrayEquals;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.UnaryOperator;

import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.PlayerResponse;
import app.morphe.extension.shared.innertube.PlayerResponseOuterClass.VideoDetails;

public class PlaylistTransferTest {
    private static final String SOURCE = "OLAK5uy_test";
    private static final String FIRST = "firstSongId";
    private static final String SECOND = "secondTrack";
    private static final String THIRD = "thirdSongId";
    private static final String ALIAS = "alternateId";
    private static final String GHOST = PlaylistPage.UNAVAILABLE;
    private static final byte[] AUDIO = {0x1a, 0x45, (byte) 0xdf, (byte) 0xa3, 1, 2, 3, 4};

    @Rule public TemporaryFolder temporary = new TemporaryFolder();

    @Test public void transferProgressCountsReadyPositionsWithoutDownloadingDuplicateCopies() {
        var counter = new PlaylistTransfer.ProgressCounter(List.of(FIRST, SECOND, GHOST, ALIAS, SECOND),
                id -> ALIAS.equals(id) ? FIRST : id, FIRST::equals);
        assertEquals(new PlaylistTransfer.Progress(2, 4), counter.snapshot());

        counter.saved(SECOND);
        assertEquals(new PlaylistTransfer.Progress(4, 4), counter.snapshot());
        counter.saved(SECOND);
        assertEquals(new PlaylistTransfer.Progress(4, 4), counter.snapshot());
    }

    @Test public void failureDoesNotStopLaterTracksAndColdResumeFetchesOnlyMissingMedia() throws Exception {
        var before = new Copies();
        before.sources.remember(SOURCE, null, List.of(FIRST, SECOND, GHOST, ALIAS, THIRD, SECOND), 1, true);
        List<String> attempts = new ArrayList<>();
        List<String> failed = new ArrayList<>();
        // A separately saved song already has bytes, but lacks its older offline response.
        before.saveAudio(FIRST, true);
        assertTrue(before.raw.addAlias(FIRST, ALIAS));
        var first = PlaylistTransfer.fill(before.tracks(), before.canonical(), before::ready,
                () -> true, id -> {
                    attempts.add(id);
                    return before.ensure(id, SECOND);
                }, (id, exception) -> failed.add(id));

        assertEquals(List.of(FIRST, SECOND, THIRD), attempts);
        assertEquals(List.of(SECOND), failed);
        assertEquals(new PlaylistTransfer.Outcome(1, false), first);
        assertEquals(List.of(SECOND, THIRD), before.transfers);
        assertEquals(List.of(FIRST), before.backfills);
        assertEquals(new PlaylistTransfer.Progress(3, 5), before.progress());
        assertEquals(List.of(FIRST, FIRST, THIRD), before.offlineQueue());

        // Restart the backing stores. Resume uses fresh ordered membership, not the original worker's list.
        var after = new Copies();
        assertEquals(new PlaylistTransfer.Progress(3, 5), after.progress());
        var retained = after.raw.find(THIRD, id -> null);
        assertNotNull(retained);
        after.sources.remember(SOURCE, null, List.of(THIRD, SECOND, GHOST, ALIAS, SECOND), 2, true);
        var resumed = PlaylistTransfer.fill(after.tracks(), after.canonical(), after::ready,
                () -> true, id -> after.ensure(id, null), (id, exception) -> fail(exception.toString()));

        assertEquals(new PlaylistTransfer.Outcome(1, true), resumed);
        assertEquals(List.of(SECOND), after.transfers);
        assertTrue(after.backfills.isEmpty());
        assertTrue(after.progress().complete());
        assertArrayEquals(AUDIO, Files.readAllBytes(retained.file().toPath()));
        assertEquals(retained, after.raw.find(THIRD, id -> null));
        assertEquals(List.of(THIRD, SECOND, FIRST, SECOND), after.offlineQueue());
        assertEquals(Set.of(FIRST), after.raw.individualIds());
    }

    @Test public void lossStopsBeforeStartingMoreTransfersAndZeroCopyPendingMembershipSurvivesCleanup()
            throws Exception {
        var copies = new Copies();
        copies.sources.remember(SOURCE, null, List.of(FIRST, SECOND, THIRD), 1, true);
        var online = new AtomicBoolean(true);
        var interrupted = PlaylistTransfer.fill(copies.tracks(), copies.canonical(), copies::ready, online::get,
                id -> {
                    online.set(false);
                    return copies.ensure(id, FIRST);
                }, (id, exception) -> assertEquals(FIRST, id));
        assertFalse(interrupted.allReady());
        assertEquals(List.of(FIRST), copies.transfers);
        copies.sources.retainWithCopies(copies.raw.committedIds(), Set.of(SOURCE));

        var after = new Copies();
        assertEquals(List.of(FIRST, SECOND, THIRD), after.tracks());
        assertEquals(new PlaylistTransfer.Progress(0, 3), after.progress());
        assertTrue(after.offlineQueue().isEmpty());
    }

    @Test public void interruptedWorkerPreservesItsInterruptAndDoesNotStartAnotherTrack() {
        List<String> tried = new ArrayList<>();
        try {
            var result = PlaylistTransfer.fill(List.of(FIRST, SECOND), UnaryOperator.identity(), id -> false,
                    () -> true, id -> {
                        tried.add(id);
                        throw new InterruptedException();
                    }, (id, exception) -> fail(exception.toString()));
            assertFalse(result.allReady());
            assertEquals(List.of(FIRST), tried);
            assertTrue(Thread.currentThread().isInterrupted());
        } finally {
            Thread.interrupted();
        }
    }

    private final class Copies {
        final RawAudioFiles raw = new RawAudioFiles(new File(temporary.getRoot(), "rvx_raw"));
        final OfflineCopyFiles responses = new OfflineCopyFiles(new File(temporary.getRoot(), "rvx_offline"));
        final OfflineSourceStore sources = new OfflineSourceStore(new File(temporary.getRoot(), "sources.json"));
        final List<String> transfers = new ArrayList<>();
        final List<String> backfills = new ArrayList<>();

        Copies() {
            sources.ensureLoaded();
            responses.ensureLoaded();
        }

        List<String> tracks() {
            return sources.get(SOURCE).videoIds();
        }

        UnaryOperator<String> canonical() {
            var own = raw.committedIds();
            var aliases = raw.aliases();
            return id -> OfflineCopyStore.copyId(id, own, aliases);
        }

        boolean ready(String id) {
            return raw.find(id, key -> null) != null && responses.has(id);
        }

        PlaylistTransfer.Progress progress() {
            var canonical = canonical();
            return PlaylistTransfer.progress(tracks(), id -> ready(canonical.apply(id)));
        }

        List<String> offlineQueue() {
            var tracks = OfflineSourceStore.tracksOf(sources.get(SOURCE), raw.committedIds(), responses::metadata,
                    canonical());
            return OfflineReplayLogic.itemsOfTracks(tracks).stream().map(OfflineWatchNext.Item::videoId).toList();
        }

        boolean ensure(String id, String failId) throws Exception {
            return PlaylistTransfer.prepare(id, key -> raw.find(key, ignored -> null) != null, responses::has,
                    key -> {
                        transfers.add(key);
                        if (key.equals(failId)) throw new IOException("Track failed");
                        saveAudio(key, false);
                        saveResponse(key);
                        return true;
                    }, key -> {
                        backfills.add(key);
                        try {
                            saveResponse(key);
                            return null;
                        } catch (Exception failure) {
                            return failure.toString();
                        }
                    });
        }

        private void saveAudio(String id, boolean individual) throws Exception {
            File input = temporary.newFile();
            Files.write(input.toPath(), AUDIO);
            assertTrue(raw.retain(id, input, 251, "audio/webm; codecs=\"opus\"", AUDIO.length, 123, null, individual));
        }

        private void saveResponse(String id) throws Exception {
            var metadata = new OfflineCopyMetadata(id, id, "Artist", "Album", 200_000, null, 1000, "download");
            byte[] bytes = PlayerResponse.newBuilder().setVideoDetails(VideoDetails.newBuilder().setVideoId(id))
                    .build().toByteArray();
            assertNotNull(responses.write(metadata, bytes, null));
        }
    }
}
