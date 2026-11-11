package dev.utaa.linimal.extension.features.readwithoutreceipt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Test;

public final class ReadWithoutReceiptHooksTest {
    private static final long EXPIRED = ReadWithoutReceiptHooks.SUPPRESSION_TIMEOUT_MILLIS + 1L;

    @After
    public void resetState() {
        ReadWithoutReceiptHooks.resetForTesting();
    }

    private static boolean blocks(String chatId, long now) {
        return ReadWithoutReceiptHooks.shouldBlockGivenEnabled(chatId, now, true);
    }

    private static void create(Object activity, String chatId, long token, long now, boolean registered) {
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, chatId, token, now,
                true, registered, ReadWithoutReceiptHooks.currentSuppression());
    }

    @Test
    public void closingTheChatKeepsBlockingOnlyThatChatForAShortTime() {
        Object activity = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, "chat", 0L, 1L, true, true,
                ReadWithoutReceiptHooks.currentSuppression());
        ReadWithoutReceiptHooks.endActivityObserved(activity, false, true,
                ReadWithoutReceiptHooks.currentSuppression(), 1000L);

        org.junit.Assert.assertNull(ReadWithoutReceiptHooks.currentSuppression());
        org.junit.Assert.assertTrue(ReadWithoutReceiptHooks.isRecentlyEnded(
                "chat", 1000L + ReadWithoutReceiptHooks.ENDED_GRACE_MILLIS - 1));
        org.junit.Assert.assertFalse(ReadWithoutReceiptHooks.isRecentlyEnded("other", 1001L));
        ReadWithoutReceiptHooks.clearRecentlyEnded("other");
        org.junit.Assert.assertTrue(ReadWithoutReceiptHooks.isRecentlyEnded("chat", 1001L));
        org.junit.Assert.assertFalse(ReadWithoutReceiptHooks.isRecentlyEnded(
                "chat", 1000L + ReadWithoutReceiptHooks.ENDED_GRACE_MILLIS));
    }

    @Test
    public void reenteringTheSameChatEndsTheGraceImmediately() {
        Object activity = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, "chat", 0L, 1L, true, true,
                ReadWithoutReceiptHooks.currentSuppression());
        ReadWithoutReceiptHooks.endActivityObserved(activity, false, true,
                ReadWithoutReceiptHooks.currentSuppression(), 1000L);

        ReadWithoutReceiptHooks.clearRecentlyEnded("chat");

        org.junit.Assert.assertFalse(ReadWithoutReceiptHooks.isRecentlyEnded("chat", 1001L));
    }

    private static void endConfirmedSession(boolean fromNotification) {
        Object activity = new Object();
        if (fromNotification) {
            ReadWithoutReceiptHooks.markNotificationSuppressedAt("chat", 0L);
        } else {
            ReadWithoutReceiptHooks.markSuppressedAt("chat", 0L);
        }
        ReadWithoutReceiptHooks.onChatCreatedObserved(activity, "chat", 0L, 1L, true, true,
                ReadWithoutReceiptHooks.currentSuppression());
        ReadWithoutReceiptHooks.endActivityObserved(activity, false, true,
                ReadWithoutReceiptHooks.currentSuppression(), 1000L);
    }

    @Test
    public void disablingBothSourcesDiscardsTheGrace() {
        endConfirmedSession(false);

        ReadWithoutReceiptHooks.clearDisabledSuppression(false, false);

        assertFalse(ReadWithoutReceiptHooks.isRecentlyEnded("chat", 1001L));
    }

    @Test
    public void graceFollowsTheSettingOfItsOwnSource() {
        endConfirmedSession(false);
        assertTrue(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1001L, true, false));
        assertFalse(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1002L, false, true));
        // 一度 OFF で破棄した猶予は、再度 ON にしても復活しません。
        assertFalse(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1003L, true, true));

        endConfirmedSession(true);
        assertTrue(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1001L, false, true));
        assertFalse(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1002L, true, false));
        assertFalse(ReadWithoutReceiptHooks.isRecentlyEndedGivenSources("chat", 1003L, true, true));
    }

    @Test
    public void disablingTheOtherSourceKeepsTheGrace() {
        endConfirmedSession(true);

        ReadWithoutReceiptHooks.clearDisabledSuppression(false, true);
        assertTrue(ReadWithoutReceiptHooks.isRecentlyEnded("chat", 1001L));

        ReadWithoutReceiptHooks.clearDisabledSuppression(true, false);
        assertFalse(ReadWithoutReceiptHooks.isRecentlyEnded("chat", 1002L));
    }

    @Test
    public void pendingBlocksOnlyTheSelectedChatAndExpiresPermanently() {
        assertFalse(blocks("chat-1", 0L));
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        assertTrue(blocks("chat-1", EXPIRED - 1L));
        assertFalse(blocks("chat-2", 0L));
        assertFalse(blocks(null, 0L));
        assertFalse(blocks("chat-1", EXPIRED));
        assertFalse(blocks("chat-1", 0L));
    }

    @Test
    public void confirmedSessionHasNoThirtyMinuteTimeout() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(new Object(), "chat-1", 0L, 1L, true);
        assertTrue(blocks("chat-1", EXPIRED * 10));
    }

    @Test
    public void expiredPendingCannotBecomeConfirmed() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(new Object(), "chat-1", 0L, EXPIRED, true);
        assertFalse(blocks("chat-1", 0L));
    }

    @Test
    public void failedCallbackRegistrationDoesNotPromoteOrRetainPending() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(new Object(), "chat-1", 0L, 1L, false);
        assertFalse(blocks("chat-1", 1L));
        assertFalse(blocks("chat-1", EXPIRED));
    }

    @Test
    public void normalReentryIntoTheSameChatEndsTheOldSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(new Object(), "chat-1", 0L, 1L, true);
        create(new Object(), "chat-1", 0L, 2L, true);
        assertFalse(blocks("chat-1", 2L));
    }

    @Test
    public void enteringAnotherChatEndsTheOldSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(new Object(), "chat-1", 0L, 1L, true);
        create(new Object(), "chat-2", 0L, 2L, true);
        assertFalse(blocks("chat-1", 2L));
        assertFalse(blocks("chat-2", 2L));
    }

    @Test
    public void oldPendingTimeoutCannotClearPromotedSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.Suppression pending = ReadWithoutReceiptHooks.currentSuppression();
        create(new Object(), "chat-1", 0L, 1L, true);
        assertTrue(ReadWithoutReceiptHooks.shouldBlockGivenObserved("chat-1", EXPIRED, pending));
        assertTrue(blocks("chat-1", EXPIRED));
    }

    @Test
    public void oldTimeoutCannotClearNewPendingForTheSameOrAnotherChat() {
        for (String nextChat : new String[] {"chat-1", "chat-2"}) {
            ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
            ReadWithoutReceiptHooks.Suppression pending = ReadWithoutReceiptHooks.currentSuppression();
            ReadWithoutReceiptHooks.markSuppressedAt(nextChat, EXPIRED);
            assertEquals("chat-1".equals(nextChat),
                    ReadWithoutReceiptHooks.shouldBlockGivenObserved("chat-1", EXPIRED, pending));
            assertTrue(blocks(nextChat, EXPIRED));
        }
    }

    @Test
    public void oldCreateSnapshotCannotClearNewSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.Suppression old = ReadWithoutReceiptHooks.currentSuppression();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-2", 1L);
        create(new Object(), "chat-2", 0L, 2L, true);
        ReadWithoutReceiptHooks.onChatCreatedObserved(new Object(), "chat-1", 0L, EXPIRED,
                true, true, old);
        assertTrue(blocks("chat-2", EXPIRED));
    }

    @Test
    public void disabledPendingAndConfirmedNeverReviveAfterReenable() {
        for (boolean confirmed : new boolean[] {false, true}) {
            ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
            if (confirmed) {
                create(new Object(), "chat-1", 0L, 1L, true);
            }
            assertFalse(ReadWithoutReceiptHooks.shouldBlockGivenEnabled(null, 2L, false));
            assertFalse(blocks("chat-1", 2L));
        }
    }

    @Test
    public void disabledCreateClearsStateWithoutReadingTheRequest() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.onChatCreatedRequestObserved(new Object(), new ThrowingRequest(), 0L,
                1L, false, true, ReadWithoutReceiptHooks.currentSuppression());
        assertFalse(blocks("chat-1", 1L));
    }

    @Test
    public void publicClearDiscardsPendingAndConfirmed() {
        for (boolean confirmed : new boolean[] {false, true}) {
            ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
            if (confirmed) {
                create(new Object(), "chat-1", 0L, 1L, true);
            }
            ReadWithoutReceiptHooks.clearSuppression();
            assertFalse(blocks("chat-1", 1L));
        }
    }

    @Test
    public void validatedGetterConfirmsWithoutDependingOnLineTypes() {
        Object activity = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.onChatCreatedRequestObserved(activity, new Request(), 0L, 1L,
                true, true, ReadWithoutReceiptHooks.currentSuppression());
        assertTrue(blocks("chat-1", EXPIRED));
        assertTrue(ReadWithoutReceiptHooks.sessionTokenFor(activity) > 0L);
    }

    @Test
    public void missingInvalidAndThrowingGettersFailOpenAndDiscardTheReservation() {
        for (Object request : new Object[] {null, new Object(), new InvalidRequest(), new ThrowingRequest()}) {
            ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
            ReadWithoutReceiptHooks.onChatCreatedRequestObserved(new Object(), request, 0L, 1L,
                    true, true, ReadWithoutReceiptHooks.currentSuppression());
            assertFalse(blocks("chat-1", 1L));
        }
    }

    @Test
    public void staleGetterFailureCannotDiscardNewSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.Suppression old = ReadWithoutReceiptHooks.currentSuppression();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-2", 1L);
        create(new Object(), "chat-2", 0L, 2L, true);
        ReadWithoutReceiptHooks.onChatCreatedRequestObserved(new Object(), new ThrowingRequest(), 0L,
                2L, true, true, old);
        assertTrue(blocks("chat-2", EXPIRED));
    }

    @Test
    public void uninitializedReadEntryFailsOpenAndDiscardsExistingState() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        assertFalse(ReadWithoutReceiptHooks.shouldBlockMarkAsRead("chat-1"));
        assertFalse(blocks("chat-1", 1L));
    }

    @Test
    public void uninitializedCreateEntryFailsOpenAndDiscardsExistingState() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        ReadWithoutReceiptHooks.onChatCreated(null, null);
        assertFalse(blocks("chat-1", 1L));
    }

    @Test
    public void tokensIncreaseEvenAfterClearingAndResettingState() {
        Object activity = new Object();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(activity, "chat-1", 0L, 1L, true);
        long oldToken = ReadWithoutReceiptHooks.sessionTokenFor(activity);
        ReadWithoutReceiptHooks.resetForTesting();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        create(activity, "chat-1", 0L, 1L, true);
        assertTrue(ReadWithoutReceiptHooks.sessionTokenFor(activity) > oldToken);
        assertEquals(0L, ReadWithoutReceiptHooks.sessionTokenFor(new Object()));
    }

    @Test
    public void sendingEndsConfirmedManualAndNotificationSessionsButNotAnotherChat() {
        for (boolean notification : new boolean[] {false, true}) {
            Object activity = new Object();
            if (notification) {
                ReadWithoutReceiptHooks.markNotificationSuppressedAt("chat-1", 0L);
            } else {
                ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
            }
            create(activity, "chat-1", 0L, 1L, true);
            ReadWithoutReceiptHooks.Suppression session = ReadWithoutReceiptHooks.currentSuppression();
            assertFalse(ReadWithoutReceiptHooks.endConfirmedSuppression("chat-2", session));
            assertTrue(blocks("chat-1", 2L));
            assertTrue(ReadWithoutReceiptHooks.endConfirmedSuppression("chat-1", session));
            assertFalse(blocks("chat-1", 2L));
            assertEquals(0L, ReadWithoutReceiptHooks.sessionTokenFor(activity));
            assertFalse(ReadWithoutReceiptHooks.endConfirmedSuppression("chat-1", session));
        }
    }

    @Test
    public void sendingCannotConsumePendingOrReplaceANewerSession() {
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 0L);
        assertFalse(ReadWithoutReceiptHooks.endConfirmedSuppression(
                "chat-1", ReadWithoutReceiptHooks.currentSuppression()));
        create(new Object(), "chat-1", 0L, 1L, true);
        ReadWithoutReceiptHooks.Suppression old = ReadWithoutReceiptHooks.currentSuppression();
        ReadWithoutReceiptHooks.markSuppressedAt("chat-1", 2L);
        create(new Object(), "chat-1", 0L, 3L, true);
        assertFalse(ReadWithoutReceiptHooks.endConfirmedSuppression("chat-1", old));
        assertTrue(blocks("chat-1", 3L));
    }

    public static final class Request {
        public String getChatId() {
            return "chat-1";
        }
    }

    public static final class InvalidRequest {
        public Object getChatId() {
            return "chat-1";
        }
    }

    public static final class ThrowingRequest {
        public String getChatId() {
            throw new IllegalStateException("request の読み取り失敗");
        }
    }
}
