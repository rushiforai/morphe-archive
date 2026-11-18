package io.github.sabopura.morphe.extension.twitch.ads;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

public class BackupSourceTest {
    private final AtomicLong now = new AtomicLong(1_000_000);
    private final List<Runnable> queued = new ArrayList<>();
    private final BackupSource source = new BackupSource(0, now::get);
    private final List<Playlists.Variant> renditions = Playlists.variants(
            "#EXTM3U\n#EXT-X-STREAM-INF:BANDWIDTH=630000,RESOLUTION=640x360,VIDEO=\"360p30\"\nhttps://b/360.m3u8\n",
            "https://usher.ttvnw.net/a.m3u8");

    private void runQueued() {
        List<Runnable> tasks = new ArrayList<>(queued);
        queued.clear();
        tasks.forEach(Runnable::run);
    }

    @Test
    public void aSlowOpeningIsNoFailureAndServesTheNextRefresh() {
        Future<?> opening = source.start(() -> renditions, queued::add);
        assertFalse("the refresh gives up at its deadline",
                BackupSource.await(opening, System.currentTimeMillis() + 20, () -> false));
        assertFalse(source.resting());

        runQueued();
        assertSame(renditions, source.variants());
        assertTrue(BackupSource.await(opening, System.currentTimeMillis(), () -> false));
    }

    @Test
    public void onlyOneOpeningRunsAtATime() {
        AtomicInteger opened = new AtomicInteger();
        BackupSource.Opener opener = () -> {
            opened.incrementAndGet();
            return renditions;
        };
        Future<?> warmUp = source.start(opener, queued::add);
        assertSame("a refresh joins the warm-up", warmUp, source.start(opener, queued::add));
        runQueued();
        source.start(opener, queued::add);
        assertTrue("an open source is not opened again", queued.isEmpty());
        assertEquals(1, opened.get());
    }

    @Test
    public void aFailedOpeningRestsTheSource() {
        source.start(() -> null, queued::add);
        runQueued();
        assertTrue(source.resting());
        assertNull(source.variants());
        source.start(() -> renditions, queued::add);
        assertTrue(queued.isEmpty());

        now.addAndGet(BackupSource.COOL_DOWN_MS);
        source.start(() -> renditions, queued::add);
        runQueued();
        assertSame(renditions, source.variants());
    }

    @Test
    public void anOpenSourceIsOpenedAgainAfterItsLifetime() {
        source.start(() -> renditions, queued::add);
        runQueued();
        now.addAndGet(BackupSource.LIFETIME_MS + 1);
        assertNull(source.variants());
        assertNotNull(source.start(() -> renditions, queued::add));
        assertEquals(1, queued.size());
    }

    @Test
    public void waitingEndsWhenThePlayerCancels() {
        Future<?> opening = source.start(() -> renditions, queued::add);
        assertFalse(BackupSource.await(opening, System.currentTimeMillis() + 60_000, () -> true));
    }

    /** The client that was opening the source was released: that says nothing about the source. */
    @Test
    public void anOpeningGivenUpNeitherOpensNorRestsTheSource() {
        source.start(() -> {
            throw new java.util.concurrent.CancellationException();
        }, queued::add);
        runQueued();
        assertNull(source.variants());
        assertFalse(source.resting());

        source.start(() -> renditions, queued::add);
        runQueued();
        assertSame("the next client opens it at once", renditions, source.variants());
    }
}
