package android.database.sqlite;

import android.content.Context;

public abstract class SQLiteOpenHelper implements AutoCloseable {
    private final SQLiteDatabase db = new SQLiteDatabase();
    public SQLiteOpenHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {}
    public void setWriteAheadLoggingEnabled(boolean enabled) {}
    public SQLiteDatabase getWritableDatabase() { return db; }
    public SQLiteDatabase getReadableDatabase() { return db; }
    @Override public void close() {}
    public void onConfigure(SQLiteDatabase db) {}
    public abstract void onCreate(SQLiteDatabase db);
    public abstract void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion);
    public void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {}
    public void onOpen(SQLiteDatabase db) {}
}
