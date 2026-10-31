package com.fyber.inneractive.sdk.player.ui;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.fyber.inneractive.sdk.config.x0;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.ui.IAsmoothProgressBar;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.h1;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class i extends s {
    public p A;
    public final t0 B;

    /* renamed from: z, reason: collision with root package name */
    public final o f30690z;

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0136  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public i(Context context, a aVar, com.fyber.inneractive.sdk.player.n nVar, com.fyber.inneractive.sdk.config.global.r rVar, String str) throws JSONException {
        com.fyber.inneractive.sdk.flow.g gVar;
        boolean zA;
        p pVar;
        t0 t0Var;
        t0 t0Var2;
        com.fyber.inneractive.sdk.config.global.r rVar2 = rVar;
        super(context, rVar2, null);
        this.B = null;
        this.B = nVar != null ? nVar.f30580b : null;
        if (context == null || nVar == null || (t0Var2 = nVar.f30580b) == null) {
            gVar = null;
        } else {
            rVar2 = rVar;
            gVar = new com.fyber.inneractive.sdk.flow.g(context, false, t0Var2.f28437a, t0Var2.f28438b, rVar);
        }
        if (nVar == null || (t0Var = nVar.f30580b) == null) {
            zA = false;
        } else {
            com.fyber.inneractive.sdk.response.e eVar = t0Var.f28438b;
            zA = com.fyber.inneractive.sdk.player.f.a(rVar2, eVar != null ? ((com.fyber.inneractive.sdk.response.g) eVar).E : com.fyber.inneractive.sdk.ignite.m.NONE);
        }
        o oVar = new o(context, gVar, aVar, rVar2, zA, str);
        this.f30690z = oVar;
        if (nVar != null) {
            com.fyber.inneractive.sdk.model.vast.b bVar = nVar.f30638q;
            if (bVar == null || TextUtils.isEmpty(bVar.n)) {
                IAlog.a("%s : dynamic controls are not available", "IAVideoViewComposition");
            } else {
                com.fyber.inneractive.sdk.player.ui.remote.g gVar2 = nVar.f30643v;
                if ((gVar2 != null ? gVar2.f30730a : null) != null) {
                    com.fyber.inneractive.sdk.player.ui.remote.d dVar = gVar2 != null ? gVar2.f30730a : null;
                    if (dVar.f30709h) {
                        IAlog.a("%s : dynamic controls are already destroyed", "IAVideoViewComposition");
                    } else if (dVar.f30708g) {
                        IAlog.a("%s : dynamic controls load process timed out", "IAVideoViewComposition");
                        com.fyber.inneractive.sdk.player.ui.remote.g gVar3 = nVar.f30643v;
                        (gVar3 != null ? gVar3.f30730a : null).a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_LOAD_TIMEOUT, "Template loading is timed out", true, null);
                    } else if (dVar.f30703b.f31375j) {
                        pVar = new p(getContext().getApplicationContext(), aVar, dVar, oVar);
                    } else {
                        IAlog.a("%s : dynamic controls are not ready, yet", "IAVideoViewComposition");
                        com.fyber.inneractive.sdk.player.ui.remote.g gVar4 = nVar.f30643v;
                        (gVar4 != null ? gVar4.f30730a : null).a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_ERROR, "Template isn't loaded yet", true, null);
                    }
                }
            }
            this.A = pVar;
            this.f30734m = oVar.f30734m;
            this.f30737r = oVar.f30737r;
            this.f30738s = oVar.f30738s;
            this.n = oVar.n;
            TextView textView = oVar.f30741v;
            this.f30741v = textView;
            a(textView, 10);
            a(this.n, 8);
            a(this.f30734m, 7);
            a(this.f30737r, -1);
            if (b()) {
                p pVar2 = this.A;
                IAsmoothProgressBar iAsmoothProgressBar = oVar.P;
                f(iAsmoothProgressBar != null && iAsmoothProgressBar.getVisibility() == 0);
                ImageView imageView = oVar.N;
                d(imageView != null && imageView.getVisibility() == 0);
                oVar.i();
                attachViewToParent(pVar2, 0, new RelativeLayout.LayoutParams(-1, -1));
                com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.VAST_EVENT_DVC_IMPRESSION;
                InneractiveAdRequest adRequest = getAdRequest();
                com.fyber.inneractive.sdk.response.e adResponse = getAdResponse();
                com.fyber.inneractive.sdk.player.ui.remote.d dVar2 = pVar2.M;
                String str2 = dVar2.f30707f;
                Boolean boolValueOf = Boolean.valueOf(dVar2.f30710i);
                w wVar = new w(uVar, adRequest, adResponse);
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("loaded_from_cache", boolValueOf);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "loaded_from_cache", boolValueOf);
                }
                try {
                    jSONObject.put("templateURL", str2);
                } catch (Exception unused2) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "templateURL", str2);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
            }
            View view = this.f30690z;
            attachViewToParent(view, 0, view.getLayoutParams());
        }
        IAlog.a("%s : flow manager is missing, unexpected and dynamic controls status are unknown", "IAVideoViewComposition");
        com.fyber.inneractive.sdk.network.events.a.a(com.fyber.inneractive.sdk.network.t.VAST_ERROR_DVC_FAILURE, com.fyber.inneractive.sdk.network.events.b.TEMPLATE_CONTENT_ERROR, getAdRequest(), getAdResponse(), "Missing flow manager", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, (Boolean) null);
        pVar = null;
        this.A = pVar;
        this.f30734m = oVar.f30734m;
        this.f30737r = oVar.f30737r;
        this.f30738s = oVar.f30738s;
        this.n = oVar.n;
        TextView textView2 = oVar.f30741v;
        this.f30741v = textView2;
        a(textView2, 10);
        a(this.n, 8);
        a(this.f30734m, 7);
        a(this.f30737r, -1);
        if (b()) {
        }
        View view2 = this.f30690z;
        attachViewToParent(view2, 0, view2.getLayoutParams());
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(com.fyber.inneractive.sdk.flow.endcard.d dVar, b bVar) {
        ViewGroup viewGroup;
        p pVar;
        this.f30690z.a(dVar, bVar);
        if (!a(this.A) || (viewGroup = this.f30737r) == null || viewGroup.getVisibility() != 0 || (pVar = this.A) == null) {
            return;
        }
        pVar.destroy();
        this.A = null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e, com.fyber.inneractive.sdk.player.ui.m
    public final boolean b() {
        p pVar = this.A;
        return pVar != null && pVar.b();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void c(boolean z11) {
        this.f30690z.c(z11);
        if (a(this.A)) {
            this.A.c(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void d(boolean z11) {
        this.f30690z.d(z11);
        if (a(this.A)) {
            this.A.d(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void e(boolean z11) {
        if (a(this.A)) {
            this.A.e(z11);
        } else {
            this.f30690z.e(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void f(boolean z11) {
        this.f30690z.f(z11);
        if (a(this.A)) {
            this.A.f(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void g(boolean z11) {
        if (a(this.A)) {
            this.A.g(z11);
        } else {
            this.f30690z.g(z11);
        }
    }

    public InneractiveAdRequest getAdRequest() {
        t0 t0Var = this.B;
        if (t0Var != null) {
            return t0Var.f28437a;
        }
        return null;
    }

    public com.fyber.inneractive.sdk.response.e getAdResponse() {
        t0 t0Var = this.B;
        if (t0Var != null) {
            return t0Var.f28438b;
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View getEndCardView() {
        return this.f30690z.getEndCardView();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyView() {
        return a(this.A) ? this.A.getTrackingFriendlyView() : this.f30690z.getTrackingFriendlyView();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public View[] getTrackingFriendlyViewObstructionPurposeOther() {
        return a(this.A) ? this.A.getTrackingFriendlyViewObstructionPurposeOther() : this.f30690z.getTrackingFriendlyViewObstructionPurposeOther();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void h() {
        this.f30690z.h();
        if (a(this.A)) {
            this.A.h();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void i() {
        this.f30690z.i();
        if (a(this.A)) {
            this.A.i();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void j() {
        this.f30690z.j();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void k() {
        this.f30690z.k();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final boolean l() {
        return a(this.A) ? this.A.M.f30714m : this.f30690z.l();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void m() {
        this.f30690z.m();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void n() {
        this.f30690z.n();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void o() {
        this.f30690z.o();
        this.f30740u = this.f30690z.f30740u;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setAppInfoButtonRound(TextView textView) {
        this.f30690z.setAppInfoButtonRound(textView);
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public void setListener(n nVar) {
        super.setListener(nVar);
        this.f30690z.setListener(nVar);
        if (a(this.A)) {
            this.A.setListener(nVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setMuteButtonState(boolean z11) {
        this.f30690z.setMuteButtonState(z11);
        if (a(this.A)) {
            this.A.setMuteButtonState(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setRemainingTime(String str) {
        this.f30690z.setRemainingTime(str);
        if (a(this.A)) {
            this.A.setRemainingTime(str);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public void setSkipText(String str) {
        this.f30690z.setSkipText(str);
        if (a(this.A)) {
            this.A.setSkipText(str);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public void setUnitConfig(x0 x0Var) {
        super.setUnitConfig(x0Var);
        this.f30690z.setUnitConfig(x0Var);
        if (a(this.A)) {
            this.A.setUnitConfig(x0Var);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void b(boolean z11) {
        this.f30690z.b(z11);
        if (a(this.A)) {
            this.A.b(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void g() {
        o oVar = this.f30690z;
        oVar.p();
        oVar.C = true;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11, com.fyber.inneractive.sdk.ignite.m mVar) {
        if (!a(this.A)) {
            this.f30690z.a(z11, mVar);
        } else {
            this.A.a(z11, mVar);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11, String str) {
        this.f30690z.a(z11, str);
        if (a(this.A)) {
            this.A.a(z11, str);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11, int i5, int i11) {
        this.o = i5;
        this.f30735p = i11;
        this.f30736q = z11;
        o oVar = this.f30690z;
        oVar.o = i5;
        oVar.f30735p = i11;
        oVar.f30736q = z11;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.m
    public final boolean a() {
        if (a(this.A)) {
            return this.A.M.n;
        }
        return this.f30690z.a();
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(com.fyber.inneractive.sdk.flow.endcard.b bVar, b bVar2) {
        this.f30690z.a(bVar, bVar2);
        p pVar = this.A;
        if (pVar != null) {
            pVar.destroy();
            this.A = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(boolean z11) {
        if (a(this.A)) {
            this.A.a(z11);
        } else {
            this.f30690z.a(z11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.s
    public final void a(int i5, int i11) {
        this.f30690z.a(i5, i11);
        if (a(this.A)) {
            this.A.a(i5, i11);
        }
    }

    @Override // com.fyber.inneractive.sdk.player.ui.e
    public final void a(h1 h1Var, int i5, int i11) {
        this.f30690z.a(h1Var, i5, i11);
    }

    public static boolean a(p pVar) {
        return (pVar == null || pVar.M.f30709h || !pVar.b()) ? false : true;
    }
}
