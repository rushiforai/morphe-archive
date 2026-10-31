package com.google.android.gms.internal.measurement;

import java.util.Objects;

/* loaded from: classes.dex */
public final class t7 extends d8 {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ i8 f33080e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t7(i8 i8Var) {
        super(i8Var, true);
        Objects.requireNonNull(i8Var);
        this.f33080e = i8Var;
    }

    @Override // com.google.android.gms.internal.measurement.d8
    public final void a() {
        i8 i8Var = this.f33080e;
        boolean zJ = i8Var.j();
        long j11 = this.f32460a;
        if (zJ) {
            d7 d7VarL = i8Var.l();
            sg.w.h(d7VarL);
            d7VarL.resetAnalyticsDataWithElapsedTime(j11, this.f32461b);
        } else {
            d7 d7VarL2 = i8Var.l();
            sg.w.h(d7VarL2);
            d7VarL2.resetAnalyticsData(j11);
        }
    }
}
