package app.linenotifications.extension.core;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Objects;
import java.util.Set;

/** Pure local decisions. This class never fetches messages or performs a read action. */
public final class NotificationPolicy {
    public static final int UNKNOWN_UNREAD_COUNT = -1;
    /** MessagingStyle retains at most 25 messages; Android decides how many lines are visible. */
    public static final int MIN_RECENT_MESSAGES = 1;
    public static final int MAX_RECENT_MESSAGES = 25;
    public static final int DEFAULT_RECENT_MESSAGES = MAX_RECENT_MESSAGES;
    public static final int MAX_KEYWORDS = 50;
    public static final int MAX_KEYWORD_LENGTH = 64;
    public static final long SNOOZE_1H_MILLIS = 3600000L;
    public static final String ACTION_LAYOUT_DEFAULT = "default";
    public static final String ACTION_LAYOUT_READ_SNOOZE_REPLY = "read_snooze_reply";
    public static final String ACTION_LAYOUT_READ_MUTE_REPLY = "read_mute_reply";
    public static final String ACTION_LAYOUT_READ_REPLY = "read_reply";
    public static final String ACTION_LAYOUT_SNOOZE_REPLY = "snooze_reply";
    public static final String ACTION_LAYOUT_READ_SNOOZE = "read_snooze";
    public static final String ACTION_LAYOUT_READ_ONLY = "read_only";
    public static final String ACTION_LAYOUT_REPLY_ONLY = "reply_only";
    public static final String ACTION_LAYOUT_NONE = "none";

    public enum ActionSlot { READ, SNOOZE_1H, MUTE, REPLY }

    public static int clampMessageCount(int count) {
        return Math.max(MIN_RECENT_MESSAGES, Math.min(MAX_RECENT_MESSAGES, count));
    }

    private NotificationPolicy() {}

    public enum Mode { ORIGINAL, SILENT, SUPPRESS }

    public enum PreviewState { NATIVE, LOCAL, READ }

    /** Push can precede local persistence. Never label the incoming push with an older count. */
    public static PreviewState previewState(int unread, String readUp, String postedId, List<Message> messages) {
        return previewState(unread, readUp, postedId, messages, false);
    }

    /** Push can precede local persistence; requires exact message match or confirmed local row. */
    public static PreviewState previewState(int unread, String readUp, String postedId,
                                            List<Message> messages, boolean postedStored) {
        try {
            long posted = Long.parseLong(postedId);
            long boundary = readUp == null || readUp.isEmpty() ? 0 : Long.parseLong(readUp);
            if (posted <= 0 || boundary < 0) return PreviewState.NATIVE;
            if (posted <= boundary) return PreviewState.READ;
            if (unread > 0) {
                if (postedStored) return PreviewState.LOCAL;
                if (messages != null) for (Message message : messages) {
                    if (message != null && message.sourceOrder == posted) return PreviewState.LOCAL;
                }
            }
        } catch (NumberFormatException ignored) { }
        return PreviewState.NATIVE;
    }

    public static final class Settings {
        public final boolean notTooMuchSilent;
        public final boolean moreChatInfo;
        public final boolean noReply;
        public final boolean markAsRead;
        public final int maxRecentMessages;

        public Settings(boolean notTooMuchSilent, boolean moreChatInfo,
                        boolean noReply, boolean markAsRead) {
            this(notTooMuchSilent, moreChatInfo, noReply, markAsRead, DEFAULT_RECENT_MESSAGES);
        }

        public Settings(boolean notTooMuchSilent, boolean moreChatInfo,
                        boolean noReply, boolean markAsRead, int maxRecentMessages) {
            this.notTooMuchSilent = notTooMuchSilent;
            this.moreChatInfo = moreChatInfo;
            this.noReply = noReply;
            this.markAsRead = markAsRead;
            this.maxRecentMessages = clampMessageCount(maxRecentMessages);
        }

        public static Settings defaults() {
            return new Settings(false, false, false, false, DEFAULT_RECENT_MESSAGES);
        }
    }

    /** Stable native IDs, never display names. Account identity prevents cross-account reuse. */
    public static final class ChatKey {
        public final String accountId;
        public final String chatId;

        public ChatKey(String accountId, String chatId) {
            this.accountId = requiredId(accountId, "accountId");
            this.chatId = requiredId(chatId, "chatId");
        }

        @Override public boolean equals(Object other) {
            if (this == other) return true;
            if (!(other instanceof ChatKey)) return false;
            ChatKey that = (ChatKey) other;
            return accountId.equals(that.accountId) && chatId.equals(that.chatId);
        }

