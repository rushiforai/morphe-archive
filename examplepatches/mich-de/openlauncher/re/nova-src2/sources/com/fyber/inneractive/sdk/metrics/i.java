package com.fyber.inneractive.sdk.metrics;

import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f28559a = new LinkedHashMap();

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f28560b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public long f28561c;

    /* renamed from: d, reason: collision with root package name */
    public long f28562d;

    public static JSONArray a(LinkedHashMap linkedHashMap) throws JSONException {
        JSONArray jSONArray = new JSONArray();
        for (h hVar : linkedHashMap.keySet()) {
            JSONObject jSONObject = new JSONObject();
            try {
                jSONObject.putOpt("outcome", hVar.f28558b);
                jSONObject.putOpt("time", linkedHashMap.get(hVar));
                jSONObject.putOpt("idx", Integer.valueOf(jSONArray.length()));
            } catch (JSONException unused) {
            }
            jSONArray.put(jSONObject);
        }
        return jSONArray;
    }
}
