package nl.johninnl.eclipse.auto.app;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
import nl.johninnl.eclipse.app.c12;
import nl.johninnl.eclipse.app.gy2;
import nl.johninnl.eclipse.app.hka;
import nl.johninnl.eclipse.app.tz1;
import nl.johninnl.eclipse.app.vz1;
import nl.johninnl.eclipse.app.zv8;
import org.junit.Test;

/**
 * Drives Suspend against the stubs, which reproduce Kotlin's final resumeWith loop: the extension's
 * classes must satisfy the supertypes the app's loaders demand and deliver values and failures.
 */
public class SuspendTest {
    private static final class Outcome {
        Object value;
        Throwable failure;
        int deliveries;
    }

    private final List<Runnable> queued = new ArrayList<>();
    private final Executor deferred = new Executor() { @Override public void execute(Runnable command) { queued.add(command); } };
    private final Outcome outcome = new Outcome();
    private final Suspend.Callback callback = new Suspend.Callback() {
        @Override public void done(Object value, Throwable failure) {
            outcome.value = value;
            outcome.failure = failure;
            outcome.deliveries++;
        }
    };

    private void drain() {
        for (Runnable task : new ArrayList<>(queued)) task.run();
        queued.clear();
    }

    @Test public void theCallSatisfiesEveryLoaderParameterType() {
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                // R8 narrowed the loaders to vz1 or hka, and the continuation itself is tz1.
                assertTrue(call instanceof hka);
                assertTrue(call instanceof vz1);
                assertTrue(call instanceof tz1);
                c12 context = call.getContext();
                assertSame(gy2.q, context);
                return "done";
            }
        }, callback, deferred);
        drain();
        assertEquals("done", outcome.value);
    }

    @Test public void aValueReturnedImmediatelyIsDeliveredThroughTheExecutor() {
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return 42; }
        }, callback, deferred);
        assertEquals("nothing is delivered before the main-thread hop", 0, outcome.deliveries);
        drain();
        assertEquals(42, outcome.value);
        assertNull(outcome.failure);
        assertEquals(1, outcome.deliveries);
    }

    @Test public void aSuspendedCallDeliversWhenTheAppResumesIt() {
        final Suspend.Call[] captured = new Suspend.Call[1];
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                captured[0] = call;
                return nl.johninnl.eclipse.app.q12.COROUTINE_SUSPENDED;
            }
        }, callback, deferred);
        drain();
        assertEquals("a suspended call has no result yet", 0, outcome.deliveries);
        captured[0].resumeWith("later");
        drain();
        assertEquals("later", outcome.value);
        assertEquals(1, outcome.deliveries);
    }

    @Test public void aFailedResumeRethrowsThroughInvokeSuspendAndArrivesAsTheOriginalThrowable() {
        final Suspend.Call[] captured = new Suspend.Call[1];
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) {
                captured[0] = call;
                return nl.johninnl.eclipse.app.q12.COROUTINE_SUSPENDED;
            }
        }, callback, deferred);
        IOException failure = new IOException("offline");
        captured[0].resumeWith(new zv8(failure));
        drain();
        assertSame(failure, outcome.failure);
        assertNull(outcome.value);
    }

    @Test public void aLoaderThatThrowsSynchronouslyIsReportedAsAFailure() {
        final IllegalStateException failure = new IllegalStateException("bad");
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { throw failure; }
        }, callback, deferred);
        drain();
        assertSame(failure, outcome.failure);
    }

    @Test public void aThrowingCallbackDoesNotBreakTheContinuation() {
        Suspend.run(new Suspend.Loader() {
            @Override public Object invoke(Suspend.Call call) { return "x"; }
        }, new Suspend.Callback() {
            @Override public void done(Object value, Throwable failure) { throw new RuntimeException("callback"); }
        }, deferred);
        drain();
    }
}