        @Override public int hashCode() {
            return 31 * accountId.hashCode() + chatId.hashCode();
        }
    }

    public static final class Message {
        public final String id;
        public final long timestampMillis;
        /** Native stable ordering within equal timestamps; never generated from arrival order. */
        public final long sourceOrder;
        /** Stable native sender identity, distinct from a display name that can change or collide. */
        public final String senderId;
        public final String sender;
        public final String text;

        public Message(String id, long timestampMillis, long sourceOrder,
                       String senderId, String sender, String text) {
            this.id = requiredId(id, "messageId");
            this.timestampMillis = timestampMillis;
            this.sourceOrder = sourceOrder;
            this.senderId = requiredId(senderId, "senderId");
            this.sender = Objects.requireNonNull(sender, "sender");
            this.text = Objects.requireNonNull(text, "text");
        }
    }

    public static final class Snapshot {
        public final ChatKey chat;
        public final boolean nativeMuted;
        /** Must reflect LINE preview privacy; lock-screen redaction remains the adapter's job. */
        public final boolean previewAllowed;
        /** Native total, or UNKNOWN_UNREAD_COUNT. It must never be inferred from the preview. */
        public final int totalUnreadCount;
        /**
         * The adapter verified an ordinary per-chat notification whose incoming message is
         * already stored locally. Summary, unsupported, and uncommitted pushes must use false.
         * This is readiness to expose an action, not a bound on which messages it will read.
         */
        public final boolean readReady;
        public final List<Message> unreadMessages;

        public Snapshot(ChatKey chat, boolean nativeMuted, boolean previewAllowed,
                        int totalUnreadCount, boolean readReady,
                        List<Message> unreadMessages) {
            this.chat = Objects.requireNonNull(chat, "chat");
            if (totalUnreadCount < UNKNOWN_UNREAD_COUNT) {
                throw new IllegalArgumentException("Invalid native unread count");
            }
            this.nativeMuted = nativeMuted;
            this.previewAllowed = previewAllowed;
            this.totalUnreadCount = totalUnreadCount;
            this.readReady = readReady;
            Objects.requireNonNull(unreadMessages, "unreadMessages");
            List<Message> copy = new ArrayList<Message>(unreadMessages.size());
            for (Message message : unreadMessages) {
                Objects.requireNonNull(message, "message");
                if (previewAllowed && totalUnreadCount != 0) copy.add(message);
            }
            this.unreadMessages = Collections.unmodifiableList(copy);
        }
    }

    /**
     * A room-wide intent description, not an executable callback. Only an explicit read-button
     * tap may execute it. The adapter must revalidate the active account before invoking LINE's
     * native whole-room read operation and again before native notification cleanup.
     * LINE determines which messages arriving during execution are included.
     */
    public static final class ReadCommand {
        public final ChatKey chat;
        private ReadCommand(ChatKey chat) {
            this.chat = chat;
        }

        public boolean isFor(ChatKey activeChat) {
            return chat.equals(activeChat);
        }
    }

    public static final class Decision {
        public final Mode mode;
        /** When false, keep the native content. When true, use this possibly empty preview. */
        public final boolean replacePreview;
        public final List<Message> recentMessages;
        public final int totalUnreadCount;
        public final boolean hideSuggestedReplies;
        public final boolean replaceMuteWithRead;
        public final ReadCommand readCommand;

        private Decision(Mode mode, boolean replacePreview, List<Message> recentMessages,
                         int totalUnreadCount, boolean hideSuggestedReplies,
                         ReadCommand readCommand) {
            this.mode = mode;
            this.replacePreview = replacePreview;
            this.recentMessages = recentMessages;
            this.totalUnreadCount = totalUnreadCount;
            this.hideSuggestedReplies = hideSuggestedReplies;
            this.readCommand = readCommand;
            this.replaceMuteWithRead = readCommand != null;
        }
    }

    /** fullyMuted must be looked up by snapshot.chat, including its account identity. */
    public static Decision evaluate(Settings settings, Snapshot snapshot, boolean fullyMuted) {
        Objects.requireNonNull(settings, "settings");
        Objects.requireNonNull(snapshot, "snapshot");
        Mode mode = Mode.ORIGINAL;
        if (settings.notTooMuchSilent) {
            if (fullyMuted) mode = Mode.SUPPRESS;
            else if (snapshot.nativeMuted) mode = Mode.SILENT;
        }
        boolean visible = mode != Mode.SUPPRESS;
        boolean replacePreview = visible && settings.moreChatInfo && snapshot.previewAllowed;
        List<Message> recent = replacePreview
                ? latestMessages(snapshot.unreadMessages, settings.maxRecentMessages) : Collections.<Message>emptyList();
        ReadCommand read = visible && settings.markAsRead && snapshot.totalUnreadCount > 0
                && snapshot.readReady
                ? new ReadCommand(snapshot.chat) : null;
        return new Decision(mode, replacePreview, recent, snapshot.totalUnreadCount,
                visible && settings.noReply, read);
    }

