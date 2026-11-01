package nl.johninnl.medium.reader;

import org.junit.Test;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.AbstractExecutorService;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import static org.junit.Assert.*;

public class ReaderTaskTest {
    static class Direct extends AbstractExecutorService {
        boolean shutdown;
        public void shutdown() { shutdown = true; }
        public List<Runnable> shutdownNow() { shutdown = true; return Collections.emptyList(); }
        public boolean isShutdown() { return shutdown; }
        public boolean isTerminated() { return shutdown; }
        public boolean awaitTermination(long timeout, TimeUnit unit) { return shutdown; }
        public void execute(Runnable command) { if (shutdown) throw new RejectedExecutionException(); command.run(); }
    }

    @Test public void inlineCompletionBeforeSubmitReturnsIsDeliveredOnce() {
        Cancellation cancellation = new Cancellation();
        AtomicInteger callbacks = new AtomicInteger();
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        new ReaderTask<>(new Direct(), c -> "ready", cancellation, value -> { callbacks.incrementAndGet(); result.set(value); }).start();
        assertNotNull(result.get()); assertEquals("ready", result.get().value); assertNull(result.get().failure);
        cancellation.cancel(); assertEquals(1, callbacks.get());
    }

    @Test public void asyncWorkDoesNotReportSuccessBeforeItFinishes() throws Exception {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1), completed = new CountDownLatch(1);
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        try {
            new ReaderTask<>(executor, c -> { entered.countDown(); release.await(); return "ready"; }, new Cancellation(), value -> { result.set(value); completed.countDown(); }).start();
            assertTrue(entered.await(2, TimeUnit.SECONDS)); assertNull(result.get());
            release.countDown(); assertTrue(completed.await(2, TimeUnit.SECONDS)); assertEquals("ready", result.get().value);
        } finally { release.countDown(); executor.shutdownNow(); }
    }

    @Test public void alreadyCancelledOperationNeverInvokesWork() {
        Cancellation cancellation = new Cancellation(); cancellation.cancel();
        AtomicInteger work = new AtomicInteger(); AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        new ReaderTask<>(new Direct(), c -> { work.incrementAndGet(); return "wrong"; }, cancellation, result::set).start();
        assertNotNull(result.get()); assertEquals(0, work.get());
        assertEquals("CANCELLED", ((ArticleException) result.get().failure).code);
    }

    @Test public void cancellationWinsAgainstLateSuccessfulWork() throws Exception {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        CountDownLatch entered = new CountDownLatch(1), release = new CountDownLatch(1), completed = new CountDownLatch(1);
        Cancellation cancellation = new Cancellation(); AtomicInteger callbacks = new AtomicInteger();
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        try {
            new ReaderTask<>(executor, c -> { entered.countDown(); release.await(); return "too late"; }, cancellation,
                    value -> { callbacks.incrementAndGet(); result.set(value); completed.countDown(); }).start();
            assertTrue(entered.await(2, TimeUnit.SECONDS)); cancellation.cancel();
            assertTrue(completed.await(2, TimeUnit.SECONDS));
            release.countDown(); executor.shutdown(); assertTrue(executor.awaitTermination(2, TimeUnit.SECONDS));
            assertEquals("CANCELLED", ((ArticleException) result.get().failure).code); assertEquals(1, callbacks.get());
        } finally { release.countDown(); executor.shutdownNow(); }
    }

    @Test public void cancellationBeforeFutureAssignmentNeverStartsWork() {
        Cancellation cancellation = new Cancellation();
        ExecutorService executor = new Direct() { @Override public void execute(Runnable command) { cancellation.cancel(); command.run(); } };
        AtomicInteger work = new AtomicInteger(), callbacks = new AtomicInteger();
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        new ReaderTask<>(executor, c -> { work.incrementAndGet(); return "wrong"; }, cancellation,
                value -> { callbacks.incrementAndGet(); result.set(value); }).start();
        assertNotNull(result.get()); assertEquals(0, work.get()); assertEquals(1, callbacks.get());
        assertEquals("CANCELLED", ((ArticleException) result.get().failure).code);
    }

    @Test public void rejectedSubmissionIsATerminalFailure() {
        Direct executor = new Direct(); executor.shutdown();
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        new ReaderTask<>(executor, c -> "wrong", new Cancellation(), result::set).start();
        assertNotNull(result.get()); assertTrue(result.get().failure instanceof RejectedExecutionException);
    }

    @Test public void workFailureIsNotReplacedByAnEmptySuccess() {
        Exception failure = new Exception("fixture failure");
        AtomicReference<ReaderTask.Result<String>> result = new AtomicReference<>();
        new ReaderTask<String>(new Direct(), c -> { throw failure; }, new Cancellation(), result::set).start();
        assertNotNull(result.get()); assertSame(failure, result.get().failure); assertNull(result.get().value);
    }
}
