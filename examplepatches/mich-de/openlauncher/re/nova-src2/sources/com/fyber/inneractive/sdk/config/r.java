package com.fyber.inneractive.sdk.config;

import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class r {

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f27885a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f27886b = new HashMap();

    public final String a(String str, String str2) {
        return this.f27885a.containsKey(str) ? (String) this.f27885a.get(str) : str2;
    }

    public final int b(String str, int i5, int i11) {
        int i12;
        try {
            i12 = Integer.parseInt(a(str, Integer.toString(i5)));
        } catch (Throwable unused) {
            i12 = i5;
        }
        return (i12 < i11 || i12 > 30) ? i5 : i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && r.class == obj.getClass()) {
            r rVar = (r) obj;
            if (this.f27885a.equals(rVar.f27885a) && this.f27886b.equals(rVar.f27886b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f27885a.hashCode();
    }

    public static r a(JSONObject jSONObject) {
        r rVar = new r();
        JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("params");
        if (jSONObjectOptJSONObject != null && jSONObjectOptJSONObject.length() > 0) {
            Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
            while (itKeys.hasNext()) {
                String next = itKeys.next();
                String strOptString = jSONObjectOptJSONObject.optString(next, null);
                if (strOptString != null) {
                    rVar.f27885a.put(next, strOptString);
                }
            }
        }
        JSONObject jSONObjectOptJSONObject2 = jSONObject.optJSONObject("overrides");
        if (jSONObjectOptJSONObject2 != null && jSONObjectOptJSONObject2.length() > 0) {
            Iterator<String> itKeys2 = jSONObjectOptJSONObject2.keys();
            while (itKeys2.hasNext()) {
                String next2 = itKeys2.next();
                JSONObject jSONObjectOptJSONObject3 = jSONObjectOptJSONObject2.optJSONObject(next2);
                if (jSONObjectOptJSONObject3 != null && jSONObjectOptJSONObject3.length() > 0) {
                    rVar.f27886b.put(next2, new p(jSONObjectOptJSONObject3));
                }
            }
        }
        return rVar;
    }

    public final int a(String str, int i5, int i11) {
        try {
            i5 = Integer.parseInt(a(str, Integer.toString(i5)));
        } catch (Throwable unused) {
        }
        return Math.max(i5, i11);
    }

    public final boolean a(boolean z11, String str) {
        try {
            return Boolean.parseBoolean(a(str, Boolean.toString(z11)));
        } catch (Throwable unused) {
            return z11;
        }
    }

    public final o a(String str) {
        p pVar;
        String str2 = IAConfigManager.Q.f27746d;
        if (this.f27886b.containsKey(str2)) {
            pVar = (p) this.f27886b.get(str2);
        } else {
            pVar = new p();
        }
        pVar.getClass();
        return pVar.f27873a.containsKey(str) ? (o) pVar.f27873a.get(str) : new o();
    }
}
