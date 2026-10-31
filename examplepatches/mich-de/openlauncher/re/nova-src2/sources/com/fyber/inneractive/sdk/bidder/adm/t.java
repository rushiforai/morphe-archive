package com.fyber.inneractive.sdk.bidder.adm;

import com.fyber.inneractive.sdk.flow.c0;

/* loaded from: classes3.dex */
public final class t implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c0 f27606a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.config.global.r f27607b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ y f27608c;

    public t(y yVar, c0 c0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        this.f27608c = yVar;
        this.f27606a = c0Var;
        this.f27607b = rVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f27608c.a(this.f27606a, this.f27607b);
    }
}
