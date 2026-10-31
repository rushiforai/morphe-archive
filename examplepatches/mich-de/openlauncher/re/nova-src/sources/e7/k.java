package e7;

import android.database.sqlite.SQLiteStatement;

/* loaded from: classes.dex */
public final class k extends j implements d7.g {

    /* renamed from: b, reason: collision with root package name */
    public final SQLiteStatement f52240b;

    public k(SQLiteStatement sQLiteStatement) {
        super(sQLiteStatement);
        this.f52240b = sQLiteStatement;
    }

    @Override // d7.g
    public final long executeInsert() {
        return this.f52240b.executeInsert();
    }

    @Override // d7.g
    public final int executeUpdateDelete() {
        return this.f52240b.executeUpdateDelete();
    }
}
