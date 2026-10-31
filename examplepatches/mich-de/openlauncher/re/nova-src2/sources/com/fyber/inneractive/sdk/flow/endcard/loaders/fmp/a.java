package com.fyber.inneractive.sdk.flow.endcard.loaders.fmp;

import com.fyber.inneractive.sdk.flow.endcard.j;
import com.fyber.inneractive.sdk.flow.endcard.o;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class a implements com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f28103a;

    /* renamed from: b, reason: collision with root package name */
    public final j f28104b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.endcard.loaders.b f28105c;

    /* renamed from: d, reason: collision with root package name */
    public o f28106d;

    public a(j jVar, y0 y0Var, com.fyber.inneractive.sdk.flow.endcard.loaders.b bVar) {
        this.f28104b = jVar;
        this.f28103a = y0Var;
        this.f28105c = bVar;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a
    public final void a() {
        com.fyber.inneractive.sdk.flow.endcard.loaders.b bVar = this.f28105c;
        o oVar = this.f28106d;
        bVar.getClass();
        if (oVar != null) {
            IAlog.a("%s : onCompanionLoadSuccess: endcard type: %s", "EndCardLoader", oVar.i());
            bVar.f28089d.a(oVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a
    public final void a(String str) {
        this.f28105c.getClass();
        IAlog.a("%s : onCompanionLoadFailure: error: %s", "EndCardLoader", str);
    }
}
