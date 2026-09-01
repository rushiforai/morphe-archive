package defpackage;

import android.database.sqlite.SQLiteProgram;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class g35 implements w2d {
    public final SQLiteProgram a;

    public g35(SQLiteProgram sQLiteProgram) {
        this.a = sQLiteProgram;
    }

    @Override // defpackage.w2d
    public final void c(int i, long j) {
        this.a.bindLong(i, j);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }

    @Override // defpackage.w2d
    public final void d(int i, byte[] bArr) {
        this.a.bindBlob(i, bArr);
    }

    @Override // defpackage.w2d
    public final void f0(double d, int i) {
        this.a.bindDouble(i, d);
    }

    @Override // defpackage.w2d
    public final void g(int i) {
        this.a.bindNull(i);
    }

    @Override // defpackage.w2d
    public final void l() {
        this.a.clearBindings();
    }

    @Override // defpackage.w2d
    public final void s(int i, String str) {
        str.getClass();
        this.a.bindString(i, str);
    }
}
