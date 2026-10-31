package com.vungle.ads.internal;

import com.vungle.ads.VungleError;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j0 extends com.vungle.ads.internal.presenter.c {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ k0 f46859b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j0(com.vungle.ads.internal.presenter.b bVar, k0 k0Var) {
        super(bVar);
        this.f46859b = k0Var;
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdEnd(String str) {
        this.f46859b.a(h.f46848f);
        this.f47358a.onAdEnd(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdImpression(String str) {
        this.f46859b.a(h.f46847e);
        this.f47358a.onAdImpression(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdStart(String str) {
        this.f46859b.a(h.f46846d);
        this.f47358a.onAdStart(str);
    }

    @Override // com.vungle.ads.internal.presenter.c, com.vungle.ads.internal.presenter.b
    public final void onFailure(VungleError error) {
        Intrinsics.g(error, "error");
        this.f46859b.a(h.f46849g);
        super.onFailure(error);
    }
}