    private static final Comparator<Message> MESSAGE_ORDER = new Comparator<Message>() {
        @Override public int compare(Message left, Message right) {
            int time = Long.compare(left.timestampMillis, right.timestampMillis);
            if (time != 0) return time;
            int order = Long.compare(left.sourceOrder, right.sourceOrder);
            return order != 0 ? order : left.id.compareTo(right.id);
        }
    };

    private static List<Message> latestMessages(List<Message> messages, int maxCount) {
        Map<String, Message> byId = new HashMap<String, Message>();
        for (Message message : messages) {
            Message previous = byId.get(message.id);
            if (previous == null || MESSAGE_ORDER.compare(previous, message) <= 0) {
                byId.put(message.id, message);
            }
        }
        List<Message> ordered = new ArrayList<Message>(byId.values());
        Collections.sort(ordered, MESSAGE_ORDER);
        int limit = clampMessageCount(maxCount);
        int first = Math.max(0, ordered.size() - limit);
        return Collections.unmodifiableList(new ArrayList<Message>(ordered.subList(first, ordered.size())));
    }

    private static final String[] PLACEHOLDER_DEFAULT = {"line_notify_attachment_placeholder", "[Attachment]"};
    private static final String[] PLACEHOLDER_PHOTO = {"line_notify_attachment_photo", "[Photo]"};
    private static final String[] PLACEHOLDER_VIDEO = {"line_notify_attachment_video", "[Video]"};
    private static final String[] PLACEHOLDER_STICKER = {"line_notify_attachment_sticker", "[Sticker]"};
    private static final String[] PLACEHOLDER_AUDIO = {"line_notify_attachment_audio", "[Voice message]"};
    private static final String[] PLACEHOLDER_FILE = {"line_notify_attachment_file", "[File]"};
    private static final String[] PLACEHOLDER_LOCATION = {"line_notify_attachment_location", "[Location]"};
    private static final String[] PLACEHOLDER_CONTACT = {"line_notify_attachment_contact", "[Contact]"};
    private static final String[] PLACEHOLDER_CALL = {"line_notify_attachment_call", "[Call]"};
    private static final String[] PLACEHOLDER_GIFT = {"line_notify_attachment_gift", "[Gift]"};
    private static final String[] PLACEHOLDER_MUSIC = {"line_notify_attachment_music", "[Music]"};

    private static String[] attachmentSpec(int attachmentType) {
        // Maps LINE chat_history.attachement_type (ContentType ordinals) to localized resource keys.
        switch (attachmentType) {
            case 1:
            case 21: return PLACEHOLDER_PHOTO;
            case 2: return PLACEHOLDER_VIDEO;
            case 7: return PLACEHOLDER_STICKER;
            case 3: return PLACEHOLDER_AUDIO;
            case 5:
            case 14: return PLACEHOLDER_FILE;
            case 15: return PLACEHOLDER_LOCATION;
            case 13: return PLACEHOLDER_CONTACT;
            case 6: return PLACEHOLDER_CALL;
            case 9: return PLACEHOLDER_GIFT;
            case 19: return PLACEHOLDER_MUSIC;
            default: return PLACEHOLDER_DEFAULT;
        }
    }

    /** Returns the Android string resource key for a LINE `attachement_type` code. */
    public static String attachmentPlaceholderKey(int attachmentType) {
        return attachmentSpec(attachmentType)[0];
    }

    /** Returns the English fallback label for a LINE `attachement_type` code. */
    public static String attachmentPlaceholderFallback(int attachmentType) {
        return attachmentSpec(attachmentType)[1];
    }

    /** Returns true if {@code attachmentType} can resolve a local photo, video, or sticker preview. */
    public static boolean isPreviewableMediaType(int attachmentType) {
        return attachmentType == 1 || attachmentType == 21 || attachmentType == 2 || attachmentType == 7;
    }

    /** Looks up a key in LINE's tab-delimited `chat_history.parameter` string (`key\tval...`). */
    public static String parameterValue(String parameter, String key) {
        if (parameter == null || parameter.isEmpty() || key == null || key.isEmpty()) return null;
        String[] parts = parameter.split("\t", -1);
        for (int i = 0; i + 1 < parts.length; i += 2) {
            if (key.equals(parts[i])) {
                String value = parts[i + 1];
                return value.isEmpty() ? null : value;
            }
        }
        return null;
    }

