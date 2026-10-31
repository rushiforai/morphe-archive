package pu;

import h6.f1;
import h6.j1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g0 implements j1 {

    /* renamed from: a, reason: collision with root package name */
    public final w60.a f83040a;

    public g0(w60.a inputAddressViewModelSubcomponentFactoryProvider) {
        Intrinsics.g(inputAddressViewModelSubcomponentFactoryProvider, "inputAddressViewModelSubcomponentFactoryProvider");
        this.f83040a = inputAddressViewModelSubcomponentFactoryProvider;
    }

    @Override // h6.j1
    public final f1 create(Class cls) {
        vu.h hVar = ((vu.j) this.f83040a.get()).f93189a;
        return new com.stripe.android.paymentsheet.addresselement.k0(hVar.f93176a, (k0) hVar.f93178c.get(), (qu.c) hVar.f93186k.get());
    }
}
