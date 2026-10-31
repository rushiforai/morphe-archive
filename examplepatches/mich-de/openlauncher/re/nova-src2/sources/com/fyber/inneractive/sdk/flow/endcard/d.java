package com.fyber.inneractive.sdk.flow.endcard;

import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.y0;
import org.json.JSONArray;

/* loaded from: classes3.dex */
public final class d extends b {
    public d(int i5, y0 y0Var) {
        super(i5, y0Var);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(ViewGroup viewGroup, com.fyber.inneractive.sdk.player.ui.b bVar) {
        f fVar = (f) f();
        fVar.a(bVar, null);
        ViewGroup viewGroup2 = fVar.f28066c;
        com.fyber.inneractive.sdk.util.v.a(viewGroup2);
        viewGroup.addView(viewGroup2);
        a(this.f28059e, this.f28057c);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final n c() {
        return new f(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.player.ui.c d() {
        com.fyber.inneractive.sdk.config.global.features.v vVar = this.f28057c.f28459g;
        View viewB = f().b();
        com.fyber.inneractive.sdk.player.ui.c cVarD = super.d();
        cVarD.f30673e = viewB;
        boolean z11 = false;
        if (vVar != null) {
            Boolean boolC = vVar.c("cta_text_all_caps");
            if (boolC != null ? boolC.booleanValue() : false) {
                z11 = true;
            }
        }
        cVarD.f30670b = z11;
        boolean zB = b.b(vVar);
        Integer numValueOf = Integer.valueOf(b.a(vVar));
        if (zB) {
            cVarD.f30672d = numValueOf;
        }
        return cVarD;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.util.g g() {
        return com.fyber.inneractive.sdk.util.g.DEFAULT_ENDCARD;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final l h() {
        return l.Default;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.model.vast.i i() {
        return com.fyber.inneractive.sdk.model.vast.i.Default_End_Card;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final boolean l() {
        return true;
    }

    public final void a(int i5, y0 y0Var) {
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.VAST_DEFAULT_COMPANION_DISPLAYED;
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        JSONArray jSONArray = y0Var.f28458f;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(gVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArray;
        wVar.a((String) null);
    }
}
