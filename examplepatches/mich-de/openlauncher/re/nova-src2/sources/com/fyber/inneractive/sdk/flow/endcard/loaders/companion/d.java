package com.fyber.inneractive.sdk.flow.endcard.loaders.companion;

import android.graphics.Bitmap;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.endcard.v;
import com.fyber.inneractive.sdk.flow.endcard.w;
import com.fyber.inneractive.sdk.flow.y0;
import com.fyber.inneractive.sdk.model.vast.k;
import com.fyber.inneractive.sdk.network.d1;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.network.t;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.response.g;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class d implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final w f28099a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a f28100b;

    /* renamed from: c, reason: collision with root package name */
    public final v f28101c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e f28102d;

    public d(e eVar, v vVar, com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar) {
        this.f28102d = eVar;
        this.f28101c = vVar;
        this.f28099a = (w) vVar.f();
        this.f28100b = aVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x010f  */
    @Override // com.fyber.inneractive.sdk.network.f0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, Exception exc, boolean z11) throws JSONException {
        boolean zEqualsIgnoreCase;
        Bitmap bitmap;
        d1 d1Var = (d1) obj;
        if (exc == null && d1Var != null && d1Var.f28702b == null && (bitmap = d1Var.f28701a) != null) {
            w wVar = this.f28099a;
            Bitmap bitmap2 = wVar.f28137c;
            if (bitmap2 != null) {
                bitmap2.recycle();
            }
            wVar.f28137c = bitmap;
            wVar.f28138d.setImageBitmap(bitmap);
            e eVar = this.f28102d;
            v vVar = this.f28101c;
            eVar.getClass();
            JSONObject jSONObject = new JSONObject();
            JSONObject jSONObjectA = vVar.f28061g.a();
            try {
                jSONObject.put("companion_data", jSONObjectA);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", "companion_data", jSONObjectA);
            }
            y0 y0Var = vVar.f28057c;
            u uVar = u.VAST_COMPANION_LOADED;
            InneractiveAdRequest inneractiveAdRequest = y0Var.f28455c;
            g gVar = y0Var.f28456d;
            JSONArray jSONArray = y0Var.f28458f;
            com.fyber.inneractive.sdk.network.w wVar2 = new com.fyber.inneractive.sdk.network.w(gVar);
            wVar2.f28820c = uVar;
            wVar2.f28818a = inneractiveAdRequest;
            wVar2.f28821d = jSONArray;
            wVar2.f28823f.put(jSONObject);
            wVar2.a((String) null);
            this.f28100b.a();
            return;
        }
        String str = d1Var != null ? d1Var.f28702b : null;
        e eVar2 = this.f28102d;
        v vVar2 = this.f28101c;
        eVar2.getClass();
        IAlog.a("%s sending VAST_COMPANION_FAILED_LOADING event", "StaticCompanionEndCardLoader");
        JSONObject jSONObject2 = new JSONObject();
        String strA = TextUtils.isEmpty(str) ? com.fyber.inneractive.sdk.util.v.a(exc) : str;
        if (!TextUtils.isEmpty(strA)) {
            try {
                jSONObject2.put("reason", strA);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "reason", strA);
            }
        }
        JSONObject jSONObjectA2 = vVar2.f28061g.a();
        try {
            jSONObject2.put("companion_data", jSONObjectA2);
        } catch (Exception unused3) {
            IAlog.f("Got exception adding param to json object: %s, %s", "companion_data", jSONObjectA2);
        }
        y0 y0Var2 = vVar2.f28057c;
        t tVar = t.VAST_COMPANION_FAILED_LOADING;
        InneractiveAdRequest inneractiveAdRequest2 = y0Var2.f28455c;
        g gVar2 = y0Var2.f28456d;
        JSONArray jSONArray2 = y0Var2.f28458f;
        com.fyber.inneractive.sdk.network.w wVar3 = new com.fyber.inneractive.sdk.network.w(gVar2);
        wVar3.f28819b = tVar;
        wVar3.f28818a = inneractiveAdRequest2;
        wVar3.f28821d = jSONArray2;
        wVar3.f28823f.put(jSONObject2);
        wVar3.a((String) null);
        this.f28100b.a(str);
        v vVar3 = this.f28101c;
        String str2 = vVar3.f28061g.f28587f;
        k kVar = vVar3.f28136h;
        if (TextUtils.isEmpty(str2)) {
            zEqualsIgnoreCase = false;
        } else {
            zEqualsIgnoreCase = true;
            String strSubstring = str2.substring(str2.lastIndexOf(46) + 1);
            if (!kVar.extension.equalsIgnoreCase(strSubstring)) {
                k kVar2 = k.Jpeg;
                if (kVar == kVar2) {
                    zEqualsIgnoreCase = k.Jpg.extension.equalsIgnoreCase(strSubstring);
                } else if (kVar == k.Jpg) {
                    zEqualsIgnoreCase = kVar2.extension.equalsIgnoreCase(strSubstring);
                }
            }
        }
        if (zEqualsIgnoreCase) {
            return;
        }
        y0 y0Var3 = this.f28101c.f28057c;
        t tVar2 = t.VAST_COMPANION_INCOMPATIBLE_MIMETYPE;
        InneractiveAdRequest inneractiveAdRequest3 = y0Var3.f28455c;
        g gVar3 = y0Var3.f28456d;
        JSONArray jSONArray3 = y0Var3.f28458f;
        com.fyber.inneractive.sdk.network.w wVar4 = new com.fyber.inneractive.sdk.network.w(gVar3);
        wVar4.f28819b = tVar2;
        wVar4.f28818a = inneractiveAdRequest3;
        wVar4.f28821d = jSONArray3;
        wVar4.a((String) null);
    }
}
