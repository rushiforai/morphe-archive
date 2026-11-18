package io.github.sabopura.morphe.extension.twitch.chat;

import java.util.LinkedHashMap;
import java.util.Map;

/** Stable decisions across row recycling; isolated by room AND sender. No chat is persisted. */
public final class RepeatFilter {
    // At a hundred lines a second, eight seconds of chat must still be remembered.
    private final Map<String, Boolean> decisions = bounded(4096);
    private final Map<String, Long> previous = bounded(4096);

    private static <V> Map<String, V> bounded(int size) {
        return new LinkedHashMap<String, V>(16, .75f, true) {
            @Override
            protected boolean removeEldestEntry(Map.Entry<String, V> entry) {
                return size() > size;
            }
        };
    }

    /** {@code folded} is the message passed through {@link ChatRules#normalize}. */
    public synchronized boolean isRepeat(
            String room, String user, String id, String folded, long sentAt) {
        if (room == null || user == null || user.isEmpty() || id == null || sentAt <= 0)
            return false;
        String message = room + '\u0000' + id;
        Boolean known = decisions.get(message);
        if (known != null) return known;
        String content = room + '\u0000' + user + '\u0000' + folded;
        Long last = previous.get(content);
        boolean repeat = last != null && sentAt >= last && sentAt - last <= 8_000;
        if (last == null || sentAt > last) previous.put(content, sentAt);
        decisions.put(message, repeat);
        return repeat;
    }
}
