package com.sj010.gboardclipboard.extension;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Direct SQLite repository for Gboard's internal clipboard database.
 * Gboard stores clipboard entries in databases/gboard_clipboard.db -> table 'clips'.
 */
public final class GboardClipboardHistoryRepository {

    static final String TAG = "GboardClipboard";
    static final String DATABASE_NAME = "gboard_clipboard.db";
    static final String TABLE_CLIPS = "clips";

    public static final String COLUMN_ID = "_id";
    public static final String COLUMN_TEXT = "text";
    public static final String COLUMN_HTML_TEXT = "html_text";
    public static final String COLUMN_ITEM_TYPE = "item_type";
    public static final String COLUMN_ENTITY_TYPE = "entity_type";
    public static final String COLUMN_TIMESTAMP = "timestamp";
    public static final String COLUMN_SENSITIVE = "sensitive";
    public static final String COLUMN_URI = "uri";
    public static final String COLUMN_GROUP_ID = "group_id";

    public static final String[] ALL_COLUMNS = {
            COLUMN_ID,
            COLUMN_TEXT,
            COLUMN_HTML_TEXT,
            COLUMN_ITEM_TYPE,
            COLUMN_ENTITY_TYPE,
            COLUMN_TIMESTAMP,
            COLUMN_SENSITIVE,
            COLUMN_URI,
            COLUMN_GROUP_ID,
    };

    public static final int MAX_LIMIT = 500;

    private GboardClipboardHistoryRepository() {
    }

    public static final class ClipboardEntry {
        private final long id;
        private final String text;
        private final String htmlText;
        private final int itemType;
        private final int entityType;
        private final long timestamp;
        private final boolean sensitive;
        private final String uri;
        private final String groupId;

        ClipboardEntry(long id, String text, String htmlText, int itemType, int entityType,
                long timestamp, boolean sensitive, String uri, String groupId) {
            this.id = id;
            this.text = text;
            this.htmlText = htmlText;
            this.itemType = itemType;
            this.entityType = entityType;
            this.timestamp = timestamp;
            this.sensitive = sensitive;
            this.uri = uri;
            this.groupId = groupId;
        }

        public long getId() { return id; }
        public String getText() { return text; }
        public String getHtmlText() { return htmlText; }
        public int getItemType() { return itemType; }
        public int getEntityType() { return entityType; }
        public long getTimestamp() { return timestamp; }
        public boolean isSensitive() { return sensitive; }
        public String getUri() { return uri; }
        public String getGroupId() { return groupId; }

        public String getPasteableText() {
            if (text != null && !text.isEmpty()) {
                return text;
            }
            return htmlText != null ? htmlText : "";
        }
    }

    /**
     * A read of the history database: the entries that were asked for and the
     * total number of rows, from a single open of the database.
     */
    public static final class HistorySnapshot {
        private final List<ClipboardEntry> entries;
        private final int totalCount;
        private final boolean available;

        HistorySnapshot(List<ClipboardEntry> entries, int totalCount, boolean available) {
            this.entries = entries;
            this.totalCount = totalCount;
            this.available = available;
        }

        public List<ClipboardEntry> getEntries() {
            return entries;
        }

        public int getTotalCount() {
            return totalCount;
        }

        /**
         * False when the database could not be read at all. An empty history and
         * an unreadable database are different states for the caller.
         */
        public boolean isAvailable() {
            return available;
        }
    }

