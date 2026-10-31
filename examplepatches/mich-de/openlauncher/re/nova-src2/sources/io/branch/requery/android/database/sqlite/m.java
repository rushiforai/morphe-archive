package io.branch.requery.android.database.sqlite;

import android.os.CancellationSignal;

/* loaded from: classes4.dex */
public final class m implements CancellationSignal.OnCancelListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w4.d f61854a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ SQLiteDatabase f61855b;

    public m(SQLiteDatabase sQLiteDatabase, w4.d dVar) {
        this.f61855b = sQLiteDatabase;
        this.f61854a = dVar;
    }

    @Override // android.os.CancellationSignal.OnCancelListener
    public final void onCancel() {
        this.f61854a.a();
    }
}
