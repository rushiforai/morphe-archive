import app.linenotifications.extension.core.NotificationPolicy;
import app.linenotifications.extension.core.NotificationPolicy.ChatKey;
import app.linenotifications.extension.core.NotificationPolicy.Decision;
import app.linenotifications.extension.core.NotificationPolicy.Message;
import app.linenotifications.extension.core.NotificationPolicy.Mode;
import app.linenotifications.extension.core.NotificationPolicy.Settings;
import app.linenotifications.extension.core.NotificationPolicy.Snapshot;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/** Standalone tests: no Android, account, network, or test framework required. */
public final class NotificationPolicyTest {
    private static int assertions;
    private static final ChatKey CHAT = new ChatKey("account-a", "chat-1");
    private static final Settings ALL = new Settings(true, true, true, true);

    public static void main(String[] args) {
        defaultsPreserveNativeBehavior();
        mutePrecedenceAndAccountIsolation();
        recentUnreadIsBoundedOrderedAndDeduplicated();
        conversationKeepsSenderIdentityAndMultilineBodies();
        unreadCountCases();
        privacyAndDefensiveCopies();
        readCommandTargetsWholeRoom();
        independentTogglesAndUnavailableMetadata();
        invalidMetadataFailsClearly();
        pushBeforeLocalPersistence();
        System.out.println("NotificationPolicy: " + assertions + " assertions passed");
    }

    private static void defaultsPreserveNativeBehavior() {
        Decision decision = NotificationPolicy.evaluate(Settings.defaults(), snapshot(true), true);
        check(decision.mode == Mode.ORIGINAL, "Default does not override native mute");
        check(!decision.replacePreview && decision.recentMessages.isEmpty(), "Default preserves preview");
        check(!decision.hideSuggestedReplies && !decision.replaceMuteWithRead, "Default preserves actions");
        check(decision.readCommand == null, "Default has no read intent");
    }

    private static void pushBeforeLocalPersistence() {
        List<Message> none = Collections.emptyList();
        check(NotificationPolicy.previewState(0, "100", "101", none) == NotificationPolicy.PreviewState.NATIVE,
                "First push before commit retains native sender and body instead of disappearing");
        List<Message> first = Arrays.asList(message("101", 101));
        check(NotificationPolicy.previewState(1, "100", "102", first) == NotificationPolicy.PreviewState.NATIVE,
                "Second push cannot use the first message's stale count and preview");
        check(NotificationPolicy.previewState(1, "100", "101", first) == NotificationPolicy.PreviewState.LOCAL,
                "First committed message can show local unread count and body");
        check(NotificationPolicy.previewState(2, "100", "102", Arrays.asList(message("101", 101), message("102", 102)))
                        == NotificationPolicy.PreviewState.LOCAL, "Post-commit refresh shows both received messages");
        check(NotificationPolicy.previewState(0, "102", "102", none) == NotificationPolicy.PreviewState.READ,
                "An already-read notification is not revived by a persistence refresh");
        check(NotificationPolicy.previewState(1, "102", "101", Arrays.asList(message("103", 103)))
                        == NotificationPolicy.PreviewState.READ, "New unread messages cannot revive an older read push");
        check(NotificationPolicy.previewState(6, "100", "101", Arrays.asList(message("106", 106)))
                        == NotificationPolicy.PreviewState.LOCAL, "A newer committed snapshot can cover an earlier push outside the retained history window");
        check(NotificationPolicy.previewState(1, "100", "unknown", first) == NotificationPolicy.PreviewState.NATIVE,
                "Unknown push IDs do not invent a local count");
    }

