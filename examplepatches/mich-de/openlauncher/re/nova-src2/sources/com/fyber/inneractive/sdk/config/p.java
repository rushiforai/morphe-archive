package com.fyber.inneractive.sdk.config;

import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f27873a = new HashMap();

    public p() {
    }

    public p(JSONObject jSONObject) {
        JSONArray jSONArrayNames;
        JSONArray jSONArrayNames2 = jSONObject.names();
        for (int i5 = 0; i5 < jSONArrayNames2.length(); i5++) {
            String strOptString = jSONArrayNames2.optString(i5, null);
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject(strOptString);
            o oVar = new o();
            if (jSONObjectOptJSONObject != null && (jSONArrayNames = jSONObjectOptJSONObject.names()) != null) {
                for (int i11 = 0; i11 < jSONArrayNames.length(); i11++) {
                    String strOptString2 = jSONArrayNames.optString(i11, null);
                    String strOptString3 = jSONObjectOptJSONObject.optString(strOptString2, null);
                    if (strOptString2 != null && strOptString3 != null) {
                        oVar.f27871a.put(strOptString2, strOptString3);
                    }
                }
            }
            this.f27873a.put(strOptString, oVar);
        }
    }
}
