/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-22.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.extension.music.patches.downloads;

import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Source.CACHED_AUDIO;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Source.CACHED_VIDEO;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Source.CACHED_VIDEO_AUDIO;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Source.UNCONFIRMED;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.openFallback;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.openLocal;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.selectFormats;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.selectPlayback;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.selectPublishedFormats;
import static app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.snapshot;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import org.junit.After;
import org.junit.Test;

import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.EventPlayback;
import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.LocalFormat;
import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Playback;
import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Read;
import app.morphe.extension.music.patches.downloads.PlaybackSourceInspector.Snapshot;

public class PlaybackSourceInspectorTest {
    private static final Snapshot UNKNOWN = new Snapshot(UNCONFIRMED, UNCONFIRMED, -1, -1);
    private static final Snapshot RAW_FORMAT_ONLY = new Snapshot(UNCONFIRMED, UNCONFIRMED, 251, -1);

    private final Object coordinator = new Object();
    private final LocalFormat raw = new LocalFormat(CACHED_AUDIO, 251);
    private final LocalFormat videoAudio = new LocalFormat(CACHED_VIDEO_AUDIO, 140);
    private final LocalFormat video = new LocalFormat(CACHED_VIDEO, 134);

    @After public void stop() {
        selectPlayback(coordinator, null);
    }

