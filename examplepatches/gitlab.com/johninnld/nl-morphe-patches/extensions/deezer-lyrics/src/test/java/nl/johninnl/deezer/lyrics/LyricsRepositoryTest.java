package nl.johninnl.deezer.lyrics;

import org.junit.Test;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

public class LyricsRepositoryTest {
    private static TrackSignature track(String id) { return new TrackSignature(id, "Title " + id, "Artist", "Album", 120); }
    private static LrclibClient.Result payload(TrackSignature signature) {
        return LrclibClient.Result.found(LyricsPayload.normalize(7, false, signature.title, null, 120));
    }
    private static void await(CountDownLatch latch) throws Exception { assertTrue("Lookup completed within its bounded window", latch.await(3, TimeUnit.SECONDS)); }
    private static LyricsRepository.Listener listener(AtomicBoolean current, CountDownLatch done, AtomicInteger calls) {
        return new LyricsRepository.Listener() {
            public boolean isCurrent() { return current.get(); }
            public void found(LyricsPayload p) { calls.incrementAndGet(); done.countDown(); }
            public void missing() { calls.incrementAndGet(); done.countDown(); }
        };
    }

    @Test public void concurrentSubscribersShareOneLookupAndReceiveTheSameTrack() throws Exception {
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1), done = new CountDownLatch(2);
        AtomicInteger fetches = new AtomicInteger(), deliveries = new AtomicInteger();
        try (LyricsRepository repo = new LyricsRepository(signature -> {
            fetches.incrementAndGet(); entered.countDown();
            try { release.await(3, TimeUnit.SECONDS); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
            return payload(signature);
        }, () -> System.nanoTime() / 1000000)) {
            repo.lookup(track("A"), listener(new AtomicBoolean(true), done, deliveries));
            await(entered);
            repo.lookup(track("A"), listener(new AtomicBoolean(true), done, deliveries));
            release.countDown(); await(done);
            assertEquals(1, fetches.get());
            assertEquals(2, deliveries.get());
        }
    }

    @Test public void cancelledAndStaleScreensNeverReceiveACompletedLookup() throws Exception {
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1), done = new CountDownLatch(1);
        AtomicInteger staleCalls = new AtomicInteger(), currentCalls = new AtomicInteger();
        AtomicBoolean stale = new AtomicBoolean(true);
        try (LyricsRepository repo = new LyricsRepository(signature -> {
            entered.countDown();
            try { release.await(3, TimeUnit.SECONDS); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
            return payload(signature);
        }, () -> System.nanoTime() / 1000000)) {
            LyricsRepository.Request cancelled = repo.lookup(track("A"), listener(new AtomicBoolean(true), new CountDownLatch(1), staleCalls));
            await(entered);
            repo.lookup(track("A"), listener(stale, new CountDownLatch(1), staleCalls));
            cancelled.cancel(); stale.set(false);
            repo.lookup(track("A"), listener(new AtomicBoolean(true), done, currentCalls));
            release.countDown(); await(done);
            assertEquals(0, staleCalls.get());
            assertEquals(1, currentCalls.get());
        }
    }

    @Test public void differentSignaturesStaySeparateAndUseOneNetworkWorker() throws Exception {
        AtomicInteger inflight = new AtomicInteger(), maximum = new AtomicInteger(), deliveries = new AtomicInteger();
        CountDownLatch done = new CountDownLatch(2);
        try (LyricsRepository repo = new LyricsRepository(signature -> {
            maximum.accumulateAndGet(inflight.incrementAndGet(), Math::max);
            LrclibClient.Result value = payload(signature); inflight.decrementAndGet(); return value;
        }, () -> System.nanoTime() / 1000000)) {
            for (String id : new String[]{"A", "B"}) {
                TrackSignature signature = track(id);
                repo.lookup(signature, new LyricsRepository.Listener() {
                    public boolean isCurrent() { return true; }
                    public void found(LyricsPayload p) { assertEquals(signature.title, p.plainText); deliveries.incrementAndGet(); done.countDown(); }
                    public void missing() { done.countDown(); }
                });
            }
            await(done);
            assertEquals(1, maximum.get());
            assertEquals(2, deliveries.get());
        }
    }
}
