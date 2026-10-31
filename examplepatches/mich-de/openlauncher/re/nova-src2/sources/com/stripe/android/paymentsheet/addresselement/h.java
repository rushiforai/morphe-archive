package com.stripe.android.paymentsheet.addresselement;

import android.content.Context;
import com.stripe.android.paymentsheet.addresselement.AddressElementActivityContract;
import h6.f1;
import h6.j1;

/* loaded from: classes4.dex */
public final class h implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final pu.c f44732a;

    /* renamed from: b, reason: collision with root package name */
    public final pu.c f44733b;

    public h(pu.c cVar, pu.c cVar2) {
        this.f44732a = cVar;
        this.f44733b = cVar2;
    }

    @Override // h6.j1
    public final f1 create(Class cls) {
        vu.h hVar = new vu.h(new br.c(), new br.a(0), new vu.a(), (Context) this.f44732a.invoke(), (AddressElementActivityContract.Args) this.f44733b.invoke());
        return new pu.k((pu.k0) hVar.f93178c.get(), hVar.f93179d, hVar.f93180e);
    }
}
