package com.fyber.inneractive.sdk.config.global;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f27831a = new HashMap();

    public static l a(JSONObject jSONObject) throws JSONException {
        l lVar = new l();
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("features");
        for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
            JSONObject jSONObject2 = jSONArrayOptJSONArray.getJSONObject(i5);
            q qVar = new q();
            qVar.f27834b = jSONObject2.getString("id");
            JSONObject jSONObjectOptJSONObject = jSONObject2.optJSONObject("params");
            if (jSONObjectOptJSONObject != null) {
                qVar.f27833a = new o(jSONObjectOptJSONObject);
            } else {
                IAlog.a("RemoteFeature fromJson. feature %s has no params!", qVar.f27834b);
            }
            JSONArray jSONArrayOptJSONArray2 = jSONObject2.optJSONArray("experiments");
            if (jSONArrayOptJSONArray2 != null) {
                for (int i11 = 0; i11 < jSONArrayOptJSONArray2.length(); i11++) {
                    JSONObject jSONObject3 = jSONArrayOptJSONArray2.getJSONObject(i11);
                    b bVar = new b();
                    bVar.f27805a = jSONObject3.getString("id");
                    bVar.f27806b = jSONObject3.optInt("perc", 10);
                    JSONArray jSONArray = jSONObject3.getJSONArray("variants");
                    for (int i12 = 0; i12 < jSONArray.length(); i12++) {
                        JSONObject jSONObject4 = jSONArray.getJSONObject(i12);
                        k kVar = new k();
                        kVar.f27829b = jSONObject4.getString("id");
                        kVar.f27830c = jSONObject4.getInt("perc");
                        JSONObject jSONObjectOptJSONObject2 = jSONObject4.optJSONObject("params");
                        if (jSONObjectOptJSONObject2 != null) {
                            kVar.f27833a = new o(jSONObjectOptJSONObject2);
                        }
                        bVar.f27807c.add(kVar);
                    }
                    b.a(bVar, jSONObject3.optJSONObject("include"), true);
                    b.a(bVar, jSONObject3.optJSONObject("exclude"), false);
                    qVar.f27835c.put(bVar.f27805a, bVar);
                }
            }
            lVar.f27831a.put(qVar.f27834b, qVar);
        }
        return lVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || l.class != obj.getClass()) {
            return false;
        }
        return this.f27831a.equals(((l) obj).f27831a);
    }

    public final int hashCode() {
        return this.f27831a.hashCode();
    }

    public final String toString() {
        return String.format("remoteConfig - features: %s", this.f27831a.values());
    }
}
