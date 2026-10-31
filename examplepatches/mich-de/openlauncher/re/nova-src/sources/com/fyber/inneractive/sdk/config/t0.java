package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.config.enums.Track;
import java.util.Iterator;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class t0 implements com.fyber.inneractive.sdk.util.b1 {

    /* renamed from: a, reason: collision with root package name */
    public Set f27934a = null;

    @Override // com.fyber.inneractive.sdk.util.b1
    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        JSONArray jSONArray = new JSONArray();
        Set set = this.f27934a;
        if (set != null) {
            Iterator it = set.iterator();
            while (it.hasNext()) {
                jSONArray.put((Track) it.next());
            }
        }
        com.fyber.inneractive.sdk.util.c1.a(jSONObject, "track", jSONArray);
        return jSONObject;
    }
}
