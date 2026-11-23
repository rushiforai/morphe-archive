package nl.johninnl.deezer.lyrics;

import org.junit.Test;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

public class LyricsFlowTest {
    private static final TrackSignature TRACK = new TrackSignature("0.7", "Synthetic title", "Artist", "Album", 120);
    private static LyricsPayload payload() { return LyricsPayload.normalize(17, false, "Synthetic text", null, 120); }
    private static final class Output implements LyricsFlow.Output {
        final List<Object> values = new ArrayList<>();
        final CountDownLatch done = new CountDownLatch(1);
        final CountDownLatch valued = new CountDownLatch(1);
        boolean current = true;
        Throwable failure;
        int completed, disposed;
        public boolean isCurrent() { return current; }
        public boolean nativeUsable(Object value) { return "native".equals(value); }
        public Object fallbackValue(LyricsPayload p) { return p.providerIdentity(); }
        public void value(Object value) { values.add(value); valued.countDown(); }
        public void complete() { completed++; done.countDown(); }
        public void error(Throwable error) { failure = error; done.countDown(); }
        public void disposeNative() { disposed++; }
    }
    private static LyricsRepository repo(LyricsRepository.Fetcher fetcher) {
        return new LyricsRepository(fetcher, () -> System.nanoTime() / 1000000);
    }
    private static void await(CountDownLatch latch) throws Exception { assertTrue(latch.await(3, TimeUnit.SECONDS)); }

    @Test public void usableNativeLyricsNeverFetchFallback() {
        AtomicInteger fetches = new AtomicInteger(); Output output = new Output();
        try (LyricsRepository repo = repo(signature -> { fetches.incrementAndGet(); return LrclibClient.Result.found(payload()); })) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output);
            flow.nativeValue("native"); flow.nativeComplete();
            assertEquals(0, fetches.get());
            assertEquals(java.util.Collections.singletonList("native"), output.values);
            assertEquals(1, output.completed);
        }
    }

    @Test public void emptyNativeStreamEmitsMatchingFallbackThenCompletes() throws Exception {
        Output output = new Output();
        try (LyricsRepository repo = repo(signature -> LrclibClient.Result.found(payload()))) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output); flow.nativeComplete(); await(output.done);
            assertEquals(java.util.Collections.singletonList("lrclib:17"), output.values);
            assertEquals(1, output.completed); assertNull(output.failure);
        }
    }

    @Test public void failedFallbackPreservesTheOriginalNativeFailure() throws Exception {
        Output output = new Output(); Throwable nativeError = new IllegalStateException("Native lyrics unavailable");
        try (LyricsRepository repo = repo(signature -> LrclibClient.Result.missing())) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output); flow.nativeFailure(nativeError); await(output.done);
            assertSame(nativeError, output.failure); assertTrue(output.values.isEmpty());
        }
    }

    @Test public void lateNativeLyricsWinOverAnInflightFallback() throws Exception {
        Output output = new Output(); CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1);
        try (LyricsRepository repo = repo(signature -> {
            entered.countDown(); try { release.await(3, TimeUnit.SECONDS); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
            return LrclibClient.Result.found(payload());
        })) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output);
            flow.nativeValue(null); await(entered); flow.nativeValue("native"); flow.nativeComplete(); release.countDown(); await(output.done);
            assertEquals(java.util.Collections.singletonList("native"), output.values);
            assertEquals(1, output.completed);
        }
    }

    @Test public void changedTrackAndDisposedScreensCannotReceiveAsyncValues() {
        Output output = new Output(); output.current = false;
        try (LyricsRepository repo = repo(signature -> LrclibClient.Result.found(payload()))) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output);
            flow.nativeComplete(); flow.found(payload());
            assertTrue(flow.isDisposed()); assertEquals(1, output.disposed);
            assertTrue(output.values.isEmpty()); assertEquals(0, output.completed);
        }
    }

    @Test public void deliveredFallbackSurvivesALaterNativeLyricsError() throws Exception {
        Output output = new Output();
        try (LyricsRepository repo = repo(signature -> LrclibClient.Result.found(payload()))) {
            LyricsFlow flow = new LyricsFlow(repo, TRACK, output);
            flow.nativeValue(null); await(output.valued);
            flow.nativeFailure(new IllegalStateException("Native lyrics ended")); await(output.done);
            assertNull(output.failure); assertEquals(1, output.completed);
            assertEquals(java.util.Collections.singletonList("lrclib:17"), output.values);
        }
    }
}
