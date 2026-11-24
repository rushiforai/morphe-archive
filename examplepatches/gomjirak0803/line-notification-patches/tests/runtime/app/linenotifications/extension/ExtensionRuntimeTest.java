package app.linenotifications.extension;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import testenv.FakeLineEnv;

/** JVM behavioral regression suite covering review 0.1.17-dev timing and state scenarios. */
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

            System.out.println("ExtensionRuntimeTest passed (" + checks + " checks)");
            System.exit(0);
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    private static void resetAll(Context context) {
        context.resetForTest();
        FakeLineEnv.reset();
        Handler.resetForTest();
        Log.clearForTest();
        Toast.resetForTest();
        NativeLine.clearChatListPreviewCache();
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
        Notifications.cancelChatNotifications(null, null, (String) null);
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

        // Local save commits 102: flushes 102 first (fresh alert), then active refresh sets ONLY_ALERT_ONCE.
        FakeLineEnv.addMessage(chat, "102", 1002L, "u_peer_1", "Second message", null, null);
        Notifications.onMessageStored(chat);
        List<NotificationManager.NotifyRecord> history = manager.getNotifyHistoryForTest();
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("101", "102", "102")),
                "Expected [101, 102, 102] (flush + silent refresh of 102), got " + deliveredMessageIds(manager));
        check((history.get(1).notification.flags & Notification.FLAG_ONLY_ALERT_ONCE) == 0,
                "Flushed push 102 must preserve fresh notification alert behavior");
        check((history.get(2).notification.flags & Notification.FLAG_ONLY_ALERT_ONCE) != 0,
                "Post-save refresh of 102 must stay alert-once");
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
        check(deliveredMessageIds(manager).equals(java.util.Arrays.asList("203", "203")),
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

        // Case 3a: LINE preview privacy turns OFF during avatar lookup.
        String group1 = chatId('c', 301);
        FakeLineEnv.CHATS.put(group1, new FakeLineEnv.ChatRow("Group A", "300", 1, false));
        FakeLineEnv.addMessage(group1, "301", 4001L, "u_sender_1", "Private message 301", null, null);
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.previewsAllowed = false;
        Notifications.post(manager, MESSAGE_TAG, 30101, msgNotification(group1, "301", "Group A", "Plaintext"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#30101"),
                "Turning off LINE preview privacy during avatar load must suppress plaintext post; notified="
                        + deliveredMessageIds(manager) + " canceled=" + manager.getCancelHistoryForTest()
                        + " logs=" + Log.messagesForTest());

        // Case 3b: Chat is marked read during avatar lookup.
        FakeLineEnv.previewsAllowed = true;
        manager.resetForTest();
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
                "Reading the chat during avatar load must suppress stale preview post");

        // Case 3c: Active account changes during avatar lookup.
        FakeLineEnv.activeAccount = "u_acc_1";
        manager.resetForTest();
        FakeLineEnv.CHATS.get(group1).unread = 1;
        FakeLineEnv.CHATS.get(group1).readUp = "300";
        FakeLineEnv.onAvatarLoad = () -> FakeLineEnv.activeAccount = "u_acc_2";
        Notifications.post(manager, MESSAGE_TAG, 30103, msgNotification(group1, "301", "Group A", "Plaintext"));
        check(manager.getNotifyHistoryForTest().isEmpty()
                        && manager.getCancelHistoryForTest().contains(MESSAGE_TAG + "#30103"),
                "Account change during avatar load must suppress stale preview post");

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

        FakeLineEnv.deferNativeMuteCallback = true;
        AtomicReference<Boolean> callbackResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, callbackResult::set);

        long deadline = System.currentTimeMillis() + 3000L;
        while (System.currentTimeMillis() < deadline && FakeLineEnv.NATIVE_MUTE_CALLS.isEmpty()) {
            Thread.sleep(2L);
        }
        check(FakeLineEnv.NATIVE_MUTE_CALLS.size() == 1 && !FakeLineEnv.NATIVE_MUTE_CALLS.get(0).desiredEnabled,
                "Native mute call should be in flight with desiredEnabled=false");
        check(Settings.fullyMuted("u_acc_1", chat),
                "Local suppression preference should guard incoming pushes while call is in flight");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) != null,
                "Existing notification 501 must NOT be canceled before native mute succeeds");

        FakeLineEnv.completeDeferredNativeMute(false);
        awaitCallback(() -> callbackResult.get() != null);
        check(Boolean.FALSE.equals(callbackResult.get()), "Callback should report failure");
        check(!Settings.fullyMuted("u_acc_1", chat), "Local hidden preference must roll back on failure");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) != null,
                "Existing notification 501 must remain intact after hide failure");

        // Now complete successfully.
        FakeLineEnv.deferNativeMuteCallback = false;
        FakeLineEnv.nextNativeMuteSuccess = true;
        AtomicReference<Boolean> secondResult = new AtomicReference<Boolean>();
        ChatNotifications.change(context, chat, ChatNotifications.HIDDEN, null, secondResult::set);
        awaitCallback(() -> secondResult.get() != null);
        check(Boolean.TRUE.equals(secondResult.get()), "Second hide request should succeed");
        check(Settings.fullyMuted("u_acc_1", chat), "Room should be marked fully hidden on success");
        check(manager.getActiveSlotForTest(MESSAGE_TAG, 501) == null,
                "Existing notification 501 should be canceled after native mute succeeds");
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

    private static void check(boolean condition, String description) {
        checks++;
        if (!condition) throw new AssertionError(description);
    }
}
