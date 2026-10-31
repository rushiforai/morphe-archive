package com.fyber.inneractive.sdk.cache.session;

import com.tiktok.util.TTConst;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ JSONObject f27679a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f27680b;

    public b(c cVar, JSONObject jSONObject) {
        this.f27680b = cVar;
        this.f27679a = jSONObject;
    }

    @Override // java.lang.Runnable
    public final void run() throws JSONException {
        g gVar;
        e eVar = this.f27680b.f27681a;
        JSONObject jSONObject = this.f27679a;
        eVar.getClass();
        for (com.fyber.inneractive.sdk.cache.session.enums.c cVar : com.fyber.inneractive.sdk.cache.session.enums.c.values()) {
            if (cVar != com.fyber.inneractive.sdk.cache.session.enums.c.NONE) {
                String strName = cVar.name();
                JSONArray jSONArray = new JSONArray();
                try {
                    jSONArray = jSONObject.getJSONArray(strName);
                } catch (JSONException unused) {
                }
                for (int i5 = 0; i5 < jSONArray.length(); i5++) {
                    g gVarA = g.a(jSONArray.optJSONObject(i5));
                    if (gVarA != null && gVarA.f27691a != 0) {
                        eVar.a(cVar, gVarA);
                    }
                }
            }
        }
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("currentSession");
        if (jSONObjectOptJSONObject != null) {
            h hVar = new h();
            JSONArray jSONArray2 = new JSONArray();
            try {
                jSONArray2 = jSONObjectOptJSONObject.getJSONArray("content");
            } catch (JSONException unused2) {
            }
            for (int i11 = 0; i11 < jSONArray2.length(); i11++) {
                JSONObject jSONObject2 = new JSONObject();
                try {
                    jSONObject2 = jSONArray2.getJSONObject(i11);
                } catch (JSONException unused3) {
                }
                com.fyber.inneractive.sdk.cache.session.enums.c cVarA = com.fyber.inneractive.sdk.cache.session.enums.c.a(jSONObject2.optString(TTConst.TRACK_TYPE), jSONObject2.optString("subType"));
                g gVarA2 = g.a(jSONObject2.optJSONObject("session_data"));
                if (gVarA2 != null) {
                    hVar.put(cVarA, gVarA2);
                }
            }
            for (com.fyber.inneractive.sdk.cache.session.enums.c cVar2 : com.fyber.inneractive.sdk.cache.session.enums.c.values()) {
                if (cVar2 != com.fyber.inneractive.sdk.cache.session.enums.c.NONE && (gVar = (g) hVar.get(cVar2)) != null && gVar.f27691a != 0) {
                    eVar.a(cVar2, gVar);
                }
            }
        }
        this.f27680b.f27681a.getClass();
    }
}
