package com.fyber.inneractive.sdk.flow.endcard;

import com.fyber.inneractive.sdk.flow.y0;

/* loaded from: classes3.dex */
public final class v extends c {

    /* renamed from: h, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.model.vast.k f28136h;

    public v(y0 y0Var, com.fyber.inneractive.sdk.model.vast.c cVar, int i5) {
        super(y0Var, cVar, i5);
        this.f28136h = cVar.f28583b;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final n c() {
        return new w(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.c, com.fyber.inneractive.sdk.flow.endcard.b
    public final boolean l() {
        return super.l() && ((w) f()).f28137c != null;
    }
}
