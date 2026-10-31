package com.fyber.inneractive.sdk.flow.endcard;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class c extends b implements com.fyber.inneractive.sdk.response.i {

    /* renamed from: g, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.model.vast.c f28061g;

    public c(y0 y0Var, com.fyber.inneractive.sdk.model.vast.c cVar, int i5) {
        super(i5, y0Var);
        this.f28061g = cVar;
    }

    public final void a(com.fyber.inneractive.sdk.network.u uVar, y0 y0Var) throws JSONException {
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        JSONArray jSONArray = y0Var.f28458f;
        com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(gVar);
        wVar.f28820c = uVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArray;
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObjectA = this.f28061g.a();
        try {
            jSONObject.put("companion_data", jSONObjectA);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "companion_data", jSONObjectA);
        }
        JSONArray jSONArray2 = this.f28056b;
        if (jSONArray2 != null && jSONArray2.length() > 0) {
            JSONArray jSONArray3 = this.f28056b;
            try {
                jSONObject.put("plbl_det", jSONArray3);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "plbl_det", jSONArray3);
            }
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
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
    public final void e() {
        a();
        View viewB = f().b();
        if (viewB != null) {
            viewB.setVisibility(8);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.util.g g() {
        return com.fyber.inneractive.sdk.util.g.VAST_ENDCARD;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final l h() {
        return l.Companion;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final com.fyber.inneractive.sdk.model.vast.i i() {
        return this.f28061g.f28582a;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public boolean l() {
        return f().b() != null;
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void m() throws JSONException {
        super.m();
        a(com.fyber.inneractive.sdk.network.u.VAST_COMPANION_LOADED, this.f28057c);
    }

    public final void a(int i5, y0 y0Var) throws JSONException {
        com.fyber.inneractive.sdk.player.n.a(this, com.fyber.inneractive.sdk.model.vast.x.EVENT_CREATIVE_VIEW);
        a(com.fyber.inneractive.sdk.network.u.VAST_COMPANION_DISPLAYED, y0Var);
    }

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) throws JSONException {
        IAlog.a("%s loading failed for %s", inneractiveInfrastructureError.getCause(), i(), this.f28055a);
        com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.VAST_COMPANION_FAILED_LOADING;
        if (inneractiveInfrastructureError.isErrorAlreadyReported(tVar)) {
            return;
        }
        JSONObject jSONObject = new JSONObject();
        JSONObject jSONObjectA = this.f28061g.a();
        try {
            jSONObject.put("companion_data", jSONObjectA);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "companion_data", jSONObjectA);
        }
        Throwable cause = inneractiveInfrastructureError.getCause();
        String strDescription = inneractiveInfrastructureError.description();
        if (TextUtils.isEmpty(strDescription)) {
            strDescription = com.fyber.inneractive.sdk.util.v.a(cause);
        }
        if (!TextUtils.isEmpty(strDescription)) {
            try {
                jSONObject.put("reason", inneractiveInfrastructureError);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "reason", inneractiveInfrastructureError);
            }
        }
        y0 y0Var = this.f28057c;
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

    @Override // com.fyber.inneractive.sdk.flow.endcard.b
    public final void a(ViewGroup viewGroup, com.fyber.inneractive.sdk.player.ui.b bVar) throws JSONException {
        View viewB = f().b();
        if (viewB != null) {
            ((a) f()).c();
            com.fyber.inneractive.sdk.util.v.a(viewB);
            viewGroup.addView(viewB);
            viewB.requestFocus();
            a(this.f28059e, this.f28057c);
        }
    }

    @Override // com.fyber.inneractive.sdk.response.i
    public final List a(com.fyber.inneractive.sdk.model.vast.x xVar) {
        return this.f28061g.a(xVar);
    }
}
