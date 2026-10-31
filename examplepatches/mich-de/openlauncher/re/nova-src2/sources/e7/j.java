package e7;

import android.database.sqlite.SQLiteProgram;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class j implements d7.e {

    /* renamed from: a, reason: collision with root package name */
    public final SQLiteProgram f52239a;

    public j(SQLiteProgram delegate) {
        Intrinsics.g(delegate, "delegate");
        this.f52239a = delegate;
    }

    @Override // d7.e
    public final void bindBlob(int i5, byte[] value) {
        Intrinsics.g(value, "value");
        this.f52239a.bindBlob(i5, value);
    }

    @Override // d7.e
    public final void bindDouble(int i5, double d5) {
        this.f52239a.bindDouble(i5, d5);
    }

    @Override // d7.e
    public final void bindLong(int i5, long j11) {
        this.f52239a.bindLong(i5, j11);
    }

    @Override // d7.e
    public final void bindNull(int i5) {
        this.f52239a.bindNull(i5);
    }

    @Override // d7.e
    public final void bindString(int i5, String value) {
        Intrinsics.g(value, "value");
        this.f52239a.bindString(i5, value);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f52239a.close();
    }
}
