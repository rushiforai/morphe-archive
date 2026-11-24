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
        attachmentPlaceholderCases();
        parameterAndMentionCases();
        keywordCases();
        chatListAttachmentCases();
        messageCountCases();
        mediaPreviewCases();
        actionLayoutAndSnoozeCases();
        accountSummaryAndMediaGuardCases();
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
        check(NotificationPolicy.previewState(1, "100", "103", Arrays.asList(message("104", 104)))
                        == NotificationPolicy.PreviewState.NATIVE,
                "Unstored out-of-order push must not treat newer row 104 as readiness for push 103");
        check(NotificationPolicy.previewState(1, "100", "103", Arrays.asList(message("104", 104)), false)
                        == NotificationPolicy.PreviewState.NATIVE,
                "5-arg previewState holds when neither messages nor DB confirm push 103");
        check(NotificationPolicy.previewState(6, "100", "101", Arrays.asList(message("106", 106)), true)
                        == NotificationPolicy.PreviewState.LOCAL,
                "DB-confirmed out-of-window push resolves LOCAL");
        check(NotificationPolicy.previewState(6, "100", "101", Arrays.asList(message("106", 106)), false)
                        == NotificationPolicy.PreviewState.NATIVE,
                "Unconfirmed out-of-window push waits instead of relying on row 106");
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

    private static void attachmentPlaceholderCases() {
        int[] types = {1, 21, 2, 7, 3, 5, 14, 15, 13, 6, 9, 19};
        String[] keys = {
                "line_notify_attachment_photo", "line_notify_attachment_photo",
                "line_notify_attachment_video", "line_notify_attachment_sticker",
                "line_notify_attachment_audio", "line_notify_attachment_file",
                "line_notify_attachment_file", "line_notify_attachment_location",
                "line_notify_attachment_contact", "line_notify_attachment_call",
                "line_notify_attachment_gift", "line_notify_attachment_music",
        };
        String[] fallbacks = {
                "[Photo]", "[Photo]", "[Video]", "[Sticker]", "[Voice message]",
                "[File]", "[File]", "[Location]", "[Contact]", "[Call]", "[Gift]", "[Music]",
        };
        for (int i = 0; i < types.length; i++) {
            check(keys[i].equals(NotificationPolicy.attachmentPlaceholderKey(types[i])),
                    "Attachment key for " + types[i]);
            check(fallbacks[i].equals(NotificationPolicy.attachmentPlaceholderFallback(types[i])),
                    "Attachment fallback for " + types[i]);
        }
        for (int fallbackType : new int[]{-1, 0, 4, 8, 10, 16, 17, 20, 22, 99}) {
            check("line_notify_attachment_placeholder".equals(
                            NotificationPolicy.attachmentPlaceholderKey(fallbackType)),
                    "Default attachment key for " + fallbackType);
            check("[Attachment]".equals(
                            NotificationPolicy.attachmentPlaceholderFallback(fallbackType)),
                    "Default attachment fallback for " + fallbackType);
        }
    }

    private static void parameterAndMentionCases() {
        check("report.pdf".equals(NotificationPolicy.parameterValue("K1\t\tFILE_NAME\treport.pdf", "FILE_NAME")),
                "Reads FILE_NAME after empty tab value");
        check(NotificationPolicy.parameterValue("FILE_NAME\t\tOTHER\t1", "FILE_NAME") == null,
                "Treats empty parameter value as null");
        check(NotificationPolicy.parameterValue("NO_TABS", "FILE_NAME") == null,
                "Handles parameter without tabs");

        String directMention = "MENTION\t{\"MENTIONEES\":[{\"S\":\"0\",\"E\":\"4\",\"M\":\"u123\",\"A\":\"0\"}]}";
        String secondMention = "MENTION\t{ \"MENTIONEES\" : [ {\"S\":\"0\",\"M\":\"u999\",\"EXTRA\":{\"M\":\"x\"}},"
                + " {\"M\":\"u123\",\"A\":\"0\"} ] }";
        String allMention = "K\tV\tMENTION\t{\"MENTIONEES\":[{\"S\":\"0\",\"E\":\"4\",\"A\":\"1\",\"NOTE\":\"\\\"hi\\\"\"}]}";
        String escapedMention = "MENTION\t{\"MENTIONEES\":[{\"M\":\"u\\u003123\"}]}";
        check(NotificationPolicy.isMentionedInParameter(directMention, "u123"), "Detects direct user mention");
        check(!NotificationPolicy.isMentionedInParameter(directMention, "u999"), "Ignores non-matching mention MID");
        check(NotificationPolicy.isMentionedInParameter(secondMention, "u123"), "Scans past first mention and nested objects");
        check(!NotificationPolicy.isMentionedInParameter(secondMention, "x"), "Ignores M key inside nested sub-object");
        check(NotificationPolicy.isMentionedInParameter(allMention, "u123"), "Detects @All (A=1) mention");
        check(NotificationPolicy.isMentionedInParameter(escapedMention, "u123"), "Decodes \\uXXXX escape in mention MID");
        check(!NotificationPolicy.isMentionedInParameter("MENTION\t{\"MENTIONEES\":[{\"M\":\"u123\"", "u123")
                        || NotificationPolicy.isMentionedInParameter("MENTION\t{\"MENTIONEES\":[{\"M\":\"u123\"", "u123"),
                "Truncated/malformed mention returns deterministic boolean without throwing");
        check(!NotificationPolicy.isMentionedInParameter("MENTION\t{not json", "u123"), "Malformed JSON returns false safely");
        check(!NotificationPolicy.isMentionedInParameter(null, "u123")
                        && !NotificationPolicy.isMentionedInParameter(directMention, ""),
                "Null/empty parameters or account return false");

        check("Q4 Report.pdf".equals(NotificationPolicy.attachmentDetail(14, "FILE_NAME\t  Q4\n\u0007  Report.pdf  ", null, null)),
                "FILE attachment extracts and sanitizes FILE_NAME");
        check("Deck.pdf".equals(NotificationPolicy.attachmentDetail(5, "FILE_NAME\tDeck.pdf", null, null)),
                "PDF attachment extracts FILE_NAME");
        check("Gangnam Station".equals(NotificationPolicy.attachmentDetail(15, null, " Gangnam\nStation ", "Seoul")),
                "LOCATION prefers sanitized location_name");
        check("123 Teheran-ro".equals(NotificationPolicy.attachmentDetail(15, null, "   \n ", " 123\tTeheran-ro ")),
                "LOCATION falls back to location_address when location_name blank");
        check(NotificationPolicy.attachmentDetail(1, "FILE_NAME\ta.png", "Place", "Addr") == null
                        && NotificationPolicy.attachmentDetail(7, "FILE_NAME\ts", "Place", "Addr") == null,
                "Non-FILE/LOCATION attachments omit detail");
        StringBuilder ninety = new StringBuilder();
        for (int i = 0; i < 90; i++) ninety.append('a');
        String capped = NotificationPolicy.attachmentDetail(14, "FILE_NAME\t" + ninety, null, null);
        check(capped != null && capped.length() == 81 && capped.endsWith("\u2026"),
                "Long detail is capped to 80 chars plus ellipsis");
        StringBuilder seventyNineEmoji = new StringBuilder();
        for (int i = 0; i < 79; i++) seventyNineEmoji.append('a');
        seventyNineEmoji.append("\uD83D\uDE00");
        String cappedEmoji = NotificationPolicy.attachmentDetail(14, "FILE_NAME\t" + seventyNineEmoji, null, null);
        check(cappedEmoji != null && cappedEmoji.length() == 80 && cappedEmoji.endsWith("\u2026")
                        && !Character.isHighSurrogate(cappedEmoji.charAt(cappedEmoji.length() - 2)),
                "Drops boundary emoji cleanly instead of leaving an orphan high surrogate before ellipsis");
        StringBuilder seventyEightEmoji = new StringBuilder();
        for (int i = 0; i < 78; i++) seventyEightEmoji.append('a');
        seventyEightEmoji.append("\uD83D\uDE00z");
        String fitEmoji = NotificationPolicy.attachmentDetail(14, "FILE_NAME\t" + seventyEightEmoji, null, null);
        check(fitEmoji != null && fitEmoji.length() == 81 && "\uD83D\uDE00\u2026".equals(fitEmoji.substring(78)),
                "Preserves complete emoji surrogate pair when both units fit within limit");
        check("[File] a.pdf".equals(NotificationPolicy.formatAttachmentPlaceholder("[File]", "a.pdf"))
                        && "[File]".equals(NotificationPolicy.formatAttachmentPlaceholder("[File]", null)),
                "Formats placeholder with or without detail");

        check("[위치] 강남역".equals(NotificationPolicy.resolveMessageBody(
                        "강남역", 15, "[위치]", null, "강남역", "서울")),
                "LOCATION prefixes label even when LINE mirrors title in content");
        check("[위치] 강남역".equals(NotificationPolicy.resolveMessageBody(
                        "  강남역\n", 15, "[위치]", null, null, null)),
                "LOCATION falls back to sanitized content when location columns null");
        check("[파일] a.pdf".equals(NotificationPolicy.resolveMessageBody(
                        null, 14, "[파일]", "FILE_NAME\ta.pdf", null, null)),
                "FILE resolves filename when content empty");
        check("[파일] a.pdf".equals(NotificationPolicy.resolveMessageBody(
                        "a.pdf", 14, "[파일]", "FILE_NAME\ta.pdf", null, null)),
                "FILE prefixes label when content mirrors FILE_NAME");
        check("hello".equals(NotificationPolicy.resolveMessageBody(
                        "hello", 0, "[첨부 메시지]", null, null, null)),
                "NONE keeps normal text content unchanged");
        check("[스티커]".equals(NotificationPolicy.resolveMessageBody(
                        "", 7, "[스티커]", null, null, null)),
                "STICKER resolves placeholder when content empty");
    }

    private static void keywordCases() {
        check(NotificationPolicy.parseKeywords(null).isEmpty()
                        && NotificationPolicy.parseKeywords(" , \r\n\uFF0C\u3001 ").isEmpty(),
                "Empty or separator-only keyword input returns empty list");
        List<String> parsed = NotificationPolicy.parseKeywords("  Urgent\r\n  deploy\u0007  alert , urgent\uFF0Cmeeting\u3001MEETING  ");
        check(parsed.equals(Arrays.asList("Urgent", "deploy alert", "meeting")),
                "Parses ASCII/CJK commas and newlines, cleans whitespace, and deduplicates case-insensitively");
        check("Urgent\ndeploy alert\nmeeting".equals(NotificationPolicy.serializeKeywords(parsed)),
                "Serializes keywords with newlines");
        check("".equals(NotificationPolicy.serializeKeywords(Collections.<String>emptyList())),
                "Serializing empty keywords yields empty string");
        check("Urgent, de\u2026".equals(NotificationPolicy.formatKeywordsSummary(parsed, 10)),
                "Truncates keyword summary with ellipsis");
        check(NotificationPolicy.formatKeywordsSummary(Collections.<String>emptyList(), 10) == null,
                "Empty keyword list produces null summary");

        StringBuilder many = new StringBuilder();
        for (int i = 1; i <= 60; i++) {
            if (i > 1) many.append(',');
            many.append("kw").append(i);
        }
        List<String> cappedCount = NotificationPolicy.parseKeywords(many.toString());
        check(cappedCount.size() == NotificationPolicy.MAX_KEYWORDS
                        && "kw50".equals(cappedCount.get(NotificationPolicy.MAX_KEYWORDS - 1)),
                "Keyword count is capped at 50");

        StringBuilder tooLong = new StringBuilder();
        for (int i = 0; i < 63; i++) tooLong.append('a');
        tooLong.append(" bcd");
        List<String> cappedLen = NotificationPolicy.parseKeywords(tooLong.toString());
        check(cappedLen.size() == 1 && cappedLen.get(0).length() == 63 && !cappedLen.get(0).endsWith(" "),
                "Keyword length cap drops trailing space before exceeding max length without ellipsis");

        String nfc = "\uAC00\uB098";
        String nfd = "\u1100\u1161\u1102\u1161";
        List<String> unicodeKeywords = NotificationPolicy.parseKeywords("Alert, " + nfd);
        check(NotificationPolicy.matchesKeyword("SERVER ALERT!", unicodeKeywords),
                "Matches keywords case-insensitively");
        check(NotificationPolicy.matchesKeyword(nfc + " \uB2E4", unicodeKeywords),
                "Matches NFC text against NFD-entered Hangul keyword");
        check(!NotificationPolicy.matchesKeyword("normal update", unicodeKeywords),
                "Does not match unrelated text");

        List<String> fileAndPlace = NotificationPolicy.parseKeywords("Invoice, Teheran");
        check(NotificationPolicy.matchesMessageKeywords("", 14, "FILE_NAME\tQ4_Invoice.pdf", null, null, fileAndPlace),
                "Matches keyword in FILE attachment FILE_NAME metadata");
        check(NotificationPolicy.matchesMessageKeywords("", 5, "FILE_NAME\tQ4_Invoice.pdf", null, null, fileAndPlace),
                "Matches keyword in PDF attachment FILE_NAME metadata");
        check(NotificationPolicy.matchesMessageKeywords("Here", 15, null, "Office", "123 Teheran-ro", fileAndPlace),
                "Matches keyword in LOCATION address metadata");
        check(!NotificationPolicy.matchesMessageKeywords("Invoice", 1, "FILE_NAME\tInvoice.png", "Teheran", null,
                        NotificationPolicy.parseKeywords("Teheran")),
                "Does not inspect LOCATION fields on non-LOCATION IMAGE attachment");
    }

    private static void chatListAttachmentCases() {
        check(NotificationPolicy.effectiveChatListAttachmentType(1, 15) == 15
                        && NotificationPolicy.effectiveChatListAttachmentType(1, 14) == 14
                        && NotificationPolicy.effectiveChatListAttachmentType(5, 0) == 7
                        && NotificationPolicy.effectiveChatListAttachmentType(1, 7) == 7,
                "Maps MESSAGE/STICKER attachment rows to typed codes");
        check(NotificationPolicy.effectiveChatListAttachmentType(1, 0) == 0
                        && NotificationPolicy.effectiveChatListAttachmentType(1, 6) == 0
                        && NotificationPolicy.effectiveChatListAttachmentType(17, 15) == 0
                        && NotificationPolicy.effectiveChatListAttachmentType(2, 1) == 0,
                "Excludes plain text, CALL, UNSENT, and JOIN/system rows");

        check("[Location] Gangnam Station".equals(NotificationPolicy.resolveChatListMessage(
                        "Alice sent a location.", 10000L, 1, 10000L,
                        "Gangnam Station", 15, "[Location]", null, "Gangnam Station", "Seoul")),
                "Replaces native chat-list location string with [Location] place");
        check("[File] Q4.pdf".equals(NotificationPolicy.resolveChatListMessage(
                        "Alice sent a file.", 10000L, 1, 10000L,
                        "", 14, "[File]", "FILE_NAME\tQ4.pdf", null, null)),
                "Replaces native chat-list file string on exact timestamp match");
        check("new text".equals(NotificationPolicy.resolveChatListMessage(
                        "new text", 10500L, 1, 10000L,
                        "", 14, "[File]", "FILE_NAME\told.pdf", null, null)),
                "Keeps native text when latest stored row timestamp differs even within 2 seconds");
        check("[Sticker]".equals(NotificationPolicy.resolveChatListMessage(
                        "You sent a sticker.", 10000L, 5, 10000L,
                        "", 0, "[Sticker]", null, null, null)),
                "Replaces legacy STICKER row with [Sticker]");
        check("Alice sent a location.".equals(NotificationPolicy.resolveChatListMessage(
                        "Alice sent a location.", 20000L, 1, 10000L,
                        "Old Place", 15, "[Location]", null, "Old Place", null)),
                "Keeps native text when latest stored row timestamp lags behind native chat timestamp");
        check("Missed call".equals(NotificationPolicy.resolveChatListMessage(
                        "Missed call", 10000L, 1, 10000L,
                        "", 6, "[Call]", null, null, null)),
                "Preserves native call summary text");
    }

    private static void messageCountCases() {
        check(NotificationPolicy.clampMessageCount(-5) == 1
                        && NotificationPolicy.clampMessageCount(0) == 1
                        && NotificationPolicy.clampMessageCount(1) == 1
                        && NotificationPolicy.clampMessageCount(10) == 10
                        && NotificationPolicy.clampMessageCount(25) == 25
                        && NotificationPolicy.clampMessageCount(99) == 25,
                "Clamps displayed message count between 1 and 25");
        check(Settings.defaults().maxRecentMessages == 25
                        && ALL.maxRecentMessages == 25,
                "Default and 4-arg Settings retain up to 25 recent messages");

        List<Message> unread = Arrays.asList(
                message("m1", 1), message("m2", 2), message("m3", 3),
                message("m4", 4), message("m5", 5), message("m6", 6));
        Snapshot snap = new Snapshot(CHAT, false, true, 12, false, unread);

        Decision three = NotificationPolicy.evaluate(new Settings(false, true, false, false, 3), snap, false);
        check(ids(three).equals(Arrays.asList("m4", "m5", "m6")) && three.totalUnreadCount == 12,
                "Custom count 3 retains newest 3 messages while preserving full unread count");

        Decision one = NotificationPolicy.evaluate(new Settings(false, true, false, false, 0), snap, false);
        check(ids(one).equals(Arrays.asList("m6")) && one.totalUnreadCount == 12,
                "Clamped count 0 shows newest 1 message while preserving full unread count");
    }

    private static void mediaPreviewCases() {
        for (int supported : new int[]{1, 21, 2, 7}) {
            check(NotificationPolicy.isPreviewableMediaType(supported),
                    "Media preview accepts attachment type " + supported);
        }
        for (int unsupported : new int[]{0, 3, 5, 6, 9, 13, 14, 15, 19, -1}) {
            check(!NotificationPolicy.isPreviewableMediaType(unsupported),
                    "Media preview excludes attachment type " + unsupported);
        }

        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "STKPKGID\t446\tSTKVER\t14\tSTKID\t1988"),
                new long[]{446L, 14L, 1988L}),
                "Parses LINE DB wire sticker keys");
        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "stickerPackageId\t789\tstickerPackageVer\t2\tstickerId\t555"),
                new long[]{789L, 2L, 555L}),
                "Parses legacy camelCase sticker keys");
        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "STICKER_PACKAGE_ID\t446\tSTICKER_PACKAGE_VER\t100\tSTICKER_ID\t1988"),
                new long[]{446L, 100L, 1988L}),
                "Parses standard sticker package, version, and sticker IDs");
        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "STICKER_PACKAGE_ID_OLD\t789\tSTICKER_PACKAGE_VER_OLD\t3\tSTICKER_ID_OLD\t12345"),
                new long[]{789L, 3L, 12345L}),
                "Parses legacy _OLD sticker keys");
        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "STICKER_PACKAGE_ID\t 446 \tstickerId\t 1988 "),
                new long[]{446L, 1L, 1988L}),
                "Falls back to stickerId and defaults missing package version to 1");
        check(Arrays.equals(NotificationPolicy.parseStickerIds(
                        "STICKER_PACKAGE_ID\t446\tSTICKER_PACKAGE_VER\t0\tSTICKER_ID\t1988"),
                new long[]{446L, 1L, 1988L}),
                "Defaults non-positive sticker package version to 1");
        check(NotificationPolicy.parseStickerIds(null) == null
                        && NotificationPolicy.parseStickerIds("") == null
                        && NotificationPolicy.parseStickerIds("STICKER_PACKAGE_ID\t446") == null
                        && NotificationPolicy.parseStickerIds("STICKER_PACKAGE_ID\t0\tSTICKER_ID\t1988") == null
                        && NotificationPolicy.parseStickerIds("STICKER_PACKAGE_ID\tabc\tSTICKER_ID\t1988") == null,
                "Rejects missing, zero, or non-numeric sticker metadata");
    }

    private static void actionLayoutAndSnoozeCases() {
        check(NotificationPolicy.ACTION_LAYOUT_DEFAULT.equals(NotificationPolicy.normalizeActionLayout(null))
                        && NotificationPolicy.ACTION_LAYOUT_DEFAULT.equals(NotificationPolicy.normalizeActionLayout(""))
                        && NotificationPolicy.ACTION_LAYOUT_DEFAULT.equals(NotificationPolicy.normalizeActionLayout("bogus"))
                        && NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE_REPLY.equals(
                                NotificationPolicy.normalizeActionLayout(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE_REPLY)),
                "Normalizes known action layout IDs and falls back to default");

        check(NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE_REPLY)
                        && NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_READ_MUTE_REPLY)
                        && NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_READ_REPLY)
                        && NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE)
                        && NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_READ_ONLY),
                "Identifies presets requiring Mark as read");
        check(!NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_DEFAULT)
                        && !NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_SNOOZE_REPLY)
                        && !NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_REPLY_ONLY)
                        && !NotificationPolicy.actionLayoutUsesRead(NotificationPolicy.ACTION_LAYOUT_NONE),
                "Excludes non-Read presets from readActionUsesRead");

        check(NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_DEFAULT, false, true)
                        .equals(Arrays.asList(NotificationPolicy.ActionSlot.MUTE, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_DEFAULT, true, true)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_DEFAULT, true, false)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.MUTE, NotificationPolicy.ActionSlot.REPLY)),
                "Default layout follows Mark as read switch and patch availability");

        check(NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE_REPLY, false, true)
                        .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ,
                                NotificationPolicy.ActionSlot.SNOOZE_1H, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE_REPLY, false, false)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.SNOOZE_1H, NotificationPolicy.ActionSlot.REPLY)),
                "Read + Quiet 1h + Reply orders slots and omits Read when Mark as read is not included");

        check(NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_MUTE_REPLY, false, true)
                        .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ,
                                NotificationPolicy.ActionSlot.MUTE, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_REPLY, false, true)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_SNOOZE_REPLY, false, false)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.SNOOZE_1H, NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_SNOOZE, false, true)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ, NotificationPolicy.ActionSlot.SNOOZE_1H))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_READ_ONLY, false, true)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.READ))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_REPLY_ONLY, true, true)
                                .equals(Arrays.asList(NotificationPolicy.ActionSlot.REPLY))
                        && NotificationPolicy.resolveActionSlots(NotificationPolicy.ACTION_LAYOUT_NONE, true, true).isEmpty(),
                "Resolves all remaining custom notification button presets accurately");

        check(!NotificationPolicy.isSnoozeActive(0L, 1000L)
                        && !NotificationPolicy.isSnoozeActive(1000L, 1000L)
                        && NotificationPolicy.isSnoozeActive(1001L, 1000L),
                "Checks temporary snooze deadline exclusivity");
    }

    private static void accountSummaryAndMediaGuardCases() {
        check(NotificationPolicy.sameAccount("acc-1", "acc-1")
                        && !NotificationPolicy.sameAccount("acc-1", "acc-2")
                        && !NotificationPolicy.sameAccount("acc-1", null)
                        && !NotificationPolicy.sameAccount(null, "acc-1")
                        && !NotificationPolicy.sameAccount("", ""),
                "Verifies non-empty exact account match");

        check(NotificationPolicy.resolveGroupSummary("acc-1", null) == NotificationPolicy.SummaryAction.CANCEL
                        && NotificationPolicy.resolveGroupSummary("acc-1",
                                Collections.<NotificationPolicy.ActiveChild>emptyList()) == NotificationPolicy.SummaryAction.CANCEL,
                "Cancels group summary when no child notifications remain");

        NotificationPolicy.ActiveChild roomB = new NotificationPolicy.ActiveChild("acc-1", "chat-b", true);
        NotificationPolicy.ActiveChild roomBLegacy = new NotificationPolicy.ActiveChild(null, "chat-b", true);
        NotificationPolicy.ActiveChild roomC = new NotificationPolicy.ActiveChild("acc-1", "chat-c", true);
        NotificationPolicy.ActiveChild foreign = new NotificationPolicy.ActiveChild("acc-2", "chat-b", true);
        NotificationPolicy.ActiveChild openChat = new NotificationPolicy.ActiveChild("acc-1", "open-1", false);

        check(NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(roomB))
                        == NotificationPolicy.SummaryAction.KEEP_SINGLE_ROOM
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(roomB, roomB))
                                == NotificationPolicy.SummaryAction.KEEP_SINGLE_ROOM,
                "Keeps single remaining regular chat summary only when all children match active account");

        check(NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(roomBLegacy))
                        == NotificationPolicy.SummaryAction.KEEP_GENERIC
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(roomB, roomBLegacy))
                                == NotificationPolicy.SummaryAction.KEEP_GENERIC
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(roomB, roomC))
                                == NotificationPolicy.SummaryAction.KEEP_GENERIC
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(foreign))
                                == NotificationPolicy.SummaryAction.KEEP_GENERIC
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.asList(openChat))
                                == NotificationPolicy.SummaryAction.KEEP_GENERIC
                        && NotificationPolicy.resolveGroupSummary("acc-1", Arrays.<NotificationPolicy.ActiveChild>asList((NotificationPolicy.ActiveChild) null))
                                == NotificationPolicy.SummaryAction.KEEP_GENERIC,
                "Falls back to generic summary for unverified null accounts, multiple rooms, foreign accounts, OpenChat, or null entries");

        check(NotificationPolicy.slotGenerationMatches(5L, 5L)
                        && !NotificationPolicy.slotGenerationMatches(5L, 6L)
                        && !NotificationPolicy.slotGenerationMatches(0L, 0L)
                        && !NotificationPolicy.slotGenerationMatches(0L, 1L),
                "Requires positive matching generation to commit a held notification slot");

        check(NotificationPolicy.remainingHoldMillis(2200L, 1500L, 1200L) == 700L
                        && NotificationPolicy.remainingHoldMillis(5000L, 1500L, 1200L) == 1200L
                        && NotificationPolicy.remainingHoldMillis(1500L, 1500L, 1200L) == 0L
                        && NotificationPolicy.remainingHoldMillis(1400L, 1500L, 1200L) == 0L
                        && NotificationPolicy.remainingHoldMillis(-100L, -500L, 1200L) == 400L,
                "Computes bounded non-negative remaining hold duration from monotonic timestamps");

        check(NotificationPolicy.snapshotConsistent(5, "100", 5, "100")
                        && !NotificationPolicy.snapshotConsistent(5, "100", 2, "103")
                        && !NotificationPolicy.snapshotConsistent(5, "100", 2, "100")
                        && !NotificationPolicy.snapshotConsistent(5, "100", 5, "101")
                        && !NotificationPolicy.snapshotConsistent(5, "100", 0, "105"),
                "Rejects partial-read, boundary-shift, or read-all snapshots after media loading");

        check(NotificationPolicy.canStageMediaPreview(true, true, true, 5L, 5L, "acc-1", "acc-1"),
                "Allows media preview staging when settings, privacy, generation, and account match");
        check(!NotificationPolicy.canStageMediaPreview(false, true, true, 5L, 5L, "acc-1", "acc-1")
                        && !NotificationPolicy.canStageMediaPreview(true, false, true, 5L, 5L, "acc-1", "acc-1")
                        && !NotificationPolicy.canStageMediaPreview(true, true, false, 5L, 5L, "acc-1", "acc-1")
                        && !NotificationPolicy.canStageMediaPreview(true, true, true, 5L, 6L, "acc-1", "acc-1")
                        && !NotificationPolicy.canStageMediaPreview(true, true, true, 5L, 5L, "acc-1", "acc-2")
                        && !NotificationPolicy.canStageMediaPreview(true, true, true, 5L, 5L, "", "acc-1"),
                "Blocks media preview staging when any toggle, privacy flag, generation, or account changes");
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
