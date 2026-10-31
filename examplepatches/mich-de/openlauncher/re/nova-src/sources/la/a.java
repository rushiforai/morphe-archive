package la;

import android.database.sqlite.SQLiteDatabase;
import android.os.Binder;

/* loaded from: classes2.dex */
public final class a extends Binder implements AutoCloseable {

    /* renamed from: a, reason: collision with root package name */
    public final SQLiteDatabase f74803a;

    public a(SQLiteDatabase sQLiteDatabase) {
        this.f74803a = sQLiteDatabase;
        sQLiteDatabase.beginTransaction();
    }

    public final void a() {
        this.f74803a.setTransactionSuccessful();
    }

    public final SQLiteDatabase b() {
        return this.f74803a;
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.f74803a.endTransaction();
    }
}
