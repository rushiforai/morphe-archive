package com.fyber.inneractive.sdk.config.global;

import com.fyber.inneractive.sdk.util.IAlog;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONObject;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public String f27805a;

    /* renamed from: b, reason: collision with root package name */
    public int f27806b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f27807c = new ArrayList();

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f27808d = new ArrayList();

    public static void a(b bVar, JSONObject jSONObject, boolean z11) {
        String next;
        d cVar;
        if (jSONObject != null) {
            Iterator<String> itKeys = jSONObject.keys();
            while (itKeys.hasNext()) {
                next = itKeys.next();
                next.getClass();
                switch (next) {
                    case "demand":
                        cVar = new c(jSONObject.getJSONArray(next), z11);
                        break;
                    case "pub_id":
                        cVar = new i(jSONObject.getJSONArray(next), z11);
                        break;
                    case "placement_type":
                        cVar = new h(jSONObject.getJSONArray(next), z11);
                        break;
                    case "os":
                        cVar = new f(z11, jSONObject.getString(next));
                        break;
                    case "sdk":
                        cVar = new j(z11, jSONObject.getString(next));
                        break;
                    default:
                        cVar = null;
                        break;
                }
                if (cVar != null) {
                    bVar.f27808d.add(cVar);
                } else {
                    IAlog.a("b: Unsupported filter type: ".concat(next), new Object[0]);
                }
            }
        }
    }

    public final String toString() {
        return String.format("experiment: id=%s, variants=%s, filters=%s", this.f27805a, this.f27807c, this.f27808d);
    }
}
