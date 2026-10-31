package com.stripe.android.paymentsheet.addresselement;

import android.app.Application;
import com.stripe.android.paymentsheet.addresselement.AutocompleteContract;
import kotlin.jvm.internal.Intrinsics;
import vt.p0;

/* loaded from: classes4.dex */
public final class d0 implements pu.y {

    /* renamed from: a, reason: collision with root package name */
    public final AutocompleteContract.Args f44723a;

    public d0(AutocompleteContract.Args args) {
        this.f44723a = args;
    }

    @Override // pu.y
    public final pu.z create(Class cls, k6.c extras) {
        Intrinsics.g(extras, "extras");
        Application applicationT = jk.b.T(extras);
        br.a aVar = new br.a(0);
        br.c cVar = new br.c();
        s40.h hVarB = s40.c.b(new as.h(s40.e.a(applicationT), 11));
        s40.e eVarA = s40.e.a(this.f44723a);
        s40.h hVarB2 = s40.c.b(new vu.c(hVarB, eVarA));
        s40.h hVarB3 = s40.c.b(new vu.d(eVarA));
        s40.h hVarB4 = s40.c.b(new br.b(aVar, vu.e.f93166a, 0));
        s40.h hVarB5 = s40.c.b(new av.a(cVar, 1));
        return new pu.z((dw.e) hVarB2.get(), (pu.u) hVarB3.get(), (qu.c) s40.c.b(new p0(s40.c.b(new au.d(new bs.e(hVarB4, hVarB5, 4), new bs.b(hVarB, s40.c.b(new p0(hVarB, 3)), s40.c.b(vu.e.f93167b), 4), hVarB5, 5)), 2)).get(), applicationT);
    }
}
