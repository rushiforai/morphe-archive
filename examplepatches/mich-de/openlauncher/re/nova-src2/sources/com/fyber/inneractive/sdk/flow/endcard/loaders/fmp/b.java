package com.fyber.inneractive.sdk.flow.endcard.loaders.fmp;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.endcard.o;
import com.fyber.inneractive.sdk.flow.endcard.p;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.response.g;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f28107a;

    /* renamed from: b, reason: collision with root package name */
    public final o f28108b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a f28109c;

    /* renamed from: d, reason: collision with root package name */
    public final String f28110d;

    public b(o oVar, com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar, String str) {
        this.f28108b = oVar;
        this.f28107a = (p) oVar.f();
        this.f28109c = aVar;
        this.f28110d = str;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) throws JSONException {
        String str = (String) obj;
        if (str != null && exc == null) {
            IAlog.c("%s loaded FMP End-Card icon %s", "IconCallback", this.f28110d);
            p pVar = this.f28107a;
            pVar.f28120k = str;
            pVar.b(this.f28109c);
            return;
        }
        if (TextUtils.isEmpty(this.f28107a.f28120k)) {
            o oVar = this.f28108b;
            IAlog.a("%s sending FMP_COMPANION_FAILED_LOADING event", "IconCallback");
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
            Boolean boolValueOf = Boolean.valueOf(z11);
            try {
                jSONObject.put("loaded_from_cache", boolValueOf);
            } catch (Exception unused3) {
                IAlog.f("Got exception adding param to json object: %s, %s", "loaded_from_cache", boolValueOf);
            }
            y0 y0Var = oVar.f28057c;
            t tVar = t.FMP_COMPANION_FAILED_LOADING;
            InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
            g gVar = y0Var.f28456d;
            JSONArray jSONArray = y0Var.f28458f;
            w wVar = new w(gVar);
            wVar.f28819b = tVar;
            wVar.f28818a = inneractiveAdRequest;
            wVar.f28821d = jSONArray;
            wVar.f28823f.put(jSONObject);
            wVar.a((String) null);
        }
    }
}
