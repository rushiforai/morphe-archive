package io.github.sabopura.morphe.extension.twitch.danmaku;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/** Turns the fields of Twitch's parsed live chat message into a comment. */
final class ChatMessageReader {
    /** A chat message ready for display. */
    static final class Comment {
        final String id;
        final String author;
        final String login;
        final String userId;
        final Integer color;
        final List<ChatTokens.Segment> segments;
        final String plainText;

        Comment(String id, String author, String login, String userId, Integer color,
                List<ChatTokens.Segment> segments) {
            this.id = id;
            this.author = author;
            this.login = login;
            this.userId = userId;
            this.color = color;
            this.segments = segments;
            this.plainText = ChatTokens.plainText(segments);
        }
    }

    private ChatMessageReader() {
    }

    static String tag(Map<?, ?> tags, String key) {
        Object value = tags == null ? null : tags.get(key);
        if (value == null) return null;
        String text = String.valueOf(value);
        return text.isEmpty() ? null : text;
    }

    /** Send time in epoch milliseconds, from the IRC tag or the typed field; 0 when unknown. */
    static long sentAt(Map<?, ?> tags, Long timestampSeconds) {
        String tag = tag(tags, "tmi-sent-ts");
        if (tag != null) {
            try {
                long parsed = Long.parseLong(tag);
                if (parsed > 0L) return parsed;
            } catch (NumberFormatException ignored) {
                // Fall back to the typed timestamp.
            }
        }
        if (timestampSeconds == null) return 0L;
        return timestampSeconds > 100_000_000_000L ? timestampSeconds : timestampSeconds * 1000L;
    }

    /** The comment, or null for a message with no text or emote. {@code login} is the sender's username. */
    static Comment read(Map<?, ?> tags, String login, Integer color, List<?> tokens, Object gigantifiedEmote) {
        List<ChatTokens.Segment> segments = new ArrayList<>(ChatTokens.parseAll(tokens));
        if (gigantifiedEmote != null) {
            ChatTokens.Segment emote = ChatTokens.parse(String.valueOf(gigantifiedEmote));
            if (emote != null) segments.add(emote);
        }
        if (segments.isEmpty()) return null;
        String author = tag(tags, "display-name");
        if (author == null) author = login;
        return new Comment(tag(tags, "id"), author == null ? "" : author, login, tag(tags, "user-id"), color, segments);
    }
}
