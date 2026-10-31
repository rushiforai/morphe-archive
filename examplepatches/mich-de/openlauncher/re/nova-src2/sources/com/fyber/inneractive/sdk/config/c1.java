package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class c1 {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.cache.session.e f27770a;

    /* renamed from: b, reason: collision with root package name */
    public e f27771b;

    /* renamed from: e, reason: collision with root package name */
    public a1 f27774e;

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f27772c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f27773d = new HashMap();

    /* renamed from: f, reason: collision with root package name */
    public boolean f27775f = false;

    public final String a(UnitDisplayType unitDisplayType, String str) {
        Map map = (Map) this.f27772c.get(unitDisplayType);
        return (map == null || map.get(str) == null) ? com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b : (String) map.get(str);
    }

    public final void a(UnitDisplayType unitDisplayType, String str, String str2) {
        Map map = (Map) this.f27772c.get(unitDisplayType);
        if (map == null) {
            map = new HashMap();
            this.f27772c.put(unitDisplayType, map);
        }
        map.put(str, str2);
        a1 a1Var = this.f27774e;
        if (a1Var == null || !this.f27775f) {
            return;
        }
        ((com.fyber.inneractive.sdk.bidder.b) a1Var).d();
    }

    public final JSONArray a(UnitDisplayType unitDisplayType) throws JSONException {
        int i5;
        com.fyber.inneractive.sdk.cache.session.e eVar = this.f27770a;
        if (eVar == null) {
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        try {
            for (com.fyber.inneractive.sdk.cache.session.enums.c cVar : com.fyber.inneractive.sdk.cache.session.enums.c.values()) {
                if (cVar != com.fyber.inneractive.sdk.cache.session.enums.c.NONE && (unitDisplayType == null || cVar.a() == unitDisplayType)) {
                    JSONObject jSONObject = new JSONObject();
                    jSONObject.put(TTConst.TRACK_TYPE, cVar.a().value());
                    jSONObject.put("subType", cVar.name().toLowerCase(Locale.US).contains("video") ? "video" : "display");
                    com.fyber.inneractive.sdk.cache.session.k kVar = (com.fyber.inneractive.sdk.cache.session.k) eVar.f27686b.get(cVar);
                    try {
                        i5 = Integer.parseInt(IAConfigManager.Q.f27761u.f27936b.a("number_of_sessions", Integer.toString(5)));
                    } catch (Throwable unused) {
                        i5 = 5;
                    }
                    int i11 = i5 >= 0 ? i5 : 5;
                    if (i11 > 0 && kVar != null && kVar.size() >= i11) {
                        boolean zB = cVar.b();
                        JSONArray jSONArray2 = new JSONArray();
                        ArrayList arrayList = new ArrayList(kVar);
                        Collections.sort(arrayList, new com.fyber.inneractive.sdk.cache.session.j());
                        Iterator it = arrayList.iterator();
                        int i12 = 0;
                        while (it.hasNext()) {
                            jSONArray2.put(((com.fyber.inneractive.sdk.cache.session.g) it.next()).a(false, zB));
                            i12++;
                            if (i12 >= i11) {
                                break;
                            }
                        }
                        jSONObject.put("sessionData", jSONArray2);
                        jSONArray.put(jSONObject);
                    }
                }
            }
        } catch (Exception unused2) {
        }
        return jSONArray;
    }
}
