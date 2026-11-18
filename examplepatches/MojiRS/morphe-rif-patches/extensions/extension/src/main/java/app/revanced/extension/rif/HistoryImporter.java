package app.revanced.extension.rif;

import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;

import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * Merges the history of an exported browserhistory.db into rif's history.
 * <p>
 * Based on Arnaumes' "Import history" patch (github.com/Arnaumes/revanced-rif-import-history), GPL-3.0.
 * <p>
 * A history item is identified by its URI, like rif does when it records a visit. Items whose URI is already in
 * the local history are skipped and left exactly as they are; nothing is ever deleted or updated. New items keep
 * all their exported values (referer, last access time, access count and thread id).
 * <p>
 * The backup is read through its own database connection, never attached to rif's: if the backup is damaged,
 * Android's corruption handling then only ever deletes the temporary copy of the backup, not rif's history.
 */
final class HistoryImporter {
    interface ProgressListener {
        void onProgress(int processed, int total);
    }

    /** The database isn't a usable rif history: no history table, not SQLite, or damaged. */
    static final class NotAHistoryDatabaseException extends Exception {
        NotAHistoryDatabaseException(String message) {
            super(message);
        }

        NotAHistoryDatabaseException(String message, Throwable cause) {
            super(message, cause);
        }
    }

    static final class Result {
        /** Items added to the local history. */
        final int imported;
        /** Items skipped because their URI was already in the local history. */
        final int alreadyPresent;
        /** Extra copies of a URI within the backup itself, skipped (the most recently accessed copy counts). */
        final int duplicates;

        Result(int imported, int alreadyPresent, int duplicates) {
            this.imported = imported;
            this.alreadyPresent = alreadyPresent;
            this.duplicates = duplicates;
        }
    }

    private static final String TABLE = HistoryDatabase.TABLE;
    private static final String VALID_URI = "typeof(uri) = 'text' AND uri <> ''";
    private static final int STEP = 500;

    private HistoryImporter() {
    }

    /**
     * Adds the items of {@code source} whose URI isn't in {@code target} yet.
     * <p>
     * Runs in a transaction, so a failure normally leaves the local history unchanged. Every few hundred items it
     * steps aside if rif is waiting for its database (committing what it has added so far), so rif never stalls
     * during a long import. Either way, merging the same backup again only adds what is still missing.
     */
    static Result merge(SQLiteDatabase source, SQLiteDatabase target, ProgressListener listener)
            throws NotAHistoryDatabaseException {
        Set<String> columns;
        int total;
        try {
            String check = DatabaseUtils.stringForQuery(source, "PRAGMA quick_check", null);
            if (!"ok".equalsIgnoreCase(check)) throw new NotAHistoryDatabaseException("Damaged database: " + check);
            columns = columns(source);
            if (!columns.contains("uri")) {
                throw new NotAHistoryDatabaseException("No " + TABLE + " table with a uri column");
            }
            total = (int) DatabaseUtils.longForQuery(source, "SELECT COUNT(*) FROM " + TABLE + " WHERE " + VALID_URI, null);
        } catch (SQLiteException e) {
            throw new NotAHistoryDatabaseException("Not a readable SQLite database", e);
        }
        listener.onProgress(0, total);

        // Values for columns an export might lack, matching what rif's UriHistoryProvider stores by default.
        // Sorting by URI puts the copies of a URI next to each other, the most recently accessed first.
        String select = "SELECT uri, "
                + column(columns, "referer", "''") + ", "
                + column(columns, "accessed", String.valueOf(System.currentTimeMillis())) + ", "
                + column(columns, "access_count", "1") + ", "
                + column(columns, "thread_id", "''")
                + " FROM " + TABLE + " WHERE " + VALID_URI
                + " ORDER BY uri" + (columns.contains("accessed") ? ", accessed DESC" : "");

        int processed = 0;
        int imported = 0;
        int alreadyPresent = 0;
        int duplicates = 0;
        SQLiteStatement exists = null;
        SQLiteStatement insert = null;
        target.beginTransaction();
        try {
            exists = target.compileStatement("SELECT EXISTS (SELECT 1 FROM " + TABLE + " WHERE uri = ?)");
            insert = target.compileStatement(
                    "INSERT INTO " + TABLE + " (uri, referer, accessed, access_count, thread_id) VALUES (?, ?, ?, ?, ?)");

            Cursor rows = source.rawQuery(select, null);
            try {
                String previousUri = null;
                while (rows.moveToNext()) {
                    String uri = rows.getString(0);
                    if (uri.equals(previousUri)) {
                        duplicates++;
                    } else {
                        exists.bindString(1, uri);
                        if (exists.simpleQueryForLong() != 0) {
                            alreadyPresent++;
                        } else {
                            insert.clearBindings();
                            for (int column = 0; column < 5; column++) bind(insert, column + 1, rows, column);
                            insert.executeInsert();
                            imported++;
                        }
                    }
                    previousUri = uri;

                    if (++processed % STEP == 0) {
                        target.yieldIfContendedSafely();
                        listener.onProgress(processed, total);
                    }
                }
            } finally {
                rows.close();
            }
            target.setTransactionSuccessful();
        } finally {
            target.endTransaction();
            if (exists != null) exists.close();
            if (insert != null) insert.close();
        }

        listener.onProgress(total, total);
        return new Result(imported, alreadyPresent, duplicates);
    }

    /** The history table's column names, lower case (SQLite column names are case-insensitive). */
    private static Set<String> columns(SQLiteDatabase database) {
        Set<String> columns = new HashSet<>();
        Cursor cursor = database.rawQuery("PRAGMA table_info(" + TABLE + ")", null);
        try {
            int name = cursor.getColumnIndexOrThrow("name");
            while (cursor.moveToNext()) columns.add(cursor.getString(name).toLowerCase(Locale.ROOT));
        } finally {
            cursor.close();
        }
        return columns;
    }

    private static String column(Set<String> columns, String name, String defaultValue) {
        return columns.contains(name) ? name : defaultValue + " AS " + name;
    }

    /** Copies a value with its SQLite type, so NULLs and numbers stay exactly as exported. */
    private static void bind(SQLiteStatement statement, int index, Cursor cursor, int column) {
        switch (cursor.getType(column)) {
            case Cursor.FIELD_TYPE_NULL:
                statement.bindNull(index);
                break;
            case Cursor.FIELD_TYPE_INTEGER:
                statement.bindLong(index, cursor.getLong(column));
                break;
            case Cursor.FIELD_TYPE_FLOAT:
                statement.bindDouble(index, cursor.getDouble(column));
                break;
            case Cursor.FIELD_TYPE_BLOB:
                statement.bindBlob(index, cursor.getBlob(column));
                break;
            default:
                statement.bindString(index, cursor.getString(column));
                break;
        }
    }
}