    /**
     * Reads the history and the total row count from one open of the database.
     *
     * @param limit the maximum number of entries to return, {@code 0} for none.
     */
    public static HistorySnapshot loadSnapshot(Context context, boolean includeSensitive, int limit) {
        if (context == null) {
            return new HistorySnapshot(Collections.emptyList(), 0, false);
        }
        if (!clipboardDatabaseExists(context)) {
            // Gboard creates the database when it captures the first clip. Until
            // then there is nothing to read, which is not a read failure.
            return new HistorySnapshot(Collections.emptyList(), 0, true);
        }
        SQLiteDatabase database = openForReading(context);
        if (database == null) {
            return new HistorySnapshot(Collections.emptyList(), 0, false);
        }

        try {
            Set<String> availableColumns = resolveAvailableColumns(database);
            String selection = buildSelection(includeSensitive, availableColumns);
            int effectiveLimit = limit <= 0 ? 0 : Math.min(limit, MAX_LIMIT);
            List<ClipboardEntry> entries = effectiveLimit == 0
                    ? Collections.emptyList()
                    : readEntries(database, selection, availableColumns, effectiveLimit);
            int totalCount = countEntries(database, selection);
            return new HistorySnapshot(entries, totalCount, true);
        } catch (Throwable t) {
            Log.w(TAG, "Failed reading clipboard history", t);
            return new HistorySnapshot(Collections.emptyList(), 0, false);
        } finally {
            closeQuietly(database);
        }
    }

    public static List<ClipboardEntry> loadHistory(Context context, boolean includeSensitive, int limit) {
        return loadSnapshot(context, includeSensitive, limit).getEntries();
    }

    private static List<ClipboardEntry> readEntries(SQLiteDatabase database, String selection,
            Set<String> availableColumns, int limit) {
        String[] projection = resolveProjection(availableColumns);
        if (projection.length == 0) {
            return Collections.emptyList();
        }
        List<ClipboardEntry> entries = new ArrayList<>();
        Cursor cursor = database.query(TABLE_CLIPS, projection, selection, null, null, null,
                COLUMN_TIMESTAMP + " DESC, " + COLUMN_ID + " DESC",
                String.valueOf(limit));
        if (cursor == null) {
            return Collections.emptyList();
        }
        try {
            while (cursor.moveToNext()) {
                ClipboardEntry entry = readEntry(cursor, availableColumns);
                if (entry != null) {
                    entries.add(entry);
                }
            }
        } finally {
            cursor.close();
        }
        return Collections.unmodifiableList(entries);
    }

    private static int countEntries(SQLiteDatabase database, String selection) {
        Cursor cursor = database.query(TABLE_CLIPS, new String[]{COLUMN_ID}, selection, null,
                null, null, null, null);
        if (cursor == null) {
            return 0;
        }
        try {
            return cursor.getCount();
        } finally {
            cursor.close();
        }
    }

    /**
     * The filter that hides the sensitive entries, or null when nothing has to
     * be filtered.
     */
    private static String buildSelection(boolean includeSensitive, Set<String> availableColumns) {
        if (includeSensitive || !availableColumns.contains(COLUMN_SENSITIVE)) {
            return null;
        }
        return COLUMN_SENSITIVE + " = 0";
    }

    public static long insertClipIfAbsent(Context context, String text, long timestamp,
            boolean sensitive, int recentLimit) {
        if (context == null || text == null || text.isEmpty()) {
            return -1L;
        }
        SQLiteDatabase database = openClipboardDatabase(context, true);
        if (database == null) {
            return -1L;
        }
        try {
            Set<String> availableColumns = resolveAvailableColumns(database);
            if (!availableColumns.contains(COLUMN_TEXT)) {
                return -1L;
            }
            if (containsRecentText(database, text, recentLimit)) {
                return 0L;
            }
            return insertRow(database, availableColumns, text, timestamp, sensitive);
        } catch (Throwable t) {
            Log.w(TAG, "Failed inserting absent clipboard entry", t);
            return -1L;
        } finally {
            closeQuietly(database);
        }
    }