    private static void mutePrecedenceAndAccountIsolation() {
        check(NotificationPolicy.evaluate(ALL, snapshot(true), false).mode == Mode.SILENT,
                "Native-muted chat becomes silent");
        check(NotificationPolicy.evaluate(ALL, snapshot(false), false).mode == Mode.ORIGINAL,
                "Normal chat retains native sound behavior");
        Decision suppressed = NotificationPolicy.evaluate(ALL, snapshot(false), true);
        check(suppressed.mode == Mode.SUPPRESS, "Full mute wins even for native unmuted chat");
        check(suppressed.recentMessages.isEmpty() && suppressed.readCommand == null,
                "Suppressed notification exposes no preview or action");
        Settings disabledParent = new Settings(false, true, true, true);
        check(NotificationPolicy.evaluate(disabledParent, snapshot(true), true).mode == Mode.ORIGINAL,
                "Full mute list is dormant when parent feature is off");
        Set<ChatKey> muted = new HashSet<ChatKey>();
        muted.add(CHAT);
        check(muted.contains(new ChatKey("account-a", "chat-1")), "Stable identity matches");
        check(!muted.contains(new ChatKey("account-b", "chat-1")), "Other account never inherits full mute");
        check(!muted.contains(new ChatKey("account-a", "chat-2")), "Other room never inherits full mute");
    }