    /** Parses `{packageId, packageVer, stickerId}` from `chat_history.parameter`, or `null` if invalid. */
    public static long[] parseStickerIds(String parameter) {
        String pkgRaw = firstParameterValue(parameter, "STKPKGID", "stickerPackageId",
                "STICKER_PACKAGE_ID", "STICKER_PACKAGE_ID_OLD");
        String verRaw = firstParameterValue(parameter, "STKVER", "stickerPackageVer",
                "STICKER_PACKAGE_VER", "STICKER_PACKAGE_VER_OLD");
        String stkRaw = firstParameterValue(parameter, "STKID", "stickerId",
                "STICKER_ID", "STICKER_ID_OLD");
        long pkgId = parsePositiveLong(pkgRaw, -1L);
        long stkId = parsePositiveLong(stkRaw, -1L);
        if (pkgId <= 0L || stkId <= 0L) return null;
        long pkgVer = parsePositiveLong(verRaw, 1L);
        return new long[]{pkgId, pkgVer, stkId};
    }

    private static String firstParameterValue(String parameter, String... keys) {
        for (String key : keys) {
            String value = parameterValue(parameter, key);
            if (value != null) return value;
        }
        return null;
    }

    private static long parsePositiveLong(String raw, long fallback) {
        if (raw == null) return fallback;
        try {
            long value = Long.parseLong(raw.trim());
            return value > 0L ? value : fallback;
        } catch (NumberFormatException ignored) {
            return fallback;
        }
    }

    /** Returns true if `chat_history.parameter` mentions `accountMid` directly or via `@All` (`"A":"1"`). */
    public static boolean isMentionedInParameter(String parameter, String accountMid) {
        if (accountMid == null || accountMid.isEmpty()) return false;
        String mentionJson = parameterValue(parameter, "MENTION");
        if (mentionJson == null) return false;
        int pos = skipJsonWs(mentionJson, 0);
        if (pos >= mentionJson.length() || mentionJson.charAt(pos) != '{') return false;
        pos++;
        StringBuilder buf = new StringBuilder();
        while (pos < mentionJson.length()) {
            pos = skipJsonWs(mentionJson, pos);
            if (pos >= mentionJson.length() || mentionJson.charAt(pos) == '}') return false;
            if (mentionJson.charAt(pos) == ',') { pos++; continue; }
            if (mentionJson.charAt(pos) != '"') return false;
            pos = readJsonString(mentionJson, pos, buf);
            if (pos < 0) return false;
            String topKey = buf.toString();
            pos = skipJsonWs(mentionJson, pos);
            if (pos >= mentionJson.length() || mentionJson.charAt(pos) != ':') return false;
            pos = skipJsonWs(mentionJson, pos + 1);
            if ("MENTIONEES".equals(topKey)) {
                return pos < mentionJson.length() && mentionJson.charAt(pos) == '['
                        && scanMentioneesArray(mentionJson, pos, accountMid, buf);
            }
            pos = skipJsonValue(mentionJson, pos);
            if (pos < 0) return false;
        }
        return false;
    }

    /** Resolves optional single-line filename or place metadata for FILE/PDF/LOCATION messages. */
    public static String attachmentDetail(int attachmentType, String parameter,
                                          String locationName, String locationAddress) {
        if (attachmentType == 14 || attachmentType == 5) {
            return sanitizeDetail(parameterValue(parameter, "FILE_NAME"), 80);
        }
        if (attachmentType == 15) {
            String cleanName = sanitizeDetail(locationName, 80);
            return cleanName != null ? cleanName : sanitizeDetail(locationAddress, 80);
        }
        return null;
    }

    /** Formats a localized attachment label with optional detail metadata. */
    public static String formatAttachmentPlaceholder(String label, String detail) {
        return detail == null || detail.isEmpty() ? label : label + " " + detail;
    }

    /** Resolves the display text for a chat_history row, applying typed labels for attachments. */
    public static String resolveMessageBody(String content, int attachmentType, String label,
                                            String parameter, String locationName, String locationAddress) {
        if (attachmentType == 15) {
            String detail = attachmentDetail(attachmentType, parameter, locationName, locationAddress);
            if (detail == null) detail = sanitizeDetail(content, 80);
            return formatAttachmentPlaceholder(label, detail);
        }
        if (attachmentType == 14 || attachmentType == 5) {
            String detail = attachmentDetail(attachmentType, parameter, locationName, locationAddress);
            if (content == null || content.isEmpty()
                    || (detail != null && detail.equals(sanitizeDetail(content, 80)))) {
                return formatAttachmentPlaceholder(label, detail);
            }
            return content;
        }
        return (content == null || content.isEmpty()) ? label : content;
    }

