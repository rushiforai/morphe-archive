package com.fyber.inneractive.sdk.flow.endcard;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.q0;

/* loaded from: classes3.dex */
public final class s implements com.fyber.inneractive.sdk.web.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ u f28126a;

    public s(u uVar) {
        this.f28126a = uVar;
    }

    @Override // com.fyber.inneractive.sdk.web.g
    public final void a(com.fyber.inneractive.sdk.web.i iVar) {
        IAlog.a("%s End-Card loaded", this.f28126a.f28053a);
        this.f28126a.f28134h.set(false);
        u uVar = this.f28126a;
        uVar.getClass();
        boolean z11 = iVar != null;
        uVar.f28132f = z11;
        com.fyber.inneractive.sdk.web.m mVar = z11 ? iVar.f31304b : null;
        String str = IAConfigManager.Q.G.f27672e;
        if (!uVar.f() || mVar == null || TextUtils.isEmpty(str)) {
            uVar.f28054b.m();
        } else {
            q0.a(mVar, str, uVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.web.g
    public final void a(com.fyber.inneractive.sdk.web.i iVar, InneractiveInfrastructureError inneractiveInfrastructureError) {
        IAlog.f("%s End-Card failed to load!", this.f28126a.f28053a);
        this.f28126a.f28134h.set(false);
        u uVar = this.f28126a;
        uVar.f28132f = false;
        uVar.f28054b.a(inneractiveInfrastructureError);
    }
}