    @Test public void openingAndEmptyReadsAreNotEvidence() {
        Playback playback = select("raw-first-read", raw, null);
        Read read = openLocal(playback.rvxPlaybackNonce(), raw);
        assertNotNull(read);
        assertEquals(RAW_FORMAT_ONLY, snapshot());

        read.returned(0);
        read.returned(-1);
        assertEquals(RAW_FORMAT_ONLY, snapshot());

        read.returned(42);
        Snapshot confirmed = snapshot();
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), confirmed);
        assertNull(openLocal(playback.rvxPlaybackNonce(), raw));
        read.returned(17);
        assertSame(confirmed, snapshot());
    }

    @Test public void earlyChunkForActiveSessionWaitsForItsExactSelectedFormat() {
        Playback playback = select("current-before-format", null, null);
        assertNull(openLocal("prefetch", raw));
        openLocal(playback.rvxPlaybackNonce(), raw).returned(32);
        assertEquals(UNKNOWN, snapshot());

        selectFormats(playback, raw, null, 251, -1);
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), snapshot());
    }

    @Test public void selectedAudioAndVideoAreProvedIndependentlyAndVideoHidesInSongMode() {
        Playback playback = select("video-modes", videoAudio, null);
        String nonce = playback.rvxPlaybackNonce();
        openLocal(nonce, videoAudio).returned(42);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, -1), snapshot());

        selectFormats(playback, videoAudio, video, 140, 134);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, 134), snapshot());
        openLocal(nonce, video).returned(42);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, CACHED_VIDEO, 140, 134), snapshot());

        selectFormats(playback, videoAudio, null, 140, -1);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, -1), snapshot());
        selectFormats(playback, videoAudio, video, 140, 134);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, CACHED_VIDEO, 140, 134), snapshot());
    }

    @Test public void publishedVideoRequiresItsOwnReadAndCurrentReceiver() {
        EventPlayback playback = new TestEventPlayback("published-video", new Object());
        selectPlayback(coordinator, playback);
        selectFormats(playback, videoAudio, null, 140, -1);
        openLocal(playback.rvxPlaybackNonce(), videoAudio).returned(42);

        selectPublishedFormats(new Object(), videoAudio, video, 140, 134);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, -1), snapshot());

        selectPublishedFormats(playback.rvxPlaybackEvents(), videoAudio, video, 140, 134);
        selectFormats(playback, videoAudio, null, 140, -1); // A delayed activation sample cannot erase the event.
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, 134), snapshot());

        openLocal(playback.rvxPlaybackNonce(), video).returned(42);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, CACHED_VIDEO, 140, 134), snapshot());
        openFallback(playback.rvxPlaybackNonce(), video);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, 134), snapshot());

        selectPublishedFormats(playback.rvxPlaybackEvents(), videoAudio, null, 140, -1);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, -1), snapshot());
    }

    @Test public void laterClipIgnoresPreviousReceiverEvenForTheSameFormats() {
        EventPlayback previous = new TestEventPlayback("published-previous", new Object());
        selectPlayback(coordinator, previous);
        selectPublishedFormats(previous.rvxPlaybackEvents(), videoAudio, video, 140, 134);
        openLocal(previous.rvxPlaybackNonce(), video).returned(42);

        EventPlayback current = new TestEventPlayback("published-current", new Object());
        selectPlayback(coordinator, current);
        selectPublishedFormats(current.rvxPlaybackEvents(), videoAudio, null, 140, -1);
        selectPublishedFormats(previous.rvxPlaybackEvents(), videoAudio, video, 140, 134);
        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 140, -1), snapshot());

        selectPublishedFormats(current.rvxPlaybackEvents(), videoAudio, null, 140, 134);
        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 140, 134), snapshot());
    }

    @Test public void sameItagFromAnotherResponseDoesNotCarryEvidence() {
        Playback playback = select("format-replacement", raw, null);
        String nonce = playback.rvxPlaybackNonce();
        Read oldRead = openLocal(nonce, raw);
        LocalFormat newGeneration = new LocalFormat(CACHED_AUDIO, 251);
        selectFormats(playback, newGeneration, null, 251, -1);

        assertNull(openLocal(nonce, raw));
        oldRead.returned(42);
        assertEquals(RAW_FORMAT_ONLY, snapshot());
        openLocal(nonce, newGeneration).returned(42);
        openFallback(nonce, raw);
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), snapshot());
    }

    @Test public void fallbackNeverBecomesNetworkEvidenceAndLateLocalReadCannotRestoreIt() {
        Playback playback = select("fallback-boundary", videoAudio, video);
        String nonce = playback.rvxPlaybackNonce();
        openLocal(nonce, videoAudio).returned(42);
        Read pendingVideo = openLocal(nonce, video);
        assertEquals(new Snapshot(CACHED_VIDEO_AUDIO, UNCONFIRMED, 140, 134), snapshot());

        openFallback(nonce, videoAudio);
        openFallback(nonce, video);
        pendingVideo.returned(32);
        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 140, 134), snapshot());
        assertNull(openLocal(nonce, videoAudio));
        assertNull(openLocal(nonce, video));
    }

    @Test public void supersededReaderDoesNotAttachItsBytesToTheReplacement() {
        Playback playback = select("overlapping-opens", raw, null);
        String nonce = playback.rvxPlaybackNonce();
        Read original = openLocal(nonce, raw);
        Read replacement = openLocal(nonce, raw);

        original.returned(128);
        assertEquals(RAW_FORMAT_ONLY, snapshot());
        replacement.returned(128);
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), snapshot());
    }

    @Test public void lateReadAndFormatEventsFromSameRecordingCannotCrossPlaybackObjects() throws Exception {
        Playback outgoing = select("same-recording-first", raw, null);
        Read outgoingRead = openLocal(outgoing.rvxPlaybackNonce(), raw);
        CountDownLatch mayReturn = new CountDownLatch(1);
        ExecutorService executor = Executors.newSingleThreadExecutor();
        try {
            Future<?> completion = executor.submit(() -> {
                assertTrueAwait(mayReturn);
                outgoingRead.returned(42);
                selectFormats(outgoing, raw, video, 251, 134);
            });
            Playback incoming = select("same-recording-second", raw, null);
            mayReturn.countDown();
            completion.get(5, TimeUnit.SECONDS);
            assertEquals(RAW_FORMAT_ONLY, snapshot());
            assertNull(openLocal(outgoing.rvxPlaybackNonce(), raw));

            openLocal(incoming.rvxPlaybackNonce(), raw).returned(42);
            openFallback(outgoing.rvxPlaybackNonce(), raw);
            assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), snapshot());
        } finally {
            executor.shutdownNow();
        }
    }

    @Test public void ambiguousReusedNonceFailsClosedAndStopClearsEvidence() {
        Playback original = select("stock-reused-nonce", raw, null);
        openLocal(original.rvxPlaybackNonce(), raw).returned(128);
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), snapshot());
        selectPlayback(new Object(), null);
        assertEquals(CACHED_AUDIO, snapshot().audio());

        selectPlayback(coordinator, null);
        assertEquals(UNKNOWN, snapshot());
        for (int index = 0; index < 128; index++) {
            select("intervening-playback-" + index, raw, null);
        }
        Playback reused = select(new String(original.rvxPlaybackNonce()), raw, null);
        assertNull(openLocal(reused.rvxPlaybackNonce(), raw));
        assertEquals(RAW_FORMAT_ONLY, snapshot());
    }

    @Test public void selectedStockFormatIsIndependentFromUnconfirmedSource() {
        Playback playback = select("native-stock-formats", null, null);
        selectFormats(playback, null, null, 251, 134);
        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 251, 134), snapshot());

        selectFormats(playback, null, null, 140, 0);
        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 140, -1), snapshot());

        selectPlayback(coordinator, new TestPlayback("no-selected-stock-format"));
        selectFormats(playback, null, null, 251, 134);
        assertEquals(UNKNOWN, snapshot());
    }

    @Test public void positiveLocalReadCannotClaimDifferentSelectedItag() {
        Playback playback = select("selected-itag-conflict", null, null);
        selectFormats(playback, raw, null, 140, -1);
        openLocal(playback.rvxPlaybackNonce(), raw).returned(42);

        assertEquals(new Snapshot(UNCONFIRMED, UNCONFIRMED, 140, -1), snapshot());
    }

    @Test public void snapshotExportsOnlySafeTrackKindsAndFormatNumbers() {
        String secretNonce = "private-request-identity";
        select(secretNonce, raw, null);
        openLocal(secretNonce, raw).returned(128);

        Snapshot observation = snapshot();
        assertEquals(new Snapshot(CACHED_AUDIO, UNCONFIRMED, 251, -1), observation);
        assertFalse(observation.toString().contains(secretNonce));
    }

    private Playback select(String nonce, LocalFormat audio, LocalFormat video) {
        Playback playback = new TestPlayback(nonce);
        selectPlayback(coordinator, playback);
        selectFormats(playback, audio, video, audio == raw ? 251 : audio == videoAudio ? 140 : -1,
                video == null ? -1 : 134);
        return playback;
    }

    private static void assertTrueAwait(CountDownLatch latch) {
        try {
            if (!latch.await(5, TimeUnit.SECONDS)) throw new AssertionError("Read was not released");
        } catch (InterruptedException ex) {
            Thread.currentThread().interrupt();
            throw new AssertionError(ex);
        }
    }

    private record TestPlayback(String rvxPlaybackNonce) implements Playback {}

    private record TestEventPlayback(String rvxPlaybackNonce, Object rvxPlaybackEvents) implements EventPlayback {}
}