    /** Maps chat_history (type, attachement_type) to a supported attachment code, or 0 for native text. */
    public static int effectiveChatListAttachmentType(int messageType, int attachmentType) {
        if (messageType != 1 && messageType != 5) return 0;
        if (messageType == 5 && attachmentType == 0) return 7;
        switch (attachmentType) {
            case 1:
            case 21:
            case 2:
            case 3:
            case 5:
            case 7:
            case 9:
            case 13:
            case 14:
            case 15:
            case 19:
                return attachmentType;
            default:
                return 0;
        }
    }

    /** Formats a typed attachment preview for the chat list only on exact timestamp match. */
    public static String resolveChatListMessage(String nativeText, long expectedTimeMillis,
                                                int messageType, long rowCreatedTimeMillis,
                                                String content, int attachmentType, String label,
                                                String parameter, String locationName, String locationAddress) {
        if (rowCreatedTimeMillis != expectedTimeMillis) return nativeText;
        int effectiveType = effectiveChatListAttachmentType(messageType, attachmentType);
        if (effectiveType == 0) return nativeText;
        return resolveMessageBody(content, effectiveType, label, parameter, locationName, locationAddress);
    }

    /** Parses comma- and newline-separated keywords into a deduplicated NFC list. */
    public static List<String> parseKeywords(String raw) {
        if (raw == null || raw.isEmpty()) return Collections.emptyList();
        String[] parts = raw.split("[\\r\\n,\\uFF0C\\u3001]+");
        List<String> result = new ArrayList<String>();
        Set<String> seen = new LinkedHashSet<String>();
        for (String part : parts) {
            if (part == null || part.isEmpty()) continue;
            String nfc = Normalizer.normalize(part, Normalizer.Form.NFC);
            String cleaned = cleanSingleLine(nfc, MAX_KEYWORD_LENGTH, false);
            if (cleaned == null) continue;
            String lower = cleaned.toLowerCase(Locale.ROOT);
            if (seen.add(lower)) {
                result.add(cleaned);
                if (result.size() >= MAX_KEYWORDS) break;
            }
        }
        return result.isEmpty() ? Collections.<String>emptyList() : Collections.unmodifiableList(result);
    }

    /** Serializes normalized keywords for storage or multi-line editing. */
    public static String serializeKeywords(List<String> keywords) {
        if (keywords == null || keywords.isEmpty()) return "";
        StringBuilder sb = new StringBuilder();
        for (String keyword : keywords) {
            if (keyword == null || keyword.isEmpty()) continue;
            if (sb.length() > 0) sb.append('\n');
            sb.append(keyword);
        }
        return sb.toString();
    }

    /** Formats a compact comma-separated keyword preview truncated after {@code maxChars}. */
    public static String formatKeywordsSummary(List<String> keywords, int maxChars) {
        if (keywords == null || keywords.isEmpty() || maxChars <= 0) return null;
        StringBuilder sb = new StringBuilder();
        for (String keyword : keywords) {
            if (keyword == null || keyword.isEmpty()) continue;
            if (sb.length() > 0) sb.append(", ");
            sb.append(keyword);
        }
        if (sb.length() == 0) return null;
        return sb.length() > maxChars ? sb.substring(0, maxChars) + "\u2026" : sb.toString();
    }

    /** Case-insensitive NFC substring check for {@code text} against configured {@code keywords}. */
    public static boolean matchesKeyword(String text, List<String> keywords) {
        if (text == null || text.isEmpty() || keywords == null || keywords.isEmpty()) return false;
        String normalized = Normalizer.normalize(text, Normalizer.Form.NFC).toLowerCase(Locale.ROOT);
        for (String keyword : keywords) {
            if (keyword == null || keyword.isEmpty()) continue;
            String needle = Normalizer.normalize(keyword, Normalizer.Form.NFC).toLowerCase(Locale.ROOT);
            if (!needle.isEmpty() && normalized.contains(needle)) return true;
        }
        return false;
    }

    /** Checks stored message content and FILE/PDF/LOCATION metadata against {@code keywords}. */
    public static boolean matchesMessageKeywords(String content, int attachmentType, String parameter,
                                                 String locationName, String locationAddress, List<String> keywords) {
        if (keywords == null || keywords.isEmpty()) return false;
        if (matchesKeyword(content, keywords)) return true;
        if (attachmentType == 14 || attachmentType == 5) {
            return matchesKeyword(parameterValue(parameter, "FILE_NAME"), keywords);
        }
        if (attachmentType == 15) {
            return matchesKeyword(locationName, keywords) || matchesKeyword(locationAddress, keywords);
        }
        return false;
    }

