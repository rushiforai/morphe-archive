package defpackage;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import java.io.Closeable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z25 implements Closeable {
    public static final String[] b = {"", " OR ROLLBACK ", " OR ABORT ", " OR FAIL ", " OR IGNORE ", " OR REPLACE "};
    public static final String[] c = new String[0];
    public static final vq6 d;
    public static final vq6 e;
    public final SQLiteDatabase a;

    static {
        yw6 yw6Var = yw6.PUBLICATION;
        d = vx0.d0(yw6Var, new e73(11));
        e = vx0.d0(yw6Var, new e73(12));
    }

    public z25(SQLiteDatabase sQLiteDatabase) {
        this.a = sQLiteDatabase;
    }

    public final void B() {
        this.a.endTransaction();
    }

    public final void D(String str) {
        this.a.execSQL(str);
    }

    public final void I(Object[] objArr) {
        this.a.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", objArr);
    }

    public final void L() {
        this.a.setTransactionSuccessful();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }

    public final void f() {
        this.a.beginTransaction();
    }

    public final boolean isOpen() {
        return this.a.isOpen();
    }

    public final boolean k0() {
        return this.a.inTransaction();
    }

    public final void m() {
        this.a.beginTransactionNonExclusive();
    }

    public final h35 p(String str) {
        str.getClass();
        SQLiteStatement sQLiteStatementCompileStatement = this.a.compileStatement(str);
        sQLiteStatementCompileStatement.getClass();
        return new h35(sQLiteStatementCompileStatement);
    }
}
