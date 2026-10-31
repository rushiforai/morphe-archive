package com.fyber.inneractive.sdk.flow.endcard.loaders.fmp;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.endcard.o;
import com.fyber.inneractive.sdk.flow.endcard.p;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.network.g;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class c implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a f28111a;

    /* renamed from: b, reason: collision with root package name */
    public final o f28112b;

    public c(o oVar, com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar) {
        this.f28112b = oVar;
        this.f28111a = aVar;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) throws JSONException {
        String str = (String) obj;
        if (str != null && exc == null) {
            ((p) this.f28112b.f()).f28131e = str.concat("<style>body {margin: 0px; background-color: rgba(0, 0, 0, 0.0);}</style>");
            ((p) this.f28112b.f()).f28121l = z11;
            ((p) this.f28112b.f()).b(this.f28111a);
            return;
        }
        if (exc == null || (exc instanceof g) || z11) {
            return;
        }
        o oVar = this.f28112b;
        IAlog.a("%s sending FMP_COMPANION_FAILED_LOADING event", "TemplateCallback");
        JSONObject jSONObject = new JSONObject();
        String strA = v.a(exc);
        if (!TextUtils.isEmpty(strA)) {
            try {
                jSONObject.put("error", strA);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "error", strA);
            }
        }
        String strN = oVar.n();
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
        y0 y0Var = oVar.f28057c;
        t tVar = t.FMP_COMPANION_FAILED_LOADING;
        InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
        com.fyber.inneractive.sdk.response.g gVar = y0Var.f28456d;
        JSONArray jSONArray = y0Var.f28458f;
        w wVar = new w(gVar);
        wVar.f28819b = tVar;
        wVar.f28818a = inneractiveAdRequest;
        wVar.f28821d = jSONArray;
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
    }
}
