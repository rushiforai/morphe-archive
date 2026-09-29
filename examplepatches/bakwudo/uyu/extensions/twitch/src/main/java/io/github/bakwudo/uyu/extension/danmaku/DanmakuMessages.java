package io.github.bakwudo.uyu.extension.danmaku;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Turns received chat messages into danmaku comments.
 */
final class DanmakuMessages {
    /**
     * Message ids already handled. The chat connection sends the last messages again when a
     * channel is joined again, and the same batch can reach the hook more than once.
     */
    private static final Map<String, Boolean> seenIds = new LinkedHashMap<>(256, 0.75f, false) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Boolean> eldest) {
            return size() > 2000;
        }
    };

    private DanmakuMessages() {
    }

    /**
     * @param messages ChatLiveMessage objects.
     * @return Comments for the messages not seen before. Messages without text or emotes are
     * left out.
     */
    static List<DanmakuComment> toComments(List<?> messages) {
        List<DanmakuComment> comments = new ArrayList<>(messages.size());
        for (Object message : messages) {
            String id = ChatMessages.messageId(message);
            if (id != null) {
                synchronized (seenIds) {
                    if (seenIds.put(id, Boolean.TRUE) != null) continue;
                }
            }

            Object info = ChatMessages.messageInfo(message);
            List<?> tokens = info == null ? null : ChatMessages.tokens(info);
            DanmakuComment comment = tokens == null ? null : toComment(tokens);
            if (comment != null) comments.add(comment);
        }
        return comments;
    }

    /**
     * Keeps the text and the Twitch emotes. Mentions, links and cheers are shown as text.
     */
    private static DanmakuComment toComment(List<?> tokens) {
        List<Object> parts = new ArrayList<>();
        StringBuilder text = new StringBuilder();
        for (Object token : tokens) {
            String emoteId = ChatMessages.emoteTokenId(token);
            if (emoteId != null) {
                addText(parts, text);
                parts.add(new DanmakuComment.Emote(emoteId));
                continue;
            }

            String tokenText = ChatMessages.textTokenText(token);
            if (tokenText == null) tokenText = ChatMessages.mentionTokenText(token);
            if (tokenText == null) tokenText = ChatMessages.urlTokenUrl(token);
            if (tokenText == null) {
                String prefix = ChatMessages.bitsTokenPrefix(token);
                if (prefix != null) tokenText = prefix + ChatMessages.bitsTokenAmount(token);
            }
            if (tokenText != null) text.append(tokenText);
        }
        addText(parts, text);

        trimEnds(parts);
        return parts.isEmpty() ? null : new DanmakuComment(parts.toArray());
    }

    private static void addText(List<Object> parts, StringBuilder text) {
        if (text.length() == 0) return;
        parts.add(text.toString().replaceAll("\\s", " "));
        text.setLength(0);
    }

    /** Removes leading and trailing spaces, and parts left empty. */
    private static void trimEnds(List<Object> parts) {
        if (!parts.isEmpty() && parts.get(0) instanceof String first) {
            String trimmed = first.replaceAll("^ +", "");
            if (trimmed.isEmpty()) parts.remove(0);
            else parts.set(0, trimmed);
        }
        int last = parts.size() - 1;
        if (last >= 0 && parts.get(last) instanceof String end) {
            String trimmed = end.replaceAll(" +$", "");
            if (trimmed.isEmpty()) parts.remove(last);
            else parts.set(last, trimmed);
        }
    }
}
