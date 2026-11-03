package dev.utaa.linimal.extension.features.readwithoutreceipt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.atomic.AtomicBoolean;

import org.junit.After;
import org.junit.Test;

public final class ReadWithoutReceiptManualHooksTest {
    @After
    public void reset() {
        ReadWithoutReceiptHooks.resetForTesting();
    }

    @Test
    public void onlyOneReadRunsAtATimeAndFailureReleasesTheAction() {
        ReadWithoutReceiptManualHooks.State state = new ReadWithoutReceiptManualHooks.State();
        assertTrue(state.begin());
        assertTrue(state.isPending());
        assertFalse(state.begin());
        state.finish();
        assertFalse(state.isPending());
        assertTrue(state.begin());
    }

    @Test
    public void rotationRetainsThePendingReadAndSuppressionButReentryDoesNot() {
        Object first = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(first, 0L);
        ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
        assertTrue(session.manualState.begin());
        ReadWithoutReceiptHooks.endActivity(first, true, true);
        Object restored = new Object();
        create(restored, session.token);
        ReadWithoutReceiptHooks.Suppression transferred = ReadWithoutReceiptHooks.currentSuppression();
        assertSame(session.manualState, transferred.manualState);
        assertTrue(transferred.manualState.isPending());
        assertTrue(ReadWithoutReceiptHooks.shouldBlockGivenObserved("chat", 1L, transferred));
        ReadWithoutReceiptHooks.endActivity(restored, false, true);
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 2L);
        create(new Object(), 0L);
        assertFalse(ReadWithoutReceiptHooks.currentSuppression().manualState.isPending());
    }

    @Test
    public void manualPermissionIsLimitedToOneChatAndWorker() throws Exception {
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(new Object(), 0L);
        ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
        ReadWithoutReceiptManualHooks.invokeRead(session, new Executor(() -> {
            assertFalse(ReadWithoutReceiptHooks.shouldBlockMarkAsRead("chat"));
            assertTrue(ReadWithoutReceiptHooks.shouldBlockMarkAsRead("other"));
            AtomicBoolean escaped = new AtomicBoolean(true);
            Thread other = new Thread(() -> escaped.set(ReadWithoutReceiptManualHooks.isManualRead("chat")));
            other.start();
            try {
                other.join();
            } catch (InterruptedException error) {
                throw new AssertionError(error);
            }
            assertFalse(escaped.get());
        }), 42L);
        assertFalse(ReadWithoutReceiptManualHooks.hasManualInvocation());
        assertSame(session, ReadWithoutReceiptHooks.currentSuppression());
        assertTrue(ReadWithoutReceiptHooks.shouldBlockGivenObserved("chat", 1L, session));
    }

    @Test
    public void permissionRevokesOnSessionReplacementAndIsClearedEvenWhenTheReaderThrows() throws Exception {
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(new Object(), 0L);
        ReadWithoutReceiptHooks.Suppression old = ReadWithoutReceiptHooks.currentSuppression();
        try {
            ReadWithoutReceiptManualHooks.invokeRead(old, new Executor(() -> {
                ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
                create(new Object(), 0L);
                assertTrue(ReadWithoutReceiptHooks.shouldBlockMarkAsRead("chat"));
                throw new IllegalStateException("reader failed");
            }), 42L);
            fail("Reader failure must propagate to the worker's failure handler");
        } catch (InvocationTargetException expected) {
            assertTrue(expected.getCause() instanceof IllegalStateException);
        }
        assertFalse(ReadWithoutReceiptManualHooks.hasManualInvocation());
        assertEquals(0L, ReadWithoutReceiptManualHooks.invokeRead(old, new Executor(() -> {
            throw new AssertionError("stale action executed");
        }), 42L));
    }

    @Test
    public void markingTheWholeChatReturnsToNormalLineOnlyWhenItSucceeds() {
        Object activity = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(activity, 0L);
        ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();

        assertFalse(ReadWithoutReceiptManualHooks.finishRead(session, 0L));
        assertSame(session, ReadWithoutReceiptHooks.currentSuppression());

        assertTrue(ReadWithoutReceiptManualHooks.finishRead(session, 42L));
        assertEquals(null, ReadWithoutReceiptHooks.currentSuppression());
        assertEquals(0L, ReadWithoutReceiptHooks.sessionTokenFor(activity));
    }

    @Test
    public void resultIsSentToTheOwnerAfterRotationEvenWhenTheSessionEnds() {
        Object first = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(first, 0L);
        ReadWithoutReceiptHooks.Suppression started = ReadWithoutReceiptHooks.currentSuppression();
        ReadWithoutReceiptHooks.endActivityObserved(first, true, true, started);
        Object second = new Object();
        create(second, started.token);

        ReadWithoutReceiptHooks.Suppression target = ReadWithoutReceiptManualHooks.resultTarget(started);
        assertSame(second, target.owner.get());
        assertTrue(ReadWithoutReceiptManualHooks.finishRead(started, 42L));
        assertEquals(null, ReadWithoutReceiptHooks.currentSuppression());
        assertSame(second, target.owner.get());
        assertSame(started, ReadWithoutReceiptManualHooks.resultTarget(started));
    }

    @Test
    public void blockedSendDuringSessionReplacementIsNotReportedAsSent() throws Exception {
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(new Object(), 0L);
        ReadWithoutReceiptHooks.Suppression old = ReadWithoutReceiptHooks.currentSuppression();

        assertEquals(0L, ReadWithoutReceiptManualHooks.invokeRead(old, new Executor(() -> {
            ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
            create(new Object(), 0L);
            assertTrue(ReadWithoutReceiptHooks.shouldBlockMarkAsRead("chat"));
        }), 42L));

        ReadWithoutReceiptHooks.Suppression current = ReadWithoutReceiptHooks.currentSuppression();
        assertEquals(42L, ReadWithoutReceiptManualHooks.invokeRead(current, new Executor(() -> {
        }), 42L));
    }

    public static final class Executor {
        private final Runnable action;

        Executor(Runnable action) {
            this.action = action;
        }

        public long linimalMarkReadManually(long point, String chatId) {
            action.run();
            return point;
        }
    }

    private static void create(Object activity, long token) {
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, "chat", token, 3L,
                true, true, ReadWithoutReceiptHooks.currentSuppression());
    }
}
