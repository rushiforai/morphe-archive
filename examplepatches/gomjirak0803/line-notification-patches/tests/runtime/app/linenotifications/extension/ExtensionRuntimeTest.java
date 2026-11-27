package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.RemoteInput;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;
import app.linenotifications.extension.core.NotificationPolicy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import testenv.FakeLineEnv;

/** JVM behavioral regression suite covering review 0.1.17-dev through 0.1.19-dev timing and state scenarios. */
public final class ExtensionRuntimeTest {
    private static final String MESSAGE_TAG = "NOTIFICATION_TAG_MESSAGE";
    private static int checks;

    private ExtensionRuntimeTest() {}

    public static void main(String[] args) {
        try {
            Context context = new Context();
            Settings.init(context);

            testTrailingRefreshPreservesNewerPendingPush(context);
            testTrailingRefreshPreservesPendingGroupSummary(context);
            testUnrelatedSaveDoesNotFlushUnreadyPendingPost(context);
            testPendingTimeoutForcesDeliveryWhenStillUnstored(context);
            testPrivacyAccountAndReadChangesDuringAvatarLoad(context);
            testCancelChatNotificationsRequiresVerifiedAccountStamp(context);
            testHideChatFailureKeepsExistingNotifications(context);
            testChatListCacheInvalidatedOnMessageStoredAtSameTimestamp(context);
            testAccountLookupErrorAndPrivacyOffDuringAvatarLoadSuppressesPlaintext(context);
            testPartialReadDuringAvatarLoadRequeriesAndPreservesRemainingUnread(context);
            testTrailingRefreshDuringInFlightHidePreservesNotificationOnFailure(context);
            testFirstPendingTimeoutDoesNotFlushLaterSlotEarly(context);
            testCancelRoomAPreservesRoomBPendingSummaryOnSharedSlot(context);
            testPendingFlushAndTimeoutRedactWhenPrivacyDisabled(context);
            testInitialAccountLookupFailureDropsManagedNotificationEvenWhenSilentOff(context);
            testCancelChatNotificationsAbortsSummaryRebuildOnAccountSwitch(context);
            testUnhideFailureKeepsRoomHiddenAndBlocksAllowMutedWhileInFlight(context);
            testAccountBoundMuteActionRejectsCrossAccountTap(context);
            testPendingFlushDuringInFlightHidePreservesExistingNotificationAndSharedSummary(context);
            testDoublePartialReadExhaustingRetryDeliversSafeGenericAndSchedulesRefresh(context);
            testStaleActiveSnapshotAfterPendingFlushDoesNotOverwriteNewerMessage(context);
            testSilentBypassRespectsPreviewPrivacyAndMentionQueryExcludesContent(context);
            testInfoOnlySelectionDisablingInfoAndPrivacyWhilePendingRedacts(context);
            testAccountAPendingFlushAfterSwitchToAccountBDoesNotCancelB(context);
            testRedactedStickerAndSummaryStripStickerAndRemoteInputExtras(context);
            testSummaryRebuildAccountSwitchDuringActiveIpcAndPrivacyFailureFallback(context);
            testConcurrentHideDuringAvatarLoadAndCrashRecoveryPendingHide(context);
            testWearableMuteBindingAndAndroid11ExtrasPrecedenceRestore(context);
            testStaleReadEventDoesNotCancelNewerUnreadOrPendingAndPrivacyOffChecksRead(context);
            testSharedSummaryRebuildAndPendingFlushHaveDistinctPublishSeq(context);
            testDelayedActiveListPreventsSummaryCascadeCancelOfRecentRoomBChild(context);
            testPrivacyTurningOffMidTransformRevokesKeywordOnlyBypass(context);
            testPendingFlushItemFailureDoesNotDropRemainingRoomQueue(context);
            testQuietHiddenUnhidePreservesChannelOnNormalAndCrashRecovery(context);
            testReadBoundaryPreSqlGroupCascadeLedgerAndIpcFailure(context);
            testPrivacyOffRedactsVisibleSlotWithPendingAndSummaryFallbackAndHiddenRoom(context);
            testAccountSwitchAfterPendingFlushAndMenuToggleKeepsOriginalAccount(context);
            testStandaloneNoReplyToggleRestoresPhoneAndWearableChoices(context);
            testCrossProcessSlotEpochAndNormalCrashRecoveryChannel(context);
            testReadChecksBeforePreviewFailureMissingIdAndPendingIpcFailure(context);
            testBulkCancelLedgerConflictSummaryPublicShortcutAndSharedPendingOrder(context);
            testPrivacyRefreshSummaryAndAvatarPendingAccountSwitchReconcileAndNoReplyOnly(context);
            testAstraV2BlockersAndLedgerCap(context);
            testAstraV3GroupAStatelessFixes(context);
            testNativeBindings26190(context);

            System.out.println("ExtensionRuntimeTest passed (" + checks + " checks)");
            System.exit(0);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    private static void resetAll(Context context) {
        Handler.resetForTest();
        Notifications.clearRuntimeStateForTest();
        ChatNotifications.clearRuntimeStateForTest();
        Settings.clearRuntimeStateForTest();
        Handler.resetForTest();
        context.resetForTest();
        FakeLineEnv.reset();
        Log.clearForTest();
        Toast.resetForTest();
        NativeLine.clearChatListPreviewCache();
        Settings.test_rowIncluded = true;
        Settings.test_silentIncluded = true;
        Settings.test_infoIncluded = true;
        Settings.test_noReplyIncluded = true;
        Settings.test_readIncluded = true;
        Notification.android11ExtrasPrecedenceForTest = true;
    }

    private static void awaitLogContains(String fragment) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 3000L;
        while (System.currentTimeMillis() < deadline) {
            for (String line : Log.messagesForTest()) {
                if (line.contains(fragment)) {
                    syncWithNotificationsMonitor();
                    return;
                }
            }
            Thread.sleep(2L);
        }
        throw new AssertionError("Timed out waiting for log fragment: " + fragment + "; logs=" + Log.messagesForTest());
    }

    private static void awaitCallback(java.util.function.BooleanSupplier done) throws InterruptedException {
        long deadline = System.currentTimeMillis() + 3000L;
        while (System.currentTimeMillis() < deadline) {
            Handler.drainImmediateForTest();
            if (done.getAsBoolean()) return;
            Thread.sleep(2L);
        }
        throw new AssertionError("Timed out waiting for async callback");
    }

    private static void syncWithNotificationsMonitor() {
        Notifications.flushWorkerForTest();
    }

    private static Notification msgNotification(String chatId, String msgId, String title, String text) {
        return msgNotification(chatId, msgId, title, text, "NOTIFICATION_GROUP_MESSAGE", false, null);
    }

    private static Notification msgNotification(String chatId, String msgId, String title, String text,
                                                String group, boolean summary, String account) {
        Notification n = new Notification();
        Bundle extras = new Bundle();
        extras.putString("line.chat.id", chatId);
        if (msgId != null) extras.putString("line.message.id", msgId);
        if (account != null) extras.putString(Notifications.ACCOUNT, account);
        extras.putCharSequence(Notification.EXTRA_TITLE, title);
        extras.putCharSequence(Notification.EXTRA_TEXT, text);
        n.extras = extras;
        n.setGroupForTest(group);
        if (summary) n.flags |= Notification.FLAG_GROUP_SUMMARY;
        n.contentIntent = PendingIntent.getActivity(null, 1, new Intent("test.chat").putExtra("chatId", chatId), 0);
        return n;
    }

    private static String chatId(char prefix, int num) {
        return String.format(java.util.Locale.US, "%c%032x", prefix, num);
    }

    private static List<String> deliveredMessageIds(NotificationManager manager) {
        List<String> ids = new ArrayList<String>();
        for (NotificationManager.NotifyRecord r : manager.getNotifyHistoryForTest()) {
            ids.add(r.messageId);
        }
        return ids;
    }

    private static void testTrailingRefreshPreservesNewerPendingPush(Context context) throws Exception {
        resetAll(context);
        String chat = chatId('u', 101);
        int slotId = 10101;
        Settings.setEnabled(Settings.INFO, true);
        NotificationManager manager = context.getSystemService(NotificationManager.class);

        FakeLineEnv.CONTACTS.put("u_peer_1", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 1001L, "u_peer_1", "First message", null, null);

        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "101", "Alice", "First message"));
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("101")),
                "Initial stored message 101 should be delivered once");

        // Second push arrives on the same slot before local DB save commits.
        FakeLineEnv.CHATS.get(chat).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "102", "Alice", "Second message"));
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("101")),
                "Unstored message 102 should be held pending");

        // Fire 101's 400ms trailing refresh before 102 is saved.
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(Log.messagesForTest().toString().contains("refresh skipped for pending slot"),
                "Trailing refresh should skip slot currently holding pending message 102");
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("101")),
                "Trailing refresh must not re-deliver 101 or evict 102");

        // Local save commits 102: flushes 102 first (fresh alert), skipping redundant immediate refresh.
        FakeLineEnv.addMessage(chat, "102", 1002L, "u_peer_1", "Second message", null, null);
        Notifications.onMessageStored(chat);
        List<NotificationManager.NotifyRecord> history = manager.getNotifyHistoryForTest();
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("101", "102")),
                "Expected [101, 102] after save flush without duplicate immediate refresh, got "
                        + deliveredMessageIds(manager));
        check((history.get(1).notification.flags & Notification.FLAG_ONLY_ALERT_ONCE) == 0,
                "Flushed push 102 must preserve fresh notification alert behavior");

        // Trailing refresh of 102 still keeps ONLY_ALERT_ONCE when it fires 400ms later.
        Log.clearForTest();
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        history = manager.getNotifyHistoryForTest();
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("101", "102", "102")),
                "Expected [101, 102, 102] after trailing refresh, got " + deliveredMessageIds(manager));
        check((history.get(2).notification.flags & Notification.FLAG_ONLY_ALERT_ONCE) != 0,
                "Post-save trailing refresh of 102 must stay alert-once");
        Notification active102 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check("102".equals(active102.extras.getString("line.message.id"))
                        && "Second message".equals(String.valueOf(active102.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Active notification must reflect message 102");
    }

    private static void testTrailingRefreshPreservesPendingGroupSummary(Context context) throws Exception {
        resetAll(context);
        String chatA = chatId('u', 102);
        int childId = 10201;
        int summaryId = 16880000;
        Settings.setEnabled(Settings.INFO, true);
        NotificationManager manager = context.getSystemService(NotificationManager.class);

        FakeLineEnv.CONTACTS.put("u_peer_a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chatA, new FakeLineEnv.ChatRow("Alice", "500", 1, false));
        FakeLineEnv.addMessage(chatA, "501", 2001L, "u_peer_a", "Msg 501", null, null);

        Notifications.post(manager, MESSAGE_TAG, childId, msgNotification(chatA, "501", "Alice", "Msg 501"));
        Notifications.post(manager, null, summaryId,
                msgNotification(chatA, "501", "Alice", "Msg 501", "NOTIFICATION_GROUP_MESSAGE", true, null));

        // Second single-room push queues on both child and summary slots before DB save.
        FakeLineEnv.CHATS.get(chatA).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, childId, msgNotification(chatA, "502", "Alice", "Msg 502"));
        Notifications.post(manager, null, summaryId,
                msgNotification(chatA, "502", "Alice", "Msg 502", "NOTIFICATION_GROUP_MESSAGE", true, null));

        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(Log.messagesForTest().toString().contains("refresh skipped for pending slot"),
                "Trailing refresh must skip pending child and summary slots");
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("501", "501")),
                "Trailing refresh must not re-deliver 501 on either child or summary slot; got="
                        + deliveredMessageIds(manager) + " logs=" + Log.messagesForTest());

        FakeLineEnv.addMessage(chatA, "502", 2002L, "u_peer_a", "Msg 502", null, null);
        Notifications.onMessageStored(chatA);
        Notification activeChild = manager.getActiveSlotForTest(MESSAGE_TAG, childId).getNotification();
        Notification activeSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check("502".equals(activeChild.extras.getString("line.message.id"))
                        && "502".equals(activeSummary.extras.getString("line.message.id")),
                "Both child and summary must flush 502 cleanly on save; got " + deliveredMessageIds(manager));
    }

    private static void testUnrelatedSaveDoesNotFlushUnreadyPendingPost(Context context) throws Exception {
        resetAll(context);
        String chat = chatId('u', 201);
        int slotId = 20101;
        Settings.setEnabled(Settings.INFO, true);
        NotificationManager manager = context.getSystemService(NotificationManager.class);

        FakeLineEnv.CONTACTS.put("u_peer_2", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Bob", "200", 1, false));

        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "203", "Bob", "Placeholder"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "Message 203 should initially be held pending");

        // An earlier/other message 202 saves in the same room while 203 is still missing from DB.
        FakeLineEnv.addMessage(chat, "202", 3001L, "u_peer_2", "Other message", null, null);
        Notifications.onMessageStored(chat);
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Unrelated save of 202 must not prematurely flush unstored 203");
        check(Log.messagesForTest().toString().contains("pending retained after unrelated save")
                        && Handler.pendingCountForTest() >= 1,
                "Pending timeout should remain scheduled for unready item 203; pending="
                        + Handler.pendingDelaysForTest());

        // Even if the 400ms trailing refresh runs before 203 is stored, 203 stays held.
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "400ms refresh must not bypass hold for unstored 203");

        // Now 203 itself is stored.
        FakeLineEnv.CHATS.get(chat).unread = 2;
        FakeLineEnv.addMessage(chat, "203", 3002L, "u_peer_2", "Rich message 203", null, null);
        Notifications.onMessageStored(chat);
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("203")),
                "Message 203 should flush once its own DB row exists; got " + deliveredMessageIds(manager));
    }

    private static void testPendingTimeoutForcesDeliveryWhenStillUnstored(Context context) throws Exception {
        resetAll(context);
        String chat = chatId('u', 202);
        int slotId = 20201;
        Settings.setEnabled(Settings.INFO, true);
        NotificationManager manager = context.getSystemService(NotificationManager.class);

        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Bob", "200", 1, false));
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "204", "Bob", "Fallback 204"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "Message 204 should be held initially");

        Handler.advanceByForTest(1200L);
        awaitLogContains("post: delivered to Android");
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("204")),
                "Timeout expiry must force-deliver held notification 204");
    }

    private static void testPrivacyAccountAndReadChangesDuringAvatarLoad(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_sender_1", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));

        // Case 3a: LINE preview privacy turns OFF during avatar lookup (verified active slot is canceled).
        String group1 = chatId('c', 301);
        FakeLineEnv.CHATS.put(group1, new FakeLineEnv.ChatRow("Group A", "300", 1, false));
        FakeLineEnv.addMessage(group1, "301", 4001L, "u_sender_1", "Private message 301", null, null);
        manager.putActiveForTest(MESSAGE_TAG, 30101,
                msgNotification(group1, "300", "Group A", "Previous 300", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.previewsAllowed = false;
        Notifications.post(manager, MESSAGE_TAG, 30101, msgNotification(group1, "301", "Group A", "Plaintext"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#30101"),
                "Turning off LINE preview privacy during avatar load must suppress plaintext post and cancel verified slot; notified="
                        + deliveredMessageIds(manager) + " canceled=" + manager.getCancelHistoryForTest()
                        + " logs=" + Log.messagesForTest());

        // Case 3a-empty: Absent/unverified slot is NOT blindly canceled when privacy turns OFF.
        FakeLineEnv.previewsAllowed = true;
        manager.resetForTest();
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.previewsAllowed = false;
        Notifications.post(manager, MESSAGE_TAG, 30105, msgNotification(group1, "301", "Group A", "Plaintext"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().isEmpty(),
                "Turning off privacy on an unverified absent slot must not issue a blind cancel");

        // Case 3b: Chat is marked read during avatar lookup (verified active slot <= readUp is canceled).
        FakeLineEnv.previewsAllowed = true;
        manager.resetForTest();
        manager.putActiveForTest(MESSAGE_TAG, 30102,
                msgNotification(group1, "300", "Group A", "Old 300", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        FakeLineEnv.CHATS.get(group1).unread = 1;
        FakeLineEnv.CHATS.get(group1).readUp = "300";
        FakeLineEnv.onAvatarLoad = () -> {
            FakeLineEnv.ChatRow row = FakeLineEnv.CHATS.get(group1);
            row.unread = 0;
            row.readUp = "301";
        };
        Notifications.post(manager, MESSAGE_TAG, 30102, msgNotification(group1, "301", "Group A", "Plaintext"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#30102"),
                "Reading the chat during avatar load must suppress stale preview post and cancel verified slot");

        // Case 3c: Active account changes during avatar lookup without canceling new account's slot.
        FakeLineEnv.activeAccount = "u_acc_1";
        manager.resetForTest();
        manager.putActiveForTest(MESSAGE_TAG, 30103,
                msgNotification(group1, "299", "Group A", "Account 2 active", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_2"));
        FakeLineEnv.CHATS.get(group1).unread = 1;
        FakeLineEnv.CHATS.get(group1).readUp = "300";
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.activeAccount = "u_acc_2";
        Notifications.post(manager, MESSAGE_TAG, 30103, msgNotification(group1, "301", "Group A", "Plaintext"));
        Notification survivingAcc2 = manager.getActiveSlotForTest(MESSAGE_TAG, 30103).getNotification();
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && !manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#30103")
                        && survivingAcc2 != null
                        && "u_acc_2".equals(survivingAcc2.extras.getString(Notifications.ACCOUNT)),
                "Account change during avatar load must discard stale post without canceling target slot");

        // Case 3d: More Chat Info turns OFF during avatar lookup (falls back without MessagingStyle).
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.previewsAllowed = true;
        manager.resetForTest();
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CHATS.get(group1).unread = 1;
        FakeLineEnv.CHATS.get(group1).readUp = "300";
        FakeLineEnv.onAvatarLoad = () -> Settings.prefs().edit().putBoolean(Settings.INFO, false).apply();
        Notifications.post(manager, MESSAGE_TAG, 30104, msgNotification(group1, "301", "Group A", "Native fallback"));
        Notification delivered30104 = manager.getActiveSlotForTest(MESSAGE_TAG, 30104).getNotification();
        check(delivered30104 != null
                        && !"android.app.Notification$MessagingStyle".equals(
                                delivered30104.extras.getString(Notification.EXTRA_TEMPLATE)),
                "Disabling More Chat Info during avatar load must fall back without expanded MessagingStyle");
    }

    private static void testCancelChatNotificationsRequiresVerifiedAccountStamp(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chat = chatId('c', 401);
        String group = "NOTIFICATION_GROUP_MESSAGE";

        manager.putActiveForTest(MESSAGE_TAG, 401, msgNotification(chat, "41", "Legacy", "No account", group, false, null));
        manager.putActiveForTest(MESSAGE_TAG, 402, msgNotification(chat, "42", "Foreign", "Other acc", group, false, "u_acc_2"));
        manager.putActiveForTest(MESSAGE_TAG, 403, msgNotification(chat, "43", "Current", "Active acc", group, false, "u_acc_1"));
        manager.putActiveForTest(null, 404, msgNotification(chat, "43", "Current", "Summary acc1", group, true, "u_acc_1"));
        manager.putActiveForTest(null, 405, msgNotification(chat, "41", "Legacy", "Unstamped summary", null, true, null));

        Notifications.cancelChatNotifications(manager, "u_acc_1", chat);

        check(manager.getActiveSlotForTest(MESSAGE_TAG, 403) == null,
                "Active account notification should be canceled");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 401) != null,
                "Unstamped notification (ACCOUNT=null) must NOT be canceled");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 402) != null,
                "Foreign account notification must NOT be canceled");
        check(manager.getActiveSlotForTest(null, 405) != null,
                "Unstamped summary (ACCOUNT=null) must NOT be canceled");
        Notification summary404 = manager.getActiveSlotForTest(null, 404).getNotification();
        check(summary404 != null && (summary404.flags & Notification.FLAG_GROUP_SUMMARY) != 0
                        && summary404.extras.getString("line.chat.id") == null,
                "Summary 404 must remain generic because unstamped/foreign children stay active");

        // Also check pruneHiddenNotifications when re-enabling SILENT.
        Settings.setMuted("u_acc_1", chat, "Room 4", true);
        manager.putActiveForTest(MESSAGE_TAG, 406, msgNotification(chat, "46", "Legacy", "No account", group, false, null));
        manager.putActiveForTest(MESSAGE_TAG, 407, msgNotification(chat, "47", "Current", "Active acc", group, false, "u_acc_1"));
        Settings.setEnabled(Settings.SILENT, true);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 407) == null,
                "pruneHiddenNotifications should cancel verified active-account hidden notification");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 406) != null,
                "pruneHiddenNotifications must keep unstamped notification intact");
    }

    private static void testHideChatFailureKeepsExistingNotifications(Context context) throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chat = chatId('c', 501);
        Settings.setEnabled(Settings.SILENT, true);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Room 5", "500", 1, false));
        manager.putActiveForTest(MESSAGE_TAG, 501,
                msgNotification(chat, "501", "Room 5", "Existing msg", null, false, "u_acc_1"));

        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> callbackResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, callbackResult::set);

        check(muteCalled.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred native hide call");
        List<FakeLineEnv.NativeMuteCall> calls = FakeLineEnv.getNativeMuteCallsSnapshot();
        check(calls.size() == 1 && !calls.get(0).desiredEnabled,
                "Native mute call should be in flight with desiredEnabled=false");
        check(!Settings.fullyMuted("u_acc_1", chat)
                        && ChatNotifications.isHideInFlight("u_acc_1", chat)
                        && Notifications.allowMuted(new ke8.z(), chat),
                "Persisted hidden flag must wait for native commit while allowMuted lets incoming pushes reach DEFER_HIDE");
        // Incoming push while hide is in flight must be invisibly deferred (not delivered or dropped).
        Notifications.post(manager, MESSAGE_TAG, 502,
                msgNotification(chat, "502", "Room 5", "During hide msg"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 502) == null,
                "Incoming message during in-flight hide must be held invisibly until native hide settles");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) != null,
                "Existing notification 501 must NOT be canceled before native mute succeeds");

        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> callbackResult.get() != null);
        awaitLogContains("hide: aborted, pending re-evaluated");
        check(Boolean.FALSE.equals(callbackResult.get()), "Callback should report failure");
        check(!Settings.fullyMuted("u_acc_1", chat), "Local hidden preference must roll back on failure");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) != null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 502) != null,
                "Existing notification 501 must remain intact and deferred message 502 must recover after hide failure");

        // Now complete successfully.
        FakeLineEnv.deferNativeMuteCallback = false;
        FakeLineEnv.nextNativeMuteSuccess = true;
        AtomicReference<Boolean> secondResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, secondResult::set);
        awaitCallback(() -> secondResult.get() != null);
        check(Boolean.TRUE.equals(secondResult.get()), "Second hide request should succeed");
        check(Settings.fullyMuted("u_acc_1", chat), "Room should be marked fully hidden on success");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) == null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 502) == null,
                "Existing notifications 501 and 502 should be canceled after native mute succeeds");
    }

    private static void testChatListCacheInvalidatedOnMessageStoredAtSameTimestamp(Context context) {
        resetAll(context);
        String chat = chatId('u', 601);
        long sameTs = 1700000000000L;
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Room 6", "600", 1, false));
        FakeLineEnv.addMessage(chat, "601", sameTs, "u_peer_6", null, Integer.valueOf(14), "FILE_NAME\tone.pdf");

        String first = Settings.chatListLastMessage(chat, "[File]", Long.valueOf(sameTs), false);
        check("[File] one.pdf".equals(first), "Expected first file label, got " + first);

        // Second file arrives at exact same millisecond with identical LINE placeholder text.
        FakeLineEnv.addMessage(chat, "602", sameTs, "u_peer_6", null, Integer.valueOf(14), "FILE_NAME\ttwo.pdf");
        Notifications.onMessageStored(chat);

        String second = Settings.chatListLastMessage(chat, "[File]", Long.valueOf(sameTs), false);
        check("[File] two.pdf".equals(second),
                "Chat-list cache must be invalidated on message save; got " + second);
    }

    private static void testAccountLookupErrorAndPrivacyOffDuringAvatarLoadSuppressesPlaintext(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_sender_1", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));

        String group = chatId('c', 701);
        FakeLineEnv.CHATS.put(group, new FakeLineEnv.ChatRow("Group 701", "700", 1, false));
        FakeLineEnv.addMessage(group, "701", 7001L, "u_sender_1", "DB latest", null, null);
        FakeLineEnv.onAvatarLoad = () -> {
            FakeLineEnv.previewsAllowed = false;
            FakeLineEnv.activeAccount = "";
        };

        Notifications.post(manager, MESSAGE_TAG, 70101, msgNotification(group, "701", "Group 701", "native body 701"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 70101) == null,
                "Account lookup failure + privacy OFF during avatar load must suppress native plaintext; notified="
                        + deliveredMessageIds(manager));
    }

    private static void testPartialReadDuringAvatarLoadRequeriesAndPreservesRemainingUnread(Context context) {
        for (boolean android11Precedence : new boolean[]{true, false}) {
            resetAll(context);
            Notification.android11ExtrasPrecedenceForTest = android11Precedence;
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            Settings.setEnabled(Settings.INFO, true);
            FakeLineEnv.CONTACTS.put("u_sender_1", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));

            String group = chatId('c', 702);
            FakeLineEnv.CHATS.put(group, new FakeLineEnv.ChatRow("Group B", "100", 2, false));
            FakeLineEnv.addMessage(group, "101", 8001L, "u_sender_1", "First 101", null, null);
            FakeLineEnv.addMessage(group, "102", 8002L, "u_sender_1", "Second 102", null, null);
            manager.putActiveForTest(MESSAGE_TAG, 70201,
                    msgNotification(group, "101", "Group B", "First 101", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));

            AtomicBoolean synced = new AtomicBoolean(false);
            FakeLineEnv.onAvatarLoad = () -> {
                if (synced.compareAndSet(false, true)) {
                    FakeLineEnv.ChatRow row = FakeLineEnv.CHATS.get(group);
                    row.unread = 1;
                    row.readUp = "101";
                }
            };

            Notification input = msgNotification(group, "102", "Stale Native Title 101", "native body 102");
            Bundle staleHist = new Bundle();
            staleHist.putCharSequence("text", "First 101");
            input.extras.putParcelableArray(Notification.EXTRA_HISTORIC_MESSAGES, new android.os.Parcelable[]{staleHist});
            Notifications.post(manager, MESSAGE_TAG, 70201, input);
            check(manager.getActiveSlotForTest(MESSAGE_TAG, 70201) != null
                            && !manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#70201"),
                    "Partial read leaving message 102 unread must not cancel the chat notification");
            Notification delivered = manager.getActiveSlotForTest(MESSAGE_TAG, 70201).getNotification();
            android.os.Parcelable[] packed = delivered.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
            android.os.Parcelable[] historic = delivered.extras.getParcelableArray(Notification.EXTRA_HISTORIC_MESSAGES);
            String renderedTitle = String.valueOf(delivered.extras.getCharSequence(Notification.EXTRA_TITLE, ""));
            check("102".equals(delivered.extras.getString("line.message.id"))
                            && "Group B  [1]".equals(String.valueOf(delivered.extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE)))
                            && !renderedTitle.contains("Stale Native Title 101")
                            && "Second 102".equals(String.valueOf(delivered.extras.getCharSequence(Notification.EXTRA_TEXT)))
                            && !"First 101".equals(String.valueOf(delivered.extras.getCharSequence(Notification.EXTRA_TEXT)))
                            && historic == null
                            && packed != null && packed.length == 1
                            && "Second 102".equals(String.valueOf(((Bundle) packed[0]).getCharSequence("text"))),
                    "Partial read retry must drop stale title/historic messages and render remaining unread [1] with 102 only (a11="
                            + android11Precedence + "); title=" + renderedTitle
                            + " convTitle=" + delivered.extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE)
                            + " msgs=" + (packed == null ? -1 : packed.length));
        }
    }

    private static void testTrailingRefreshDuringInFlightHidePreservesNotificationOnFailure(Context context) throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chat = chatId('c', 703);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_sender_3", new FakeLineEnv.ContactRow("Carol", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Room 703", "702", 1, false));
        FakeLineEnv.addMessage(chat, "703", 9001L, "u_sender_3", "Msg 703", null, null);

        Notifications.post(manager, MESSAGE_TAG, 70301, msgNotification(chat, "703", "Room 703", "Msg 703"));
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 70301) != null, "Initial notification 703 should be active");

        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> result = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, result::set);

        check(muteCalled.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred hide call");

        // Fire 400ms trailing refresh while HIDDEN change is still awaiting native callback.
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(Log.messagesForTest().toString().contains("refresh skipped while hide in flight"),
                "Trailing refresh must skip room with hide request in flight");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 70301) != null,
                "Active notification 703 must stay intact while hide is in flight");

        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> result.get() != null);
        check(Boolean.FALSE.equals(result.get())
                        && !Settings.fullyMuted("u_acc_1", chat)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 70301) != null,
                "Failed hide after trailing refresh must keep existing notification intact");

        FakeLineEnv.deferNativeMuteCallback = false;
        FakeLineEnv.nextNativeMuteSuccess = true;
        AtomicReference<Boolean> secondResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, secondResult::set);
        awaitCallback(() -> secondResult.get() != null);
        check(Boolean.TRUE.equals(secondResult.get())
                        && Settings.fullyMuted("u_acc_1", chat)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 70301) == null,
                "Successful retry of hide must cancel existing notification");
    }

    private static void testFirstPendingTimeoutDoesNotFlushLaterSlotEarly(Context context) throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chat = chatId('u', 704);
        int summaryId = 16880000;
        int childId = 70401;
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_7", new FakeLineEnv.ContactRow("Dave", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Dave", "100", 2, false));

        // Hold summary 101 at t=0, then 900ms later hold child 102 in the same room.
        Notifications.post(manager, null, summaryId,
                msgNotification(chat, "101", "Dave", "Placeholder 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Handler.advanceByForTest(900L);
        Notifications.post(manager, MESSAGE_TAG, childId,
                msgNotification(chat, "102", "Dave", "Placeholder 102", "NOTIFICATION_GROUP_MESSAGE", false, null));
        check(manager.getNotifyHistoryForTest().isEmpty(), "Both 101 and 102 should be held pending");

        // Advance remaining 300ms to t=1200ms: only 101's 1.2s deadline expired; 102 still has ~900ms left.
        Handler.advanceByForTest(300L);
        awaitLogContains("pending partial timeout flushed");
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("101")),
                "First timeout must flush only expired item 101, not 102; got " + deliveredMessageIds(manager));

        // 300ms later (t=1500ms, still before 102's 2100ms deadline), 102 commits to DB cleanly.
        Handler.advanceByForTest(300L);
        FakeLineEnv.addMessage(chat, "101", 9101L, "u_peer_7", "Rich 101", null, null);
        FakeLineEnv.addMessage(chat, "102", 9102L, "u_peer_7", "Rich 102", null, null);
        Notifications.onMessageStored(chat);
        Notification activeChild = manager.getActiveSlotForTest(MESSAGE_TAG, childId).getNotification();
        check(activeChild != null
                        && "102".equals(activeChild.extras.getString("line.message.id"))
                        && "Rich 102".equals(String.valueOf(activeChild.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Retained child 102 must deliver rich DB content when stored");

        // Exact boundary check with no DB save event: 104 queued at t=900 must remain held at t=2099
        // and force-deliver once at t=2100.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        String chatB = chatId('u', 714);
        int childB = 71401;
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CHATS.put(chatB, new FakeLineEnv.ChatRow("Eve", "100", 2, false));
        Notifications.post(manager, null, summaryId,
                msgNotification(chatB, "103", "Eve", "Placeholder 103", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Handler.advanceByForTest(900L);
        Notifications.post(manager, MESSAGE_TAG, childB,
                msgNotification(chatB, "104", "Eve", "Placeholder 104", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Handler.advanceByForTest(300L);
        awaitLogContains("pending partial timeout flushed");
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("103")),
                "Expected only 103 at t=1200, got " + deliveredMessageIds(manager));

        Handler.advanceByForTest(899L);
        syncWithNotificationsMonitor();
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("103")),
                "Message 104 must remain held at t=2099ms (1ms before deadline); got " + deliveredMessageIds(manager));

        Handler.advanceByForTest(1L);
        awaitLogContains("pending timeout flushed");
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("103", "104")),
                "Message 104 must force-deliver once at t=2100ms; got " + deliveredMessageIds(manager));
    }

    private static void testCancelRoomAPreservesRoomBPendingSummaryOnSharedSlot(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String roomA = chatId('u', 705);
        String roomB = chatId('u', 706);
        int summaryId = 16880000;
        int childB = 70601;
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CONTACTS.put("u_peer_b", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "700", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Bob", "700", 1, false));

        // Only Room A's summary is active on screen while Room B's child and summary both await DB save.
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomA, "705", "Alice", "Old Room A summary", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        Notifications.post(manager, MESSAGE_TAG, childB,
                msgNotification(roomB, "706", "Bob", "Room B placeholder", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "706", "Bob", "Room B placeholder", "NOTIFICATION_GROUP_MESSAGE", true, null));

        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        check(manager.getActiveSlotForTest(null, summaryId) == null,
                "Canceling Room A must clear Room A's stale summary from screen immediately");

        FakeLineEnv.addMessage(roomB, "706", 9201L, "u_peer_b", "Room B stored text", null, null);
        Notifications.onMessageStored(roomB);
        Notification activeChildB = manager.getActiveSlotForTest(MESSAGE_TAG, childB).getNotification();
        Notification activeSummaryB = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(activeChildB != null && "706".equals(activeChildB.extras.getString("line.message.id")),
                "Room B child must flush cleanly on Room B save");
        check(activeSummaryB != null
                        && roomB.equals(activeSummaryB.extras.getString("line.chat.id"))
                        && "706".equals(activeSummaryB.extras.getString("line.message.id"))
                        && "Room B stored text".equals(String.valueOf(activeSummaryB.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Room B pending summary on shared slot must survive Room A cancel and flush cleanly");
    }

    private static void assertAllRedacted(NotificationManager manager, String... forbiddenFragments) {
        for (NotificationManager.NotifyRecord rec : manager.getNotifyHistoryForTest()) {
            Notification n = rec.notification;
            String title = String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TITLE, ""));
            String text = String.valueOf(n.extras.getCharSequence(Notification.EXTRA_TEXT, ""));
            check(!"android.app.Notification$MessagingStyle".equals(n.extras.getString(Notification.EXTRA_TEMPLATE))
                            && n.extras.getParcelableArray(Notification.EXTRA_MESSAGES) == null
                            && n.extras.getParcelableArray(Notification.EXTRA_HISTORIC_MESSAGES) == null
                            && n.getLargeIcon() == null,
                    "Delivered redacted notification must drop style/messages/largeIcon; title=" + title + " text=" + text);
            check("LINE".equals(title) && "You have a new message.".equals(text),
                    "Redacted notification must replace title/text cleanly; got " + title + " / " + text);
            if (n.publicVersion != null) {
                String pTitle = String.valueOf(n.publicVersion.extras.getCharSequence(Notification.EXTRA_TITLE, ""));
                String pText = String.valueOf(n.publicVersion.extras.getCharSequence(Notification.EXTRA_TEXT, ""));
                check("LINE".equals(pTitle) && "You have a new message.".equals(pText)
                                && n.publicVersion.getLargeIcon() == null,
                        "publicVersion must also be redacted; got " + pTitle + " / " + pText);
            }
            for (String secret : forbiddenFragments) {
                check(!title.contains(secret) && !text.contains(secret)
                                && !String.valueOf(n.tickerText).contains(secret),
                        "Leaked secret fragment '" + secret + "' in notification history");
            }
        }
    }

    private static void testPendingFlushAndTimeoutRedactWhenPrivacyDisabled(Context context) throws Exception {
        // Case A: Pending hold started with previews ON, then privacy turns OFF before local save.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chatA = chatId('u', 801);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_8a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chatA, new FakeLineEnv.ChatRow("Alice", "800", 1, false));
        Icon fakeLarge = Icon.createWithBitmap(Bitmap.createBitmap(4, 4, null));

        Notification inputA = msgNotification(chatA, "801", "Alice", "Secret pending 801");
        inputA.setLargeIconForTest(fakeLarge);
        inputA.publicVersion = msgNotification(chatA, "801", "Alice", "Pub Secret 801");
        Notifications.post(manager, MESSAGE_TAG, 80101, inputA);
        check(manager.getNotifyHistoryForTest().isEmpty(), "801 should be held pending");

        FakeLineEnv.previewsAllowed = false;
        FakeLineEnv.addMessage(chatA, "801", 10001L, "u_peer_8a", "DB Secret 801", null, null);
        Notifications.onMessageStored(chatA);
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(manager.getNotifyHistoryForTest().size() >= 1, "Redacted notification should be posted on save");
        assertAllRedacted(manager, "Secret pending 801", "Pub Secret 801", "DB Secret 801", "Alice");

        // Case B: Timeout forced delivery when privacy turned OFF while held.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        String chatB = chatId('u', 802);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CHATS.put(chatB, new FakeLineEnv.ChatRow("Bob", "800", 1, false));
        Notification inputB = msgNotification(chatB, "802", "Bob", "Timeout secret 802");
        inputB.setLargeIconForTest(fakeLarge);
        inputB.publicVersion = msgNotification(chatB, "802", "Bob", "Pub Timeout 802");
        Notifications.post(manager, MESSAGE_TAG, 80201, inputB);
        check(manager.getNotifyHistoryForTest().isEmpty(), "802 should be held pending");

        FakeLineEnv.previewsAllowed = false;
        Handler.advanceByForTest(1200L);
        awaitLogContains("post: delivered to Android");
        check(manager.getNotifyHistoryForTest().size() == 1, "Redacted notification must post at timeout");
        assertAllRedacted(manager, "Timeout secret 802", "Pub Timeout 802", "Bob");

        // Case C: Privacy lookup fails at timeout -> fail-closed drop (never publish native plaintext).
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        String chatC = chatId('u', 803);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CHATS.put(chatC, new FakeLineEnv.ChatRow("Carol", "800", 1, false));
        Notifications.post(manager, MESSAGE_TAG, 80301, msgNotification(chatC, "803", "Carol", "Throw secret 803"));
        FakeLineEnv.throwOnPreviewsAllowed = true;
        Handler.advanceByForTest(1200L);
        awaitLogContains("post: discarded unverifiable state");
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Failed privacy lookup at timeout must drop held notification cleanly");
    }

    private static void testInitialAccountLookupFailureDropsManagedNotificationEvenWhenSilentOff(Context context) {
        // INFO=true, SILENT=false with no active account.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        Settings.setEnabled(Settings.SILENT, false);
        FakeLineEnv.activeAccount = "";
        String chatA = chatId('u', 811);
        Notifications.post(manager, MESSAGE_TAG, 81101, msgNotification(chatA, "811", "Alice", "Secret 811"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 81101) == null,
                "Managed INFO post must drop fail-closed when initial account lookup fails even with SILENT off");

        // Snooze active + SILENT=false with no active account.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, false);
        Settings.setEnabled(Settings.INFO, false);
        String chatB = chatId('u', 812);
        Settings.snooze("u_acc_1", chatB, NotificationPolicy.SNOOZE_1H_MILLIS);
        FakeLineEnv.activeAccount = "";
        Notifications.post(manager, MESSAGE_TAG, 81201, msgNotification(chatB, "812", "Bob", "Secret 812"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 81201) == null,
                "Snoozed chat must drop fail-closed when initial account lookup fails");
    }

    private static void testCancelChatNotificationsAbortsSummaryRebuildOnAccountSwitch(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String roomA = chatId('u', 821);
        String roomB = chatId('u', 822);
        int summaryId = 16880000;
        manager.putActiveForTest(MESSAGE_TAG, 82101,
                msgNotification(roomA, "821", "Alice", "Room A text", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 82201,
                msgNotification(roomB, "822", "Bob", "Account A private text", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notification summary = msgNotification(null, null, "LINE", "2 new messages", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        summary.extras.putBoolean("line_notification_patches.generic_summary", true);
        manager.putActiveForTest(null, summaryId, summary);

        // Switch account inside previewsAllowed check during summary rebuild.
        AtomicInteger checksCount = new AtomicInteger();
        FakeLineEnv.onPreviewsAllowedCheck = () -> {
            if (checksCount.incrementAndGet() >= 2) {
                FakeLineEnv.activeAccount = "u_acc_2";
            }
        };
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Summary rebuild must abort when account switches before notify; notified="
                        + manager.getNotifyHistoryForTest().size());

        // Also test account switch right at entry to rebuildSummaryWithoutCanceledChat.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        manager.putActiveForTest(MESSAGE_TAG, 82101,
                msgNotification(roomA, "821", "Alice", "Room A text", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 82201,
                msgNotification(roomB, "822", "Bob", "Account A private text", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notification summary2 = msgNotification(null, null, "LINE", "2 new messages", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        summary2.extras.putBoolean("line_notification_patches.generic_summary", true);
        manager.putActiveForTest(null, summaryId, summary2);
        FakeLineEnv.onPreviewsAllowedCheck = () -> FakeLineEnv.activeAccount = "u_acc_2";
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Summary rebuild must abort immediately on account switch at entry");
    }

    private static void testUnhideFailureKeepsRoomHiddenAndBlocksAllowMutedWhileInFlight(Context context) throws Exception {
        resetAll(context);
        String chat = chatId('c', 831);
        Settings.setEnabled(Settings.SILENT, true);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Hidden Room", "830", 1, true));
        Settings.setMuted("u_acc_1", chat, "Hidden Room", true);

        // HIDDEN -> NORMAL failure keeps persisted hidden flag intact throughout flight and after error.
        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> unhideNormal = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.NORMAL, null, unhideNormal::set);
        check(muteCalled.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred unhide call");
        check(Settings.fullyMuted("u_acc_1", chat) && !Notifications.allowMuted(new ke8.z(), chat),
                "Unhiding room must remain fully hidden in prefs and blocked in allowMuted while native call is in flight");

        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> unhideNormal.get() != null);
        check(Boolean.FALSE.equals(unhideNormal.get())
                        && Settings.fullyMuted("u_acc_1", chat)
                        && !Notifications.allowMuted(new ke8.z(), chat),
                "Failed unhide to NORMAL must keep room completely hidden");

        // HIDDEN -> QUIET failure keeps hidden=true, quiet=false; then success flips both cleanly.
        muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> unhideQuietFail = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.QUIET, null, unhideQuietFail::set);
        check(muteCalled.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred HIDDEN->QUIET call");
        check(Settings.fullyMuted("u_acc_1", chat)
                        && !Settings.quiet("u_acc_1", chat)
                        && !Notifications.allowMuted(new ke8.z(), chat),
                "HIDDEN->QUIET must remain hidden until native unhide succeeds");
        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> unhideQuietFail.get() != null);
        check(Boolean.FALSE.equals(unhideQuietFail.get())
                        && Settings.fullyMuted("u_acc_1", chat)
                        && !Settings.quiet("u_acc_1", chat),
                "Failed HIDDEN->QUIET must leave preferences unchanged");

        FakeLineEnv.deferNativeMuteCallback = false;
        FakeLineEnv.nextNativeMuteSuccess = true;
        AtomicReference<Boolean> unhideQuietOk = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.QUIET, null, unhideQuietOk::set);
        awaitCallback(() -> unhideQuietOk.get() != null);
        check(Boolean.TRUE.equals(unhideQuietOk.get())
                        && !Settings.fullyMuted("u_acc_1", chat)
                        && Settings.quiet("u_acc_1", chat)
                        && Notifications.allowMuted(new ke8.z(), chat),
                "Successful HIDDEN->QUIET must clear hidden flag, enable quiet, and allow silent notifications");
    }

    private static void testAccountBoundMuteActionRejectsCrossAccountTap(Context context) throws Exception {
        resetAll(context);
        context.getResources().putStringForTest("notification_button_mute", "Mute");
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.INFO, false);
        String chat = chatId('c', 841);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Room 841", "840", 1, false));

        Intent rawMuteIntent = new Intent("jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION")
                .putExtra("chatId", chat);
        Notification.Action nativeMute = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode),
                "Mute",
                PendingIntent.getService(context, 0, rawMuteIntent, 0)).build();
        Notification original = msgNotification(chat, "841", "Room 841", "Hello");
        original.actions = new Notification.Action[]{nativeMute};

        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.post(manager, MESSAGE_TAG, 84101, original);
        Notification posted = manager.getActiveSlotForTest(MESSAGE_TAG, 84101).getNotification();
        check(posted.actions != null && posted.actions.length == 1
                        && MuteActions.ACTION.equals(posted.actions[0].actionIntent.getIntentForTest().getAction()),
                "SILENT=true must wrap native mute into account-bound MuteActions");

        // Switch to account B and place account B's own notification for the same chat ID.
        FakeLineEnv.activeAccount = "u_acc_2";
        manager.putActiveForTest(MESSAGE_TAG, 84102,
                msgNotification(chat, "842", "Room 841", "Acc2 msg", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_2"));

        // Tapping Account A's bound mute action under Account B must be rejected cleanly.
        boolean handledBound = Settings.interceptNotificationAction(
                context, posted.actions[0].actionIntent.getIntentForTest());
        check(handledBound
                        && FakeLineEnv.getNativeMuteCallsSnapshot().isEmpty()
                        && !Settings.quiet("u_acc_2", chat)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 84102) != null,
                "Cross-account mute tap must not modify Account B settings or cancel Account B notification");

        // Unbound raw native mute intent is also consumed under SILENT=true without mutating Account B.
        boolean handledRaw = Settings.interceptNotificationAction(context, rawMuteIntent);
        check(handledRaw
                        && FakeLineEnv.getNativeMuteCallsSnapshot().isEmpty()
                        && !Settings.quiet("u_acc_2", chat)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 84102) != null,
                "Unbound native mute intent must be ignored when SILENT is enabled");

        // Matching Account A tap succeeds and cancels only Account A's notification.
        FakeLineEnv.activeAccount = "u_acc_1";
        Settings.interceptNotificationAction(context, posted.actions[0].actionIntent.getIntentForTest());
        awaitCallback(() -> Settings.quiet("u_acc_1", chat)
                && manager.getActiveSlotForTest(MESSAGE_TAG, 84101) == null);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 84102) != null && !Settings.quiet("u_acc_2", chat),
                "Same-account mute tap must silence Account A cleanly without affecting Account B");
    }

    private static void testPendingFlushDuringInFlightHidePreservesExistingNotificationAndSharedSummary(Context context)
            throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        String roomA = chatId('u', 851);
        String roomB = chatId('u', 852);
        int slotA = 85101;
        int slotB = 85201;
        int summaryId = 16880000;
        FakeLineEnv.CONTACTS.put("u_peer_a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CONTACTS.put("u_peer_b", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "850", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Bob", "850", 1, false));
        FakeLineEnv.addMessage(roomA, "851", 11001L, "u_peer_a", "Active A 851", null, null);
        FakeLineEnv.addMessage(roomB, "852", 11002L, "u_peer_b", "Active B 852", null, null);

        // Establish Room A single-room active child + summary, queue BOTH Room A pending child 853
        // and Room A pending summary 853 while single-room, then post Room B child on the same group.
        Notifications.post(manager, MESSAGE_TAG, slotA, msgNotification(roomA, "851", "Alice", "Active A 851"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "851", "Alice", "Active A 851", "NOTIFICATION_GROUP_MESSAGE", true, null));
        FakeLineEnv.CHATS.get(roomA).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, slotA, msgNotification(roomA, "853", "Alice", "Pending A 853"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "853", "Alice", "Pending A 853", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check("851".equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.message.id")),
                "Room A pending summary 853 must genuinely be held pending before Room B arrives");
        Notifications.post(manager, MESSAGE_TAG, slotB, msgNotification(roomB, "852", "Bob", "Active B 852"));

        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> hideResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, roomA, ChatNotifications.HIDDEN, null, hideResult::set);
        check(muteCalled.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred hide call");

        // Local save and timeout during in-flight hide must NOT cancel active 851 or shared summary!
        FakeLineEnv.addMessage(roomA, "853", 11003L, "u_peer_a", "Saved A 853", null, null);
        Notifications.onMessageStored(roomA);
        Handler.advanceByForTest(1200L);
        syncWithNotificationsMonitor();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, slotA) != null
                        && "851".equals(manager.getActiveSlotForTest(MESSAGE_TAG, slotA).getNotification().extras.getString("line.message.id"))
                        && manager.getActiveSlotForTest(null, summaryId) != null
                        && manager.getCancelHistoryForTest().isEmpty(),
                "Pending save/timeout during in-flight hide must not cancel existing notification or shared summary");

        // Fail hide -> pending 853 child AND summary must flush after abort.
        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> hideResult.get() != null);
        awaitLogContains("hide: aborted, pending re-evaluated");
        check("853".equals(manager.getActiveSlotForTest(MESSAGE_TAG, slotA).getNotification().extras.getString("line.message.id"))
                        && manager.getActiveSlotForTest(null, summaryId) != null
                        && "853".equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.message.id")),
                "Aborted hide must flush BOTH deferred child 853 and deferred summary 853");

        // Confirmed READ on Room A must NOT cancel Room B's active summary on the shared slot.
        FakeLineEnv.CHATS.get(roomA).unread = 0;
        FakeLineEnv.CHATS.get(roomA).readUp = "853";
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomB, "852", "Bob", "Active B 852", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "853", "Alice", "Read A 853", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Notification preservedSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(preservedSummary != null && roomB.equals(preservedSummary.extras.getString("line.chat.id")),
                "Confirmed READ on Room A summary must not cancel Room B's shared summary");
    }

    private static void testDoublePartialReadExhaustingRetryDeliversSafeGenericAndSchedulesRefresh(Context context)
            throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String group = chatId('c', 861);
        FakeLineEnv.CONTACTS.put("u_sender_86", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));
        FakeLineEnv.CHATS.put(group, new FakeLineEnv.ChatRow("Group X", "100", 4, false));
        FakeLineEnv.addMessage(group, "101", 12001L, "u_sender_86", "First 101", null, null);
        FakeLineEnv.addMessage(group, "102", 12002L, "u_sender_86", "Second 102", null, null);
        FakeLineEnv.addMessage(group, "103", 12003L, "u_sender_86", "Third 103", null, null);
        FakeLineEnv.addMessage(group, "104", 12004L, "u_sender_86", "Fourth 104", null, null);

        AtomicInteger avatarCalls = new AtomicInteger();
        FakeLineEnv.onAvatarLoad = () -> {
            int n = avatarCalls.incrementAndGet();
            FakeLineEnv.ChatRow row = FakeLineEnv.CHATS.get(group);
            if (n == 1) {
                row.unread = 3;
                row.readUp = "101";
            } else if (n == 2) {
                row.unread = 2;
                row.readUp = "102";
            }
        };

        Notifications.post(manager, MESSAGE_TAG, 86101, msgNotification(group, "104", "Group X", "Secret native 104"));
        check(manager.getCancelHistoryForTest().isEmpty()
                        && manager.getNotifyHistoryForTest().size() == 1
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 86101) != null,
                "Double partial read with remaining unread must NOT cancel chat slot");
        assertAllRedacted(manager, "Secret native 104", "First 101", "Second 102", "Group X");

        // Scheduled trailing refresh completes and renders remaining [2] unread: 103 and 104.
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(manager.getNotifyHistoryForTest().size() == 2,
                "Trailing refresh must update slot with accurate remaining unread; notified="
                        + manager.getNotifyHistoryForTest().size());
        Notification refreshed = manager.getActiveSlotForTest(MESSAGE_TAG, 86101).getNotification();
        android.os.Parcelable[] msgs = refreshed.extras.getParcelableArray(Notification.EXTRA_MESSAGES);
        check("Group X  [2]".equals(String.valueOf(refreshed.extras.getCharSequence(Notification.EXTRA_CONVERSATION_TITLE)))
                        && msgs != null && msgs.length == 2
                        && "Third 103".equals(String.valueOf(((Bundle) msgs[0]).getCharSequence("text")))
                        && "Fourth 104".equals(String.valueOf(((Bundle) msgs[1]).getCharSequence("text"))),
                "Refreshed notification must render remaining unread [2] (103, 104)");
    }

    private static void testStaleActiveSnapshotAfterPendingFlushDoesNotOverwriteNewerMessage(Context context)
            throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 871);
        int slot = 87101;
        FakeLineEnv.CONTACTS.put("u_peer_87", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "870", 1, false));
        FakeLineEnv.addMessage(chat, "871", 13001L, "u_peer_87", "Msg 871", null, null);

        Notifications.post(manager, MESSAGE_TAG, slot, msgNotification(chat, "871", "Alice", "Msg 871"));
        check(deliveredMessageIds(manager).equals(java.util.Collections.singletonList("871")),
                "Initial 871 should be delivered");

        // Hold 872 pending before DB save, then simulate NotificationManager async enqueue visibility lag.
        FakeLineEnv.CHATS.get(chat).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, slot, msgNotification(chat, "872", "Alice", "Placeholder 872"));
        manager.setDeferActiveVisibilityForTest(true);

        FakeLineEnv.addMessage(chat, "872", 13002L, "u_peer_87", "Msg 872", null, null);
        Notifications.onMessageStored(chat);
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("871", "872")),
                "Save flush with lagged active list must not re-deliver stale 871; got "
                        + deliveredMessageIds(manager));

        // Even when trailing refresh fires while active snapshot still reports stale 871, it must skip.
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("871", "872")),
                "Trailing refresh observing stale 871 snapshot must not overwrite newer 872; got "
                        + deliveredMessageIds(manager));

        manager.flushDeferredActiveVisibilityForTest();
        Notification finalActive = manager.getActiveSlotForTest(MESSAGE_TAG, slot).getNotification();
        check("872".equals(finalActive.extras.getString("line.message.id")),
                "Final visible notification after enqueue catch-up must remain 872");
    }

    private static void testSilentBypassRespectsPreviewPrivacyAndMentionQueryExcludesContent(Context context) {
        // Case A: KEYWORD_BYPASS=true with previewsAllowed=false must NOT bypass or query content column.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.KEYWORD_BYPASS, true);
        Settings.setEnabled(Settings.MENTION_BYPASS, false);
        Settings.setKeywords("urgent");
        FakeLineEnv.previewsAllowed = false;

        String roomA = chatId('c', 881);
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Quiet Room", "880", 1, true));
        FakeLineEnv.addMessage(roomA, "881", 14001L, "u_peer_88", "urgent deadline", null, null);
        synchronized (FakeLineEnv.class) { FakeLineEnv.QUERIES.clear(); }

        Notifications.post(manager, MESSAGE_TAG, 88101, msgNotification(roomA, "881", "Quiet Room", "urgent deadline"));
        Notification deliveredA = manager.getActiveSlotForTest(MESSAGE_TAG, 88101).getNotification();
        check(deliveredA != null
                        && "line_notification_patches.silent.v1".equals(deliveredA.getChannelId())
                        && "LINE".equals(String.valueOf(deliveredA.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(deliveredA.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Keyword bypass must stay disabled and redacted while LINE previews are OFF");
        for (String sql : FakeLineEnv.getQueriesSnapshot()) {
            check(!sql.toLowerCase(java.util.Locale.ROOT).contains("content"),
                    "No SQL query may select message content while previews are OFF; query=" + sql);
        }

        // Case B: MENTION_BYPASS=true with previewsAllowed=false escalates channel via parameter-only SQL.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.MENTION_BYPASS, true);
        Settings.setEnabled(Settings.KEYWORD_BYPASS, true);
        Settings.setKeywords("urgent");
        FakeLineEnv.previewsAllowed = false;

        String roomB = chatId('c', 882);
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Quiet Room B", "880", 1, true));
        FakeLineEnv.addMessage(roomB, "882", 14002L, "u_peer_88", "urgent hello",
                Integer.valueOf(0), "MENTION\t{\"MENTIONEES\":[{\"M\":\"u_acc_1\"}]}");
        synchronized (FakeLineEnv.class) { FakeLineEnv.QUERIES.clear(); }

        Notifications.post(manager, MESSAGE_TAG, 88201, msgNotification(roomB, "882", "Quiet Room B", "urgent hello"));
        Notification deliveredB = manager.getActiveSlotForTest(MESSAGE_TAG, 88201).getNotification();
        check(deliveredB != null
                        && "line_default".equals(deliveredB.getChannelId())
                        && "LINE".equals(String.valueOf(deliveredB.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(deliveredB.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "@mention bypass must keep alert channel while redacting message body when previews are OFF");
        boolean sawMentionSql = false;
        for (String sql : FakeLineEnv.getQueriesSnapshot()) {
            String lower = sql.toLowerCase(java.util.Locale.ROOT);
            check(!lower.contains("content") && !lower.contains("location_name") && !lower.contains("location_address"),
                    "Mention check must not select content/location columns while previews are OFF; query=" + sql);
            if (lower.contains("select parameter from chat_history")) {
                sawMentionSql = true;
            }
        }
        check(sawMentionSql, "Expected mention-only query (SELECT parameter FROM chat_history)");
    }

    private static void testInfoOnlySelectionDisablingInfoAndPrivacyWhilePendingRedacts(Context context)
            throws Exception {
        // Case A: More Chat Info-only selection; INFO and previewsAllowed both turn OFF before local save.
        resetAll(context);
        Settings.test_silentIncluded = false;
        Settings.test_readIncluded = false;
        Settings.test_noReplyIncluded = false;
        Settings.test_infoIncluded = true;
        Settings.setEnabled(Settings.INFO, true);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String chatA = chatId('u', 901);
        FakeLineEnv.CONTACTS.put("u_peer_901", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chatA, new FakeLineEnv.ChatRow("Alice", "900", 1, false));

        Notifications.post(manager, MESSAGE_TAG, 90101, msgNotification(chatA, "901", "Alice", "Secret 901"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "901 should be held pending");

        Settings.prefs().edit().putBoolean(Settings.INFO, false).apply();
        FakeLineEnv.previewsAllowed = false;
        FakeLineEnv.addMessage(chatA, "901", 15001L, "u_peer_901", "DB Secret 901", null, null);
        Notifications.onMessageStored(chatA);
        check(manager.getNotifyHistoryForTest().size() == 1,
                "Held item from INFO-only selection must still flush redacted after INFO+privacy turn OFF");
        assertAllRedacted(manager, "Secret 901", "DB Secret 901", "Alice");

        // Case B: INFO-only selection; INFO and previewsAllowed both turn OFF before timeout.
        resetAll(context);
        Settings.test_silentIncluded = false;
        Settings.test_readIncluded = false;
        Settings.test_noReplyIncluded = false;
        Settings.test_infoIncluded = true;
        Settings.setEnabled(Settings.INFO, true);
        manager = context.getSystemService(NotificationManager.class);
        String chatB = chatId('u', 902);
        FakeLineEnv.CHATS.put(chatB, new FakeLineEnv.ChatRow("Bob", "900", 1, false));

        Notifications.post(manager, MESSAGE_TAG, 90201, msgNotification(chatB, "902", "Bob", "Timeout Secret 902"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "902 should be held pending");

        Settings.prefs().edit().putBoolean(Settings.INFO, false).apply();
        FakeLineEnv.previewsAllowed = false;
        Handler.advanceByForTest(1200L);
        awaitLogContains("post: delivered to Android");
        check(manager.getNotifyHistoryForTest().size() == 1,
                "Timeout flush in INFO-only selection must redact after INFO+privacy turn OFF");
        assertAllRedacted(manager, "Timeout Secret 902", "Bob");
    }

    private static void testAccountAPendingFlushAfterSwitchToAccountBDoesNotCancelB(Context context)
            throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        Settings.setEnabled(Settings.SILENT, true);
        String chat = chatId('c', 911);
        int slotId = 91101;
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Shared Room", "910", 1, false));

        // Hold Account A's pending notification on slot 91101.
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "911", "Shared Room", "Acc1 secret"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "Account A message 911 should be held pending");

        // Switch to Account B where same chat/slot has an active notification and is hidden/read.
        FakeLineEnv.activeAccount = "u_acc_2";
        Settings.setMuted("u_acc_2", chat, "Shared Room", true);
        FakeLineEnv.CHATS.get(chat).unread = 0;
        FakeLineEnv.CHATS.get(chat).readUp = "911";
        manager.putActiveForTest(MESSAGE_TAG, slotId,
                msgNotification(chat, "915", "Shared Room", "Acc2 active", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_2"));

        // Fire Account A's pending timeout -> must drop cleanly without touching Account B.
        Handler.advanceByForTest(1200L);
        syncWithNotificationsMonitor();
        Notification active = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().isEmpty()
                        && active != null
                        && "u_acc_2".equals(active.extras.getString(Notifications.ACCOUNT))
                        && "915".equals(active.extras.getString("line.message.id")),
                "Account A pending flush after switch to Account B must never cancel or overwrite Account B");
    }

    private static void attachSensitiveMediaAndWearableExtras(Notification n, Context context, String chatId) {
        n.extras.putLong("line.sticker.id", 123456789L);
        n.extras.putString("line.sticker.url", "https://stickershop.line-scdn.net/secret/123456789.png");
        n.extras.putCharSequenceArray(Notification.EXTRA_REMOTE_INPUT_HISTORY,
                new CharSequence[]{"Secret sent reply"});
        Bundle historyItem = new Bundle();
        historyItem.putCharSequence("text", "Secret history item");
        n.extras.putParcelableArray("android.remoteInputHistoryItems", new android.os.Parcelable[]{historyItem});
        n.extras.putCharSequence("android.remoteInputDraft", "Secret unsent draft");
        n.extras.putBoolean("android.remoteInputSpinner", true);

        Notification.Action wearAction = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode),
                "Mute",
                PendingIntent.getService(context, 11,
                        new Intent("jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION")
                                .putExtra("chatId", chatId), 0)).build();
        Bundle wearable = new Bundle();
        wearable.putParcelable("background", Bitmap.createBitmap(2, 2, null));
        ArrayList<Notification> pages = new ArrayList<Notification>();
        pages.add(new Notification());
        wearable.putParcelableArrayList("pages", pages);
        ArrayList<Notification.Action> wearActions = new ArrayList<Notification.Action>();
        wearActions.add(wearAction);
        wearable.putParcelableArrayList("actions", wearActions);
        n.extras.putBundle("android.wearable.EXTENSIONS", wearable);
        n.extras.putParcelableArray("line_notification_patches.native_wearable_actions",
                new android.os.Parcelable[]{wearAction});

        Notification.Action carRead = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_menu_view),
                "Car Read",
                PendingIntent.getService(context, 12,
                        new Intent("jp.naver.line.android.access.remote.action.MARK_AS_READ_ACTION")
                                .putExtra("chatId", chatId), 0)).build();
        Bundle carExt = new Bundle();
        ArrayList<Notification.Action> carActions = new ArrayList<Notification.Action>();
        carActions.add(carRead);
        carExt.putParcelableArrayList("invisible_actions", carActions);
        n.extras.putBundle("android.car.EXTENSIONS", carExt);
    }

    private static void assertNoStickerOrRemoteInputExtras(Notification n, String label) {
        check(!n.extras.containsKey("line.sticker.id")
                        && !n.extras.containsKey("line.sticker.url")
                        && !n.extras.containsKey(Notification.EXTRA_REMOTE_INPUT_HISTORY)
                        && !n.extras.containsKey("android.remoteInputHistoryItems")
                        && !n.extras.containsKey("android.remoteInputDraft")
                        && !n.extras.containsKey("android.remoteInputSpinner")
                        && !n.extras.containsKey("android.car.EXTENSIONS")
                        && !n.extras.containsKey("line_notification_patches.native_wearable_actions"),
                label + " must strip sticker, reply history items, car extensions, and wearable backup; keys="
                        + n.extras.keySet());
        Bundle wearable = n.extras.getBundle("android.wearable.EXTENSIONS");
        if (wearable != null) {
            check(!wearable.containsKey("background")
                            && !wearable.containsKey("pages")
                            && !wearable.containsKey("actions"),
                    label + " must strip wearable background/pages/actions; keys=" + wearable.keySet());
        }
    }

    private static void testRedactedStickerAndSummaryStripStickerAndRemoteInputExtras(Context context) {
        // Case A: Privacy OFF redaction strips reply history items, car & wearable actions while preserving phone reply.
        resetAll(context);
        context.getResources().putStringForTest("notification_button_mute", "Mute");
        context.getResources().putStringForTest("notification_button_reply", "Reply");
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        Settings.setEnabled(Settings.SILENT, true);
        FakeLineEnv.previewsAllowed = false;
        String chat = chatId('u', 921);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "920", 1, false));

        Notification.Action phoneReply = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_menu_send),
                "Reply",
                PendingIntent.getService(context, 13, new Intent("test.reply"), 0))
                .addRemoteInput(new RemoteInput.Builder("reply_key").setLabel("Reply").build())
                .build();
        Notification.Action phoneMute = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode),
                "Mute",
                PendingIntent.getService(context, 14,
                        new Intent("jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION")
                                .putExtra("chatId", chat), 0)).build();

        Notification input = msgNotification(chat, "921", "Alice", "Sent a sticker");
        input.actions = new Notification.Action[]{phoneReply, phoneMute};
        attachSensitiveMediaAndWearableExtras(input, context, chat);
        Notification pub = msgNotification(chat, "921", "Alice", "Public sticker");
        attachSensitiveMediaAndWearableExtras(pub, context, chat);
        input.publicVersion = pub;

        Notifications.post(manager, MESSAGE_TAG, 92101, input);
        Notification delivered = manager.getActiveSlotForTest(MESSAGE_TAG, 92101).getNotification();
        check(delivered != null && delivered.publicVersion != null, "Redacted sticker notification should deliver");
        assertNoStickerOrRemoteInputExtras(delivered, "Redacted child notification");
        assertNoStickerOrRemoteInputExtras(delivered.publicVersion, "Redacted publicVersion");
        check(delivered.actions != null && delivered.actions.length == 2
                        && delivered.actions[0].getRemoteInputs() != null
                        && MuteActions.ACTION.equals(delivered.actions[1].actionIntent.getIntentForTest().getAction()),
                "Redacted child must still preserve phone inline reply and account-bound mute button");

        // Case B: Summary rebuild switching from Room A -> Room B clears Room A's sticker/reply/car/wearable extras.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        String roomA = chatId('u', 922);
        String roomB = chatId('u', 923);
        int summaryId = 16880000;
        manager.putActiveForTest(MESSAGE_TAG, 92201,
                msgNotification(roomA, "922", "Alice", "Room A sticker", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 92301,
                msgNotification(roomB, "923", "Bob", "Room B plain", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notification summaryA = msgNotification(roomA, "922", "Alice", "Room A sticker",
                "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        attachSensitiveMediaAndWearableExtras(summaryA, context, roomA);
        Notification summaryPub = msgNotification(roomA, "922", "Alice", "Room A pub sticker",
                "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        attachSensitiveMediaAndWearableExtras(summaryPub, context, roomA);
        summaryA.publicVersion = summaryPub;
        manager.putActiveForTest(null, summaryId, summaryA);

        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification rebuilt = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(rebuilt != null && roomB.equals(rebuilt.extras.getString("line.chat.id")),
                "Summary must switch to remaining Room B");
        assertNoStickerOrRemoteInputExtras(rebuilt, "Rebuilt summary");
        assertNoStickerOrRemoteInputExtras(rebuilt.publicVersion, "Rebuilt summary publicVersion");
    }

    private static void testSummaryRebuildAccountSwitchDuringActiveIpcAndPrivacyFailureFallback(Context context) {
        // Case A: Account switches during getActiveNotifications() IPC inside rebuildSummaryWithoutCanceledChat.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        String roomA = chatId('u', 931);
        String roomB = chatId('u', 932);
        int summaryId = 16880000;
        manager.putActiveForTest(MESSAGE_TAG, 93101,
                msgNotification(roomA, "931", "Alice", "Room A text", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 93201,
                msgNotification(roomB, "932", "Bob", "Room B secret", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notification summary = msgNotification(roomA, "931", "Alice", "Room A text",
                "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        manager.putActiveForTest(null, summaryId, summary);

        AtomicInteger activeCalls = new AtomicInteger();
        manager.onGetActiveNotificationsForTest = () -> {
            if (activeCalls.incrementAndGet() == 2) {
                FakeLineEnv.activeAccount = "u_acc_2";
            }
        };
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Account switch during active-list ownership IPC must abort summary rebuild");

        // Case B: Same-account cancel of Room A with Room B remaining while previewsAllowed() throws.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        manager.putActiveForTest(MESSAGE_TAG, 93101,
                msgNotification(roomA, "931", "Alice", "Secret Room A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 93201,
                msgNotification(roomB, "932", "Bob", "Secret Room B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notification summaryRoomA = msgNotification(roomA, "931", "Alice", "Secret Room A",
                "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        PendingIntent roomAIntent = summaryRoomA.contentIntent;
        manager.putActiveForTest(null, summaryId, summaryRoomA);

        FakeLineEnv.throwOnPreviewsAllowed = true;
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification safeSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(safeSummary != null
                        && manager.getNotifyHistoryForTest().size() == 1
                        && "LINE".equals(String.valueOf(safeSummary.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(safeSummary.extras.getCharSequence(Notification.EXTRA_TEXT)))
                        && safeSummary.extras.getString("line.chat.id") == null
                        && safeSummary.extras.getBoolean("line_notification_patches.generic_summary", false)
                        && safeSummary.contentIntent != roomAIntent,
                "Privacy lookup failure during summary rebuild must replace hidden room's summary with safe generic fallback");

        // Case C: refreshActive must redact active single-room summary when privacy turns OFF even if INFO=false.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "930", 1, false));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "935", "Alice", "Visible Summary 935", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check("Visible Summary 935".equals(String.valueOf(
                        manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Initial summary should show preview while privacy is ON");

        FakeLineEnv.previewsAllowed = false;
        Notifications.refreshActivePreviews();
        syncWithNotificationsMonitor();
        Notification redactedSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check("LINE".equals(String.valueOf(redactedSummary.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(redactedSummary.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "refreshActive must redact active summary when privacy turns OFF even with INFO disabled");
    }

    private static void testConcurrentHideDuringAvatarLoadAndCrashRecoveryPendingHide(Context context)
            throws Exception {
        // Case A: Hide commits during avatar load right before Notifications.post() delivers.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_sender_94", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));
        String roomX = chatId('c', 941);
        FakeLineEnv.CHATS.put(roomX, new FakeLineEnv.ChatRow("Room X", "940", 1, false));
        FakeLineEnv.addMessage(roomX, "941", 16001L, "u_sender_94", "Secret 941", null, null);
        FakeLineEnv.onAvatarLoad = () -> Settings.commitHideSuccess("u_acc_1", roomX, "Room X");

        Notifications.post(manager, MESSAGE_TAG, 94101, msgNotification(roomX, "941", "Room X", "Secret 941"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 94101) == null,
                "Hide completing during avatar load must prevent post() from delivering plaintext");

        // Case B: Hide STARTS during avatar load -> post() defers invisibly and stays suppressed on hide success.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_sender_94", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));
        String roomY = chatId('c', 942);
        FakeLineEnv.CHATS.put(roomY, new FakeLineEnv.ChatRow("Room Y", "940", 1, false));
        FakeLineEnv.addMessage(roomY, "942", 16002L, "u_sender_94", "Secret 942", null, null);
        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> hideDone = new AtomicReference<Boolean>();
        FakeLineEnv.onAvatarLoad = () -> {
            ChatNotifications.change(context, roomY, ChatNotifications.HIDDEN, null, hideDone::set);
            try {
                muteCalled.await(3L, TimeUnit.SECONDS);
            } catch (InterruptedException ignored) { }
        };

        Notifications.post(manager, MESSAGE_TAG, 94201, msgNotification(roomY, "942", "Room Y", "Secret 942"));
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Hide starting during avatar load must defer delivery invisibly");
        FakeLineEnv.completeDeferredNativeMute(true);
        awaitCallback(() -> hideDone.get() != null);
        check(Boolean.TRUE.equals(hideDone.get())
                        && Settings.fullyMuted("u_acc_1", roomY)
                        && manager.getNotifyHistoryForTest().isEmpty(),
                "Completed concurrent hide must keep deferred message permanently suppressed");

        // Case C: Process-death crash recovery of pending_hide marker against LINE's persisted mute state.
        resetAll(context);
        Settings.setEnabled(Settings.SILENT, true);
        String roomZ1 = chatId('c', 943);
        String roomZ2 = chatId('c', 944);
        FakeLineEnv.CHATS.put(roomZ1, new FakeLineEnv.ChatRow("Room Z1", "940", 1, true));
        FakeLineEnv.CHATS.put(roomZ2, new FakeLineEnv.ChatRow("Room Z2", "940", 1, false));
        Settings.prefs().edit().putBoolean(Settings.quietKey("u_acc_1", roomZ1), true).apply();
        Settings.setPendingHide("u_acc_1", roomZ1, "Room Z1");
        Settings.setPendingHide("u_acc_1", roomZ2, "Room Z2");

        check(Settings.fullyMuted("u_acc_1", roomZ1)
                        && Settings.quiet("u_acc_1", roomZ1)
                        && !Settings.prefs().contains(Settings.pendingHideKey("u_acc_1", roomZ1))
                        && !Notifications.allowMuted(new ke8.z(), roomZ1),
                "Crash recovery must promote pending_hide to fullyMuted while preserving quietKey");
        check(!Settings.fullyMuted("u_acc_1", roomZ2)
                        && !Settings.prefs().contains(Settings.pendingHideKey("u_acc_1", roomZ2))
                        && Notifications.allowMuted(new ke8.z(), roomZ2),
                "Crash recovery must clear stale pending_hide when native mute did not persist");
    }

    private static void testWearableMuteBindingAndAndroid11ExtrasPrecedenceRestore(Context context) {
        for (boolean android11Precedence : new boolean[]{true, false}) {
            resetAll(context);
            Notification.android11ExtrasPrecedenceForTest = android11Precedence;
            context.getResources().putStringForTest("notification_button_mute", "Mute");
            context.getResources().putStringForTest("notification_button_reply", "Reply");
            NotificationManager manager = context.getSystemService(NotificationManager.class);
            Settings.setEnabled(Settings.INFO, true);
            Settings.setEnabled(Settings.SILENT, false);
            Settings.setEnabled(Settings.READ, false);

            String chat = chatId('c', 951);
            int slotId = 95101;
            FakeLineEnv.CONTACTS.put("u_sender_95", new FakeLineEnv.ContactRow("Carol", null));
            FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Room 951", "950", 1, false));
            FakeLineEnv.addMessage(chat, "951", 17001L, "u_sender_95", "Hello 951", null, null);

            Intent rawMuteIntent = new Intent("jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION")
                    .putExtra("chatId", chat);
            Notification.Action nativeMute = new Notification.Action.Builder(
                    Icon.createWithResource("android", android.R.drawable.ic_lock_silent_mode),
                    "Mute",
                    PendingIntent.getService(context, 1, rawMuteIntent, 0)).build();
            Notification.Action replyAction = new Notification.Action.Builder(
                    Icon.createWithResource("android", android.R.drawable.ic_menu_send),
                    "Reply",
                    PendingIntent.getService(context, 2, new Intent("test.reply"), 0))
                    .addRemoteInput(new RemoteInput.Builder("reply_key").setLabel("Reply").build())
                    .build();

            Notification original = msgNotification(chat, "951", "Room 951", "Hello 951");
            original.actions = new Notification.Action[]{replyAction, nativeMute};
            Bundle wearable = new Bundle();
            ArrayList<Notification.Action> wearList = new ArrayList<Notification.Action>();
            wearList.add(replyAction);
            wearList.add(nativeMute);
            wearable.putParcelableArrayList("actions", wearList);
            original.extras.putBundle("android.wearable.EXTENSIONS", wearable);

            // Step 1: Initial post with SILENT=false preserves native mute on both phone & wearable.
            Notifications.post(manager, MESSAGE_TAG, slotId, original);
            Notification step1 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w1 = step1.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step1.actions.length == 2
                            && rawMuteIntent.getAction().equals(step1.actions[1].actionIntent.getIntentForTest().getAction())
                            && w1.size() == 2
                            && rawMuteIntent.getAction().equals(w1.get(1).actionIntent.getIntentForTest().getAction())
                            && !step1.extras.containsKey("line_notification_patches.native_actions"),
                    "Initial SILENT=false must keep native mute on phone and wearable (a11=" + android11Precedence + ")");

            // Step 2: Enable SILENT=true -> BOTH phone & wearable mute become account-bound MuteActions.
            Settings.prefs().edit().putBoolean(Settings.SILENT, true).apply();
            Notifications.refreshReadActions();
            Notification step2 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w2 = step2.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step2.actions.length == 2
                            && MuteActions.ACTION.equals(step2.actions[1].actionIntent.getIntentForTest().getAction())
                            && w2.size() == 2
                            && MuteActions.ACTION.equals(w2.get(1).actionIntent.getIntentForTest().getAction()),
                    "SILENT=true must bind BOTH phone and wearable mute actions (a11=" + android11Precedence + ")");

            // Cross-account tap on wearable mute action must be rejected under Account B.
            FakeLineEnv.activeAccount = "u_acc_2";
            boolean wearHandled = Settings.interceptNotificationAction(
                    context, w2.get(1).actionIntent.getIntentForTest());
            check(wearHandled && !Settings.quiet("u_acc_2", chat) && FakeLineEnv.getNativeMuteCallsSnapshot().isEmpty(),
                    "Wearable mute action from Account A must be rejected under Account B");
            FakeLineEnv.activeAccount = "u_acc_1";

            // Step 3: Disable SILENT=false -> BOTH phone & wearable restore native mute without leaving null backups.
            Settings.prefs().edit().putBoolean(Settings.SILENT, false).apply();
            Notifications.refreshReadActions();
            Notification step3 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w3 = step3.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step3.actions.length == 2
                            && rawMuteIntent.getAction().equals(step3.actions[1].actionIntent.getIntentForTest().getAction())
                            && w3.size() == 2
                            && rawMuteIntent.getAction().equals(w3.get(1).actionIntent.getIntentForTest().getAction())
                            && !step3.extras.containsKey("line_notification_patches.native_actions")
                            && !step3.extras.containsKey("line_notification_patches.native_wearable_actions"),
                    "Toggling SILENT=false must restore native mute and remove backup keys (a11=" + android11Precedence + ")");

            // Step 4: Re-enable SILENT=true -> re-binds cleanly without Android 11/12 null-extra poisoning.
            Settings.prefs().edit().putBoolean(Settings.SILENT, true).apply();
            Notifications.refreshReadActions();
            Notification step4 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w4 = step4.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step4.actions.length == 2
                            && MuteActions.ACTION.equals(step4.actions[1].actionIntent.getIntentForTest().getAction())
                            && w4.size() == 2
                            && MuteActions.ACTION.equals(w4.get(1).actionIntent.getIntentForTest().getAction()),
                    "Re-enabling SILENT=true must re-bind both phone and wearable mute (a11=" + android11Precedence + ")");

            // Step 5: ACTION_LAYOUT_NONE must actually clear built.actions to empty despite AOSP buildUnstyled quirk.
            Settings.setActionLayout(NotificationPolicy.ACTION_LAYOUT_NONE);
            Notification step5 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w5 = step5.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step5.actions != null && step5.actions.length == 0
                            && w5 != null && w5.size() == 1
                            && "Reply".equals(String.valueOf(w5.get(0).title)),
                    "ACTION_LAYOUT_NONE must clear phone actions to empty array and drop wearable mute (a11="
                            + android11Precedence + "); len=" + (step5.actions == null ? -1 : step5.actions.length));

            // Step 6: Restore default layout + SILENT=false -> native phone & wearable buttons return intact.
            Settings.prefs().edit().putBoolean(Settings.SILENT, false).apply();
            Settings.setActionLayout(NotificationPolicy.ACTION_LAYOUT_DEFAULT);
            Notification step6 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
            ArrayList<Notification.Action> w6 = step6.extras.getBundle("android.wearable.EXTENSIONS")
                    .getParcelableArrayList("actions");
            check(step6.actions.length == 2
                            && rawMuteIntent.getAction().equals(step6.actions[1].actionIntent.getIntentForTest().getAction())
                            && w6.size() == 2
                            && rawMuteIntent.getAction().equals(w6.get(1).actionIntent.getIntentForTest().getAction()),
                    "Restoring default layout after NONE must recover native phone & wearable actions (a11="
                            + android11Precedence + ")");
        }
    }

    private static void testStaleReadEventDoesNotCancelNewerUnreadOrPendingAndPrivacyOffChecksRead(Context context)
            throws Exception {
        // Case A: Delayed read push 101 arrives while unread=1 (readUp=101) and newer 102 is active / pending.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 961);
        FakeLineEnv.CONTACTS.put("u_peer_96", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "101", 1, false));
        FakeLineEnv.addMessage(chat, "101", 18001L, "u_peer_96", "Read 101", null, null);
        // Active slot 96101 already displays unread 102; slot 96102 holds pending unstored 103.
        manager.putActiveForTest(MESSAGE_TAG, 96101,
                msgNotification(chat, "102", "Alice", "Unread 102", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notifications.post(manager, MESSAGE_TAG, 96102, msgNotification(chat, "103", "Alice", "Pending 103"));

        // Delayed 101 arrives on both slots -> must DISCARD without canceling 102 or evicting pending 103!
        Notifications.post(manager, MESSAGE_TAG, 96101, msgNotification(chat, "101", "Alice", "Delayed 101"));
        Notifications.post(manager, MESSAGE_TAG, 96102, msgNotification(chat, "101", "Alice", "Delayed 101"));
        check(manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 96101) != null
                        && "102".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 96101).getNotification().extras.getString("line.message.id")),
                "Delayed read push 101 with unread=1 must not cancel newer active 102");

        // Now 103 saves to DB -> proves delayed 101 did NOT delete pending 103!
        FakeLineEnv.addMessage(chat, "103", 18003L, "u_peer_96", "Stored 103", null, null);
        Notifications.onMessageStored(chat);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 96102) != null
                        && "103".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 96102).getNotification().extras.getString("line.message.id")),
                "Delayed read push 101 must not evict newer pending 103 from queue");

        // Case B: Held message read while previewsAllowed=false must NOT repost as generic "LINE".
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chatB = chatId('u', 962);
        FakeLineEnv.CHATS.put(chatB, new FakeLineEnv.ChatRow("Bob", "960", 1, false));
        Notifications.post(manager, MESSAGE_TAG, 96201, msgNotification(chatB, "962", "Bob", "Held 962"));
        check(manager.getNotifyHistoryForTest().isEmpty(), "962 should be held pending");

        FakeLineEnv.CHATS.get(chatB).unread = 0;
        FakeLineEnv.CHATS.get(chatB).readUp = "962";
        FakeLineEnv.previewsAllowed = false;
        Handler.advanceByForTest(1200L);
        syncWithNotificationsMonitor();
        check(manager.getNotifyHistoryForTest().isEmpty(),
                "Already-read pending message must not post generic LINE notification when previews are OFF");

        // Case C: Multi-room summary push on unstored room (unread=0, readUp=100, posted=101) is NOT treated as READ.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String roomA = chatId('u', 963);
        String roomB = chatId('u', 964);
        int summaryId = 16880000;
        manager.putActiveForTest(MESSAGE_TAG, 96401,
                msgNotification(roomB, "200", "Bob", "Room B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "100", 0, false));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Alice", "Unstored 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check(manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(null, summaryId) != null,
                "Multi-room summary for unstored message 101 (unread=0, readUp=100) must not be falsely treated as READ");
    }

    private static void testSharedSummaryRebuildAndPendingFlushHaveDistinctPublishSeq(Context context)
            throws Exception {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String roomA = chatId('u', 971);
        String roomB = chatId('u', 972);
        int slotA = 97101;
        int slotB = 97201;
        int summaryId = 16880000;
        FakeLineEnv.CONTACTS.put("u_peer_a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CONTACTS.put("u_peer_b", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Bob", "100", 1, false));
        FakeLineEnv.addMessage(roomA, "101", 19001L, "u_peer_a", "A 101", null, null);
        FakeLineEnv.addMessage(roomB, "101", 19002L, "u_peer_b", "B 101", null, null);

        // Post Room B (101) first + queue Room B pending 102 on child & summary, then post Room A child.
        Notifications.post(manager, MESSAGE_TAG, slotB, msgNotification(roomB, "101", "Bob", "B 101"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "101", "Bob", "B 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        FakeLineEnv.CHATS.get(roomB).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, slotB, msgNotification(roomB, "102", "Bob", "B 102 pending"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "102", "Bob", "B 102 pending", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Notifications.post(manager, MESSAGE_TAG, slotA, msgNotification(roomA, "101", "Alice", "A 101"));

        // Cancel Room A -> rebuilds shared summary for Room B (101) with publish seq S1.
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        long rebuiltSeq = manager.getActiveSlotForTest(null, summaryId).getNotification()
                .extras.getLong("line_notification_patches.slot_gen", 0L);

        // Simulate NotificationManager async enqueue lag when Room B 102 flushes with seq S2 > S1.
        manager.setDeferActiveVisibilityForTest(true);
        FakeLineEnv.addMessage(roomB, "102", 19003L, "u_peer_b", "B 102 stored", null, null);
        Notifications.onMessageStored(roomB);
        List<NotificationManager.NotifyRecord> afterFlush = manager.getNotifyHistoryForTest();
        long flushedSummarySeq = afterFlush.get(afterFlush.size() - 1).notification
                .extras.getLong("line_notification_patches.slot_gen", 0L);
        check(flushedSummarySeq > rebuiltSeq,
                "Pending flush on shared summary must have strictly higher SLOT_GEN than summary rebuild; rebuilt="
                        + rebuiltSeq + " flushed=" + flushedSummarySeq);

        int countBeforeTrailing = afterFlush.size();
        Log.clearForTest();
        Handler.advanceByForTest(400L);
        awaitLogContains("trailing refresh completed");
        check(manager.getNotifyHistoryForTest().size() == countBeforeTrailing,
                "Trailing refresh seeing lagged rebuilt summary (S1) must not overwrite flushed 102 (S2)");

        manager.flushDeferredActiveVisibilityForTest();
        check("102".equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.message.id")),
                "Final visible summary after async catch-up must remain 102");

        // Also check: discarded HOLD (account lookup failure) must NOT bump SLOT_PUBLISH_SEQ and wedge active 102.
        FakeLineEnv.activeAccount = "";
        Notifications.post(manager, MESSAGE_TAG, slotB, msgNotification(roomB, "103", "Bob", "Dropped 103"));
        FakeLineEnv.activeAccount = "u_acc_1";
        int countBeforeRefresh = manager.getNotifyHistoryForTest().size();
        Notifications.refreshActivePreviews();
        syncWithNotificationsMonitor();
        check(manager.getNotifyHistoryForTest().size() > countBeforeRefresh,
                "Discarded post must not permanently bump SLOT_PUBLISH_SEQ and block subsequent refreshes");
    }

    private static void testDelayedActiveListPreventsSummaryCascadeCancelOfRecentRoomBChild(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String roomA = chatId('u', 981);
        String roomB = chatId('u', 982);
        int slotA = 98101;
        int slotB = 98201;
        int summaryId = 16880000;
        FakeLineEnv.CONTACTS.put("u_peer_a", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CONTACTS.put("u_peer_b", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Bob", "100", 1, false));
        FakeLineEnv.addMessage(roomA, "101", 20001L, "u_peer_a", "Room A", null, null);
        FakeLineEnv.addMessage(roomB, "102", 20002L, "u_peer_b", "Room B", null, null);

        Notifications.post(manager, MESSAGE_TAG, slotA, msgNotification(roomA, "101", "Alice", "Room A"));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Alice", "Room A", "NOTIFICATION_GROUP_MESSAGE", true, null));

        // Defer NotificationManager active list visibility, submit Room B child, then cancel Room A.
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, MESSAGE_TAG, slotB, msgNotification(roomB, "102", "Bob", "Room B"));
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        check(!manager.getCancelHistoryForTest().contains("<null>#" + summaryId),
                "Summary must NOT be canceled while Room B's recently submitted child is pending enqueue; cancels="
                        + manager.getCancelHistoryForTest());

        manager.flushDeferredActiveVisibilityForTest();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, slotA) == null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, slotB) != null
                        && manager.getActiveSlotForTest(null, summaryId) != null
                        && manager.getActiveSlotForTest(null, summaryId).getNotification()
                                .extras.getBoolean("line_notification_patches.generic_summary", false),
                "Room B child must survive async flush without cascade cancellation, with generic summary");
    }

    private static void testPrivacyTurningOffMidTransformRevokesKeywordOnlyBypass(Context context) {
        // Case A: Privacy flips OFF between initial check and bypass query -> no content SQL, silent channel.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.KEYWORD_BYPASS, true);
        Settings.setEnabled(Settings.MENTION_BYPASS, false);
        Settings.setKeywords("urgent");
        String room = chatId('c', 991);
        FakeLineEnv.CHATS.put(room, new FakeLineEnv.ChatRow("Quiet Room", "990", 1, true));
        FakeLineEnv.addMessage(room, "991", 21001L, "u_peer_99", "urgent deadline", null, null);
        synchronized (FakeLineEnv.class) { FakeLineEnv.QUERIES.clear(); }

        AtomicInteger previewChecksA = new AtomicInteger();
        FakeLineEnv.onPreviewsAllowedCheck = () -> {
            if (previewChecksA.incrementAndGet() == 2) {
                FakeLineEnv.previewsAllowed = false;
            }
        };
        Notifications.post(manager, MESSAGE_TAG, 99101, msgNotification(room, "991", "Quiet Room", "urgent deadline"));
        Notification deliveredA = manager.getActiveSlotForTest(MESSAGE_TAG, 99101).getNotification();
        check(deliveredA != null
                        && "line_notification_patches.silent.v1".equals(deliveredA.getChannelId())
                        && "LINE".equals(String.valueOf(deliveredA.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(deliveredA.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Privacy turning OFF before bypass query must keep silent channel and redact");
        for (String sql : FakeLineEnv.getQueriesSnapshot()) {
            check(!sql.toLowerCase(java.util.Locale.ROOT).contains("content"),
                    "Content SQL must not run after privacy turns OFF mid-transform; sql=" + sql);
        }

        // Case B: Privacy flips OFF AFTER keyword-only bypass matched, right before final notify().
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.KEYWORD_BYPASS, true);
        Settings.setEnabled(Settings.MENTION_BYPASS, false);
        Settings.setKeywords("urgent");
        FakeLineEnv.CHATS.put(room, new FakeLineEnv.ChatRow("Quiet Room", "990", 1, true));
        FakeLineEnv.addMessage(room, "992", 21002L, "u_peer_99", "urgent alert", null, null);

        AtomicInteger previewChecksB = new AtomicInteger();
        FakeLineEnv.onPreviewsAllowedCheck = () -> {
            // 1: initial transform, 2: before bypass, 3: inside NativeLine.checkSilentBypass, 4: postInternal final gate.
            if (previewChecksB.incrementAndGet() >= 4) {
                FakeLineEnv.previewsAllowed = false;
            }
        };
        Notifications.post(manager, MESSAGE_TAG, 99102, msgNotification(room, "992", "Quiet Room", "urgent alert"));
        Notification deliveredB = manager.getActiveSlotForTest(MESSAGE_TAG, 99102).getNotification();
        check(deliveredB != null
                        && "line_notification_patches.silent.v1".equals(deliveredB.getChannelId())
                        && !deliveredB.extras.containsKey("line_notification_patches.bypass_alerted")
                        && "LINE".equals(String.valueOf(deliveredB.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(deliveredB.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Privacy turning OFF after keyword-only match must revoke bypass back to silent channel and redact");
    }

    private static void testPendingFlushItemFailureDoesNotDropRemainingRoomQueue(Context context) {
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String room = chatId('u', 995);
        int childId = 99501;
        int summaryId = 16880000;
        FakeLineEnv.CONTACTS.put("u_peer_995", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(room, new FakeLineEnv.ChatRow("Alice", "994", 1, false));

        // Hold both child and summary pending for the same room.
        Notifications.post(manager, MESSAGE_TAG, childId, msgNotification(room, "995", "Alice", "Msg 995"));
        Notifications.post(manager, null, summaryId,
                msgNotification(room, "995", "Alice", "Msg 995", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check(manager.getNotifyHistoryForTest().isEmpty(), "Both child and summary should be held");

        // Store 995, inject a failure on the 1st notify() IPC, and flush on save.
        FakeLineEnv.addMessage(room, "995", 22001L, "u_peer_995", "Stored 995", null, null);
        manager.failNextNotifyForTest(1);
        Notifications.onMessageStored(room);
        check(manager.getActiveSlotForTest(null, summaryId) != null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, childId) == null
                        && Handler.pendingCountForTest() >= 1,
                "Flush failure on 1st pending item must still deliver 2nd item and retain unexpired 1st item with timer");

        // Subsequent save/flush recovers the retained 1st item cleanly.
        Notifications.onMessageStored(room);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, childId) != null
                        && "995".equals(manager.getActiveSlotForTest(MESSAGE_TAG, childId).getNotification().extras.getString("line.message.id")),
                "Retained failed pending item must deliver cleanly on next flush");
    }

    private static void testQuietHiddenUnhidePreservesChannelOnNormalAndCrashRecovery(Context context)
            throws Exception {
        // Case A: Normal QUIET -> HIDDEN -> unhide restores silent.v1; NORMAL -> HIDDEN -> unhide restores line_default.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String quietRoom = chatId('c', 1001);
        String normalRoom = chatId('c', 1002);
        FakeLineEnv.CHATS.put(quietRoom, new FakeLineEnv.ChatRow("Quiet Room", "100", 1, false));
        FakeLineEnv.CHATS.put(normalRoom, new FakeLineEnv.ChatRow("Normal Room", "100", 1, false));

        // Put quietRoom into QUIET first, then hide BOTH rooms.
        AtomicReference<Boolean> done = new AtomicReference<Boolean>();
        ChatNotifications.change(context, "u_acc_1", quietRoom, ChatNotifications.QUIET, null, done::set);
        awaitCallback(() -> done.get() != null);
        check(Boolean.TRUE.equals(done.get()) && Settings.quiet("u_acc_1", quietRoom),
                "quietRoom must enter QUIET mode");

        done.set(null);
        ChatNotifications.change(context, "u_acc_1", quietRoom, ChatNotifications.HIDDEN, null, done::set);
        awaitCallback(() -> done.get() != null);
        check(Boolean.TRUE.equals(done.get())
                        && Settings.fullyMuted("u_acc_1", quietRoom)
                        && Settings.quiet("u_acc_1", quietRoom),
                "Hiding a QUIET room must preserve quietKey");

        done.set(null);
        ChatNotifications.change(context, "u_acc_1", normalRoom, ChatNotifications.HIDDEN, null, done::set);
        awaitCallback(() -> done.get() != null);
        check(Boolean.TRUE.equals(done.get())
                        && Settings.fullyMuted("u_acc_1", normalRoom)
                        && !Settings.quiet("u_acc_1", normalRoom),
                "Hiding a NORMAL room must keep quietKey false");

        // Unhide both using the exact same choice logic as SettingsPage / Settings.addChatMenu.
        done.set(null);
        ChatNotifications.change(context, "u_acc_1", quietRoom,
                Settings.quiet("u_acc_1", quietRoom) ? ChatNotifications.QUIET : ChatNotifications.NORMAL,
                null, done::set);
        awaitCallback(() -> done.get() != null);
        done.set(null);
        ChatNotifications.change(context, "u_acc_1", normalRoom,
                Settings.quiet("u_acc_1", normalRoom) ? ChatNotifications.QUIET : ChatNotifications.NORMAL,
                null, done::set);
        awaitCallback(() -> done.get() != null);

        Notifications.post(manager, MESSAGE_TAG, 10011, msgNotification(quietRoom, "101", "Quiet Room", "Quiet msg"));
        Notifications.post(manager, MESSAGE_TAG, 10012, msgNotification(normalRoom, "101", "Normal Room", "Normal msg"));
        Notification afterQuietUnhide = manager.getActiveSlotForTest(MESSAGE_TAG, 10011).getNotification();
        Notification afterNormalUnhide = manager.getActiveSlotForTest(MESSAGE_TAG, 10012).getNotification();
        check(afterQuietUnhide != null && "line_notification_patches.silent.v1".equals(afterQuietUnhide.getChannelId()),
                "QUIET -> HIDDEN -> unhide must restore silent.v1 channel; got="
                        + (afterQuietUnhide == null ? null : afterQuietUnhide.getChannelId()));
        check(afterNormalUnhide != null && "line_default".equals(afterNormalUnhide.getChannelId()),
                "NORMAL -> HIDDEN -> unhide must restore line_default channel; got="
                        + (afterNormalUnhide == null ? null : afterNormalUnhide.getChannelId()));

        // Case B: Process death between native mute commit and existing notification cancel.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        String crashedRoom = chatId('c', 1003);
        String otherRoom = chatId('c', 1004);
        int summaryId = 16880000;
        FakeLineEnv.CHATS.put(crashedRoom, new FakeLineEnv.ChatRow("Crashed Quiet", "100", 1, true));
        FakeLineEnv.CHATS.put(otherRoom, new FakeLineEnv.ChatRow("Other Room", "100", 1, false));
        Settings.prefs().edit().putBoolean(Settings.quietKey("u_acc_1", crashedRoom), true).apply();
        Settings.setPendingHide("u_acc_1", crashedRoom, "Crashed Quiet");

        // Pre-crash surviving child + summary for crashedRoom, plus unrelated otherRoom child.
        manager.putActiveForTest(MESSAGE_TAG, 10031,
                msgNotification(crashedRoom, "101", "Crashed Quiet", "Old hidden msg", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 10041,
                msgNotification(otherRoom, "201", "Other Room", "Other msg", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(crashedRoom, "101", "Crashed Quiet", "Old hidden msg", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));

        // Simulate fresh restart: first normal entry point reconciles pending_hide AND prunes surviving hidden notifications.
        Settings.clearRuntimeStateForTest();
        Notifications.onMessageStored(otherRoom);
        check(Settings.fullyMuted("u_acc_1", crashedRoom)
                        && Settings.quiet("u_acc_1", crashedRoom)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 10031) == null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 10041) != null
                        && otherRoom.equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.chat.id")),
                "Startup reconciliation must prune surviving hidden child/summary while preserving otherRoom and quietKey");

        // Unhide after crash recovery still restores QUIET channel.
        done.set(null);
        ChatNotifications.change(context, "u_acc_1", crashedRoom,
                Settings.quiet("u_acc_1", crashedRoom) ? ChatNotifications.QUIET : ChatNotifications.NORMAL,
                null, done::set);
        awaitCallback(() -> done.get() != null);
        Notifications.post(manager, MESSAGE_TAG, 10032, msgNotification(crashedRoom, "102", "Crashed Quiet", "After unhide"));
        check("line_notification_patches.silent.v1".equals(
                        manager.getActiveSlotForTest(MESSAGE_TAG, 10032).getNotification().getChannelId()),
                "Crash-recovered QUIET room must still restore silent.v1 channel after unhide");
    }

    private static void testReadBoundaryPreSqlGroupCascadeLedgerAndIpcFailure(Context context) throws Exception {
        // Canonical triage fixture: readUp=101, active=101, already-submitted=102, pending=103.
        // Part 1 (#10): Delayed 101 arrives while unread=1, readUp=101 and SQLite throws on recent().
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 1011);
        FakeLineEnv.CONTACTS.put("u_peer_101", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "101", 1, false));
        manager.putActiveForTest(MESSAGE_TAG, 10111,
                msgNotification(chat, "102", "Alice", "Active 102", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Notifications.post(manager, MESSAGE_TAG, 10112, msgNotification(chat, "103", "Alice", "Pending 103"));

        FakeLineEnv.throwOnMessageQuery = true;
        synchronized (FakeLineEnv.class) { FakeLineEnv.QUERIES.clear(); }
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "101", "Alice", "Delayed 101"));
        Notifications.post(manager, MESSAGE_TAG, 10112, msgNotification(chat, "101", "Alice", "Delayed 101"));
        check(FakeLineEnv.getQueriesSnapshot().isEmpty()
                        && manager.getCancelHistoryForTest().isEmpty()
                        && "102".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 10111).getNotification().extras.getString("line.message.id")),
                "Delayed 101 <= readUp must discard BEFORE preview SQL without touching active 102 or pending 103; queries="
                        + FakeLineEnv.getQueriesSnapshot());
        FakeLineEnv.throwOnMessageQuery = false;
        FakeLineEnv.addMessage(chat, "103", 23003L, "u_peer_101", "Stored 103", null, null);
        Notifications.onMessageStored(chat);
        check("103".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 10112).getNotification().extras.getString("line.message.id")),
                "Pending 103 must survive delayed 101 under SQL failure and flush once stored");

        // Part 2 (#5): Grouped summary READ cancel with unread=0, readUp=101 must NOT cascade-cancel newer child 102.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        int summaryId = 16880000;
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "101", 0, false));
        manager.putActiveForTest(MESSAGE_TAG, 10111,
                msgNotification(chat, "102", "Alice", "Child 102", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(chat, "101", "Alice", "Summary 101", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        Notifications.post(manager, null, summaryId,
                msgNotification(chat, "101", "Alice", "Delayed Summary 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check(!manager.getCancelHistoryForTest().contains("<null>#" + summaryId)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 10111) != null,
                "Grouped summary READ cancel (readUp=101) must NOT cancel summary or cascade-cancel newer child 102");

        // Part 3 (#6): Stale active shows 101 while 102 was just submitted under deferred visibility -> 101 READ refuses cancel.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_101", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 23101L, "u_peer_101", "Msg 101", null, null);
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "101", "Alice", "Msg 101"));

        FakeLineEnv.CHATS.get(chat).unread = 2;
        FakeLineEnv.addMessage(chat, "102", 23102L, "u_peer_101", "Msg 102", null, null);
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "102", "Alice", "Msg 102"));
        // Active still shows stale 101 while 102 is queued in NotificationManager.
        FakeLineEnv.CHATS.get(chat).unread = 0;
        FakeLineEnv.CHATS.get(chat).readUp = "101";
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "101", "Alice", "Delayed 101"));
        manager.flushDeferredActiveVisibilityForTest();
        check(manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 10111) != null
                        && "102".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 10111).getNotification().extras.getString("line.message.id")),
                "Delayed 101 READ seeing stale active 101 must respect fresher ledger 102 and NOT cancel 102");

        // Part 3b (#6): Empty active list during hide completion still cancels recently-submitted hidden child & summary.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "105", "Alice", "Just submitted"));
        Notifications.post(manager, null, summaryId,
                msgNotification(chat, "105", "Alice", "Just submitted", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check(manager.getActiveNotifications().length == 0, "Active list should still be empty under deferred visibility");
        Notifications.cancelChatNotifications(manager, "u_acc_1", chat);
        manager.flushDeferredActiveVisibilityForTest();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 10111) == null
                        && manager.getActiveSlotForTest(null, summaryId) == null,
                "Hide cancel with empty active list must still cancel recently-submitted child and summary via ledger");

        // Part 4 (#9): notify() IPC exception must preserve previous SLOT_GEN so subsequent refresh is NOT wedged stale.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_101", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 23201L, "u_peer_101", "Initial 101", null, null);
        Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "101", "Alice", "Initial 101"));

        FakeLineEnv.CHATS.get(chat).unread = 2;
        FakeLineEnv.addMessage(chat, "102", 23202L, "u_peer_101", "Failing 102", null, null);
        manager.failNextNotifyForTest(1);
        boolean threw = false;
        try {
            Notifications.post(manager, MESSAGE_TAG, 10111, msgNotification(chat, "102", "Alice", "Failing 102"));
        } catch (RuntimeException expected) {
            threw = true;
        }
        check(threw, "Simulated notify IPC failure should throw");
        int countAfterFail = manager.getNotifyHistoryForTest().size();
        Notifications.refreshActivePreviews();
        syncWithNotificationsMonitor();
        check(manager.getNotifyHistoryForTest().size() > countAfterFail,
                "notify() IPC failure must NOT advance SLOT_GEN and wedge subsequent refreshes of active slot");
    }

    private static void testPrivacyOffRedactsVisibleSlotWithPendingAndSummaryFallbackAndHiddenRoom(Context context) {
        // Case A (#4): Visible plaintext slot with a pending push on the SAME slot is redacted when privacy turns OFF.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 1021);
        int slotId = 10211;
        FakeLineEnv.CONTACTS.put("u_peer_102", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 24001L, "u_peer_102", "Visible Plaintext 101", null, null);
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "101", "Alice", "Visible Plaintext 101"));

        FakeLineEnv.CHATS.get(chat).unread = 2;
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "102", "Alice", "Pending Plaintext 102"));

        FakeLineEnv.previewsAllowed = false;
        Notifications.refreshActivePreviews();
        syncWithNotificationsMonitor();
        Notification redactedVisible = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check("LINE".equals(String.valueOf(redactedVisible.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(redactedVisible.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Privacy OFF refresh must redact already-visible plaintext even when a newer push is pending on that slot");

        // Pending 102 is still preserved and flushes redacted on save.
        FakeLineEnv.addMessage(chat, "102", 24002L, "u_peer_102", "Saved Plaintext 102", null, null);
        Notifications.onMessageStored(chat);
        Notification flushed102 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check("102".equals(flushed102.extras.getString("line.message.id"))
                        && "LINE".equals(String.valueOf(flushed102.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(flushed102.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Pending 102 must remain queued and deliver redacted once stored");

        // Case B (#4): Summary rebuild with 1st previewsAllowed=false and final check throwing -> generic fallback.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        String roomA = chatId('u', 1022);
        String roomB = chatId('u', 1023);
        int summaryId = 16880000;
        Notification childB = msgNotification(roomB, "202", "Bob", "Room B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1");
        PendingIntent roomBIntent = childB.contentIntent;
        manager.putActiveForTest(MESSAGE_TAG, 10221,
                msgNotification(roomA, "201", "Alice", "Room A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 10231, childB);
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomA, "201", "Alice", "Room A", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));

        FakeLineEnv.previewsAllowed = false;
        AtomicInteger previewCalls = new AtomicInteger();
        FakeLineEnv.onPreviewsAllowedCheck = () -> {
            if (previewCalls.incrementAndGet() >= 2) {
                FakeLineEnv.throwOnPreviewsAllowed = true;
            }
        };
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification genericSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(genericSummary != null
                        && genericSummary.extras.getBoolean("line_notification_patches.generic_summary", false)
                        && genericSummary.extras.getString("line.chat.id") == null
                        && genericSummary.contentIntent != roomBIntent,
                "Summary rebuild with first privacy=false and final lookup failure must fall back to generic summary/intent");

        // Case C (#1): Summary rebuild where remaining single room is already hidden -> generic summary (no hidden text).
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setMuted("u_acc_1", roomB, "Bob", true);
        manager.putActiveForTest(MESSAGE_TAG, 10221,
                msgNotification(roomA, "201", "Alice", "Room A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 10231,
                msgNotification(roomB, "202", "Bob", "Hidden Room B Secret", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomA, "201", "Alice", "Room A", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification hiddenFallback = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(hiddenFallback != null
                        && hiddenFallback.extras.getBoolean("line_notification_patches.generic_summary", false)
                        && "LINE".equals(String.valueOf(hiddenFallback.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && !"Hidden Room B Secret".equals(String.valueOf(hiddenFallback.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Summary rebuild must not copy text from a remaining room that is hidden/hiding");
    }

    private static void testAccountSwitchAfterPendingFlushAndMenuToggleKeepsOriginalAccount(Context context)
            throws Exception {
        // Case A (#7): Switching to Account B immediately after Account A's pending flush must NOT refresh Account B.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String sharedRoom = chatId('c', 1031);
        FakeLineEnv.CONTACTS.put("u_peer_103", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(sharedRoom, new FakeLineEnv.ChatRow("Group 103", "100", 1, false));

        // Account A holds pending 101 on slot 10311.
        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.post(manager, MESSAGE_TAG, 10311, msgNotification(sharedRoom, "101", "Group 103", "Acc1 101"));
        FakeLineEnv.addMessage(sharedRoom, "101", 25001L, "u_peer_103", "Acc1 Stored 101", null, null);

        // Place Account B's existing notification on slot 10312; flush Account A, then immediately switch to Account B.
        manager.putActiveForTest(MESSAGE_TAG, 10312,
                msgNotification(sharedRoom, "201", "Group 103", "Acc2 Active 201", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_2"));
        Notifications.onMessageStored(sharedRoom);
        FakeLineEnv.activeAccount = "u_acc_2";
        FakeLineEnv.CHATS.get(sharedRoom).unread = 0;
        FakeLineEnv.CHATS.get(sharedRoom).readUp = "201";

        int notifyCountAfterA = manager.getNotifyHistoryForTest().size();
        Handler.advanceByForTest(400L);
        syncWithNotificationsMonitor();
        check(manager.getNotifyHistoryForTest().size() == notifyCountAfterA
                        && manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 10312) != null,
                "Trailing refresh scheduled by Account A must not run against or cancel Account B");

        // Case B (#7): Chat-list toggle passes initial account so switching to B before worker executes does not mutate B.
        resetAll(context);
        Settings.setEnabled(Settings.SILENT, true);
        FakeLineEnv.CHATS.put(sharedRoom, new FakeLineEnv.ChatRow("Group 103", "100", 1, false));
        FakeLineEnv.activeAccount = "u_acc_1";
        CountDownLatch muteCalled = FakeLineEnv.prepareDeferredNativeMute();
        // Block ChatNotifications worker with an unrelated room first? Instead switch account immediately after call.
        // interceptChatListToggle computes mode for u_acc_1 and passes expectedAccount="u_acc_1".
        FakeLineEnv.deferNativeMuteCallback = false;
        boolean intercepted = ChatNotifications.interceptChatListToggle(sharedRoom);
        FakeLineEnv.activeAccount = "u_acc_2";
        ChatNotifications.flushWorkerForTest();
        Handler.drainImmediateForTest();
        check(intercepted && !Settings.quiet("u_acc_2", sharedRoom),
                "Chat-list toggle initiated under Account A must never mutate Account B's quiet state");
    }

    private static void testStandaloneNoReplyToggleRestoresPhoneAndWearableChoices(Context context) {
        resetAll(context);
        context.getResources().putStringForTest("notification_button_reply", "Reply");
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        Settings.setEnabled(Settings.SILENT, false);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.NO_REPLY, false);
        String chat = chatId('u', 1041);
        int slotId = 10411;
        FakeLineEnv.CONTACTS.put("u_peer_104", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 26001L, "u_peer_104", "Hello 101", null, null);

        Notification.Action replyWithChoices = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_menu_send),
                "Reply",
                PendingIntent.getService(context, 41, new Intent("test.reply"), 0))
                .setAllowGeneratedReplies(true)
                .addRemoteInput(new RemoteInput.Builder("reply_key")
                        .setLabel("Reply")
                        .setAllowFreeFormInput(true)
                        .setChoices(new CharSequence[]{"Yes", "No"})
                        .build())
                .build();
        Notification input = msgNotification(chat, "101", "Alice", "Hello 101");
        input.actions = new Notification.Action[]{replyWithChoices};
        Bundle wear = new Bundle();
        ArrayList<Notification.Action> wearActions = new ArrayList<Notification.Action>();
        wearActions.add(replyWithChoices);
        wear.putParcelableArrayList("actions", wearActions);
        input.extras.putBundle("android.wearable.EXTENSIONS", wear);

        Notifications.post(manager, MESSAGE_TAG, slotId, input);

        // Turn NO_REPLY ON alone in default layout: choices cleared & generated replies off, free-form kept.
        Settings.setEnabled(Settings.NO_REPLY, true);
        Notification filtered = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        ArrayList<Notification.Action> filteredWear = filtered.extras.getBundle("android.wearable.EXTENSIONS")
                .getParcelableArrayList("actions");
        check(filtered.actions != null && filtered.actions.length == 1
                        && !filtered.getAllowSystemGeneratedContextualActions()
                        && !filtered.actions[0].getAllowGeneratedReplies()
                        && filtered.actions[0].getRemoteInputs()[0].getAllowFreeFormInput()
                        && filtered.actions[0].getRemoteInputs()[0].getChoices() == null
                        && filteredWear != null && filteredWear.size() == 1
                        && !filteredWear.get(0).getAllowGeneratedReplies()
                        && filteredWear.get(0).getRemoteInputs()[0].getChoices() == null,
                "NO_REPLY ON must strip choices and generated replies while keeping manual free-form input on phone & wearable");

        // Turn NO_REPLY OFF: original choices & generated replies restored on both phone & wearable.
        Settings.setEnabled(Settings.NO_REPLY, false);
        Notification restored = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        ArrayList<Notification.Action> restoredWear = restored.extras.getBundle("android.wearable.EXTENSIONS")
                .getParcelableArrayList("actions");
        check(restored.actions != null && restored.actions.length == 1
                        && restored.getAllowSystemGeneratedContextualActions()
                        && restored.actions[0].getAllowGeneratedReplies()
                        && restored.actions[0].getRemoteInputs()[0].getChoices() != null
                        && restored.actions[0].getRemoteInputs()[0].getChoices().length == 2
                        && restoredWear != null && restoredWear.size() == 1
                        && restoredWear.get(0).getAllowGeneratedReplies()
                        && restoredWear.get(0).getRemoteInputs()[0].getChoices() != null
                        && restoredWear.get(0).getRemoteInputs()[0].getChoices().length == 2
                        && !restored.extras.containsKey("line_notification_patches.native_actions")
                        && !restored.extras.containsKey("line_notification_patches.native_wearable_actions"),
                "NO_REPLY OFF must restore original reply choices and generated-replies attributes on phone & wearable");
    }

    private static void testCrossProcessSlotEpochAndNormalCrashRecoveryChannel(Context context) throws Exception {
        // Part 1: Prior-process active 101 has SLOT_GEN=80; restarted process posts 102 with SLOT_GEN=1.
        // Delayed READ 101 seeing stale active 101 must NOT cancel newer 102 despite 1 < 80.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 1101);
        int slotId = 11011;
        FakeLineEnv.CONTACTS.put("u_peer_1101", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 31001L, "u_peer_1101", "Prior Process 101", null, null);
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "101", "Alice", "Prior Process 101"));
        Notification activePrior = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        activePrior.extras.putLong("line_notification_patches.slot_gen", 80L);

        // Simulate LINE process restart (new processEpoch, SLOT_LEDGER empty, nextPublishSeq reset to 0).
        Notifications.resetProcessEpochForTest();
        FakeLineEnv.CHATS.get(chat).unread = 2;
        FakeLineEnv.addMessage(chat, "102", 31002L, "u_peer_1101", "Restarted 102", null, null);
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "102", "Alice", "Restarted 102"));
        // Active list still shows prior-process 101 (SLOT_GEN=80) while ledger holds new-epoch 102 (SLOT_GEN=1).
        FakeLineEnv.CHATS.get(chat).unread = 0;
        FakeLineEnv.CHATS.get(chat).readUp = "101";
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat, "101", "Alice", "Delayed 101"));
        manager.flushDeferredActiveVisibilityForTest();
        Notification surviving = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check(manager.getCancelHistoryForTest().isEmpty()
                        && surviving != null
                        && "102".equals(surviving.extras.getString("line.message.id")),
                "Cross-process SLOT_GEN reset must compare SLOT_EPOCH first and NOT let delayed 101 cancel 102");

        // Part 2 (#11): NORMAL room crash-recovery (pending_hide + nativeMuted=true) -> unhide restores normal channel.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String normalRoom = chatId('u', 1102);
        String otherRoom = chatId('u', 1103);
        FakeLineEnv.CHATS.put(normalRoom, new FakeLineEnv.ChatRow("Normal Room", "100", 1, false));
        FakeLineEnv.CHATS.put(otherRoom, new FakeLineEnv.ChatRow("Other Room", "100", 1, false));
        manager.putActiveForTest(MESSAGE_TAG, 11021,
                msgNotification(normalRoom, "101", "Normal Room", "Surviving before crash", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        check(!Settings.quiet("u_acc_1", normalRoom), "Room must start in NORMAL mode");

        // Simulate crash mid-hide after native mute persisted on LINE.
        check(Settings.setPendingHide("u_acc_1", normalRoom, "Normal Room"), "pending_hide marker must commit");
        FakeLineEnv.CHATS.get(normalRoom).nativeMuted = true;
        Settings.clearRuntimeStateForTest();
        Notifications.onMessageStored(otherRoom);
        check(Settings.fullyMuted("u_acc_1", normalRoom)
                        && !Settings.quiet("u_acc_1", normalRoom)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 11021) == null,
                "Startup reconcile must commit NORMAL pending_hide, keep quiet=false, and prune surviving notification");

        // Unhide using same target selection as UI (quiet ? QUIET : NORMAL -> NORMAL).
        AtomicReference<Boolean> unhideDone = new AtomicReference<Boolean>();
        ChatNotifications.change(context, "u_acc_1", normalRoom,
                Settings.quiet("u_acc_1", normalRoom) ? ChatNotifications.QUIET : ChatNotifications.NORMAL,
                null, unhideDone::set);
        awaitCallback(() -> unhideDone.get() != null);
        check(Boolean.TRUE.equals(unhideDone.get()) && !Settings.fullyMuted("u_acc_1", normalRoom),
                "Unhide after NORMAL crash recovery must succeed");
        Notifications.post(manager, MESSAGE_TAG, 11022, msgNotification(normalRoom, "102", "Normal Room", "After unhide"));
        Notification afterUnhide = manager.getActiveSlotForTest(MESSAGE_TAG, 11022).getNotification();
        check(afterUnhide != null && "line_default".equals(afterUnhide.getChannelId()),
                "Crash-recovered NORMAL room must deliver on normal channel after unhide; channel="
                        + (afterUnhide == null ? "null" : afterUnhide.getChannelId()));
    }

    private static void testReadChecksBeforePreviewFailureMissingIdAndPendingIpcFailure(Context context) {
        // Part 1 (#10a): First previewsAllowed() (top of transform) SUCCEEDS; NativeLine.chat() returns readUp=101,
        // unread=1; 2nd previewsAllowed() throws once and 3rd (catch) succeeds. READ check must return BEFORE 2nd call.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 1104);
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "101", 1, false));
        AtomicInteger previewCalls = new AtomicInteger();
        FakeLineEnv.onPreviewsAllowedCheck = () -> {
            int n = previewCalls.incrementAndGet();
            FakeLineEnv.throwOnPreviewsAllowed = (n == 2);
        };
        Notifications.post(manager, MESSAGE_TAG, 11041, msgNotification(chat, "101", "Alice", "Delayed 101"));
        check(previewCalls.get() == 1
                        && manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 11041) == null,
                "Delayed 101 <= readUp must discard right after chat() before 2nd previewsAllowed() throws; calls="
                        + previewCalls.get());

        // Part 2 (#10b): 2nd re-query (afterImages) advances readUp to 101 while unread=1 -> must DISCARD (not generic LINE).
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_1105", new FakeLineEnv.ContactRow("Bob", "/avatars/bob.jpg"));
        String chat2 = chatId('c', 1105);
        FakeLineEnv.CHATS.put(chat2, new FakeLineEnv.ChatRow("Group 1105", "100", 1, false));
        FakeLineEnv.addMessage(chat2, "101", 32001L, "u_peer_1105", "Msg 101", null, null);
        FakeLineEnv.onAvatarLoad = () -> {
            FakeLineEnv.ChatRow row = FakeLineEnv.CHATS.get(chat2);
            row.readUp = "101";
            row.unread = 1;
        };
        Notifications.post(manager, MESSAGE_TAG, 11051, msgNotification(chat2, "101", "Group 1105", "Msg 101"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 11051) == null,
                "Re-query advancing readUp to posted 101 while unread>0 must DISCARD without generic LINE post");

        // Part 3 (#5): Active child, active summary, and pending post with null/non-numeric message ID must NOT be READ-canceled.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat3 = chatId('u', 1106);
        int summaryId = 16880000;
        FakeLineEnv.CHATS.put(chat3, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        // Hold a pending post with a non-numeric message ID via unstored hold.
        Notifications.post(manager, MESSAGE_TAG, 11062, msgNotification(chat3, "not_numeric", "Alice", "Pending Bad ID"));
        // Place active child (non-numeric ID) and active summary (null ID).
        manager.putActiveForTest(MESSAGE_TAG, 11061,
                msgNotification(chat3, "abc", "Alice", "Active Bad ID", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(chat3, null, "Alice", "Summary Null ID", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));

        // Isolated zero-child group with null-ID active summary: ONLY the summary's own READ ID check blocks cancel/repost.
        int isolatedSummaryId = 16880001;
        manager.putActiveForTest(null, isolatedSummaryId,
                msgNotification(chat3, null, "Alice", "Isolated Null ID Summary", "ISOLATED_GROUP_ZERO_CHILDREN", true, "u_acc_1"));

        FakeLineEnv.CHATS.get(chat3).unread = 0;
        FakeLineEnv.CHATS.get(chat3).readUp = "101";
        Notifications.post(manager, MESSAGE_TAG, 11061, msgNotification(chat3, "101", "Alice", "Delayed 101"));
        Notifications.post(manager, null, summaryId,
                msgNotification(chat3, "101", "Alice", "Delayed Summary 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Notifications.post(manager, null, isolatedSummaryId,
                msgNotification(chat3, "101", "Alice", "Delayed Isolated Summary 101", "ISOLATED_GROUP_ZERO_CHILDREN", true, null));
        Notifications.post(manager, MESSAGE_TAG, 11062, msgNotification(chat3, "101", "Alice", "Delayed 101"));
        check(manager.getCancelHistoryForTest().isEmpty()
                        && manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 11061) != null
                        && manager.getActiveSlotForTest(null, summaryId) != null
                        && manager.getActiveSlotForTest(null, isolatedSummaryId) != null,
                "READ cancel must require valid positive numeric ID <= readUp even for zero-child null-ID summary");
        // Verify pending post on 11062 survived READ cancel by advancing timeout and confirming delivery.
        FakeLineEnv.CHATS.get(chat3).unread = 1;
        FakeLineEnv.CHATS.get(chat3).readUp = "100";
        Handler.advanceByForTest(1300L);
        syncWithNotificationsMonitor();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 11062) != null
                        && "not_numeric".equals(manager.getActiveSlotForTest(MESSAGE_TAG, 11062).getNotification().extras.getString("line.message.id")),
                "Pending post with non-numeric message ID must NOT be deleted by READ cancel");

        // Part 4 (#9): Fresh post 102 throwing in notify() must preserve existing pending 101 on the same slot.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat4 = chatId('u', 1107);
        int slotId = 11071;
        FakeLineEnv.CONTACTS.put("u_peer_1107", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat4, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        // 101 is not stored yet -> queued in PENDING_POSTS on slot 11071.
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat4, "101", "Alice", "Pending 101"));
        // 102 IS stored -> fresh deliver attempts notify() which fails with IPC RuntimeException.
        FakeLineEnv.CHATS.get(chat4).unread = 2;
        FakeLineEnv.addMessage(chat4, "102", 32102L, "u_peer_1107", "Stored 102", null, null);
        manager.failNextNotifyForTest(1);
        boolean threw = false;
        try {
            Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(chat4, "102", "Alice", "Stored 102"));
        } catch (RuntimeException expected) {
            threw = true;
        }
        check(threw && manager.getActiveSlotForTest(MESSAGE_TAG, slotId) == null,
                "Failed fresh notify() for 102 should throw and leave slot empty");
        // Now store 101 and flush -> pending 101 must still be present and deliver!
        FakeLineEnv.addMessage(chat4, "101", 32101L, "u_peer_1107", "Stored 101", null, null);
        Notifications.onMessageStored(chat4);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, slotId) != null
                        && "101".equals(manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification().extras.getString("line.message.id")),
                "Fresh post 102 IPC notify() failure must NOT delete pre-existing pending 101 on the same slot");
    }

    private static void testBulkCancelLedgerConflictSummaryPublicShortcutAndSharedPendingOrder(Context context)
            throws Exception {
        // Part 1 (#6a): cancelChatNotifications sees stale active Room A on child+summary slots while SLOT_LEDGER
        // already holds fresher Room B on those SAME slots -> must NOT cancel Room B.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String roomA = chatId('u', 1108);
        String roomB = chatId('u', 1109);
        int sharedChildSlot = 11081;
        int summaryId = 16880000;
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        Notifications.post(manager, MESSAGE_TAG, sharedChildSlot,
                msgNotification(roomA, "101", "Room A", "Old Room A", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Room A", "Old Room A", "NOTIFICATION_GROUP_MESSAGE", true, null));

        // Now Room B posts fresher notifications to those exact slots under deferred active visibility.
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, MESSAGE_TAG, sharedChildSlot,
                msgNotification(roomB, "201", "Room B", "Fresh Room B", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "201", "Room B", "Fresh Room B", "NOTIFICATION_GROUP_MESSAGE", true, null));
        // Bulk-hide Room A while active still shows stale Room A.
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        manager.flushDeferredActiveVisibilityForTest();
        check(manager.getCancelHistoryForTest().isEmpty()
                        && roomB.equals(manager.getActiveSlotForTest(MESSAGE_TAG, sharedChildSlot).getNotification().extras.getString("line.chat.id"))
                        && roomB.equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.chat.id")),
                "Bulk hide cancel for Room A must check SLOT_LEDGER before canceling and preserve fresher Room B on same slots");

        // Part 2 (#6b): rebuildSummaryWithoutCanceledChat must abort when SLOT_LEDGER has a fresher summary on summaryId.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        Notifications.post(manager, MESSAGE_TAG, 11082,
                msgNotification(roomA, "101", "Room A", "Child A", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, MESSAGE_TAG, 11083,
                msgNotification(roomB, "201", "Room B", "Child B", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Room A", "Summary A", "NOTIFICATION_GROUP_MESSAGE", true, null));

        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "202", "Room B", "Fresher Summary B", "NOTIFICATION_GROUP_MESSAGE", true, null));
        int notifyCountBeforeCancel = manager.getNotifyHistoryForTest().size();
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        manager.flushDeferredActiveVisibilityForTest();
        Notification finalSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 11082) == null
                        && manager.getNotifyHistoryForTest().size() == notifyCountBeforeCancel
                        && finalSummary != null
                        && "202".equals(finalSummary.extras.getString("line.message.id")),
                "Summary rebuild must abort when SLOT_LEDGER holds a fresher summary on summaryId");

        // Part 3: Rebuilt summary publicVersion must clear original Room A shortcutId.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Notification pubWithShortcut = new Notification();
        pubWithShortcut.extras = new Bundle();
        pubWithShortcut.extras.putCharSequence(Notification.EXTRA_TITLE, "Room A");
        pubWithShortcut.extras.putCharSequence(Notification.EXTRA_TEXT, "Room A Secret");
        pubWithShortcut.setShortcutIdForTest("shortcut_room_A");
        Notification summaryWithPub = msgNotification(roomA, "101", "Room A", "Summary A", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1");
        summaryWithPub.publicVersion = pubWithShortcut;
        manager.putActiveForTest(MESSAGE_TAG, 11084,
                msgNotification(roomA, "101", "Room A", "Child A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 11085,
                msgNotification(roomB, "201", "Room B", "Child B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId, summaryWithPub);
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification rebuiltSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(rebuiltSummary != null
                        && rebuiltSummary.publicVersion != null
                        && rebuiltSummary.publicVersion.getShortcutId() == null,
                "Rebuilt summary publicVersion must clear previous room shortcutId; got="
                        + (rebuiltSummary == null || rebuiltSummary.publicVersion == null ? "null" : rebuiltSummary.publicVersion.getShortcutId()));

        // Part 4 (PENDING_POSTS shared summary): Newer Room A summary flushing first invalidates older Room B pending on same slot.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        FakeLineEnv.CONTACTS.put("u_peer_1109", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "300", 1, false));
        FakeLineEnv.addMessage(roomA, "301", 33001L, "u_peer_1109", "Stored Room A", null, null);
        // Room B summary 201 is unstored -> held in PENDING_POSTS (older enqueuedSeq=1).
        Notifications.post(manager, null, summaryId,
                msgNotification(roomB, "201", "Room B", "Older Pending B", "NOTIFICATION_GROUP_MESSAGE", true, null));
        // Room A starts in-flight hide, then posts summary 301 on SAME summaryId (newer enqueuedSeq=2).
        CountDownLatch hideInFlight = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> hideCb = new AtomicReference<Boolean>();
        ChatNotifications.change(context, "u_acc_1", roomA, ChatNotifications.HIDDEN, null, hideCb::set);
        check(hideInFlight.await(3L, TimeUnit.SECONDS), "Timed out waiting for Room A deferred hide");
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "301", "Room A", "Newer Pending A", "NOTIFICATION_GROUP_MESSAGE", true, null));
        // Abort Room A hide -> Room A summary 301 flushes FIRST and must invalidate older Room B pending 201.
        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> hideCb.get() != null);
        awaitLogContains("hide: aborted, pending re-evaluated");
        check(manager.getActiveSlotForTest(null, summaryId) != null
                        && roomA.equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.chat.id")),
                "Room A newer summary should deliver on hide abort");
        // Advance past Room B's 1.2s pending timeout -> Room B's stale pending must NOT overwrite Room A's summary!
        Handler.advanceByForTest(1300L);
        syncWithNotificationsMonitor();
        Notification afterTimeout = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(afterTimeout != null
                        && roomA.equals(afterTimeout.extras.getString("line.chat.id"))
                        && "301".equals(afterTimeout.extras.getString("line.message.id")),
                "Flushing newer Room A summary must invalidate older Room B pending on shared summary slot");
    }

    private static void testPrivacyRefreshSummaryAndAvatarPendingAccountSwitchReconcileAndNoReplyOnly(Context context)
            throws Exception {
        // Part 1 (#4a): refreshReadActions() (NO_REPLY toggle) with privacy OFF must redact active plaintext single-room summary.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat = chatId('u', 1110);
        int summaryId = 16880000;
        FakeLineEnv.CONTACTS.put("u_peer_1110", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chat, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chat, "101", 34001L, "u_peer_1110", "Plaintext Summary Body", null, null);
        Notifications.post(manager, null, summaryId,
                msgNotification(chat, "101", "Alice", "Plaintext Summary Body", "NOTIFICATION_GROUP_MESSAGE", true, null));
        check("Plaintext Summary Body".equals(String.valueOf(
                        manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Precondition: single-room summary should initially contain plaintext");
        FakeLineEnv.previewsAllowed = false;
        Settings.setEnabled(Settings.NO_REPLY, true);
        Notification redactedSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(redactedSummary != null
                        && "LINE".equals(String.valueOf(redactedSummary.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(redactedSummary.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "refreshReadActions() when LINE privacy is OFF must redact active plaintext single-room summary");

        // Part 2 (#4b): Fresh 102 seeing privacy OFF during avatar load must cancel older active 101 while preserving newer pending 103.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String group = chatId('c', 1111);
        int slotId = 11111;
        FakeLineEnv.CONTACTS.put("u_peer_1111", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));
        FakeLineEnv.CHATS.put(group, new FakeLineEnv.ChatRow("Group 1111", "100", 2, false));
        FakeLineEnv.addMessage(group, "101", 34101L, "u_peer_1111", "Old 101", null, null);
        FakeLineEnv.addMessage(group, "102", 34102L, "u_peer_1111", "Mid 102", null, null);
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(group, "101", "Group 1111", "Old 101"));
        // Pending newer 103 (unstored) is queued on the SAME slot.
        FakeLineEnv.CHATS.get(group).unread = 3;
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(group, "103", "Group 1111", "Pending Newer 103"));
        // Out-of-order fresh 102 runs avatar load during which privacy turns OFF.
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.previewsAllowed = false;
        Notifications.post(manager, MESSAGE_TAG, slotId, msgNotification(group, "102", "Group 1111", "Mid 102"));
        check(manager.getActiveSlotForTest(MESSAGE_TAG, slotId) == null,
                "Privacy OFF during 102 avatar load must cancel older plaintext active 101");
        // Now 103 is saved -> pending 103 must have survived and deliver redacted!
        FakeLineEnv.onAvatarLoad = null;
        FakeLineEnv.addMessage(group, "103", 34103L, "u_peer_1111", "Saved 103", null, null);
        Notifications.onMessageStored(group);
        Notification delivered103 = manager.getActiveSlotForTest(MESSAGE_TAG, slotId).getNotification();
        check(delivered103 != null
                        && "103".equals(delivered103.extras.getString("line.message.id"))
                        && "LINE".equals(String.valueOf(delivered103.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(delivered103.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Privacy OFF during 102 avatar load must preserve newer pending 103 on same slot and flush redacted");

        // Part 3 (#7): Account switch A->B during NativeLine.muted(chat) must abort instead of early-succeeding on B's muted state.
        resetAll(context);
        Settings.setEnabled(Settings.SILENT, true);
        String sharedRoom = chatId('c', 1112);
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(sharedRoom, new FakeLineEnv.ChatRow("Shared Room", "100", 1, true));
        FakeLineEnv.onMutedCheck = () -> FakeLineEnv.activeAccount = "u_acc_2";
        AtomicReference<Boolean> hideRes = new AtomicReference<Boolean>();
        ChatNotifications.change(context, "u_acc_1", sharedRoom, ChatNotifications.HIDDEN, null, hideRes::set);
        awaitCallback(() -> hideRes.get() != null);
        check(Boolean.FALSE.equals(hideRes.get())
                        && !Settings.fullyMuted("u_acc_1", sharedRoom)
                        && !Settings.fullyMuted("u_acc_2", sharedRoom),
                "Account switch during NativeLine.muted() must abort hide instead of early-succeeding on new account's state");

        // Part 4 (#2): Async reconcile interrupted by account switch A->B must NOT mark A reconciled; returning to A retries & prunes.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        String hiddenRoom = chatId('u', 1113);
        String triggerRoom = chatId('u', 1114);
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(hiddenRoom, new FakeLineEnv.ChatRow("Hidden 1113", "100", 1, true));
        FakeLineEnv.CHATS.put(triggerRoom, new FakeLineEnv.ChatRow("Trigger 1114", "100", 1, false));
        check(Settings.setPendingHide("u_acc_1", hiddenRoom, "Hidden 1113"), "pending_hide should commit");
        manager.putActiveForTest(MESSAGE_TAG, 11131,
                msgNotification(hiddenRoom, "101", "Hidden 1113", "Surviving hidden", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Settings.clearRuntimeStateForTest();
        AtomicBoolean switchedOnce = new AtomicBoolean(false);
        FakeLineEnv.onMutedCheck = () -> {
            if (switchedOnce.compareAndSet(false, true)) {
                FakeLineEnv.activeAccount = "u_acc_2";
            }
        };
        Notifications.allowMuted(new ke8.z(), triggerRoom);
        Notifications.flushWorkerForTest();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 11131) != null,
                "Interrupted async reconcile on account switch A->B must not prune A's notification while on B");
        // Return to Account A and trigger allowMuted again -> reconcile must retry and prune surviving notification!
        FakeLineEnv.onMutedCheck = null;
        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.allowMuted(new ke8.z(), triggerRoom);
        Notifications.flushWorkerForTest();
        check(Settings.fullyMuted("u_acc_1", hiddenRoom)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 11131) == null,
                "Returning to Account A after interrupted async reconcile must retry and prune surviving hidden notification");

        // Part 5 (P2-B): Standalone No-reply-only selection stamps ACCOUNT while OFF, updates live on ON->OFF,
        // and preserves original allowSystemGeneratedContextualActions=false.
        resetAll(context);
        context.getResources().putStringForTest("notification_button_reply", "Reply");
        manager = context.getSystemService(NotificationManager.class);
        Settings.test_silentIncluded = false;
        Settings.test_infoIncluded = false;
        Settings.test_readIncluded = false;
        Settings.test_noReplyIncluded = true;
        Settings.setEnabled(Settings.SILENT, false);
        Settings.setEnabled(Settings.INFO, false);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.NO_REPLY, false);
        String soloRoom = chatId('u', 1115);
        int soloSlot = 11151;
        Notification.Action replyAct = new Notification.Action.Builder(
                Icon.createWithResource("android", android.R.drawable.ic_menu_send),
                "Reply",
                PendingIntent.getService(context, 45, new Intent("test.reply.solo"), 0))
                .setAllowGeneratedReplies(true)
                .addRemoteInput(new RemoteInput.Builder("reply_key")
                        .setLabel("Reply")
                        .setAllowFreeFormInput(true)
                        .setChoices(new CharSequence[]{"OK", "Later"})
                        .build())
                .build();
        Notification rawSolo = msgNotification(soloRoom, "101", "Solo", "Hello Solo");
        rawSolo.actions = new Notification.Action[]{replyAct};
        Notification inputFalseCtx = Notification.Builder.recoverBuilder(context, rawSolo)
                .setAllowSystemGeneratedContextualActions(false)
                .build();
        inputFalseCtx.actions = new Notification.Action[]{replyAct};

        Notifications.post(manager, MESSAGE_TAG, soloSlot, inputFalseCtx);
        Notification initialDelivered = manager.getActiveSlotForTest(MESSAGE_TAG, soloSlot).getNotification();
        check("u_acc_1".equals(initialDelivered.extras.getString(Notifications.ACCOUNT))
                        && !initialDelivered.getAllowSystemGeneratedContextualActions(),
                "Standalone No-reply-only selection must stamp ACCOUNT even while NO_REPLY=false and keep original contextual=false");

        Settings.setEnabled(Settings.NO_REPLY, true);
        Notification soloOn = manager.getActiveSlotForTest(MESSAGE_TAG, soloSlot).getNotification();
        check(soloOn.actions != null && soloOn.actions.length == 1
                        && !soloOn.getAllowSystemGeneratedContextualActions()
                        && soloOn.actions[0].getRemoteInputs()[0].getChoices() == null
                        && soloOn.extras.containsKey("line_notification_patches.orig_contextual_actions")
                        && !soloOn.extras.getBoolean("line_notification_patches.orig_contextual_actions", true),
                "Toggling NO_REPLY ON in standalone selection must live-strip choices and record original contextual=false");

        Settings.setEnabled(Settings.NO_REPLY, false);
        Notification soloOff = manager.getActiveSlotForTest(MESSAGE_TAG, soloSlot).getNotification();
        check(soloOff.actions != null && soloOff.actions.length == 1
                        && !soloOff.getAllowSystemGeneratedContextualActions()
                        && soloOff.actions[0].getRemoteInputs()[0].getChoices() != null
                        && soloOff.actions[0].getRemoteInputs()[0].getChoices().length == 2
                        && !soloOff.extras.containsKey("line_notification_patches.orig_contextual_actions")
                        && !soloOff.extras.containsKey("line_notification_patches.native_actions"),
                "Toggling NO_REPLY OFF must restore original allowSystemGeneratedContextualActions=false and choices without stale extras");
    }

    private static void testAstraV2BlockersAndLedgerCap(Context context) throws Exception {
        // Blocker 1: Newer active 103 must be redacted in place when delayed 102 sees privacy OFF during avatar load,
        // while any even newer pending 104 on the same slot stays preserved and flushes redacted.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chat1 = chatId('c', 1201);
        int slot1 = 12011;
        FakeLineEnv.CONTACTS.put("u_peer_1201", new FakeLineEnv.ContactRow("Alice", "/avatars/alice.jpg"));
        FakeLineEnv.CHATS.put(chat1, new FakeLineEnv.ChatRow("Room 1201", "100", 2, false));
        FakeLineEnv.addMessage(chat1, "102", 41002L, "u_peer_1201", "Delayed 102", null, null);
        FakeLineEnv.addMessage(chat1, "103", 41003L, "u_peer_1201", "Active Plaintext 103", null, null);
        Notifications.post(manager, MESSAGE_TAG, slot1, msgNotification(chat1, "103", "Room 1201", "Active Plaintext 103"));
        // Also hold pending 104 (unstored) on the SAME slot.
        FakeLineEnv.CHATS.get(chat1).unread = 3;
        Notifications.post(manager, MESSAGE_TAG, slot1, msgNotification(chat1, "104", "Room 1201", "Pending 104"));
        // Delayed 102 loads avatar while privacy turns OFF.
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.previewsAllowed = false;
        Notifications.post(manager, MESSAGE_TAG, slot1, msgNotification(chat1, "102", "Room 1201", "Delayed 102"));
        Notification active103AfterPrivacyOff = manager.getActiveSlotForTest(MESSAGE_TAG, slot1).getNotification();
        check(manager.getCancelHistoryForTest().isEmpty()
                        && active103AfterPrivacyOff != null
                        && "103".equals(active103AfterPrivacyOff.extras.getString("line.message.id"))
                        && "LINE".equals(String.valueOf(active103AfterPrivacyOff.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(active103AfterPrivacyOff.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Delayed 102 seeing privacy OFF during avatar load must redact newer active 103 in place without canceling it");
        // Verify pending 104 survived and flushes redacted once stored.
        FakeLineEnv.onAvatarLoad = null;
        FakeLineEnv.addMessage(chat1, "104", 41004L, "u_peer_1201", "Stored 104", null, null);
        Notifications.onMessageStored(chat1);
        Notification flushed104 = manager.getActiveSlotForTest(MESSAGE_TAG, slot1).getNotification();
        check(flushed104 != null
                        && "104".equals(flushed104.extras.getString("line.message.id"))
                        && "LINE".equals(String.valueOf(flushed104.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(flushed104.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Pending 104 on same slot must survive active-103 privacy redaction and flush redacted");

        // Blocker 2: hideDisposition under STATE_LOCK classifies live pending_hide as HIDE_IN_FLIGHT (never HIDE_CONFIRMED).
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String chat2 = chatId('u', 1202);
        FakeLineEnv.CHATS.put(chat2, new FakeLineEnv.ChatRow("Room 1202", "100", 1, false));
        CountDownLatch hideEntered = FakeLineEnv.prepareDeferredNativeMute();
        AtomicReference<Boolean> hideCb2 = new AtomicReference<Boolean>();
        ChatNotifications.change(context, "u_acc_1", chat2, ChatNotifications.HIDDEN, null, hideCb2::set);
        check(hideEntered.await(3L, TimeUnit.SECONDS), "Timed out waiting for deferred hide in Blocker 2");
        check(Settings.confirmedMutedOnly("u_acc_1", chat2)
                        && ChatNotifications.hideDisposition("u_acc_1", chat2) == ChatNotifications.HIDE_IN_FLIGHT,
                "In-flight hide with pending_hide marker committed must report HIDE_IN_FLIGHT, never HIDE_CONFIRMED");
        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> hideCb2.get() != null);
        awaitLogContains("hide: aborted, pending re-evaluated");
        check(ChatNotifications.hideDisposition("u_acc_1", chat2) == ChatNotifications.HIDE_NONE,
                "Aborted hide must clear pending_hide and return HIDE_NONE");

        // Blocker 3a: Delayed onHideCompletedAsync after quick unhide must NOT cancel new post-unhide notification or pending.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, true);
        String chat3 = chatId('u', 1203);
        FakeLineEnv.CONTACTS.put("u_peer_1203", new FakeLineEnv.ContactRow("Bob", null));
        FakeLineEnv.CHATS.put(chat3, new FakeLineEnv.ChatRow("Room 1203", "100", 2, false));
        FakeLineEnv.addMessage(chat3, "102", 42002L, "u_peer_1203", "Post-unhide 102", null, null);
        Settings.commitHideSuccess("u_acc_1", chat3, "Room 1203");
        // User immediately unhides before delayed first cleanup runs, and 102 + pending 103 arrive.
        Settings.setMuted("u_acc_1", chat3, "Room 1203", false);
        Notifications.post(manager, MESSAGE_TAG, 12031, msgNotification(chat3, "102", "Room 1203", "Post-unhide 102"));
        Notifications.post(manager, MESSAGE_TAG, 12032, msgNotification(chat3, "103", "Room 1203", "Pending 103"));
        AtomicBoolean after3a = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", chat3, () -> after3a.set(true));
        Notifications.flushWorkerForTest();
        check(after3a.get()
                        && manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 12031) != null,
                "Delayed first hide cleanup after unhide must NOT cancel post-unhide notification");
        FakeLineEnv.addMessage(chat3, "103", 42003L, "u_peer_1203", "Stored 103", null, null);
        Notifications.onMessageStored(chat3);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 12032) != null,
                "Delayed first hide cleanup after unhide must NOT wipe post-unhide pending posts");

        // Blocker 3b: Already-reconciled Account A switches to B before onHideCompletedAsync runs -> returning to A retries prune.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        String chat3b = chatId('u', 1204);
        String other3b = chatId('u', 1205);
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(chat3b, new FakeLineEnv.ChatRow("Room 1204", "100", 1, true));
        FakeLineEnv.CHATS.put(other3b, new FakeLineEnv.ChatRow("Other 1205", "100", 1, false));
        // Mark Account A already reconciled first.
        Settings.ensureAccountReconciled("u_acc_1", false);
        Settings.commitHideSuccess("u_acc_1", chat3b, "Room 1204");
        manager.putActiveForTest(MESSAGE_TAG, 12041,
                msgNotification(chat3b, "101", "Room 1204", "Surviving A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        // Switch to B before first cleanup runs.
        FakeLineEnv.activeAccount = "u_acc_2";
        AtomicBoolean after3b = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", chat3b, () -> after3b.set(true));
        Notifications.flushWorkerForTest();
        check(after3b.get() && manager.getActiveSlotForTest(MESSAGE_TAG, 12041) != null,
                "Hide cleanup skipped on A->B switch must still run callback and leave A's slot until A returns");
        // Return to A: A must re-reconcile and prune surviving hidden 12041!
        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.allowMuted(new ke8.z(), other3b);
        Notifications.flushWorkerForTest();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 12041) == null,
                "Returning to Account A after skipped hide cleanup must re-trigger reconcile and prune surviving hidden slot");

        // Blocker 3c: IPC throw inside onHideCompletedAsync must still execute afterCleanup callback in finally.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.commitHideSuccess("u_acc_1", chat3b, "Room 1204");
        manager.onGetActiveNotificationsForTest = () -> { throw new RuntimeException("Simulated active IPC failure"); };
        AtomicBoolean after3c = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", chat3b, () -> after3c.set(true));
        Notifications.flushWorkerForTest();
        manager.onGetActiveNotificationsForTest = null;
        check(after3c.get(), "IPC RuntimeException inside onHideCompletedAsync must still invoke afterCleanup in finally");

        // Blocker 4: Hidden Room A's fresher plaintext summary in SLOT_LEDGER while Room B child is in SLOT_LEDGER
        // must be immediately replaced with a clean summary (never leaving hidden Room A plaintext behind).
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String roomA = chatId('u', 1206);
        String roomB = chatId('u', 1207);
        int summaryId = 16880000;
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        Notifications.post(manager, MESSAGE_TAG, 12061,
                msgNotification(roomA, "101", "Room A", "Child A1", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Room A", "Summary A1", "NOTIFICATION_GROUP_MESSAGE", true, null));
        // Defer active visibility: post fresher plaintext Room A summary + Room B child.
        manager.setDeferActiveVisibilityForTest(true);
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "102", "Room A", "Secret Plaintext A2", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Notifications.post(manager, MESSAGE_TAG, 12071,
                msgNotification(roomB, "201", "Room B", "Child B1", "NOTIFICATION_GROUP_MESSAGE", false, null));
        // Hide Room A now while active still lags.
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        manager.flushDeferredActiveVisibilityForTest();
        Notification finalSum4 = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 12061) == null
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 12071) != null
                        && finalSum4 != null
                        && !roomA.equals(finalSum4.extras.getString("line.chat.id"))
                        && !"Secret Plaintext A2".equals(String.valueOf(finalSum4.extras.getCharSequence(Notification.EXTRA_TEXT)))
                        && "LINE".equals(String.valueOf(finalSum4.extras.getCharSequence(Notification.EXTRA_TITLE))),
                "Hidden Room A fresher summary in SLOT_LEDGER with remaining Room B child must be rebuilt cleanly, not left as Room A plaintext");

        // Blocker 5: Single NativeLine.muted() throw during reconcile must NOT mark account reconciled; next entry retries & prunes.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        String hidden5 = chatId('u', 1208);
        String other5 = chatId('u', 1209);
        FakeLineEnv.CHATS.put(hidden5, new FakeLineEnv.ChatRow("Hidden 1208", "100", 1, true));
        FakeLineEnv.CHATS.put(other5, new FakeLineEnv.ChatRow("Other 1209", "100", 1, false));
        check(Settings.setPendingHide("u_acc_1", hidden5, "Hidden 1208"), "pending_hide should commit");
        manager.putActiveForTest(MESSAGE_TAG, 12081,
                msgNotification(hidden5, "101", "Hidden 1208", "Surviving hidden 5", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        Settings.clearRuntimeStateForTest();
        AtomicBoolean threwOnce = new AtomicBoolean(false);
        FakeLineEnv.onMutedCheck = () -> {
            if (threwOnce.compareAndSet(false, true)) {
                throw new RuntimeException("Transient native muted() failure");
            }
        };
        Notifications.onMessageStored(other5);
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 12081) != null,
                "While pending_hide marker lookup failed transiently, surviving active notification is not yet pruned");
        FakeLineEnv.onMutedCheck = null;
        Notifications.onMessageStored(other5);
        check(Settings.fullyMuted("u_acc_1", hidden5)
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 12081) == null,
                "Transient native muted() failure must leave account eligible for retry and prune on next entry");

        // Blocker 6: Standalone No-reply live OFF must restore single-room summary contextual actions & remove backup extra.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.test_silentIncluded = false;
        Settings.test_infoIncluded = false;
        Settings.test_readIncluded = false;
        Settings.test_noReplyIncluded = true;
        Settings.setEnabled(Settings.SILENT, false);
        Settings.setEnabled(Settings.INFO, false);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.NO_REPLY, true);
        String chat6 = chatId('u', 1210);
        Notification sumInput = msgNotification(chat6, "101", "Alice", "Hello summary", "NOTIFICATION_GROUP_MESSAGE", true, null);
        Notifications.post(manager, null, summaryId, sumInput);
        Notification sumOn = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(sumOn != null
                        && !sumOn.getAllowSystemGeneratedContextualActions()
                        && sumOn.extras.containsKey("line_notification_patches.orig_contextual_actions")
                        && sumOn.extras.getBoolean("line_notification_patches.orig_contextual_actions", false),
                "Single-room summary posted under No reply ON must set contextual=false and save orig_contextual_actions=true");
        Settings.setEnabled(Settings.NO_REPLY, false);
        Notification sumOff = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(sumOff != null
                        && sumOff.getAllowSystemGeneratedContextualActions()
                        && !sumOff.extras.containsKey("line_notification_patches.orig_contextual_actions"),
                "Toggling No reply live OFF must restore single-room summary contextual actions=true and clear orig_contextual_actions");

        // Item 12: SLOT_LEDGER enforces strict 256 cap even when every slot also has a pending post.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String capChat = chatId('u', 1211);
        FakeLineEnv.CONTACTS.put("u_peer_1211", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(capChat, new FakeLineEnv.ChatRow("Cap Room", "1", 1, false));
        FakeLineEnv.addMessage(capChat, "100", 43000L, "u_peer_1211", "Stored 100", null, null);
        for (int i = 0; i < 270; i++) {
            int sid = 13000 + i;
            // Deliver stored 100 (inserts into SLOT_LEDGER), then queue unstored 200 on same slot (marks slot pending).
            Notifications.post(manager, MESSAGE_TAG, sid, msgNotification(capChat, "100", "Cap Room", "Stored 100"));
            Notifications.post(manager, MESSAGE_TAG, sid, msgNotification(capChat, "200", "Cap Room", "Pending 200"));
        }
        check(Notifications.slotLedgerSizeForTest() <= 256,
                "SLOT_LEDGER must stay strictly <= 256 even when all slots have pending posts; size="
                        + Notifications.slotLedgerSizeForTest());
    }

    private static void testAstraV3GroupAStatelessFixes(Context context) {
        int summaryId = 16880000;

        // Group A #1: cancelConfirmedHiddenChats re-verifies HIDE_CONFIRMED under Notifications.class lock
        // so a room unhid after candidate collection does NOT have its new notification 102 canceled.
        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String chat1 = chatId('u', 1301);
        FakeLineEnv.CHATS.put(chat1, new FakeLineEnv.ChatRow("Room 1301", "100", 1, false));
        Settings.commitHideSuccess("u_acc_1", chat1, "Room 1301");
        java.util.Set<String> staleCandidates = java.util.Collections.singleton(chat1);
        // Room is unhid and new notification 102 arrives before prune executes cancelConfirmedHiddenChats.
        Settings.setMuted("u_acc_1", chat1, "Room 1301", false);
        Notifications.post(manager, MESSAGE_TAG, 13011, msgNotification(chat1, "102", "Room 1301", "Post-unhide 102"));
        boolean prunedOk = Notifications.cancelConfirmedHiddenChats(manager, "u_acc_1", staleCandidates);
        check(prunedOk
                        && manager.getCancelHistoryForTest().isEmpty()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 13011) != null,
                "cancelConfirmedHiddenChats must re-verify HIDE_CONFIRMED under lock and preserve unhid notification 102");

        // Group A #2: Account switch A->B inside getActiveNotifications() during onHideCompletedAsync
        // must mark Account A needing reconcile so returning to A prunes surviving hidden notifications.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        String chat2 = chatId('u', 1302);
        String other2 = chatId('u', 1303);
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(chat2, new FakeLineEnv.ChatRow("Room 1302", "100", 1, true));
        FakeLineEnv.CHATS.put(other2, new FakeLineEnv.ChatRow("Other 1303", "100", 1, false));
        Settings.ensureAccountReconciled("u_acc_1", false);
        Settings.commitHideSuccess("u_acc_1", chat2, "Room 1302");
        manager.putActiveForTest(MESSAGE_TAG, 13021,
                msgNotification(chat2, "101", "Room 1302", "Surviving A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        AtomicBoolean switchedInIpc = new AtomicBoolean(false);
        manager.onGetActiveNotificationsForTest = () -> {
            if (switchedInIpc.compareAndSet(false, true)) {
                FakeLineEnv.activeAccount = "u_acc_2";
            }
        };
        AtomicBoolean cb2 = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", chat2, () -> cb2.set(true));
        Notifications.flushWorkerForTest();
        manager.onGetActiveNotificationsForTest = null;
        check(cb2.get() && manager.getActiveSlotForTest(MESSAGE_TAG, 13021) != null,
                "Account switch A->B inside getActiveNotifications() must abort cleanup safely while running callback");
        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.allowMuted(new ke8.z(), other2);
        Notifications.flushWorkerForTest();
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 13021) == null,
                "Returning to Account A after mid-IPC account switch must re-trigger reconcile and prune surviving 13021");

        // Group A #3: Summary rebuild notify() failure during hide cleanup schedules 250ms retry and succeeds.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        String roomA = chatId('u', 1304);
        String roomB = chatId('u', 1305);
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, true));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        manager.putActiveForTest(MESSAGE_TAG, 13041,
                msgNotification(roomA, "101", "Room A", "Child A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 13051,
                msgNotification(roomB, "201", "Room B", "Child B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomA, "101", "Room A", "Secret A Summary", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        Settings.commitHideSuccess("u_acc_1", roomA, "Room A");
        manager.failNextNotifyForTest(1);
        AtomicBoolean cb3 = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", roomA, () -> cb3.set(true));
        Notifications.flushWorkerForTest();
        check(cb3.get()
                        && manager.getActiveSlotForTest(MESSAGE_TAG, 13041) == null
                        && roomA.equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.chat.id")),
                "First cleanup should cancel child A, invoke callback, and schedule retry after summary notify() failure");
        Handler.advanceByForTest(250L);
        Notifications.flushWorkerForTest();
        Notification retriedSum = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(retriedSum != null
                        && roomB.equals(retriedSum.extras.getString("line.chat.id"))
                        && !"Secret A Summary".equals(String.valueOf(retriedSum.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "250ms follow-up after failed summary rebuild must replace stale Room A summary with clean Room B summary");

        // Group A #4: Toggling No reply live OFF while LINE preview is OFF must redact AND restore contextual=true without backup.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.test_silentIncluded = false;
        Settings.test_infoIncluded = false;
        Settings.test_readIncluded = false;
        Settings.test_noReplyIncluded = true;
        Settings.setEnabled(Settings.SILENT, false);
        Settings.setEnabled(Settings.INFO, false);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.NO_REPLY, true);
        String chat4 = chatId('u', 1306);
        Notifications.post(manager, null, summaryId,
                msgNotification(chat4, "101", "Alice", "Plaintext Summary", "NOTIFICATION_GROUP_MESSAGE", true, null));
        FakeLineEnv.previewsAllowed = false;
        Settings.setEnabled(Settings.NO_REPLY, false);
        Notification sumOffPrivOff = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(sumOffPrivOff != null
                        && "LINE".equals(String.valueOf(sumOffPrivOff.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(sumOffPrivOff.extras.getCharSequence(Notification.EXTRA_TEXT)))
                        && sumOffPrivOff.getAllowSystemGeneratedContextualActions()
                        && !sumOffPrivOff.extras.containsKey("line_notification_patches.orig_contextual_actions"),
                "No reply live OFF while privacy is OFF must both redact summary and restore contextual=true without stale backup");

        // Group A #5: Rebuilt single-room summary under No reply ON preserves orig_contextual_actions so live OFF restores true.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        Settings.setEnabled(Settings.READ, false);
        Settings.setEnabled(Settings.NO_REPLY, true);
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, false));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        Notifications.post(manager, MESSAGE_TAG, 13042,
                msgNotification(roomA, "101", "Room A", "Child A", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.post(manager, null, summaryId,
                msgNotification(roomA, "101", "Room A", "Summary A", "NOTIFICATION_GROUP_MESSAGE", true, null));
        Notifications.post(manager, MESSAGE_TAG, 13052,
                msgNotification(roomB, "201", "Room B", "Child B", "NOTIFICATION_GROUP_MESSAGE", false, null));
        Notifications.cancelChatNotifications(manager, "u_acc_1", roomA);
        Notification rebuiltB = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(rebuiltB != null
                        && roomB.equals(rebuiltB.extras.getString("line.chat.id"))
                        && !rebuiltB.getAllowSystemGeneratedContextualActions()
                        && rebuiltB.extras.getBoolean("line_notification_patches.orig_contextual_actions", false),
                "Single-room summary rebuilt under No reply ON must keep contextual=false and preserve orig_contextual_actions=true");
        Settings.setEnabled(Settings.NO_REPLY, false);
        Notification restoredB = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(restoredB != null
                        && restoredB.getAllowSystemGeneratedContextualActions()
                        && !restoredB.extras.containsKey("line_notification_patches.orig_contextual_actions"),
                "Toggling No reply live OFF after summary rebuild must restore contextual=true and clear orig_contextual_actions");

        // Final high-value #1: Account switch A->B + summary replacement inside 2nd getActiveNotifications()
        // (rebuildSummaryWithoutCanceledChat) must return CANCEL_INCOMPLETE so returning to A prunes the new A summary.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.SILENT, true);
        Settings.setEnabled(Settings.INFO, false);
        FakeLineEnv.activeAccount = "u_acc_1";
        FakeLineEnv.CHATS.put(roomA, new FakeLineEnv.ChatRow("Room A", "100", 1, true));
        FakeLineEnv.CHATS.put(roomB, new FakeLineEnv.ChatRow("Room B", "200", 1, false));
        Settings.ensureAccountReconciled("u_acc_1", false);
        Settings.commitHideSuccess("u_acc_1", roomA, "Room A");
        manager.putActiveForTest(MESSAGE_TAG, 13043,
                msgNotification(roomA, "101", "Room A", "Child A", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(MESSAGE_TAG, 13053,
                msgNotification(roomB, "201", "Room B", "Child B", "NOTIFICATION_GROUP_MESSAGE", false, "u_acc_1"));
        manager.putActiveForTest(null, summaryId,
                msgNotification(roomA, "101", "Room A", "Old Summary A", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
        AtomicInteger activeCalls = new AtomicInteger();
        final NotificationManager mgrRef = manager;
        manager.onGetActiveNotificationsForTest = () -> {
            if (activeCalls.incrementAndGet() == 2) {
                FakeLineEnv.activeAccount = "u_acc_2";
                mgrRef.putActiveForTest(null, summaryId,
                        msgNotification(roomA, "102", "Room A", "New Plaintext Summary A", "NOTIFICATION_GROUP_MESSAGE", true, "u_acc_1"));
            }
        };
        AtomicBoolean cbFinal1 = new AtomicBoolean(false);
        Notifications.onHideCompletedAsync(manager, "u_acc_1", roomA, () -> cbFinal1.set(true));
        Notifications.flushWorkerForTest();
        manager.onGetActiveNotificationsForTest = null;
        check(cbFinal1.get()
                        && roomA.equals(manager.getActiveSlotForTest(null, summaryId).getNotification().extras.getString("line.chat.id")),
                "Account switch during 2nd active IPC must abort summary rebuild safely while on Account B");
        FakeLineEnv.activeAccount = "u_acc_1";
        Notifications.allowMuted(new ke8.z(), roomB);
        Notifications.flushWorkerForTest();
        Notification prunedSummary = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(prunedSummary != null
                        && roomB.equals(prunedSummary.extras.getString("line.chat.id"))
                        && !"New Plaintext Summary A".equals(String.valueOf(prunedSummary.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "Returning to Account A after 2nd-IPC account switch must re-reconcile and replace Room A plaintext summary");

        // Final high-value #4: Active plaintext summary 101 whose readUp=101, unread=1 returns DISCARD in refreshActive
        // while privacy is OFF must still redact visible plaintext 101 in place.
        resetAll(context);
        manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        String chatPriv = chatId('u', 1307);
        FakeLineEnv.CONTACTS.put("u_peer_1307", new FakeLineEnv.ContactRow("Alice", null));
        FakeLineEnv.CHATS.put(chatPriv, new FakeLineEnv.ChatRow("Alice", "100", 1, false));
        FakeLineEnv.addMessage(chatPriv, "101", 44001L, "u_peer_1307", "Visible Plaintext 101", null, null);
        Notifications.post(manager, null, summaryId,
                msgNotification(chatPriv, "101", "Alice", "Visible Plaintext 101", "NOTIFICATION_GROUP_MESSAGE", true, null));
        FakeLineEnv.CHATS.get(chatPriv).readUp = "101";
        FakeLineEnv.CHATS.get(chatPriv).unread = 1;
        FakeLineEnv.previewsAllowed = false;
        Notifications.refreshActivePreviews();
        syncWithNotificationsMonitor();
        Notification redactedDiscard = manager.getActiveSlotForTest(null, summaryId).getNotification();
        check(redactedDiscard != null
                        && "LINE".equals(String.valueOf(redactedDiscard.extras.getCharSequence(Notification.EXTRA_TITLE)))
                        && "You have a new message.".equals(String.valueOf(redactedDiscard.extras.getCharSequence(Notification.EXTRA_TEXT))),
                "refreshActivePreviews with privacy OFF must redact visible plaintext 101 even when transform returns DISCARD");
    }

    private static void testNativeBindings26190(Context context) {
        resetAll(context);
        String chatUnmuted = chatId('u', 1401);
        String chatMuted = chatId('u', 1402);
        FakeLineEnv.CHATS.put(chatUnmuted, new FakeLineEnv.ChatRow("Unmuted Room", "90", 3, false));
        FakeLineEnv.CHATS.put(chatMuted, new FakeLineEnv.ChatRow("Muted Room", "95", 2, true));

        try {
            AtomicInteger mutedChecks = new AtomicInteger();
            FakeLineEnv.onMutedCheck = mutedChecks::incrementAndGet;
            check(!NativeLine.muted(chatUnmuted) && NativeLine.muted(chatMuted) && mutedChecks.get() == 2,
                    "ch8.c DI lookup and eh8.e.b field read reflect native mute state");
            FakeLineEnv.onMutedCheck = null;

            NativeLine.Chat chatState = NativeLine.chat(chatUnmuted);
            check(chatState != null
                            && "Unmuted Room".equals(chatState.name)
                            && "90".equals(chatState.readUp)
                            && chatState.unread == 3,
                    "ln3.k$d.b field read reflects native unread count");
        } catch (ReflectiveOperationException e) {
            throw new AssertionError("NativeLine 26.19.0 reflection failed", e);
        }

        Settings.setEnabled(Settings.READ, true);
        FakeLineEnv.deferNativeReadCallback = true;
        Intent readIntent = ReadActions.action(context, "u_acc_1", chatUnmuted).actionIntent.getIntentForTest();
        boolean handled = Settings.interceptNotificationAction(context, readIntent);
        Handler.drainImmediateForTest();
        check(handled
                        && FakeLineEnv.nativeReadSubscribeCalls == 1
                        && FakeLineEnv.getReadCleanupCallsSnapshot().isEmpty()
                        && Toast.shownForTest().isEmpty(),
                "q08.b.b(r08.b) onSubscribe must not trigger read completion cleanup or failure toast");

        FakeLineEnv.completeDeferredNativeRead(null);
        Handler.drainImmediateForTest();
        List<j34.l> cleanupCalls = FakeLineEnv.getReadCleanupCallsSnapshot();
        check(cleanupCalls.size() == 2
                        && cleanupCalls.get(0) instanceof j34.l.a
                        && cleanupCalls.get(1) instanceof j34.l.c
                        && chatUnmuted.equals(cleanupCalls.get(0).chatId)
                        && chatUnmuted.equals(cleanupCalls.get(1).chatId)
                        && Toast.shownForTest().isEmpty(),
                "q08.b.onComplete() must trigger j34.h.c cleanup for chat and group selectors");

        FakeLineEnv.READ_CLEANUP_CALLS.clear();
        Intent readErrIntent = ReadActions.action(context, "u_acc_1", chatMuted).actionIntent.getIntentForTest();
        check(Settings.interceptNotificationAction(context, readErrIntent)
                        && FakeLineEnv.nativeReadSubscribeCalls == 2
                        && FakeLineEnv.getReadCleanupCallsSnapshot().isEmpty(),
                "Second read request onSubscribe must stay pending until terminal callback");
        FakeLineEnv.completeDeferredNativeRead(new RuntimeException("simulated read failure"));
        Handler.drainImmediateForTest();
        check(FakeLineEnv.getReadCleanupCallsSnapshot().isEmpty() && Toast.shownForTest().size() == 1,
                "q08.b.onError() must skip room cleanup and show failure toast");

        resetAll(context);
        NotificationManager manager = context.getSystemService(NotificationManager.class);
        Settings.setEnabled(Settings.INFO, true);
        Settings.setEnabled(Settings.INFO_MEDIA_PREVIEW, true);
        String groupGlide = chatId('c', 1403);
        FakeLineEnv.CONTACTS.put("u_sender_1403", new FakeLineEnv.ContactRow("Carol", "/avatars/carol.jpg"));
        FakeLineEnv.CHATS.put(groupGlide, new FakeLineEnv.ChatRow("Glide Group", "700", 2, false));
        FakeLineEnv.addMessage(groupGlide, "701", 5001L, "u_sender_1403", "Hello", null, null);
        FakeLineEnv.addMessage(groupGlide, "702", 5002L, "u_sender_1403", null, 7, "STKPKGID\t446\tSTKID\t1988");
        Notification glideNotif = msgNotification(groupGlide, "702", "Glide Group", "sent a sticker");
        glideNotif.extras.putString("line.sticker.url", "https://example.invalid/sticker.png");
        Notifications.post(manager, MESSAGE_TAG, 14031, glideNotif);
        List<FakeLineEnv.GlideRequestRecord> glideReqs = FakeLineEnv.getGlideRequestsSnapshot();
        FakeLineEnv.GlideRequestRecord avatarReq = null;
        FakeLineEnv.GlideRequestRecord stickerReq = null;
        for (FakeLineEnv.GlideRequestRecord req : glideReqs) {
            if (req.model instanceof x55.e) avatarReq = req;
            if ("https://example.invalid/sticker.png".equals(req.model)) stickerReq = req;
        }
        check(avatarReq != null
                        && avatarReq.strategy == co.l.b
                        && Boolean.TRUE.equals(avatarReq.onlyCache)
                        && avatarReq.overrideWidth == 80
                        && avatarReq.overrideHeight == 80
                        && avatarReq.circleCrop
                        && avatarReq.submitWidth == Integer.MIN_VALUE
                        && avatarReq.submitHeight == Integer.MIN_VALUE,
                "Avatar Glide request must pass co.l.b, r(true), t(80,80), d(), and X(MIN_VALUE, MIN_VALUE)");
        check(stickerReq != null
                        && stickerReq.strategy == co.l.d
                        && stickerReq.onlyCache == null
                        && stickerReq.overrideWidth == 384
                        && stickerReq.overrideHeight == 384
                        && !stickerReq.circleCrop
                        && stickerReq.submitWidth == Integer.MIN_VALUE
                        && stickerReq.submitHeight == Integer.MIN_VALUE,
                "Sticker Glide request must pass co.l.d, t(384,384), and X(MIN_VALUE, MIN_VALUE)");
    }

    private static void check(boolean condition, String description) {
        checks++;
        if (!condition) throw new AssertionError(description);
    }
}
