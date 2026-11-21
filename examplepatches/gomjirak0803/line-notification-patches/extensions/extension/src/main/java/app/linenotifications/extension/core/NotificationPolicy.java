package app.linenotifications.extension.core;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/** Pure local decisions. This class never fetches messages or performs a read action. */
public final class NotificationPolicy {
    public static final int UNKNOWN_UNREAD_COUNT = -1;
    /** MessagingStyle retains at most 25 messages; Android decides how many lines are visible. */
    public static final int MAX_RECENT_MESSAGES = 25;

    private NotificationPolicy() {}

    public enum Mode { ORIGINAL, SILENT, SUPPRESS }

    public enum PreviewState { NATIVE, LOCAL, READ }

    /** Push can precede local persistence. Never label the incoming push with an older count. */
    public static PreviewState previewState(int unread, String readUp, String postedId, List<Message> messages) {
        try {
            long posted = Long.parseLong(postedId);
            long boundary = readUp == null || readUp.isEmpty() ? 0 : Long.parseLong(readUp);
            if (posted <= 0 || boundary < 0) return PreviewState.NATIVE;
            if (posted <= boundary) return PreviewState.READ;
            if (unread > 0) for (Message message : messages) {
                if (message.sourceOrder >= posted) return PreviewState.LOCAL;
            }
        } catch (NumberFormatException ignored) { }
        return PreviewState.NATIVE;
    }

    public static final class Settings {
        public final boolean notTooMuchSilent;
        public final boolean moreChatInfo;
        public final boolean noReply;
        public final boolean markAsRead;

        public Settings(boolean notTooMuchSilent, boolean moreChatInfo,
                        boolean noReply, boolean markAsRead) {
            this.notTooMuchSilent = notTooMuchSilent;
            this.moreChatInfo = moreChatInfo;
            this.noReply = noReply;
            this.markAsRead = markAsRead;
        }

        public static Settings defaults() {
            return new Settings(false, false, false, false);
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
                ? latestMessages(snapshot.unreadMessages) : Collections.<Message>emptyList();
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

    private static List<Message> latestMessages(List<Message> messages) {
        Map<String, Message> byId = new HashMap<String, Message>();
        for (Message message : messages) {
            Message previous = byId.get(message.id);
            if (previous == null || MESSAGE_ORDER.compare(previous, message) <= 0) {
                byId.put(message.id, message);
            }
        }
        List<Message> ordered = new ArrayList<Message>(byId.values());
        Collections.sort(ordered, MESSAGE_ORDER);
        int first = Math.max(0, ordered.size() - MAX_RECENT_MESSAGES);
        return Collections.unmodifiableList(new ArrayList<Message>(ordered.subList(first, ordered.size())));
    }

    private static String requiredId(String value, String name) {
        Objects.requireNonNull(value, name);
        if (value.trim().isEmpty()) throw new IllegalArgumentException(name + " is empty");
        return value;
    }
}
