package android.database.sqlite;

import android.content.ContentValues;

public final class SQLiteDatabase implements AutoCloseable {
    public interface CursorFactory {}
    public static final int CONFLICT_REPLACE = 5;

    public int update(String table, ContentValues values, String whereClause, String[] whereArgs) { return 1; }
    public long insert(String table, String nullColumnHack, ContentValues values) { return 1L; }
    public long insertWithOnConflict(String table, String nullColumnHack, ContentValues initialValues, int conflictAlgorithm) { return 1L; }
    public long replace(String table, String nullColumnHack, ContentValues initialValues) { return 1L; }
    public int delete(String table, String whereClause, String[] whereArgs) { return 0; }
    public void execSQL(String sql) {}
    public void execSQL(String sql, Object[] bindArgs) {}
    public void beginTransaction() {}
    public void beginTransactionNonExclusive() {}
    public void setTransactionSuccessful() {}
    public void endTransaction() {}
    public boolean inTransaction() { return false; }
    public boolean isOpen() { return true; }
    @Override public void close() {}
}
