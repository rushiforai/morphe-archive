package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.external.InneractiveAdRequest;

/* loaded from: classes.dex */
public final class s extends m {

    /* renamed from: e, reason: collision with root package name */
    public final InneractiveAdRequest f28771e;

    /* renamed from: f, reason: collision with root package name */
    public final q0 f28772f;

    public s(InneractiveAdRequest inneractiveAdRequest, String str, com.fyber.inneractive.sdk.config.global.r rVar, com.fyber.inneractive.sdk.flow.o oVar) {
        super(rVar, str, oVar);
        this.f28771e = inneractiveAdRequest;
        q0 q0Var = new q0(new q(this), inneractiveAdRequest, rVar);
        this.f28772f = q0Var;
        q0Var.f28780d = new r(this);
    }

    @Override // com.fyber.inneractive.sdk.network.m
    public final void a() {
        this.f28749b = true;
        this.f28748a = null;
        this.f28772f.f28777a = true;
    }

    @Override // com.fyber.inneractive.sdk.network.m
    public final String b() {
        return this.f28772f.r();
    }
}
