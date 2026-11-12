package app.morphe.extension.music.patches.downloads;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertThrows;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.atomic.AtomicInteger;

public final class ReplayFutureTest {
    @Test
    public void listenersRunOnceWhenTheValueIsSetAndAfterwards() throws Exception {
        ReplayFuture future = new ReplayFuture();
        AtomicInteger runs = new AtomicInteger();

        future.addListener(runs::incrementAndGet, Runnable::run);
        assertEquals(0, runs.get());
        assertTrue(future.set("queue"));
        assertEquals(1, runs.get());

        future.addListener(runs::incrementAndGet, Runnable::run);
        assertEquals(2, runs.get());
        assertEquals("queue", future.get());
        assertFalse(future.set("again"));
        assertFalse(future.setException(new IllegalStateException()));
    }

    @Test
    public void aFailureIsReportedAsAnExecutionException() {
        ReplayFuture future = new ReplayFuture();
        IllegalStateException failure = new IllegalStateException("no");
        future.setException(failure);

        ExecutionException thrown = assertThrows(ExecutionException.class, future::get);
        assertEquals(failure, thrown.getCause());
        assertTrue(future.isDone());
        assertFalse(future.isCancelled());
    }

    @Test
    public void aCancelledFutureThrowsAndKeepsItsFirstResult() {
        ReplayFuture future = new ReplayFuture();

        assertTrue(future.cancel(false));
        assertFalse(future.set("late"));
        assertTrue(future.isCancelled());
        assertThrows(CancellationException.class, future::get);
    }

    @Test
    public void aTimedGetGivesUpWhileTheFutureIsOpen() {
        assertThrows(TimeoutException.class, () -> new ReplayFuture().get(10, TimeUnit.MILLISECONDS));
    }
}