    /** Case-insensitive check against {@link ActionSlot} layout presets and local snooze expiry. */
    public static String normalizeActionLayout(String layoutId) {
        if (ACTION_LAYOUT_READ_SNOOZE_REPLY.equals(layoutId)) return ACTION_LAYOUT_READ_SNOOZE_REPLY;
        if (ACTION_LAYOUT_READ_MUTE_REPLY.equals(layoutId)) return ACTION_LAYOUT_READ_MUTE_REPLY;
        if (ACTION_LAYOUT_READ_REPLY.equals(layoutId)) return ACTION_LAYOUT_READ_REPLY;
        if (ACTION_LAYOUT_SNOOZE_REPLY.equals(layoutId)) return ACTION_LAYOUT_SNOOZE_REPLY;
        if (ACTION_LAYOUT_READ_SNOOZE.equals(layoutId)) return ACTION_LAYOUT_READ_SNOOZE;
        if (ACTION_LAYOUT_READ_ONLY.equals(layoutId)) return ACTION_LAYOUT_READ_ONLY;
        if (ACTION_LAYOUT_REPLY_ONLY.equals(layoutId)) return ACTION_LAYOUT_REPLY_ONLY;
        if (ACTION_LAYOUT_NONE.equals(layoutId)) return ACTION_LAYOUT_NONE;
        return ACTION_LAYOUT_DEFAULT;
    }

    /** Returns true if the selected preset explicitly includes the {@code Mark as read} action. */
    public static boolean actionLayoutUsesRead(String layoutId) {
        String layout = normalizeActionLayout(layoutId);
        return ACTION_LAYOUT_READ_SNOOZE_REPLY.equals(layout)
                || ACTION_LAYOUT_READ_MUTE_REPLY.equals(layout)
                || ACTION_LAYOUT_READ_REPLY.equals(layout)
                || ACTION_LAYOUT_READ_SNOOZE.equals(layout)
                || ACTION_LAYOUT_READ_ONLY.equals(layout);
    }

    /** Resolves ordered notification action slots for a preset, omitting {@code READ} if unavailable. */
    public static List<ActionSlot> resolveActionSlots(String layoutId, boolean markAsReadSwitch, boolean readIncluded) {
        String layout = normalizeActionLayout(layoutId);
        List<ActionSlot> slots = new ArrayList<ActionSlot>(3);
        if (ACTION_LAYOUT_DEFAULT.equals(layout)) {
            if (markAsReadSwitch && readIncluded) slots.add(ActionSlot.READ);
            else slots.add(ActionSlot.MUTE);
            slots.add(ActionSlot.REPLY);
        } else if (ACTION_LAYOUT_READ_SNOOZE_REPLY.equals(layout)) {
            if (readIncluded) slots.add(ActionSlot.READ);
            slots.add(ActionSlot.SNOOZE_1H);
            slots.add(ActionSlot.REPLY);
        } else if (ACTION_LAYOUT_READ_MUTE_REPLY.equals(layout)) {
            if (readIncluded) slots.add(ActionSlot.READ);
            slots.add(ActionSlot.MUTE);
            slots.add(ActionSlot.REPLY);
        } else if (ACTION_LAYOUT_READ_REPLY.equals(layout)) {
            if (readIncluded) slots.add(ActionSlot.READ);
            slots.add(ActionSlot.REPLY);
        } else if (ACTION_LAYOUT_SNOOZE_REPLY.equals(layout)) {
            slots.add(ActionSlot.SNOOZE_1H);
            slots.add(ActionSlot.REPLY);
        } else if (ACTION_LAYOUT_READ_SNOOZE.equals(layout)) {
            if (readIncluded) slots.add(ActionSlot.READ);
            slots.add(ActionSlot.SNOOZE_1H);
        } else if (ACTION_LAYOUT_READ_ONLY.equals(layout)) {
            if (readIncluded) slots.add(ActionSlot.READ);
        } else if (ACTION_LAYOUT_REPLY_ONLY.equals(layout)) {
            slots.add(ActionSlot.REPLY);
        }
        return Collections.unmodifiableList(slots);
    }

    /** Returns true while a local timed snooze deadline has not expired. */
    public static boolean isSnoozeActive(long snoozeUntilMillis, long nowMillis) {
        return snoozeUntilMillis > nowMillis;
    }

