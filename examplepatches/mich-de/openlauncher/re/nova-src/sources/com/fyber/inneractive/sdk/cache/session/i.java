package com.fyber.inneractive.sdk.cache.session;

import com.tiktok.util.TTConst;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final h f27695a = new h();

    public final JSONObject a() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        try {
            JSONArray jSONArray = new JSONArray();
            for (Map.Entry entry : this.f27695a.entrySet()) {
                com.fyber.inneractive.sdk.cache.session.enums.c cVar = (com.fyber.inneractive.sdk.cache.session.enums.c) entry.getKey();
                try {
                    JSONObject jSONObject2 = new JSONObject();
                    jSONObject2.put(TTConst.TRACK_TYPE, cVar.a().value());
                    jSONObject2.put("subType", cVar.name().toLowerCase(Locale.US).contains("video") ? "video" : "display");
                    jSONObject2.put("session_data", ((g) entry.getValue()).a(true, true));
                    jSONArray.put(jSONObject2);
                } catch (Exception unused) {
                }
            }
            jSONObject.put("content", jSONArray);
        } catch (Exception unused2) {
        }
        return jSONObject;
    }
}
