package app.hushmessenger.extension;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.BaseColumns;
import android.provider.MediaStore;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/** The files the message log saves: the two you pick a place for, and the monthly one its switch adds to. */
final class MessageLogExport {
    static final int TEXT = 1, CSV = 2;
    /** The shared Downloads folder, spelled the way MediaStore answers with it. */
    static final String FOLDER = "Download/Messenger/";
    /** Excel reads a file without this as the wrong encoding, and every accent and emoji comes out garbled. */
    private static final String BYTE_ORDER_MARK = String.valueOf((char) 0xFEFF);

    /** Where the switch's copies go. Tests swap it, since Robolectric has no shared storage. */
    interface Shelf {
        void add(Context context, String name, String mime, byte[] content) throws IOException;
    }

    static volatile Shelf shelf = new SharedDownloads();

    private MessageLogExport() {}

    /** The words a file uses that aren't the messages' own. */
    static final class Labels {
        final String unknownChat, unsent, noText;

        Labels(SettingsText text) {
            this(text.get("message_log_unknown_thread"), text.get("message_log_unsent"), text.get("message_log_no_text"));
        }

        Labels(String unknownChat, String unsent, String noText) {
            this.unknownChat = unknownChat;
            this.unsent = unsent;
            this.noText = noText;
        }
    }

    static String mime(int format) {
        return format == CSV ? "text/csv" : "text/plain";
    }

    /** What the file picker offers to call it. */
    static String fileName(int format, long now) {
        return "Messenger log " + new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date(now)) + (format == CSV ? ".csv" : ".txt");
    }

    /** The month's file, so a long stretch of expiring messages doesn't fill Downloads with one file per check. */
    static String monthlyName(long now) {
        return "Messenger log " + new SimpleDateFormat("yyyy-MM", Locale.US).format(new Date(now)) + ".txt";
    }

    private static String stamp(long time) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.US).format(new Date(time));
    }

    /** Each chat under its name, most recent chat first, and its messages in the order they came. */
    static String text(List<MessageLog.Entry> newestFirst, Labels labels) {
        List<MessageLog.Entry> oldestFirst = new ArrayList<>(newestFirst);
        Collections.reverse(oldestFirst);
        StringBuilder out = new StringBuilder();
        for (MessageLogSearch.Chat chat : MessageLogSearch.chats(newestFirst)) {
            if (out.length() > 0) out.append('\n');
            out.append("== ").append(chat.name.isEmpty() ? labels.unknownChat : chat.name).append(" ==\n\n");
            for (MessageLog.Entry entry : oldestFirst) {
                if (!entry.thread.equals(chat.thread)) continue;
                out.append(stamp(entry.time));
                if (!entry.sender.isEmpty()) out.append("  ").append(entry.sender);
                if (entry.unsent) out.append("  (").append(labels.unsent).append(')');
                out.append('\n').append(entry.text.isEmpty() ? labels.noText : entry.text).append("\n\n");
            }
        }
        return out.toString();
    }

    /** A row per message, oldest first, the way a spreadsheet expects to sort from. */
    static String csv(List<MessageLog.Entry> newestFirst, Labels labels) {
        Map<String, String> chats = new HashMap<>();
        for (MessageLogSearch.Chat chat : MessageLogSearch.chats(newestFirst)) {
            chats.put(chat.thread, chat.name.isEmpty() ? labels.unknownChat : chat.name);
        }
        StringBuilder out = new StringBuilder(BYTE_ORDER_MARK).append("Date,Chat,Sender,Message,Unsent\r\n");
        for (int i = newestFirst.size() - 1; i >= 0; i--) {
            MessageLog.Entry entry = newestFirst.get(i);
            out.append(stamp(entry.time)).append(',').append(cell(chats.get(entry.thread))).append(',').append(cell(entry.sender)).append(',')
                .append(cell(entry.text)).append(',').append(entry.unsent ? "yes" : "").append("\r\n");
        }
        return out.toString();
    }

    /**
     * One quoted cell. The words are other people's, and a spreadsheet runs a cell starting with one of these as a formula
     * (a link that sends the sheet somewhere, say), so those get the leading apostrophe spreadsheets read as "this is text".
     */
    static String cell(String value) {
        boolean formula = !value.isEmpty() && "=+-@\t\r".indexOf(value.charAt(0)) >= 0;
        return '"' + (formula ? "'" : "") + value.replace("\"", "\"\"") + '"';
    }

    /** Reads the log and writes what the open view shows into the document the picker returned. Returns how many. */
    static int save(Context context, Uri document, int format, String query, String thread, boolean unsentOnly, Labels labels) throws IOException {
        MessageLog.LoadResult log = MessageLog.loadResult();
        if (log.failed) throw new IOException("the log can't be read");
        List<MessageLog.Entry> shown = new MessageLogSearch.Index(log.entries).find(query, thread, unsentOnly);
        String content = format == CSV ? csv(shown, labels) : text(shown, labels);
        // The picker can hand back a file that already exists, and the old content must not show past the end of the new.
        try (OutputStream out = context.getContentResolver().openOutputStream(document, "wt")) {
            if (out == null) throw new IOException("no stream for the picked file");
            out.write(content.getBytes(StandardCharsets.UTF_8));
        }
        return shown.size();
    }

    /** Adds what the log is about to remove to the month's file. */
    static void saveExpiring(Context context, List<MessageLog.Entry> oldestFirst, long now) throws IOException {
        List<MessageLog.Entry> newestFirst = new ArrayList<>(oldestFirst);
        Collections.reverse(newestFirst);
        String content = text(newestFirst, new Labels(new SettingsText(context))) + "\n";
        shelf.add(context, monthlyName(now), mime(TEXT), content.getBytes(StandardCharsets.UTF_8));
    }

    /** Download/Messenger through MediaStore, which needs no storage permission from Android 10 on. */
    @android.annotation.TargetApi(29)
    static final class SharedDownloads implements Shelf {
        @Override public void add(Context context, String name, String mime, byte[] content) throws IOException {
            ContentResolver resolver = context.getContentResolver();
            Uri collection = MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY);
            // An app sees its own items without a permission. After a reinstall it doesn't, and the month starts a new file.
            try (Cursor rows = resolver.query(collection, new String[] {BaseColumns._ID},
                    MediaStore.MediaColumns.DISPLAY_NAME + " = ? AND " + MediaStore.MediaColumns.RELATIVE_PATH + " = ?",
                    new String[] {name, FOLDER}, null)) {
                if (rows != null && rows.moveToFirst()) {
                    try (OutputStream out = resolver.openOutputStream(ContentUris.withAppendedId(collection, rows.getLong(0)), "wa")) {
                        if (out == null) throw new IOException("no stream for the month's file");
                        out.write(content);
                    }
                    return;
                }
            }
            ContentValues values = new ContentValues();
            values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
            values.put(MediaStore.MediaColumns.MIME_TYPE, mime);
            values.put(MediaStore.MediaColumns.RELATIVE_PATH, FOLDER);
            values.put(MediaStore.MediaColumns.IS_PENDING, 1);
            Uri item = resolver.insert(collection, values);
            if (item == null) throw new IOException("MediaStore made no item");
            boolean done = false;
            try {
                try (OutputStream out = resolver.openOutputStream(item)) {
                    if (out == null) throw new IOException("no stream for the new file");
                    out.write(content);
                }
                values.clear();
                values.put(MediaStore.MediaColumns.IS_PENDING, 0);
                resolver.update(item, values, null, null);
                done = true;
            } finally {
                if (!done) resolver.delete(item, null, null);
            }
        }
    }
}