    private static boolean scanMentioneesArray(String json, int start, String accountMid, StringBuilder buf) {
        int pos = start + 1;
        while (pos < json.length()) {
            pos = skipJsonWs(json, pos);
            if (pos >= json.length() || json.charAt(pos) == ']') return false;
            if (json.charAt(pos) == ',') { pos++; continue; }
            if (json.charAt(pos) == '{') {
                pos++;
                while (pos < json.length()) {
                    pos = skipJsonWs(json, pos);
                    if (pos >= json.length()) return false;
                    if (json.charAt(pos) == '}') { pos++; break; }
                    if (json.charAt(pos) == ',') { pos++; continue; }
                    if (json.charAt(pos) != '"') return false;
                    pos = readJsonString(json, pos, buf);
                    if (pos < 0) return false;
                    String key = buf.toString();
                    pos = skipJsonWs(json, pos);
                    if (pos >= json.length() || json.charAt(pos) != ':') return false;
                    pos = skipJsonWs(json, pos + 1);
                    if (pos < json.length() && json.charAt(pos) == '"'
                            && ("M".equals(key) || "A".equals(key))) {
                        pos = readJsonString(json, pos, buf);
                        if (pos < 0) return false;
                        String val = buf.toString();
                        if ("M".equals(key) && accountMid.equals(val)) return true;
                        if ("A".equals(key) && "1".equals(val)) return true;
                    } else {
                        pos = skipJsonValue(json, pos);
                        if (pos < 0) return false;
                    }
                }
            } else {
                pos = skipJsonValue(json, pos);
                if (pos < 0) return false;
            }
        }
        return false;
    }

    private static int skipJsonWs(String json, int pos) {
        while (pos < json.length()) {
            char c = json.charAt(pos);
            if (c == ' ' || c == '\t' || c == '\n' || c == '\r') pos++;
            else break;
        }
        return pos;
    }

    private static int readJsonString(String json, int pos, StringBuilder out) {
        if (pos >= json.length() || json.charAt(pos) != '"') return -1;
        out.setLength(0);
        pos++;
        while (pos < json.length()) {
            char c = json.charAt(pos++);
            if (c == '"') return pos;
            if (c != '\\') {
                out.append(c);
                continue;
            }
            if (pos >= json.length()) return -1;
            char esc = json.charAt(pos++);
            switch (esc) {
                case '"': case '\\': case '/': out.append(esc); break;
                case 'b': out.append('\b'); break;
                case 'f': out.append('\f'); break;
                case 'n': out.append('\n'); break;
                case 'r': out.append('\r'); break;
                case 't': out.append('\t'); break;
                case 'u':
                    if (pos + 4 > json.length()) return -1;
                    try {
                        out.append((char) Integer.parseInt(json.substring(pos, pos + 4), 16));
                        pos += 4;
                    } catch (NumberFormatException badHex) {
                        return -1;
                    }
                    break;
                default: return -1;
            }
        }
        return -1;
    }

    private static int skipJsonValue(String json, int pos) {
        pos = skipJsonWs(json, pos);
        if (pos >= json.length()) return -1;
        char c = json.charAt(pos);
        if (c == '"') {
            pos++;
            while (pos < json.length()) {
                char ch = json.charAt(pos++);
                if (ch == '\\') {
                    if (pos >= json.length()) return -1;
                    pos++;
                } else if (ch == '"') {
                    return pos;
                }
            }
            return -1;
        }
        if (c == '{' || c == '[') {
            int depth = 0;
            boolean inStr = false;
            while (pos < json.length()) {
                char ch = json.charAt(pos++);
                if (inStr) {
                    if (ch == '\\') {
                        if (pos >= json.length()) return -1;
                        pos++;
                    } else if (ch == '"') {
                        inStr = false;
                    }
                } else if (ch == '"') {
                    inStr = true;
                } else if (ch == '{' || ch == '[') {
                    depth++;
                } else if (ch == '}' || ch == ']') {
                    depth--;
                    if (depth == 0) return pos;
                    if (depth < 0) return -1;
                }
            }
            return -1;
        }
        int start = pos;
        while (pos < json.length()) {
            char ch = json.charAt(pos);
            if (ch == ',' || ch == '}' || ch == ']' || ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r') break;
            pos++;
        }
        return pos > start ? pos : -1;
    }

    private static String sanitizeDetail(String value, int maxChars) {
        return cleanSingleLine(value, maxChars, true);
    }

    private static String cleanSingleLine(String value, int maxChars, boolean appendEllipsis) {
        if (value == null || value.isEmpty() || maxChars <= 0) return null;
        StringBuilder sb = new StringBuilder(Math.min(value.length(), maxChars + 2));
        boolean pendingSpace = false;
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (Character.isWhitespace(c) || c < ' ') {
                if (sb.length() > 0) pendingSpace = true;
            } else {
                boolean isPair = Character.isHighSurrogate(c)
                        && i + 1 < value.length() && Character.isLowSurrogate(value.charAt(i + 1));
                int charUnits = isPair ? 2 : 1;
                if (!appendEllipsis) {
                    int needed = (pendingSpace ? 1 : 0) + charUnits;
                    if (sb.length() + needed > maxChars) break;
                }
                if (pendingSpace) {
                    sb.append(' ');
                    pendingSpace = false;
                }
                sb.append(c);
                if (isPair) {
                    sb.append(value.charAt(++i));
                }
                if (appendEllipsis && sb.length() > maxChars) {
                    int cut = maxChars;
                    if (cut > 0 && Character.isHighSurrogate(sb.charAt(cut - 1))) cut--;
                    while (cut > 0 && sb.charAt(cut - 1) == ' ') cut--;
                    return sb.substring(0, cut) + "\u2026";
                }
            }
        }
        return sb.length() == 0 ? null : sb.toString();
    }

