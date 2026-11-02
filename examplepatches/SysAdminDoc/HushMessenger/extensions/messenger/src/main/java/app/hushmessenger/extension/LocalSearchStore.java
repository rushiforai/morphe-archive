package app.hushmessenger.extension;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Reads one chat's saved messages out of Messenger's own database (#92). It opens the file read-only and never writes
 * it. Each search reads the file as it is now, so nothing is copied, kept, or left behind for another account.
 */
final class LocalSearchStore {
    static final int PAGE = 1000;
    static final int MAX_HITS = 200;
    private static final String DATABASE = "msys_database_";
    private static final String CURRENT_ACCOUNT = "threads_db2-uid";

    static final class Hit {
        final String messageId, text, sender;
        final long time;

        Hit(String messageId, String text, String sender, long time) {
            this.messageId = messageId;
            this.text = text;
            this.sender = sender;
            this.time = time;
        }
    }

    static final class Result {
        final List<Hit> hits = new ArrayList<>();
        /** How many messages with words in them were read, and the oldest one's time, or 0 for none. */
        int searched;
        long oldest;
        boolean stopped;
        boolean full;
    }

    private LocalSearchStore() {}

    /** The current account's database in Messenger's databases folder, or null when it can't tell which one that is. */
    static File database(File folder) {
        String account = account(folder);
        if (account != null) {
            File current = new File(folder, DATABASE + account);
            if (current.isFile()) return current;
        }
        File[] files = folder.listFiles((dir, name) -> name.startsWith(DATABASE) && !name.contains("-"));
        return files != null && files.length == 1 ? files[0] : null;
    }

    /** The current account's id, or null when it can't tell which one that is. */
    static String currentUser(File folder) {
        File current = database(folder);
        return current == null ? null : current.getName().substring(DATABASE.length());
    }

    private static String account(File folder) {
        try {
            String id = new String(Files.readAllBytes(new File(folder, CURRENT_ACCOUNT).toPath()), StandardCharsets.UTF_8).trim();
            return id.matches("\\d+") ? id : null;
        } catch (java.io.IOException | RuntimeException error) {
            return null;
        }
    }

    /** The database's number for a chat out of the chat's key text, like ONE_TO_ONE:123:456, or -1 when there is none. */
    static long chatNumber(String key) {
        if (key == null) return -1;
        String[] parts = key.split(":");
        if (parts.length < 2) return -1;
        try {
            return Long.parseLong(parts[1]);
        } catch (NumberFormatException notNumber) {
            return -1;
        }
    }

    /** Lower case without accents, so a plain "cafe" finds the word with its accent too. */
    static String fold(String text) {
        return Normalizer.normalize(text, Normalizer.Form.NFD).replaceAll("\\p{M}+", "").toLowerCase(Locale.ROOT);
    }

    /** Every word of the search, in any order. No words finds nothing. */
    static boolean matches(String foldedText, String[] foldedWords) {
        if (foldedWords.length == 0) return false;
        for (String word : foldedWords) if (!foldedText.contains(word)) return false;
        return true;
    }

    static String[] words(String search) {
        String folded = search == null ? "" : fold(search).trim();
        return folded.isEmpty() ? new String[0] : folded.split("\\s+");
    }

    /** Newest first, a page at a time off the screen's thread, until the chat ends, it's stopped, or the hits are full. */
    static Result search(SQLiteDatabase database, long chat, String search, AtomicBoolean stop) {
        Result result = new Result();
        String[] words = words(search);
        if (words.length == 0) return result;
        Map<Long, String> names = new HashMap<>();
        long time = Long.MAX_VALUE;
        String id = "";
        while (true) {
            if (stop.get()) {
                result.stopped = true;
                return result;
            }
            int read = 0;
            try (Cursor rows = database.rawQuery(
                "SELECT message_id, text, timestamp_ms, sender_id FROM messages WHERE thread_key = ? AND text IS NOT NULL"
                    + " AND is_unsent = 0 AND is_admin_message = 0 AND (timestamp_ms < ? OR (timestamp_ms = ? AND message_id < ?))"
                    + " ORDER BY timestamp_ms DESC, message_id DESC LIMIT " + PAGE,
                new String[] {Long.toString(chat), Long.toString(time), Long.toString(time), id})) {
                while (rows.moveToNext()) {
                    read++;
                    id = rows.getString(0);
                    String text = rows.getString(1);
                    time = rows.getLong(2);
                    result.searched++;
                    result.oldest = time;
                    if (!matches(fold(text), words)) continue;
                    result.hits.add(new Hit(id, text, name(database, rows.getLong(3), names), time));
                    if (result.hits.size() >= MAX_HITS) {
                        result.full = true;
                        return result;
                    }
                }
            }
            if (read < PAGE) return result;
        }
    }

    /** The sender's name when Messenger has it. Everything else about a hit still works without one. */
    private static String name(SQLiteDatabase database, long sender, Map<Long, String> names) {
        if (names.containsKey(sender)) return names.get(sender);
        String name = null;
        try (Cursor rows = database.rawQuery("SELECT name FROM contacts WHERE id = ? LIMIT 1", new String[] {Long.toString(sender)})) {
            if (rows.moveToFirst()) name = rows.getString(0);
        } catch (SQLiteException noNames) {
            name = null;
        }
        names.put(sender, name);
        return name;
    }
}
