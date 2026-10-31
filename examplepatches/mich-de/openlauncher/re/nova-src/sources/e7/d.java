package e7;

import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteCursor;
import android.database.sqlite.SQLiteCursorDriver;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteQuery;
import android.database.sqlite.SQLiteStatement;
import android.os.CancellationSignal;
import kotlin.jvm.internal.Intrinsics;
import x7.l;

/* loaded from: classes.dex */
public final class d implements d7.a {

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f52216b = {com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, " OR ROLLBACK ", " OR ABORT ", " OR FAIL ", " OR IGNORE ", " OR REPLACE "};

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f52217c = new String[0];

    /* renamed from: a, reason: collision with root package name */
    public final SQLiteDatabase f52218a;

    public d(SQLiteDatabase sQLiteDatabase) {
        this.f52218a = sQLiteDatabase;
    }

    @Override // d7.a
    public final void beginTransaction() {
        this.f52218a.beginTransaction();
    }

    @Override // d7.a
    public final void beginTransactionNonExclusive() {
        this.f52218a.beginTransactionNonExclusive();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f52218a.close();
    }

    @Override // d7.a
    public final d7.g compileStatement(String str) throws SQLException {
        SQLiteStatement sQLiteStatementCompileStatement = this.f52218a.compileStatement(str);
        Intrinsics.f(sQLiteStatementCompileStatement, "delegate.compileStatement(sql)");
        return new k(sQLiteStatementCompileStatement);
    }

    @Override // d7.a
    public final void endTransaction() {
        this.f52218a.endTransaction();
    }

    @Override // d7.a
    public final void execSQL(String sql) {
        Intrinsics.g(sql, "sql");
        this.f52218a.execSQL(sql);
    }

    @Override // d7.a
    public final boolean inTransaction() {
        return this.f52218a.inTransaction();
    }

    @Override // d7.a
    public final boolean isOpen() {
        return this.f52218a.isOpen();
    }

    @Override // d7.a
    public final boolean isWriteAheadLoggingEnabled() {
        SQLiteDatabase sQLiteDatabase = this.f52218a;
        Intrinsics.g(sQLiteDatabase, "sQLiteDatabase");
        return sQLiteDatabase.isWriteAheadLoggingEnabled();
    }

    @Override // d7.a
    public final Cursor query(String query) {
        Intrinsics.g(query, "query");
        return query(new l(query));
    }

    @Override // d7.a
    public final void setTransactionSuccessful() {
        this.f52218a.setTransactionSuccessful();
    }

    @Override // d7.a
    public final Cursor query(d7.f fVar) {
        final c cVar = new c(fVar);
        Cursor cursorRawQueryWithFactory = this.f52218a.rawQueryWithFactory(new SQLiteDatabase.CursorFactory() { // from class: e7.b
            @Override // android.database.sqlite.SQLiteDatabase.CursorFactory
            public final Cursor newCursor(SQLiteDatabase sQLiteDatabase, SQLiteCursorDriver sQLiteCursorDriver, String str, SQLiteQuery sQLiteQuery) {
                return (Cursor) cVar.invoke(sQLiteDatabase, sQLiteCursorDriver, str, sQLiteQuery);
            }
        }, fVar.a(), f52217c, null);
        Intrinsics.f(cursorRawQueryWithFactory, "delegate.rawQueryWithFac…EMPTY_STRING_ARRAY, null)");
        return cursorRawQueryWithFactory;
    }

    @Override // d7.a
    public final Cursor query(final d7.f fVar, CancellationSignal cancellationSignal) {
        String sql = fVar.a();
        SQLiteDatabase.CursorFactory cursorFactory = new SQLiteDatabase.CursorFactory() { // from class: e7.a
            @Override // android.database.sqlite.SQLiteDatabase.CursorFactory
            public final Cursor newCursor(SQLiteDatabase sQLiteDatabase, SQLiteCursorDriver sQLiteCursorDriver, String str, SQLiteQuery sQLiteQuery) {
                Intrinsics.d(sQLiteQuery);
                fVar.b(new j(sQLiteQuery));
                return new SQLiteCursor(sQLiteCursorDriver, str, sQLiteQuery);
            }
        };
        Intrinsics.g(sql, "sql");
        Cursor cursorRawQueryWithFactory = this.f52218a.rawQueryWithFactory(cursorFactory, sql, f52217c, null, cancellationSignal);
        Intrinsics.f(cursorRawQueryWithFactory, "sQLiteDatabase.rawQueryW…ationSignal\n            )");
        return cursorRawQueryWithFactory;
    }
}
