package dev.twitchpatches.extension.channelpoints;

import org.junit.Test;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

public class PlaybackClaimsTest {
    @Test public void requiresLivePlayingMatchingChannelAndEnabled() {
        PlaybackClaims claims = new PlaybackClaims();
        Object player = new Object();
        claims.configure(player, "channel-a", true);
        assertFalse(claims.offer("channel-a", "chest", 0, true));
        claims.state(player, true);
        assertFalse(claims.offer("channel-b", "chest", 0, true));
        assertFalse(claims.offer("channel-a", "chest", 0, false));
        assertFalse(claims.offer("channel-a", null, 0, true));
        assertTrue(claims.offer("channel-a", "chest", 0, true));
        claims.configure(player, "channel-a", false);
        claims.state(player, true);
        assertFalse(claims.offer("channel-a", "other", 40_000, true));
    }

    @Test public void retriesFailuresWithinABoundWithoutTreatingAbsentUpdateAsSuccess() {
        PlaybackClaims claims = new PlaybackClaims();
        Object player = new Object();
        claims.configure(player, "channel", true);
        claims.state(player, true);
        assertTrue(claims.offer("channel", "chest", 1_000, true));
        assertFalse(claims.offer("channel", null, 2_000, true));
        assertFalse(claims.offer("channel", "chest", 3_000, true));
        assertFalse(claims.offer("channel", "chest", 0, true));
        assertTrue(claims.offer("channel", "chest", 31_000, true));
        assertTrue(claims.offer("channel", "chest", 61_000, true));
        assertFalse(claims.offer("channel", "chest", 999_000, true));
        assertTrue(claims.offer("channel", "new-chest", 999_000, true));
    }

    @Test public void latePlayerCallbacksCannotReactivateAReleasedOrReplacedSession() {
        PlaybackClaims claims = new PlaybackClaims();
        Object oldPlayer = new Object();
        Object player = new Object();
        claims.configure(oldPlayer, "old", true);
        claims.state(oldPlayer, true);
        claims.configure(player, "new", true);
        claims.state(oldPlayer, true);
        assertFalse(claims.offer("old", "chest", 0, true));
        assertFalse(claims.offer("new", "chest", 0, true));
        claims.state(player, true);
        claims.release(oldPlayer);
        assertTrue(claims.offer("new", "chest", 0, true));
        claims.release(player);
        claims.state(player, true);
        assertFalse(claims.offer("new", "other", 40_000, true));
    }

    @Test public void concurrentUpdatesReserveOneAttempt() throws InterruptedException {
        PlaybackClaims claims = new PlaybackClaims();
        Object player = new Object();
        claims.configure(player, "channel", true);
        claims.state(player, true);
        CountDownLatch start = new CountDownLatch(1);
        AtomicInteger accepted = new AtomicInteger();
        Thread[] threads = new Thread[16];
        for (int i = 0; i < threads.length; i++) {
            threads[i] = new Thread(() -> {
                try { start.await(); } catch (InterruptedException e) { Thread.currentThread().interrupt(); return; }
                if (claims.offer("channel", "chest", 0, true)) accepted.incrementAndGet();
            });
            threads[i].start();
        }
        start.countDown();
        for (Thread thread : threads) thread.join();
        assertEquals(1, accepted.get());
    }
}
