package com.fyber.inneractive.sdk.cache.session;

import java.util.Iterator;
import java.util.Map;
import java.util.PriorityQueue;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public i f27685a = new i();

    /* renamed from: c, reason: collision with root package name */
    public final Object f27687c = new Object();

    /* renamed from: d, reason: collision with root package name */
    public final Object f27688d = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final a f27686b = new a();

    public static JSONObject a(e eVar) throws JSONException {
        eVar.getClass();
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("currentSession", eVar.f27685a.a());
            for (Map.Entry entry : eVar.f27686b.entrySet()) {
                JSONArray jSONArray = new JSONArray();
                com.fyber.inneractive.sdk.cache.session.enums.c cVar = (com.fyber.inneractive.sdk.cache.session.enums.c) entry.getKey();
                Iterator it = ((PriorityQueue) entry.getValue()).iterator();
                while (it.hasNext()) {
                    jSONArray.put(((g) it.next()).a(true, true));
                }
                jSONObject.put(cVar.name(), jSONArray);
            }
        } catch (Exception unused) {
        }
        return jSONObject;
    }

    public final void a(com.fyber.inneractive.sdk.cache.session.enums.c cVar, g gVar) {
        synchronized (this.f27688d) {
            try {
                k kVar = (k) this.f27686b.get(cVar);
                if (kVar != null) {
                    kVar.add(gVar);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