    private static void recentUnreadIsBoundedOrderedAndDeduplicated() {
        List<Message> messages = new ArrayList<Message>();
        List<String> expected = new ArrayList<String>();
        for (int i = 32; i >= 1; i--) messages.add(message(Integer.toString(i), i * 100));
        messages.add(message("32", 3200));
        messages.add(message("20", 2000));
        for (int i = 8; i <= 32; i++) expected.add(Integer.toString(i));
        Snapshot snapshot = new Snapshot(CHAT, false, true, 100, true, messages);
        Decision decision = NotificationPolicy.evaluate(ALL, snapshot, false);
        check(ids(decision).equals(expected),
                "Latest 25 unique unread messages are retained oldest to newest without duplicate slots");
        check(decision.totalUnreadCount == 100, "Native unread100 is not replaced with retained history length25");
        List<Message> ties = Arrays.asList(new Message("b", 100, 2, "sender-b", "B", "b"),
                new Message("a", 100, 1, "sender-a", "A", "old"),
                new Message("a", 100, 1, "sender-a", "A", "edited"));
        Decision tied = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 2, true, ties), false);
        check(ids(tied).equals(Arrays.asList("a", "b")), "Native source order resolves same timestamps");
        check(tied.recentMessages.get(0).text.equals("edited"), "Repeated ID uses most recent equal-order payload");
        List<Message> delayedDuplicate = Arrays.asList(message("a", 200), message("a", 100));
        Decision delayed = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 1, true, delayedDuplicate), false);
        check(delayed.recentMessages.get(0).timestampMillis == 200,
                "Older duplicate does not overwrite newer timestamp");
    }

    private static void conversationKeepsSenderIdentityAndMultilineBodies() {
        String longBody = "첫 번째 문장은 알림 한 줄보다 길어도 원본 내용을 잘라 버리지 않습니다. "
                + "추가 문장도 Android가 사용할 수 있도록 그대로 전달합니다.\n둘째 줄\n셋째 줄 🙂";
        List<Message> messages = Arrays.asList(
                new Message("one", 1, 1, "sender-a", "동일한 이름", longBody),
                new Message("two", 2, 2, "sender-b", "동일한 이름", "다른 사람의 메시지"),
                new Message("three", 3, 3, "sender-a", "바뀐 이름", "같은 사람의 새 메시지"));
        Decision decision = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 3, true, messages), false);
        check(decision.recentMessages.size() == 3, "Sender grouping does not discard individual message history");
        check(decision.recentMessages.get(0).sender.equals(decision.recentMessages.get(1).sender)
                        && !decision.recentMessages.get(0).senderId.equals(decision.recentMessages.get(1).senderId),
                "Equal display names preserve distinct native sender identities");
        check(decision.recentMessages.get(0).senderId.equals(decision.recentMessages.get(2).senderId),
                "A renamed sender retains the same native person identity");
        check(decision.recentMessages.get(0).text.equals(longBody),
                "Long text, explicit newlines and emoji are retained without line truncation");
    }

    private static void privacyAndDefensiveCopies() {
        List<Message> source = new ArrayList<Message>();
        source.add(message("secret", 1));
        Snapshot hidden = new Snapshot(CHAT, true, false, 1, true, source);
        check(hidden.unreadMessages.isEmpty(), "Privacy-disabled snapshot does not retain plaintext previews");
        Decision redacted = NotificationPolicy.evaluate(ALL, hidden, false);
        check(!redacted.replacePreview && redacted.recentMessages.isEmpty(), "Native redaction is preserved");
        Snapshot captured = new Snapshot(CHAT, false, true, 1, true, source);
        source.clear();
        check(captured.unreadMessages.size() == 1, "Snapshot owns a defensive copy");
        Decision capturedDecision = NotificationPolicy.evaluate(ALL, captured, false);
        expectUnsupported(new Runnable() { public void run() { captured.unreadMessages.clear(); } });
        expectUnsupported(new Runnable() { public void run() { capturedDecision.recentMessages.clear(); } });
        Snapshot read = new Snapshot(CHAT, false, true, 0, false, Arrays.asList(message("old", 1)));
        check(NotificationPolicy.evaluate(ALL, read, false).recentMessages.isEmpty(),
                "Authoritative zero unread does not reveal stale message list");
    }

    private static void unreadCountCases() {
        for (int count : new int[]{0, 1, 5, 6, 23, 25, 26, 100}) {
            List<Message> messages = new ArrayList<Message>();
            for (int i = 1; i <= count; i++) messages.add(message(Integer.toString(i), i));
            Decision decision = NotificationPolicy.evaluate(ALL,
                    new Snapshot(CHAT, false, true, count, count > 0, messages), false);
            check(decision.totalUnreadCount == count, "Count remains authoritative: " + count);
            check(decision.recentMessages.size() == Math.min(25, count), "Retained conversation bounded for " + count);
            if (count > 0) {
                check(decision.recentMessages.get(0).id.equals(Integer.toString(Math.max(1, count - 24))),
                        "Earliest retained unread respects the history boundary for " + count);
                check(decision.recentMessages.get(decision.recentMessages.size() - 1).id.equals(Integer.toString(count)),
                        "Newest unread remains visible for " + count);
            }
        }
    }

    private static void readCommandTargetsWholeRoom() {
        Snapshot atPost = new Snapshot(CHAT, false, true, 10, true,
                Arrays.asList(message("preview-9", 9)));
        Decision oldNotification = NotificationPolicy.evaluate(ALL, atPost, false);
        Decision newNotification = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 11, true,
                        Arrays.asList(message("preview-11", 11))), false);
        check(oldNotification.readCommand != null, "Stored room exposes a whole-room read command");
        check(oldNotification.readCommand.chat.equals(newNotification.readCommand.chat),
                "More unread messages retain the same account and room target; no snapshot boundary");
        check(oldNotification.readCommand.isFor(CHAT), "Read command accepts same identity");
        check(!oldNotification.readCommand.isFor(new ChatKey("account-b", "chat-1")),
                "Read command rejects switched account");
        check(!oldNotification.readCommand.isFor(new ChatKey("account-a", "chat-2")),
                "Read command rejects another conversation");
        check(!oldNotification.readCommand.isFor(null), "Missing active identity is rejected");
        Decision completed = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 0, false, Collections.<Message>emptyList()), false);
        check(completed.readCommand == null && completed.recentMessages.isEmpty(),
                "Native read completion leaves no action or old body in the empty snapshot");
        Decision next = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 1, true, Arrays.asList(message("new", 12))), false);
        check(next.totalUnreadCount == 1 && ids(next).equals(Arrays.asList("new")),
                "Next native unread snapshot starts at one and does not reuse previous preview rows");
    }

    private static void independentTogglesAndUnavailableMetadata() {
        Decision onlySuggestions = NotificationPolicy.evaluate(new Settings(false, false, true, false), snapshot(false), false);
        check(onlySuggestions.hideSuggestedReplies && !onlySuggestions.replaceMuteWithRead,
                "No reply only disables suggestions; it does not request removing manual reply");
        Settings onlyRead = new Settings(false, false, false, true);
        Snapshot redactedReady = new Snapshot(CHAT, false, false, 1, true,
                Collections.<Message>emptyList());
        Decision readyWithoutPreview = NotificationPolicy.evaluate(onlyRead, redactedReady, false);
        check(readyWithoutPreview.replaceMuteWithRead && readyWithoutPreview.recentMessages.isEmpty(),
                "Read action works with More Chat Info off and native previews hidden");
        check(!readyWithoutPreview.replacePreview && !readyWithoutPreview.hideSuggestedReplies,
                "Read-only setting does not alter preview privacy or reply suggestions");
        Decision readDisabled = NotificationPolicy.evaluate(new Settings(true, true, true, false),
                redactedReady, false);
        check(readDisabled.readCommand == null, "Turning read off restores the original action decision");
        Decision notReadyWithoutInfo = NotificationPolicy.evaluate(onlyRead,
                new Snapshot(CHAT, false, false, 1, false, Collections.<Message>emptyList()), false);
        check(notReadyWithoutInfo.readCommand == null,
                "Read-only mode still waits for the adapter's local-storage readiness check");
        Decision notStored = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 8, false, Collections.<Message>emptyList()), false);
        check(!notStored.replaceMuteWithRead, "Uncommitted push preserves original action until storage completes");
        Decision unknownCount = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, NotificationPolicy.UNKNOWN_UNREAD_COUNT, true,
                        Arrays.asList(message("x", 1))), false);
        check(unknownCount.totalUnreadCount == NotificationPolicy.UNKNOWN_UNREAD_COUNT,
                "Unknown count remains unknown even when preview exists");
        check(unknownCount.readCommand == null, "Unknown unread state does not enable read action");
        Decision zero = NotificationPolicy.evaluate(ALL,
                new Snapshot(CHAT, false, true, 0, true, Collections.<Message>emptyList()), false);
        check(zero.readCommand == null, "No read command for no unread messages");
    }

    private static void invalidMetadataFailsClearly() {
        expectInvalid(new Runnable() { public void run() { new ChatKey(" ", "chat"); } });
        expectInvalid(new Runnable() { public void run() {
            new Snapshot(CHAT, false, true, -2, false, Collections.<Message>emptyList());
        } });
        expectInvalid(new Runnable() { public void run() { new ChatKey("account", " "); } });
        expectInvalid(new Runnable() { public void run() {
            new Message("message", 1, 1, " ", "Display name", "Text");
        } });
    }

    private static Snapshot snapshot(boolean muted) {
        return new Snapshot(CHAT, muted, true, 2, true, Arrays.asList(message("m1", 1), message("m2", 2)));
    }

    private static Message message(String id, long time) {
        return new Message(id, time, time, "sender-id", "Sender", "Text " + id);
    }

    private static List<String> ids(Decision decision) {
        List<String> result = new ArrayList<String>();
        for (Message message : decision.recentMessages) result.add(message.id);
        return result;
    }

    private static void check(boolean condition, String description) {
        assertions++;
        if (!condition) throw new AssertionError(description);
    }

    private static void expectUnsupported(Runnable action) {
        assertions++;
        try { action.run(); throw new AssertionError("Expected immutable collection"); }
        catch (UnsupportedOperationException expected) { /* pass */ }
    }

    private static void expectInvalid(Runnable action) {
        assertions++;
        try { action.run(); throw new AssertionError("Expected invalid metadata rejection"); }
        catch (IllegalArgumentException expected) { /* pass */ }
    }
}
