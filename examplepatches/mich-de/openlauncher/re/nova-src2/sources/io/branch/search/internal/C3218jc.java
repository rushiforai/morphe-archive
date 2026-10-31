package io.branch.search.internal;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.requery.android.database.sqlite.SQLiteOpenHelper;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.jc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3218jc implements InterfaceC3076b5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SQLiteOpenHelper f64898a;

    public C3218jc(@NotNull C3235kc mHelper) {
        Intrinsics.g(mHelper, "mHelper");
        this.f64898a = mHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3076b5
    public final void close() {
        this.f64898a.close();
    }

    @Override // io.branch.search.internal.InterfaceC3076b5
    @NotNull
    public final C3178h5 getReadableDatabase() {
        SQLiteDatabase readableDatabase = this.f64898a.getReadableDatabase();
        Intrinsics.f(readableDatabase, "mHelper.readableDatabase");
        return new C3178h5(readableDatabase);
    }

    @Override // io.branch.search.internal.InterfaceC3076b5
    @NotNull
    public final C3178h5 getWritableDatabase() {
        SQLiteDatabase writableDatabase = this.f64898a.getWritableDatabase();
        Intrinsics.f(writableDatabase, "mHelper.writableDatabase");
        return new C3178h5(writableDatabase);
    }

    @Override // io.branch.search.internal.InterfaceC3076b5
    public final void setMaxSqlCacheSize(int i5) {
        this.f64898a.getReadableDatabase().setMaxSqlCacheSize(i5);
    }
}
