package io.branch.search.internal;

import android.content.ContentValues;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.ub, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3403ub extends Lambda implements Function1<C3336qb, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f66021a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f66022b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3403ub(String str, long j11) {
        super(1);
        this.f66021a = str;
        this.f66022b = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        C3336qb inWriteTransaction = (C3336qb) obj;
        Intrinsics.g(inWriteTransaction, "$this$inWriteTransaction");
        C3130e8 c3130e8K = inWriteTransaction.f65567a.k();
        String str = this.f66021a;
        long j11 = this.f66022b;
        C3178h5 writableDatabase = c3130e8K.f64372a.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("should_retry", (Integer) 1);
        Unit unit = Unit.f71706a;
        writableDatabase.a("invalid_links", contentValues, "app_store_id =? AND user_id=?", new Object[]{str, Long.valueOf(j11)});
        return unit;
    }
}
