package io.branch.search.internal;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.requery.android.database.sqlite.SQLiteStatement;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.h5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3178h5 implements InterfaceC3365s7 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SQLiteDatabase f64647a;

    public C3178h5(@NotNull SQLiteDatabase database) {
        Intrinsics.g(database, "database");
        this.f64647a = database;
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    public final void a(@NotNull String query, boolean z11) throws SQLException {
        Intrinsics.g(query, "query");
        this.f64647a.execSQL(query, z11);
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    @NotNull
    public final C3457xe compileStatement(@NotNull String sql) throws SQLException {
        Intrinsics.g(sql, "sql");
        SQLiteStatement sQLiteStatementCompileStatement = this.f64647a.compileStatement(sql);
        Intrinsics.f(sQLiteStatementCompileStatement, "database.compileStatement(sql)");
        return new C3457xe(sQLiteStatementCompileStatement);
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    public final void execSQL(@NotNull String query) throws SQLException {
        Intrinsics.g(query, "query");
        this.f64647a.execSQL(query, false);
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    public final long insert(@NotNull String table, int i5, @NotNull ContentValues content) {
        Intrinsics.g(table, "table");
        Intrinsics.g(content, "content");
        return this.f64647a.insert(table, i5, content);
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    public final void a(@NotNull String query, @NotNull String[] params) throws SQLException {
        Intrinsics.g(query, "query");
        Intrinsics.g(params, "params");
        a(query, params, false);
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    public final void execSQL(@NotNull String query, @NotNull Object[] params) throws SQLException {
        Intrinsics.g(query, "query");
        Intrinsics.g(params, "params");
        this.f64647a.execSQL(query, params, false);
    }

    public final void a(@NotNull String query, @NotNull String[] params, boolean z11) throws SQLException {
        Intrinsics.g(query, "query");
        Intrinsics.g(params, "params");
        this.f64647a.execSQL(query, params, z11);
    }

    @NotNull
    public final Cursor a() {
        Cursor cursorQuery = this.f64647a.query("SELECT * FROM sqlite_master");
        Intrinsics.f(cursorQuery, "database.query(query)");
        return cursorQuery;
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    @NotNull
    public final Cursor a(@NotNull String query, @NotNull Object[] strings, @NotNull w4.d cancellationSignal) {
        Intrinsics.g(query, "query");
        Intrinsics.g(strings, "strings");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        Cursor cursorRawQuery = this.f64647a.rawQuery(query, strings, cancellationSignal);
        Intrinsics.f(cursorRawQuery, "database.rawQuery(query,…ings, cancellationSignal)");
        return cursorRawQuery;
    }

    @Override // io.branch.search.internal.InterfaceC3365s7
    @NotNull
    public final Cursor a(@NotNull String query, @NotNull String[] strings, @NotNull w4.d cancellationSignal) {
        Intrinsics.g(query, "query");
        Intrinsics.g(strings, "strings");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        Cursor cursorRawQuery = this.f64647a.rawQuery(query, strings, cancellationSignal);
        Intrinsics.f(cursorRawQuery, "database.rawQuery(query,…ings, cancellationSignal)");
        return cursorRawQuery;
    }

    public final void a(@NotNull String table, @NotNull ContentValues values, @NotNull String whereClause, @NotNull Object[] whereArgs) {
        Intrinsics.g(table, "table");
        Intrinsics.g(values, "values");
        Intrinsics.g(whereClause, "whereClause");
        Intrinsics.g(whereArgs, "whereArgs");
        this.f64647a.update(table, 5, values, whereClause, whereArgs);
    }
}
