package app.hushmessenger.extension;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
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
    /** Which chats the log shows: every one, one-to-one chats only, or group chats only. */
    static final int ALL = 0, DIRECT = 1, GROUPS = 2;

    private MessageLogSearch() {}

    /** Lower case with the accents off, so "tin nhan" finds a message spelled with its accents. */
    static String fold(String value) {
        String bare = MARKS.matcher(Normalizer.normalize(value, Normalizer.Form.NFD)).replaceAll("");
        return bare.toLowerCase(Locale.ROOT).replace(D_WITH_STROKE, 'd');
    }

    /** One-to-one chats, encrypted or not. A message with no chat key counts as neither kind. */
    static boolean direct(MessageLog.Entry entry) {
        return !entry.thread.isEmpty() && ChatNotifications.oneToOne(entry.thread);
    }

    static boolean ofKind(MessageLog.Entry entry, int kind) {
        if (kind == ALL) return true;
        if (entry.thread.isEmpty()) return false;
        return direct(entry) == (kind == DIRECT);
    }

    /** One chat in the by-chat view. Its name is empty when no message in it named anyone and none was picked. */
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
        return chats(newestFirst, Collections.emptyMap());
    }

    /** The chats in [newestFirst], the most recent first, under the names picked for them in [names]. */
    static List<Chat> chats(List<MessageLog.Entry> newestFirst, Map<String, String> names) {
        Map<String, Chat> chats = new LinkedHashMap<>();
        for (MessageLog.Entry entry : newestFirst) {
            Chat chat = chats.get(entry.thread);
            if (chat == null) {
                String picked = names.get(entry.thread);
                chat = new Chat(entry.thread, picked != null ? picked : name(newestFirst, entry.thread), entry.time);
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
        /** The names picked for chats, and those folded, by thread. Renaming a chat changes both. */
        private final Map<String, String> names;
        private final Map<String, String> foldedNames = new HashMap<>();
        /** What each chat is called in its messages: a group's name, else its first sender, by thread. */
        private final Map<String, String> known = new HashMap<>();
        private final Map<String, String> groupNames = new HashMap<>();

        Index(List<MessageLog.Entry> entries) {
            this(entries, Collections.emptyMap());
        }

        Index(List<MessageLog.Entry> entries, Map<String, String> names) {
            this.entries = entries;
            this.names = new HashMap<>(names);
            for (Map.Entry<String, String> name : names.entrySet()) foldedNames.put(name.getKey(), fold(name.getValue()));
            folded = new String[entries.size()];
            boolean unsent = false;
            for (int i = 0; i < folded.length; i++) {
                MessageLog.Entry entry = entries.get(i);
                folded[i] = fold(entry.text + '\n' + entry.sender + '\n' + entry.chat);
                unsent |= entry.unsent;
                if (!entry.chat.isEmpty()) {
                    groupNames.putIfAbsent(entry.thread, entry.chat);
                    known.put(entry.thread, groupNames.get(entry.thread));
                } else if (!entry.sender.isEmpty() && !groupNames.containsKey(entry.thread)) {
                    known.putIfAbsent(entry.thread, entry.sender);
                }
            }
            hasUnsent = unsent;
        }

        /** The name picked for [thread], empty when none was. */
        String picked(String thread) {
            String name = names.get(thread);
            return name == null ? "" : name;
        }

        /** What [thread] is called: the name picked for it, else what its messages call it, else empty. */
        String chatName(String thread) {
            String name = picked(thread);
            if (!name.isEmpty()) return name;
            name = known.get(thread);
            return name == null ? "" : name;
        }

        /** The group's name for [thread]: the one picked for it, else the one its messages carry, else empty. */
        String groupName(String thread) {
            String name = picked(thread);
            if (!name.isEmpty()) return name;
            name = groupNames.get(thread);
            return name == null ? "" : name;
        }

        Map<String, String> names() {
            return Collections.unmodifiableMap(names);
        }

        /** Takes a name the log's screen just saved, or takes it away when [name] is empty. */
        void rename(String thread, String name) {
            if (name == null || name.isEmpty()) {
                names.remove(thread);
                foldedNames.remove(thread);
            } else {
                names.put(thread, name);
                foldedNames.put(thread, fold(name));
            }
        }

        List<MessageLog.Entry> find(String query, String thread, boolean unsentOnly) {
            return find(query, thread, unsentOnly, ALL);
        }

        /**
         * Every word of [query], in any order, in the message, its names or the name picked for its chat. A null [thread]
         * means every chat of [kind].
         */
        List<MessageLog.Entry> find(String query, String thread, boolean unsentOnly, int kind) {
            String[] words = fold(query).trim().split("\\s+");
            List<MessageLog.Entry> found = new ArrayList<>();
            for (int i = 0; i < folded.length; i++) {
                MessageLog.Entry entry = entries.get(i);
                if ((thread != null && !thread.equals(entry.thread)) || (unsentOnly && !entry.unsent)) continue;
                if (thread == null && !ofKind(entry, kind)) continue;
                String picked = foldedNames.get(entry.thread);
                boolean all = true;
                for (String word : words) all &= folded[i].contains(word) || (picked != null && picked.contains(word));
                if (all) found.add(entry);
            }
            return found;
        }
    }
}