    public enum SummaryAction { CANCEL, KEEP_SINGLE_ROOM, KEEP_GENERIC }

    public static final class ActiveChild {
        public final String accountId;
        public final String chatId;
        public final boolean regularMessage;

        public ActiveChild(String accountId, String chatId, boolean regularMessage) {
            this.accountId = accountId;
            this.chatId = chatId;
            this.regularMessage = regularMessage;
        }
    }

    /** Returns true when an expected non-empty account ID still matches the active account. */
    public static boolean sameAccount(String expectedAccount, String activeAccount) {
        return expectedAccount != null && !expectedAccount.isEmpty() && expectedAccount.equals(activeAccount);
    }

    /** Decides whether a group summary should be canceled or rebuilt after removing one chat. */
    public static SummaryAction resolveGroupSummary(String activeAccount, List<ActiveChild> remainingChildren) {
        if (remainingChildren == null || remainingChildren.isEmpty()) return SummaryAction.CANCEL;
        String singleChat = null;
        for (ActiveChild child : remainingChildren) {
            if (child == null || !child.regularMessage || child.chatId == null || child.chatId.isEmpty()) {
                return SummaryAction.KEEP_GENERIC;
            }
            if (!sameAccount(activeAccount, child.accountId)) {
                return SummaryAction.KEEP_GENERIC;
            }
            if (singleChat == null) {
                singleChat = child.chatId;
            } else if (!singleChat.equals(child.chatId)) {
                return SummaryAction.KEEP_GENERIC;
            }
        }
        return singleChat != null ? SummaryAction.KEEP_SINGLE_ROOM : SummaryAction.KEEP_GENERIC;
    }

    /** Returns true only when a slot generation token matches the latest post on that slot. */
    public static boolean slotGenerationMatches(long expectedGeneration, long currentGeneration) {
        return expectedGeneration > 0L && expectedGeneration == currentGeneration;
    }

    /** Returns remaining hold duration in ms (0 when expired; bounded by maxHoldMillis). */
    public static long remainingHoldMillis(long deadlineMillis, long nowMillis, long maxHoldMillis) {
        long remaining = deadlineMillis - nowMillis;
        if (remaining <= 0L) return 0L;
        return maxHoldMillis > 0L ? Math.min(remaining, maxHoldMillis) : remaining;
    }

    /** Returns true only when unread count and read boundary remain unchanged after loading. */
    public static boolean snapshotConsistent(int beforeUnread, String beforeReadUp,
                                               int afterUnread, String afterReadUp) {
        return afterUnread > 0 && beforeUnread == afterUnread && Objects.equals(beforeReadUp, afterReadUp);
    }

    /** Returns true only when settings, privacy, cache generation, and account all remain valid. */
    public static boolean canStageMediaPreview(boolean moreChatInfoEnabled, boolean mediaPreviewEnabled,
                                                boolean previewsAllowed, long startGeneration,
                                                long currentGeneration, String expectedAccount,
                                                String activeAccount) {
        return moreChatInfoEnabled && mediaPreviewEnabled && previewsAllowed
                && startGeneration == currentGeneration && sameAccount(expectedAccount, activeAccount);
    }

    private static String requiredId(String value, String name) {
        Objects.requireNonNull(value, name);
        if (value.trim().isEmpty()) throw new IllegalArgumentException(name + " is empty");
        return value;
    }
}
