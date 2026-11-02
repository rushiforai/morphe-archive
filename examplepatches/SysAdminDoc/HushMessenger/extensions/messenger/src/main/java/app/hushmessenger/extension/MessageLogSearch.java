package app.hushmessenger.extension;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

/** What the message log's search box and by-chat view pick out of the saved messages. */
final class MessageLogSearch {
    private static final Pattern MARKS = Pattern.compile("\\p{M}+");
    /** Vietnamese's d with a stroke has no decomposed form, so stripping marks alone leaves it alone. */
    private static final char D_WITH_STROKE = (char) 0x111;

    private MessageLogSearch() {}

    /** Lower case with the accents off, so "tin nhan" finds a message spelled with its accents. */
    static String fold(String value) {
        String bare = MARKS.matcher(Normalizer.normalize(value, Normalizer.Form.NFD)).replaceAll("");
        return bare.toLowerCase(Locale.ROOT).replace(D_WITH_STROKE, 'd');
    }

    /** One chat in the by-chat view. Its name is empty when no message in it named anyone. */
    static final class Chat {
        final String thread;
        final String name;
        final long latest;
        int count;

        Chat(String thread, String name, long latest) {
            this.thread = thread;
            this.name = name;
            this.latest = latest;
        }
    }

    /** The chats in [newestFirst], the most recent first. */
    static List<Chat> chats(List<MessageLog.Entry> newestFirst) {
        Map<String, Chat> chats = new LinkedHashMap<>();
        for (MessageLog.Entry entry : newestFirst) {
            Chat chat = chats.get(entry.thread);
            if (chat == null) {
                chat = new Chat(entry.thread, name(newestFirst, entry.thread), entry.time);
                chats.put(entry.thread, chat);
            }
            chat.count++;
        }
        return new ArrayList<>(chats.values());
    }

    /** A group's name beats a sender's, since a group's messages can reach the log before its name does. */
    private static String name(List<MessageLog.Entry> entries, String thread) {
        String sender = "";
        for (MessageLog.Entry entry : entries) {
            if (!entry.thread.equals(thread)) continue;
            if (!entry.chat.isEmpty()) return entry.chat;
            if (sender.isEmpty()) sender = entry.sender;
        }
        return sender;
    }

    /** The log folded once, off the main thread, so each typed letter only has to compare. */
    static final class Index {
        final boolean hasUnsent;
        private final List<MessageLog.Entry> entries;
        private final String[] folded;

        Index(List<MessageLog.Entry> entries) {
            this.entries = entries;
            folded = new String[entries.size()];
            boolean unsent = false;
            for (int i = 0; i < folded.length; i++) {
                MessageLog.Entry entry = entries.get(i);
                folded[i] = fold(entry.text + '\n' + entry.sender + '\n' + entry.chat);
                unsent |= entry.unsent;
            }
            hasUnsent = unsent;
        }

        /** Every word of [query], in any order, in the message or its names. A null [thread] means every chat. */
        List<MessageLog.Entry> find(String query, String thread, boolean unsentOnly) {
            String[] words = fold(query).trim().split("\\s+");
            List<MessageLog.Entry> found = new ArrayList<>();
            for (int i = 0; i < folded.length; i++) {
                MessageLog.Entry entry = entries.get(i);
                if ((thread != null && !thread.equals(entry.thread)) || (unsentOnly && !entry.unsent)) continue;
                boolean all = true;
                for (String word : words) all &= folded[i].contains(word);
                if (all) found.add(entry);
            }
            return found;
        }
    }
}
