package dev.utaa.linimal.extension.features.readreceipts;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

import dev.utaa.linimal.extension.config.ReadReceiptMode;

public final class ReadReceiptHooksTest {
    private static final class EqualSupplier {
        @Override
        public boolean equals(Object other) {
            return other instanceof EqualSupplier;
        }

        @Override
        public int hashCode() {
            return 1;
        }
    }

    @After
    public void clearThreadState() {
        ReadReceiptHooks.clearManualInvocation();
        ReadReceiptHooks.clearPreparedSupplier();
    }

    @Test
    public void normalModeAlwaysPreservesOriginalSending() {
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.NORMAL, "chat-a"));
    }

    @Test
    public void manualModeSuppressesAutomaticSending() {
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void manualSupplierAllowsExactlyOneMatchingSend() {
        Object supplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(supplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(supplier, "chat-a");

        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void automaticSupplierCannotConsumeAnotherManualRequest() {
        Object manualSupplier = new Object();
        Object automaticSupplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(manualSupplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(automaticSupplier, "chat-a");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));

        ReadReceiptHooks.prepareSupplier(manualSupplier, "chat-a");
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void supplierRegistrationUsesIdentityRatherThanEquals() {
        Object manualSupplier = new EqualSupplier();
        Object equalAutomaticSupplier = new EqualSupplier();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(manualSupplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(equalAutomaticSupplier, "chat-a");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));

        ReadReceiptHooks.prepareSupplier(manualSupplier, "chat-a");
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void mismatchedChatIdDoesNotReceiveTheAllowance() {
        Object supplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(supplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(supplier, "chat-b");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-b"));
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void clearingPreparedSupplierPreventsAStaleAllowance() {
        Object supplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(supplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(supplier, "chat-a");
        ReadReceiptHooks.clearPreparedSupplier();

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void sentMessageReadOverridesManualModeOnlyOnceForTheSameChat() {
        ReadReceiptHooks.prepareSentMessageRead("chat-a");
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
        ReadReceiptHooks.prepareSentMessageRead("chat-a");
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-b"));
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
        ReadReceiptHooks.prepareSentMessageRead("chat-a");
        ReadReceiptHooks.clearPreparedSupplier();
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    /** 「すべて既読」のループと同じ順序。送信の前に許可し、送信の後に必ず破棄します。 */
    private static boolean[] markAll(ReadReceiptMode mode, String... chatIds) {
        boolean[] suppressed = new boolean[chatIds.length];
        for (int index = 0; index < chatIds.length; index++) {
            ReadReceiptHooks.prepareExplicitRead(chatIds[index]);
            suppressed[index] = ReadReceiptHooks.shouldSuppress(mode, chatIds[index]);
            ReadReceiptHooks.clearPreparedSupplier();
        }
        return suppressed;
    }

    @Test
    public void markAllAllowsEveryChatInTheLoop() {
        boolean[] suppressed = markAll(ReadReceiptMode.MANUAL, "chat-a", "chat-b", "chat-c");

        assertFalse(suppressed[0]);
        assertFalse(suppressed[1]);
        assertFalse(suppressed[2]);
    }

    @Test
    public void markAllDoesNotLeakToAnAutomaticReadAfterTheLoop() {
        markAll(ReadReceiptMode.MANUAL, "chat-a", "chat-b");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-b"));
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void markAllAllowanceDoesNotReachAnotherChat() {
        ReadReceiptHooks.prepareExplicitRead("chat-a");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-b"));
        // 判定した時点で消費され、対象トークの許可としても残りません。
        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void aSenderThatReturnsEarlyLeavesNoAllowanceForTheNextChat() {
        // 既読なし閲覧中のトークは送信先頭で return するため、gate が許可を消費しません。
        ReadReceiptHooks.prepareExplicitRead("session-chat");
        ReadReceiptHooks.clearPreparedSupplier();

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "session-chat"));
    }

    @Test
    public void aFailedSenderLeavesNoAllowance() {
        try {
            ReadReceiptHooks.prepareExplicitRead("chat-a");
            throw new IllegalStateException("送信メソッドの例外");
        } catch (IllegalStateException expected) {
            ReadReceiptHooks.clearPreparedSupplier();
        }

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void markAllAllowanceStaysOnTheCallerThread() throws Exception {
        ReadReceiptHooks.prepareExplicitRead("chat-a");
        boolean[] suppressedOnOtherThread = new boolean[1];
        Thread automaticWorker = new Thread(() -> suppressedOnOtherThread[0] =
                ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
        automaticWorker.start();
        automaticWorker.join();

        assertTrue(suppressedOnOtherThread[0]);
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void markAllDoesNotChangeTheDefaultMode() {
        ReadReceiptHooks.prepareExplicitRead("chat-a");

        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.NORMAL, "chat-a"));
        assertFalse(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.NORMAL, "chat-b"));
    }

    @Test
    public void nullChatIdClearsAnEarlierAllowance() {
        ReadReceiptHooks.prepareExplicitRead("chat-a");
        ReadReceiptHooks.prepareExplicitRead(null);

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void explicitEntryAllowsItsWorkerOnceAcrossThreads() throws Exception {
        // 長押しと通知は caller thread で印を付け、worker thread で supplier を許可へ変換します。
        Object supplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(supplier, "chat-a");
        ReadReceiptHooks.clearManualInvocation();
        boolean[] suppressed = new boolean[2];
        Thread worker = new Thread(() -> {
            ReadReceiptHooks.prepareSupplier(supplier, "chat-a");
            suppressed[0] = ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a");
            // 同じ supplier の再実行は、登録が消費済みなので許可されません。
            ReadReceiptHooks.prepareSupplier(supplier, "chat-a");
            suppressed[1] = ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a");
        });
        worker.start();
        worker.join();

        assertFalse(suppressed[0]);
        assertTrue(suppressed[1]);
    }

    @Test
    public void explicitEntryMarkDoesNotReachAnAutomaticSupplierAfterCleanup() {
        // factory が supplier を作る前に失敗した場合の解除。次の自動 supplier を手動扱いにしません。
        Object automaticSupplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.clearManualInvocation();
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(automaticSupplier, "chat-a");
        ReadReceiptHooks.prepareSupplier(automaticSupplier, "chat-a");

        assertTrue(ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a"));
    }

    @Test
    public void concurrentWorkersCannotExchangeManualAllowances() throws Exception {
        Object firstSupplier = new Object();
        Object secondSupplier = new Object();
        ReadReceiptHooks.beginManualInvocation("chat-a");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(firstSupplier, "chat-a");
        ReadReceiptHooks.beginManualInvocation("chat-b");
        ReadReceiptHooks.registerSupplierFromCurrentInvocation(secondSupplier, "chat-b");

        ExecutorService workers = Executors.newFixedThreadPool(2);
        CountDownLatch prepared = new CountDownLatch(2);
        CountDownLatch send = new CountDownLatch(1);
        try {
            Future<Boolean> first = workers.submit(() -> {
                ReadReceiptHooks.prepareSupplier(firstSupplier, "chat-a");
                prepared.countDown();
                send.await(5, TimeUnit.SECONDS);
                return ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-a");
            });
            Future<Boolean> second = workers.submit(() -> {
                ReadReceiptHooks.prepareSupplier(secondSupplier, "chat-b");
                prepared.countDown();
                send.await(5, TimeUnit.SECONDS);
                return ReadReceiptHooks.shouldSuppress(ReadReceiptMode.MANUAL, "chat-b");
            });

            assertTrue(prepared.await(5, TimeUnit.SECONDS));
            send.countDown();
            assertFalse(first.get(5, TimeUnit.SECONDS));
            assertFalse(second.get(5, TimeUnit.SECONDS));
        } finally {
            workers.shutdownNow();
        }
    }
}
