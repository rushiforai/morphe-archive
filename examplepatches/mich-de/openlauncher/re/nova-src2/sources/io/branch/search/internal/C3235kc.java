package io.branch.search.internal;

import android.app.ActivityManager;
import android.content.Context;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.requery.android.database.sqlite.SQLiteOpenHelper;
import io.branch.search.internal.V4;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.kc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3235kc extends SQLiteOpenHelper {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f64928a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f64929b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Function1<InterfaceC3365s7, Unit> f64930c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Function3<InterfaceC3365s7, Integer, Integer, Unit> f64931d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3235kc(Context context, int i5, V4.a aVar, V4.b bVar, String str) {
        super(context, str, null, 11);
        this.f64928a = context;
        this.f64929b = i5;
        this.f64930c = aVar;
        this.f64931d = bVar;
    }

    @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
    public final void onConfigure(@NotNull SQLiteDatabase db2) {
        Intrinsics.g(db2, "db");
        db2.enableWriteAheadLogging();
        db2.setMaxSqlCacheSize(this.f64929b);
        if (((ActivityManager) this.f64928a.getSystemService(ActivityManager.class)).isLowRamDevice()) {
            db2.query("PRAGMA soft_heap_limit = 2097152").close();
        }
    }

    @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(@NotNull SQLiteDatabase db2) {
        Intrinsics.g(db2, "db");
        this.f64930c.invoke(new C3178h5(db2));
    }

    @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(@NotNull SQLiteDatabase db2, int i5, int i11) {
        Intrinsics.g(db2, "db");
        this.f64931d.invoke(new C3178h5(db2), Integer.valueOf(i5), Integer.valueOf(i11));
    }
}
