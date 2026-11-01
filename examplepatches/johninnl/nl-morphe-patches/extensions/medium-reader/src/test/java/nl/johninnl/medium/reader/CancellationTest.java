package nl.johninnl.medium.reader;

import org.junit.Test;
import java.util.concurrent.atomic.AtomicInteger;
import static org.junit.Assert.*;

public class CancellationTest {
    @Test public void invokesLateAndEarlyHandlersOnce() throws Exception {
        Cancellation cancellation = new Cancellation();
        AtomicInteger count = new AtomicInteger();
        cancellation.onCancel(count::incrementAndGet);
        cancellation.cancel(); cancellation.cancel();
        cancellation.onCancel(count::incrementAndGet);
        assertEquals(2, count.get());
        assertTrue(cancellation.isCancelled());
    }
    @Test public void closedRegistrationIsNotCalled() throws Exception {
        Cancellation cancellation = new Cancellation();
        AtomicInteger count = new AtomicInteger();
        AutoCloseable registration = cancellation.onCancel(count::incrementAndGet);
        cancellation.onCancel(() -> count.addAndGet(10));
        registration.close(); cancellation.cancel();
        assertEquals(10, count.get());
    }
}
