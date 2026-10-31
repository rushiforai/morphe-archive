package com.fyber.inneractive.sdk.util;

import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class c1 {
    public static void a(JSONObject jSONObject, String str, Object obj) throws JSONException {
        if (obj != null) {
            try {
                if (obj instanceof b1) {
                    jSONObject.putOpt(str, ((b1) obj).a());
                } else {
                    jSONObject.putOpt(str, obj);
                }
            } catch (JSONException unused) {
            }
        }
    }
}
