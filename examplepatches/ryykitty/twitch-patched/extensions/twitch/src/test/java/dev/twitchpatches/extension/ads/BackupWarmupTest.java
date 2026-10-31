package dev.twitchpatches.extension.ads;

import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import dev.twitchpatches.extension.ads.hls.LiveWindow;
import dev.twitchpatches.extension.ads.hls.Variant;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import org.junit.Test;
import static org.junit.Assert.*;

public final class BackupWarmupTest {
    private static final String BASE = "https://video-weaver.test.hls.ttvnw.net/live/master.m3u8";
    private static final Variant INITIAL = HlsPlaylist.parse("#EXTM3U\n" +
            "#EXT-X-STREAM-INF:BANDWIDTH=3000000,RESOLUTION=1280x720,CODECS=\"avc1.4d401f,mp4a.40.2\"\n" +
            "720.m3u8\n", BASE).variants.get(0);
    private static final HlsPlaylist CLEAN = HlsPlaylist.parse("#EXTM3U\n" +
            "#EXT-X-TWITCH-LIVE-SEQUENCE:20\n#EXTINF:2,\nclean20.ts\n", BASE);

    @Test public void initialRenditionLoadsOnFirstPollWithoutWaitingForWatch() throws Exception {
        CountDownLatch loaded = new CountDownLatch(1);
        AtomicReference<Variant> observed = new AtomicReference<>();
        try (BackupWarmup warmup = new BackupWarmup(INITIAL, (variant, deadline) -> {
            observed.set(variant);
            loaded.countDown();
            return new BackupWarmup.Snapshot(CLEAN, "mobile_feed");
        }, () -> true, () -> { })) {
            assertTrue("Initial warmup should run immediately", loaded.await(1, TimeUnit.SECONDS));
            assertSame(INITIAL, observed.get());
            assertSame(CLEAN, awaitSnapshot(warmup, INITIAL).playlist);
        }
    }

    @Test public void completedWarmupCanReplacePrerollAfterFirstLookupMisses() throws Exception {
        CountDownLatch loading = new CountDownLatch(1), complete = new CountDownLatch(1);
        HlsPlaylist ads = HlsPlaylist.parse("#EXTM3U\n#EXT-X-DATERANGE:ID=\"stitched-ad\"\n" +
                "#EXTINF:2,\npreroll.ts\n", BASE);
        try (BackupWarmup warmup = new BackupWarmup(INITIAL, (variant, deadline) -> {
            loading.countDown();
            complete.await();
            return new BackupWarmup.Snapshot(CLEAN, "mobile_feed");
        }, () -> true, () -> { })) {
            assertTrue(loading.await(1, TimeUnit.SECONDS));
            assertNull(warmup.snapshot(INITIAL));
            complete.countDown();
            BackupWarmup.Snapshot completed = awaitSnapshot(warmup, INITIAL);
            LiveWindow window = new LiveWindow();
            assertTrue(window.acceptCleanBackup(completed.playlist, completed.source));
            String replacement = window.finish(ads, true);
            assertNotNull(replacement);
            assertTrue(replacement.contains("clean20.ts"));
            assertFalse(replacement.contains("preroll.ts"));
        }
    }

    @Test public void renditionChangeDoesNotMislabelAnInflightSnapshot() throws Exception {
        CountDownLatch loading = new CountDownLatch(1), complete = new CountDownLatch(1);
        Variant next = HlsPlaylist.parse("#EXTM3U\n" +
                "#EXT-X-STREAM-INF:RESOLUTION=640x360,CODECS=\"avc1.4d401f,mp4a.40.2\"\n" +
                "360.m3u8\n", BASE).variants.get(0);
        try (BackupWarmup warmup = new BackupWarmup(INITIAL, (variant, deadline) -> {
            loading.countDown();
            complete.await();
            return new BackupWarmup.Snapshot(CLEAN, "mobile_feed");
        }, () -> true, () -> { })) {
            assertTrue(loading.await(1, TimeUnit.SECONDS));
            warmup.watch(next);
            complete.countDown();
            assertNotNull(awaitSnapshot(warmup, INITIAL));
            assertNull(warmup.snapshot(next));
        }
    }

    @Test public void closeCancelsPendingWorkAndDiscardsSnapshots() throws Exception {
        CountDownLatch loading = new CountDownLatch(1), interrupted = new CountDownLatch(1);
        AtomicInteger cancelled = new AtomicInteger();
        BackupWarmup warmup = new BackupWarmup(INITIAL, (variant, deadline) -> {
            loading.countDown();
            try { new CountDownLatch(1).await(); }
            catch (InterruptedException exception) { interrupted.countDown(); throw exception; }
            return new BackupWarmup.Snapshot(CLEAN, "mobile_feed");
        }, () -> true, cancelled::incrementAndGet);
        try { assertTrue(loading.await(1, TimeUnit.SECONDS)); }
        finally { warmup.close(); }
        assertTrue(interrupted.await(1, TimeUnit.SECONDS));
        assertEquals(1, cancelled.get());
        assertNull(warmup.snapshot(INITIAL));
    }

    private static BackupWarmup.Snapshot awaitSnapshot(BackupWarmup warmup, Variant variant) throws Exception {
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(1);
        BackupWarmup.Snapshot snapshot;
        while ((snapshot = warmup.snapshot(variant)) == null && System.nanoTime() < deadline) Thread.sleep(5);
        assertNotNull("Warmup result was not published", snapshot);
        return snapshot;
    }
}
