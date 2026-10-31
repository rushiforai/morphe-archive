package ks;

import com.stripe.android.link.LinkAccountUpdate;
import fs.g0;
import h6.u0;
import kotlin.jvm.internal.Intrinsics;
import s40.h;

/* loaded from: classes4.dex */
public final class g implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final h f72199a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.e f72200b;

    public g(s40.e eVar, s40.e eVar2) {
        this.f72199a = eVar;
        this.f72200b = eVar2;
    }

    @Override // w60.a
    public final Object get() {
        u0 savedStateHandle = (u0) this.f72199a.get();
        LinkAccountUpdate.Value linkAccountInfo = (LinkAccountUpdate.Value) this.f72200b.f86659a;
        Intrinsics.g(savedStateHandle, "savedStateHandle");
        Intrinsics.g(linkAccountInfo, "linkAccountInfo");
        g0 g0Var = new g0(savedStateHandle);
        g0Var.a(linkAccountInfo);
        return g0Var;
    }
}
