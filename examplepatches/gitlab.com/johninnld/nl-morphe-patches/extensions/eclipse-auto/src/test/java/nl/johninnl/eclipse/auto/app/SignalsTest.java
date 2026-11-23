package nl.johninnl.eclipse.auto.app;

import static org.junit.Assert.assertEquals;

import android.os.Looper;
import java.util.concurrent.atomic.AtomicInteger;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
public class SignalsTest {
    private final AtomicInteger refreshes = new AtomicInteger();
    private final Runnable listener = new Runnable() { @Override public void run() { refreshes.incrementAndGet(); } };

    @After public void reset() { Signals.clearListener(listener); }

    private static void idle() { Shadows.shadowOf(Looper.getMainLooper()).idle(); }

    @Test public void aBurstOfMutationsRefreshesOnceAfterTheMutationHasFinished() {
        Signals.setListener(listener);
        for (int i = 0; i < 5; i++) Signals.queueChanged();
        assertEquals("the refresh is posted, never run inside the hooked mutator", 0, refreshes.get());
        idle();
        assertEquals(1, refreshes.get());
        Signals.queueChanged();
        idle();
        assertEquals("a later change schedules again", 2, refreshes.get());
    }

    @Test public void withoutAListenerNothingIsScheduled() {
        Signals.queueChanged();
        idle();
        assertEquals(0, refreshes.get());
        Signals.setListener(listener);
        Signals.queueChanged();
        idle();
        assertEquals("the earlier call must not leave the signal stuck pending", 1, refreshes.get());
    }

    @Test public void aFailingListenerNeverReachesTheHookedMutator() {
        Signals.setListener(new Runnable() { @Override public void run() { throw new IllegalStateException("boom"); } });
        Signals.queueChanged();
        idle();
        Signals.setListener(listener);
        Signals.queueChanged();
        idle();
        assertEquals("a failure must not wedge later signals", 1, refreshes.get());
    }

    @Test public void theClassicTreeListensOnItsOwnSlotAndBothHearEveryChangeOnce() {
        AtomicInteger tree = new AtomicInteger();
        Runnable treeListener = new Runnable() { @Override public void run() { tree.incrementAndGet(); } };
        Signals.setTreeListener(treeListener);
        try {
            for (int i = 0; i < 4; i++) Signals.queueChanged();
            idle();
            assertEquals("the tree alone is enough to schedule", 1, tree.get());
            assertEquals(0, refreshes.get());
            Signals.setListener(listener);
            Signals.queueChanged();
            idle();
            assertEquals(2, tree.get());
            assertEquals(1, refreshes.get());
        } finally {
            Signals.clearTreeListener(treeListener);
        }
    }

    @Test public void aFailingCarListenerDoesNotStopTheTreeListener() {
        AtomicInteger tree = new AtomicInteger();
        Runnable treeListener = new Runnable() { @Override public void run() { tree.incrementAndGet(); } };
        Signals.setListener(new Runnable() { @Override public void run() { throw new IllegalStateException("boom"); } });
        Signals.setTreeListener(treeListener);
        try {
            Signals.queueChanged();
            idle();
            assertEquals(1, tree.get());
        } finally {
            Signals.clearTreeListener(treeListener);
        }
    }

    @Test public void clearingOnlyRemovesTheSameListener() {
        Signals.setListener(listener);
        Signals.clearListener(new Runnable() { @Override public void run() { } });
        Signals.queueChanged();
        idle();
        assertEquals(1, refreshes.get());
        Signals.clearListener(listener);
        Signals.queueChanged();
        idle();
        assertEquals(1, refreshes.get());
    }
}
