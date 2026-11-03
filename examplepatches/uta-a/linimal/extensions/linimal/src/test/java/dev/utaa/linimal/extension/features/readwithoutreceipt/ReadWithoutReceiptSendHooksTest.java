package dev.utaa.linimal.extension.features.readwithoutreceipt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public final class ReadWithoutReceiptSendHooksTest {
    @After
    public void reset() {
        ReadWithoutReceiptHooks.resetForTesting();
    }

    @Test
    public void sendingBeforeTheFirstReadAttemptWaitsForAValidReadPointAndClaimsOnlyOnce() throws Exception {
        ReadWithoutReceiptSendHooks.SendState state = new ReadWithoutReceiptSendHooks.SendState();
        ReadExecutor executor = new ReadExecutor();
        assertNull(state.onSubmitted(false));
        assertNull(state.record(executor, 0L));
        assertNull(state.record(executor, -1L));
        assertEquals(81L, state.record(executor, 81L).readPoint);
        assertNull(state.record(executor, 82L));
        assertNull(state.onSubmitted(false));
    }

    @Test
    public void sendingUsesTheHighestSuppressedReadPointWithoutAFactoryOrDatabaseLookup() throws Exception {
        ReadWithoutReceiptSendHooks.SendState state = new ReadWithoutReceiptSendHooks.SendState();
        ReadExecutor executor = new ReadExecutor();
        assertNull(state.record(executor, 81L));
        assertNull(state.record(executor, 83L));
        assertNull(state.record(executor, 82L));
        assertEquals(83L, state.onSubmitted(false).readPoint);
        assertNull(state.onSubmitted(false));
    }

    @Test
    public void highestAttemptedPointIsNeverThePreviouslyReadBaseline() throws Exception {
        ReadWithoutReceiptSendHooks.SendState state = new ReadWithoutReceiptSendHooks.SendState();
        state.record(new ReadExecutor(), 120L);
        assertEquals(120L, state.snapshot().readPoint);
    }

    @Test
    public void rotationKeepsObservedReadAndPendingSendButReentryDoesNot() throws Exception {
        Object original = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(original, 0L);
        ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
        assertNull(session.sendState.onSubmitted(false));
        ReadWithoutReceiptHooks.endActivity(original, true, true);
        create(new Object(), session.token);
        ReadWithoutReceiptHooks.Suppression restored = ReadWithoutReceiptHooks.currentSuppression();
        assertEquals(84L, restored.sendState.record(new ReadExecutor(), 84L).readPoint);
        assertTrue(ReadWithoutReceiptHooks.endConfirmedSuppression("chat", session));
        assertNull(ReadWithoutReceiptHooks.currentSuppression());
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        create(new Object(), 0L);
        assertNull(ReadWithoutReceiptHooks.currentSuppression().sendState.onSubmitted(false));
        assertFalse(ReadWithoutReceiptHooks.endConfirmedSuppression("chat", session));
    }

    @Test
    public void keepUnreadAfterSendDoesNotReleaseObservedReadsAndTurningItOffAllowsTheNextSend() throws Exception {
        ReadWithoutReceiptSendHooks.SendState state = new ReadWithoutReceiptSendHooks.SendState();
        assertNull(state.onSubmitted(true));
        assertNull(state.record(new ReadExecutor(), 91L));
        assertNull(state.onSubmitted(true));
        assertNull(state.record(new ReadExecutor(), 92L));
        assertEquals(92L, state.onSubmitted(false).readPoint);
        assertNull(state.onSubmitted(false));
    }

    private static void create(Object activity, long savedToken) {
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, "chat", savedToken, 1L,
                true, true, ReadWithoutReceiptHooks.currentSuppression());
    }

    public static final class ReadExecutor {
        public void linimalMarkReadAfterSend(long readPoint, String chatId) {
            throw new AssertionError("状態遷移テストでは LINE bridge を実行しません");
        }
    }
}