    private static boolean containsRecentText(SQLiteDatabase database, String text, int limit) {
        if (limit <= 0) {
            return false;
        }
        Cursor cursor = null;
        try {
            cursor = database.query(TABLE_CLIPS, new String[]{COLUMN_TEXT}, null, null, null, null,
                    COLUMN_TIMESTAMP + " DESC, " + COLUMN_ID + " DESC", String.valueOf(limit));
            if (cursor == null) {
                return false;
            }
            int textIndex = cursor.getColumnIndex(COLUMN_TEXT);
            while (cursor.moveToNext()) {
                if (textIndex < 0 || cursor.isNull(textIndex)) {
                    continue;
                }
                if (text.equals(cursor.getString(textIndex))) {
                    return true;
                }
            }
            return false;
        } catch (Throwable t) {
            Log.w(TAG, "Failed checking recent clips", t);
            return false;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    private static long insertRow(SQLiteDatabase database, Set<String> availableColumns,
            String text, long timestamp, boolean sensitive) {
        if (!availableColumns.contains(COLUMN_TEXT)) {
            return -1L;
        }
        ContentValues values = new ContentValues();
        if (availableColumns.contains(COLUMN_ID)) {
            values.put(COLUMN_ID, resolveNextRowId(database, timestamp));
        }
        values.put(COLUMN_TEXT, text);
        if (availableColumns.contains(COLUMN_HTML_TEXT)) {
            values.putNull(COLUMN_HTML_TEXT);
        }
        if (availableColumns.contains(COLUMN_ITEM_TYPE)) {
            values.put(COLUMN_ITEM_TYPE, 0);
        }
        if (availableColumns.contains(COLUMN_ENTITY_TYPE)) {
            values.put(COLUMN_ENTITY_TYPE, 0);
        }
        if (availableColumns.contains(COLUMN_TIMESTAMP)) {
            values.put(COLUMN_TIMESTAMP, timestamp);
        }
        if (availableColumns.contains(COLUMN_SENSITIVE)) {
            values.put(COLUMN_SENSITIVE, sensitive ? 1 : 0);
        }
        if (availableColumns.contains(COLUMN_URI)) {
            values.putNull(COLUMN_URI);
        }
        if (availableColumns.contains(COLUMN_GROUP_ID)) {
            values.putNull(COLUMN_GROUP_ID);
        }
        // CONFLICT_ABORT, not CONFLICT_REPLACE. A row id collision with a row
        // that Gboard wrote itself must fail this insert. Replacing it would
        // delete Gboard's own entry from the history database.
        return database.insertWithOnConflict(TABLE_CLIPS, null, values, SQLiteDatabase.CONFLICT_ABORT);
    }

    private static long resolveNextRowId(SQLiteDatabase database, long timestamp) {
        long candidate = timestamp > 0L ? timestamp : System.currentTimeMillis();
        long highest = 0L;
        Cursor cursor = null;
        try {
            cursor = database.rawQuery("SELECT MAX(" + COLUMN_ID + ") FROM " + TABLE_CLIPS, null);
            if (cursor != null && cursor.moveToFirst()) {
                highest = cursor.getLong(0);
            }
        } catch (Throwable t) {
            Log.d(TAG, "Failed reading highest clipboard row id", t);
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        if (candidate <= highest) {
            candidate = highest + 1L;
        }
        return candidate;
    }

    public static boolean clearHistory(Context context) {
        if (context == null) {
            return false;
        }
        SQLiteDatabase database = openClipboardDatabase(context, true);
        if (database == null) {
            return false;
        }
        try {
            database.delete(TABLE_CLIPS, null, null);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "Failed clearing clipboard history", t);
            return false;
        } finally {
            closeQuietly(database);
        }
    }

    /**
     * True when Gboard has already created its clipboard database. The database
     * only appears once the keyboard captured the first clip.
     */
    private static boolean clipboardDatabaseExists(Context context) {
        File databaseFile = context.getDatabasePath(DATABASE_NAME);
        return databaseFile != null && databaseFile.exists();
    }

    /**
     * Opens the clipboard database for reading. The read only open is tried first
     * because it never writes a journal file, and the read write open is the
     * fallback for a database the system locked down.
     */
    private static SQLiteDatabase openForReading(Context context) {
        SQLiteDatabase database = openClipboardDatabase(context, false);
        return database != null ? database : openClipboardDatabase(context, true);
    }

    private static SQLiteDatabase openClipboardDatabase(Context context, boolean writable) {
        File databaseFile = context.getDatabasePath(DATABASE_NAME);
        if (databaseFile == null || !databaseFile.exists()) {
            return null;
        }
        String path = databaseFile.getAbsolutePath();
        if (!writable) {
            try {
                return SQLiteDatabase.openDatabase(path, null, SQLiteDatabase.OPEN_READONLY);
            } catch (Throwable ignored) {
            }
        }
        return SQLiteDatabase.openDatabase(path, null, SQLiteDatabase.OPEN_READWRITE);
    }

    private static Set<String> resolveAvailableColumns(SQLiteDatabase database) {
        Set<String> columns = new HashSet<>();
        Cursor cursor = null;
        try {
            cursor = database.rawQuery("PRAGMA table_info(" + TABLE_CLIPS + ")", null);
            if (cursor != null) {
                int nameIndex = cursor.getColumnIndex("name");
                while (cursor.moveToNext()) {
                    if (nameIndex >= 0) {
                        columns.add(cursor.getString(nameIndex));
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Failed resolving clipboard schema", t);
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
        return columns;
    }

    private static String[] resolveProjection(Set<String> availableColumns) {
        List<String> list = new ArrayList<>();
        for (String col : ALL_COLUMNS) {
            if (availableColumns.contains(col)) {
                list.add(col);
            }
        }
        return list.toArray(new String[0]);
    }

    private static ClipboardEntry readEntry(Cursor cursor, Set<String> availableColumns) {
        long id = getLong(cursor, COLUMN_ID, availableColumns, 0L);
        String text = getString(cursor, COLUMN_TEXT, availableColumns, null);
        String htmlText = getString(cursor, COLUMN_HTML_TEXT, availableColumns, null);
        int itemType = getInt(cursor, COLUMN_ITEM_TYPE, availableColumns, 0);
        int entityType = getInt(cursor, COLUMN_ENTITY_TYPE, availableColumns, 0);
        long timestamp = getLong(cursor, COLUMN_TIMESTAMP, availableColumns, 0L);
        boolean sensitive = getInt(cursor, COLUMN_SENSITIVE, availableColumns, 0) != 0;
        String uri = getString(cursor, COLUMN_URI, availableColumns, null);
        String groupId = getString(cursor, COLUMN_GROUP_ID, availableColumns, null);

        return new ClipboardEntry(id, text, htmlText, itemType, entityType, timestamp, sensitive, uri, groupId);
    }

    private interface ColumnReader<T> {
        T read(Cursor cursor, int index);
    }

    /**
     * Reads one column, falling back when the column does not exist in this
     * schema or holds a null.
     */
    private static <T> T readColumn(Cursor cursor, String col, Set<String> available,
            T fallback, ColumnReader<T> reader) {
        if (!available.contains(col)) {
            return fallback;
        }
        int index = cursor.getColumnIndex(col);
        if (index < 0 || cursor.isNull(index)) {
            return fallback;
        }
        return reader.read(cursor, index);
    }

    private static String getString(Cursor cursor, String col, Set<String> available, String def) {
        return readColumn(cursor, col, available, def, (c, i) -> c.getString(i));
    }

    private static int getInt(Cursor cursor, String col, Set<String> available, int def) {
        return readColumn(cursor, col, available, def, (c, i) -> c.getInt(i));
    }

    private static long getLong(Cursor cursor, String col, Set<String> available, long def) {
        return readColumn(cursor, col, available, def, (c, i) -> c.getLong(i));
    }

    private static void closeQuietly(SQLiteDatabase database) {
        if (database != null) {
            try {
                database.close();
            } catch (Throwable ignored) {
            }
        }
    }
}
