package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.util.d1;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b0 implements u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAConfigManager f27768a;

    public b0(IAConfigManager iAConfigManager) {
        this.f27768a = iAConfigManager;
    }

    @Override // com.fyber.inneractive.sdk.config.u
    public final void onGlobalConfigChanged(v vVar, r rVar) {
        com.fyber.inneractive.sdk.network.f fVar = this.f27768a.H;
        fVar.getClass();
        int iA = IAConfigManager.Q.f27761u.f27936b.a("send_events_batch_interval", 30, -1);
        int i5 = iA >= 0 ? iA : 30;
        String property = System.getProperty("fyber.marketplace.use_batch_interval");
        if (property != null && !Boolean.getBoolean(property)) {
            i5 = 0;
        }
        fVar.f28714f = true;
        fVar.f28713e = i5;
        d1 d1Var = fVar.f28712d;
        if (d1Var != null && d1Var.hasMessages(12312329)) {
            fVar.f28712d.removeMessages(12312329);
        }
        long j11 = fVar.f28713e * 1000;
        d1 d1Var2 = fVar.f28712d;
        if (d1Var2 != null) {
            d1Var2.post(new com.fyber.inneractive.sdk.network.c(fVar, 12312329, j11));
        }
        IAConfigManager iAConfigManager = this.f27768a;
        com.fyber.inneractive.sdk.serverapi.extradata.d dVar = iAConfigManager.J;
        r rVar2 = iAConfigManager.f27761u.f27936b;
        JSONObject jSONObject = new JSONObject();
        String strA = rVar2.a("k", (String) null);
        if (strA != null) {
            try {
                jSONObject = new JSONObject(strA);
            } catch (JSONException unused) {
            }
        }
        dVar.getClass();
        HashMap map = new HashMap();
        Iterator<String> itKeys = jSONObject.keys();
        while (itKeys.hasNext()) {
            String next = itKeys.next();
            map.put(next, Integer.valueOf(jSONObject.optInt(next, 0)));
        }
        dVar.f31103e.clear();
        dVar.f31103e.putAll(map);
    }
}
