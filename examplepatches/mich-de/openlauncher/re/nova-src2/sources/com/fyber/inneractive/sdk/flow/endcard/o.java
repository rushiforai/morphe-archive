package com.fyber.inneractive.sdk.flow.endcard;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.web.i1;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class o extends b {

    /* renamed from: g, reason: collision with root package name */
    public final String f28117g;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.web.a f28118h;

    public o(y0 y0Var, String str, int i5) {
        super(i5, y0Var);
        this.f28118h = new com.fyber.inneractive.sdk.web.a(null, 0);
        this.f28117g = str;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(ViewGroup viewGroup, com.fyber.inneractive.sdk.player.ui.b bVar) throws JSONException {
        p pVar = (p) f();
        View viewB = pVar.b();
        if (viewB != null) {
            com.fyber.inneractive.sdk.util.v.a(viewB);
            viewGroup.addView(viewB);
            i1 i1Var = pVar.e().f28889a;
            if (i1Var != null) {
                i1Var.a(true);
            }
        }
        a(this.f28059e, this.f28057c);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final n c() {
        return new p(this);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.player.ui.c d() {
        View viewB = f().b();
        com.fyber.inneractive.sdk.player.ui.c cVarD = super.d();
        cVarD.f30673e = viewB;
        return cVarD;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.util.g g() {
        com.fyber.inneractive.sdk.web.a aVar = this.f28118h;
        com.fyber.inneractive.sdk.util.g gVar = com.fyber.inneractive.sdk.util.g.FMP_ENDCARD;
        gVar.a(aVar.f31258a);
        gVar.a(aVar.f31259b);
        return gVar;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final l h() {
        return l.Fmp;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.model.vast.i i() {
        return com.fyber.inneractive.sdk.model.vast.i.FMP_End_Card;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final boolean j() {
        return this.f28059e > 1;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final boolean l() {
        p pVar = (p) f();
        return pVar.f28132f && pVar.b() != null;
    }

    public final String n() {
        q qVar;
        com.fyber.inneractive.sdk.web.b bVar = (com.fyber.inneractive.sdk.web.b) ((p) f()).e().f28889a;
        if (bVar == null || (qVar = bVar.N) == null) {
            return null;
        }
        return qVar.f28124c;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) throws JSONException {
        if (inneractiveInfrastructureError.isErrorAlreadyReported(com.fyber.inneractive.sdk.network.t.FMP_COMPANION_FAILED_LOADING)) {
            return;
        }
        Throwable cause = inneractiveInfrastructureError.getCause();
        IAlog.a("%s sending FMP_COMPANION_FAILED_LOADING event", this.f28055a);
        JSONObject jSONObject = new JSONObject();
        String strA = com.fyber.inneractive.sdk.util.v.a(cause);
        if (!TextUtils.isEmpty(strA)) {
            try {
                jSONObject.put("error", strA);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "error", strA);
            }
        }
        String strN = n();
        if (!TextUtils.isEmpty(strN)) {
            try {
                jSONObject.put("version", strN);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "version", strN);
            }
        }
        Boolean bool = Boolean.FALSE;
        try {
            jSONObject.put("loaded_from_cache", bool);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "loaded_from_cache", bool);
        }
        y0 y0Var = this.f28057c;
        com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.FMP_COMPANION_FAILED_LOADING;
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        JSONArray jSONArray = y0Var.f28458f;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(gVar);
        wVar.f28819b = tVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArray;
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }

    public final void a(int i5, y0 y0Var) throws JSONException {
        String strN = n();
        this.f28118h = new com.fyber.inneractive.sdk.web.a(strN, i5);
        JSONObject jSONObject = new JSONObject();
        if (!TextUtils.isEmpty(strN)) {
            try {
                jSONObject.put("version", strN);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "version", strN);
            }
        }
        Boolean boolValueOf = Boolean.valueOf(((p) f()).f28121l);
        try {
            jSONObject.put("loaded_from_cache", boolValueOf);
        } catch (Exception unused2) {
            IAlog.f("Got exception adding param to json object: %s, %s", "loaded_from_cache", boolValueOf);
        }
        com.fyber.inneractive.sdk.network.u uVar = com.fyber.inneractive.sdk.network.u.FMP_COMPANION_SUCCESSFULLY_SHOWN;
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        JSONArray jSONArray = y0Var.f28458f;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(gVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArray;
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }
}
