package io.branch.search.internal;

import android.database.SQLException;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.vb, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3420vb extends Lambda implements Function1<C3336qb, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f66186a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3420vb(long j11) {
        super(1);
        this.f66186a = j11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) throws SQLException {
        C3336qb inWriteTransaction = (C3336qb) obj;
        Intrinsics.g(inWriteTransaction, "$this$inWriteTransaction");
        inWriteTransaction.f65567a.n().f63082a.getWritableDatabase().execSQL("DELETE FROM local_packages WHERE user_id=?", new Object[]{Long.valueOf(this.f66186a)});
        inWriteTransaction.f65567a.m().f62841a.getWritableDatabase().execSQL("DELETE FROM local_entities WHERE user_id=?", new Object[]{Long.valueOf(this.f66186a)});
        return Unit.f71706a;
    }
}
