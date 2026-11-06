package dev.twitchpatches.extension.emotes;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.Test;
import static org.junit.Assert.*;

public class EmoteImageRequestsTest {
    private static void await(CountDownLatch latch) {
        try { assertTrue("Request did not finish", latch.await(5, TimeUnit.SECONDS)); }
        catch (InterruptedException error) { Thread.currentThread().interrupt(); throw new AssertionError(error); }
    }

    @Test public void repeatedCellsShareOneRequest() {
        try (EmoteImageRequests requests = new EmoteImageRequests(1)) {
            CountDownLatch started = new CountDownLatch(1), finish = new CountDownLatch(1), done = new CountDownLatch(1);
            AtomicInteger loads = new AtomicInteger();
            requests.submit("visible", ticket -> {
                loads.incrementAndGet(); started.countDown(); await(finish);
                assertTrue(requests.complete("visible", ticket)); done.countDown();
            });
            await(started);
            requests.submit("visible", ticket -> loads.incrementAndGet());
            assertEquals(1, requests.size());
            finish.countDown(); await(done);
            assertEquals(1, loads.get());
            assertEquals(0, requests.size());
        }
    }

    @Test public void canceledCompletionCannotRemoveReplacement() {
        try (EmoteImageRequests requests = new EmoteImageRequests(2)) {
            CountDownLatch started = new CountDownLatch(1), canceled = new CountDownLatch(1);
            CountDownLatch release = new CountDownLatch(1), oldDone = new CountDownLatch(1), newDone = new CountDownLatch(1);
            AtomicBoolean stale = new AtomicBoolean(true);
            requests.submit("image", ticket -> {
                started.countDown();
                try { release.await(); } catch (InterruptedException error) { canceled.countDown(); await(release); }
                stale.set(requests.complete("image", ticket)); oldDone.countDown();
            });
            await(started); requests.cancel(); await(canceled);
            requests.submit("image", ticket -> {
                await(oldDone); assertTrue(requests.complete("image", ticket)); newDone.countDown();
            });
            release.countDown(); await(newDone);
            assertFalse(stale.get());
            assertEquals(0, requests.size());
        }
    }

    @Test public void viewportChangeRemovesOffscreenBacklog() {
        try (EmoteImageRequests requests = new EmoteImageRequests(1)) {
            CountDownLatch started = new CountDownLatch(1), release = new CountDownLatch(1), done = new CountDownLatch(1);
            java.util.List<String> loaded = Collections.synchronizedList(new ArrayList<>());
            requests.submit("first", ticket -> {
                started.countDown(); await(release); requests.complete("first", ticket);
            });
            await(started);
            for (int index = 0; index < 40; index++) {
                String url = "offscreen-" + index;
                requests.submit(url, ticket -> { loaded.add(url); requests.complete(url, ticket); });
            }
            requests.retain(Set.of("first", "visible"));
            requests.submit("visible", ticket -> {
                loaded.add("visible"); requests.complete("visible", ticket); done.countDown();
            });
            assertEquals(2, requests.size());
            release.countDown(); await(done);
            assertEquals(Collections.singletonList("visible"), loaded);
        }
    }
}
