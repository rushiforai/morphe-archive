package com.stripe.android.paymentsheet;

import com.stripe.android.paymentsheet.PaymentSheetContract;
import h6.f1;
import h6.j1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class w0 implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final ou.b1 f45006a;

    public w0(ou.b1 b1Var) {
        this.f45006a = b1Var;
    }

    @Override // h6.j1
    public final f1 create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        b1 b1Var = (b1) new vu.p(new b50.d(), new br.c(), new br.a(0), new b50.d(), new vu.q(), new vu.v(), new vt.o0(), jk.b.T(extras), h6.y0.a(extras), (PaymentSheetContract.Args) this.f45006a.invoke()).f93247r.get();
        Intrinsics.e(b1Var, "null cannot be cast to non-null type T of com.stripe.android.paymentsheet.PaymentSheetViewModel.Factory.create");
        return b1Var;
    }
}
