package com.fyber.inneractive.sdk.flow.nativead.mainasset;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.flow.i;
import com.fyber.inneractive.sdk.flow.nativead.g;
import com.fyber.inneractive.sdk.flow.nativead.s;
import com.fyber.inneractive.sdk.flow.nativead.t;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.u0;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.response.nativead.j;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import h6.c1;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements d, s {

    /* renamed from: h, reason: collision with root package name */
    public static final String f28219h = IAlog.a(b.class);

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.response.nativead.f f28220a;

    /* renamed from: b, reason: collision with root package name */
    public c f28221b;

    /* renamed from: c, reason: collision with root package name */
    public u0 f28222c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.b f28223d = com.fyber.inneractive.sdk.flow.nativead.b.UNINITIALIZED;

    /* renamed from: e, reason: collision with root package name */
    public j f28224e;

    /* renamed from: f, reason: collision with root package name */
    public r f28225f;

    /* renamed from: g, reason: collision with root package name */
    public long f28226g;

    public b(com.fyber.inneractive.sdk.response.nativead.f fVar, com.fyber.inneractive.sdk.flow.nativead.f fVar2, j jVar, r rVar) {
        this.f28220a = fVar;
        this.f28221b = fVar2;
        this.f28224e = jVar;
        this.f28225f = rVar;
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.s
    public final void a(g gVar, Exception exc, com.fyber.inneractive.sdk.response.nativead.f fVar) throws Throwable {
        String message;
        if (this.f28223d == com.fyber.inneractive.sdk.flow.nativead.b.LOADED) {
            return;
        }
        if (gVar == null) {
            this.f28223d = com.fyber.inneractive.sdk.flow.nativead.b.FAILED;
            i iVar = i.NATIVE_AD_IMAGE_LOAD_FAILED;
            if (exc != null) {
                message = exc.getMessage();
            } else {
                message = "Failed to download main media image: " + iVar.name();
            }
            IAlog.f("%s : %s", f28219h, message);
            InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD, iVar);
            c cVar = this.f28221b;
            if (cVar != null) {
                ((com.fyber.inneractive.sdk.flow.nativead.f) cVar).a(inneractiveInfrastructureError, message);
                return;
            }
            return;
        }
        if (this.f28224e != null && this.f28225f != null) {
            u uVar = u.EVENT_READY_ON_CLIENT;
            j jVar = this.f28224e;
            JSONArray jSONArrayB = this.f28225f.b();
            w wVar = new w(jVar);
            wVar.f28820c = uVar;
            wVar.f28818a = null;
            wVar.f28821d = jSONArrayB;
            long jCurrentTimeMillis = System.currentTimeMillis() - this.f28226g;
            IAlog.a(c1.o(jCurrentTimeMillis, "%sMain image load took: ", " msec"), IAlog.a(this));
            JSONObject jSONObject = new JSONObject();
            String str = this.f28220a.f31077d.f31071a;
            try {
                jSONObject.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            } catch (Exception unused) {
                IAlog.f("Got exception adding param to json object: %s, %s", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            }
            String strA = com.fyber.inneractive.sdk.util.u.a(this.f28220a.f31077d.f31071a);
            try {
                jSONObject.put("mime", strA);
            } catch (Exception unused2) {
                IAlog.f("Got exception adding param to json object: %s, %s", "mime", strA);
            }
            Long lValueOf = Long.valueOf(jCurrentTimeMillis);
            try {
                jSONObject.put("load_time", lValueOf);
            } catch (Exception unused3) {
                IAlog.f("Got exception adding param to json object: %s, %s", "load_time", lValueOf);
            }
            wVar.f28823f.put(jSONObject);
            wVar.a((String) null);
        }
        this.f28223d = com.fyber.inneractive.sdk.flow.nativead.b.LOADED;
        c cVar2 = this.f28221b;
        if (cVar2 != null) {
            com.fyber.inneractive.sdk.flow.nativead.f fVar2 = (com.fyber.inneractive.sdk.flow.nativead.f) cVar2;
            fVar2.f28190d.add(gVar);
            fVar2.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final void b() throws JSONException {
        com.fyber.inneractive.sdk.response.nativead.c cVar;
        String str;
        com.fyber.inneractive.sdk.response.nativead.f fVar = this.f28220a;
        if (fVar != null && (cVar = fVar.f31077d) != null && (str = cVar.f31071a) != null && !str.trim().isEmpty()) {
            this.f28226g = System.currentTimeMillis();
            this.f28223d = com.fyber.inneractive.sdk.flow.nativead.b.LOADING;
            t tVar = new t(this.f28220a, this);
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            u0 u0Var = new u0(tVar, iAConfigManager.f27762v.f27857a, new com.fyber.inneractive.sdk.cache.e(this.f28220a.f31077d.f31071a));
            this.f28222c = u0Var;
            iAConfigManager.f27759s.a(u0Var);
            return;
        }
        a aVar = new a("Main media image is not loadable");
        this.f28223d = com.fyber.inneractive.sdk.flow.nativead.b.FAILED;
        i iVar = i.NATIVE_AD_IMAGE_LOAD_FAILED;
        String message = aVar.getMessage();
        IAlog.f("%s : %s", f28219h, message);
        InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD, iVar);
        c cVar2 = this.f28221b;
        if (cVar2 != null) {
            ((com.fyber.inneractive.sdk.flow.nativead.f) cVar2).a(inneractiveInfrastructureError, message);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final void destroy() {
        u0 u0Var = this.f28222c;
        if (u0Var != null) {
            u0Var.c();
            this.f28222c = null;
        }
        this.f28224e = null;
        this.f28225f = null;
        this.f28220a = null;
        this.f28221b = null;
        this.f28223d = com.fyber.inneractive.sdk.flow.nativead.b.DESTROYED;
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final boolean a() {
        return this.f28223d == com.fyber.inneractive.sdk.flow.nativead.b.LOADING;
    }
}
