package com.fyber.inneractive.sdk.model.vast;

import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.util.TTConst;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class c implements com.fyber.inneractive.sdk.response.i {

    /* renamed from: a, reason: collision with root package name */
    public final i f28582a;

    /* renamed from: b, reason: collision with root package name */
    public k f28583b;

    /* renamed from: c, reason: collision with root package name */
    public final int f28584c;

    /* renamed from: d, reason: collision with root package name */
    public final int f28585d;

    /* renamed from: e, reason: collision with root package name */
    public final String f28586e;

    /* renamed from: f, reason: collision with root package name */
    public String f28587f;

    /* renamed from: g, reason: collision with root package name */
    public String f28588g;

    /* renamed from: h, reason: collision with root package name */
    public final int f28589h;

    /* renamed from: i, reason: collision with root package name */
    public final HashMap f28590i = new HashMap();

    public c(i iVar, int i5, int i11, String str, int i12) {
        this.f28582a = iVar;
        this.f28584c = i5;
        this.f28585d = i11;
        this.f28586e = str;
        this.f28589h = i12;
    }

    public final void a(x xVar, String str) {
        List arrayList = (List) this.f28590i.get(xVar);
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.f28590i.put(xVar, arrayList);
        }
        if (arrayList.contains(str)) {
            return;
        }
        arrayList.add(str);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Companion:  w:");
        sb2.append(this.f28584c);
        sb2.append(" h:");
        sb2.append(this.f28585d);
        sb2.append(" type:");
        sb2.append(this.f28582a.toString());
        sb2.append(" creativeType: ");
        k kVar = this.f28583b;
        sb2.append(kVar != null ? kVar.mimeType : "none");
        sb2.append(" ctr:");
        sb2.append(this.f28588g);
        sb2.append(" events:");
        sb2.append(this.f28590i);
        return sb2.toString();
    }

    @Override // com.fyber.inneractive.sdk.response.i
    public final List a(x xVar) {
        if (xVar == null || this.f28590i.isEmpty()) {
            return null;
        }
        return (List) this.f28590i.get(xVar);
    }

    public final JSONObject a() throws JSONException {
        String str;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("w", this.f28584c);
            jSONObject.put("h", this.f28585d);
            jSONObject.put(TTConst.TRACK_TYPE, this.f28582a.toString());
            k kVar = this.f28583b;
            if (kVar != null) {
                str = kVar.mimeType;
            } else {
                str = "none";
            }
            jSONObject.put("creativeType", str);
            jSONObject.put("content", this.f28587f);
            return jSONObject;
        } catch (JSONException e3) {
            IAlog.a("Vast Parser: Failed creating Companion json object: %s", e3.getMessage());
            return jSONObject;
        }
    }
}
