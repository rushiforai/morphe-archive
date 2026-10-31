package com.fyber.inneractive.sdk.flow.storepromo.controller;

import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.flow.endcard.k;
import com.fyber.inneractive.sdk.network.u;
import com.fyber.inneractive.sdk.network.w;
import com.fyber.inneractive.sdk.response.e;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public final class b implements com.fyber.inneractive.sdk.flow.storepromo.loader.a {

    /* renamed from: a, reason: collision with root package name */
    public final InneractiveAdRequest f28291a;

    /* renamed from: b, reason: collision with root package name */
    public final e f28292b;

    /* renamed from: c, reason: collision with root package name */
    public c f28293c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.ui.c f28294d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.loader.b f28295e;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.b f28296f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f28297g = false;

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a f28298h;

    /* renamed from: i, reason: collision with root package name */
    public k f28299i;

    public b(com.fyber.inneractive.sdk.flow.storepromo.model.c cVar, com.fyber.inneractive.sdk.flow.storepromo.b bVar, com.fyber.inneractive.sdk.flow.storepromo.loader.b bVar2, com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar, e eVar, InneractiveAdRequest inneractiveAdRequest) {
        this.f28298h = aVar;
        this.f28293c = new c(cVar, this, this);
        this.f28296f = bVar;
        this.f28291a = inneractiveAdRequest;
        this.f28292b = eVar;
        this.f28295e = bVar2;
    }

    public final void a() {
        com.fyber.inneractive.sdk.flow.storepromo.ui.c cVar = this.f28294d;
        if (cVar != null) {
            if (cVar.f28380b != null && cVar.f28379a != null) {
                cVar.f28382d.setAnimationListener(cVar.f28387i);
                cVar.f28379a.setAnimation(cVar.f28382d);
                cVar.f28379a.setVisibility(8);
            }
            k kVar = this.f28299i;
            if (kVar == null || kVar.f28076b.a() == null || kVar.f28076b.a().f().b() == null) {
                return;
            }
            IAlog.a("%sonStorePromoDismissed restoring endcard focus", IAlog.a(kVar));
            kVar.f28076b.a().f().b().requestFocus();
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.loader.a
    public final void a(com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar, com.fyber.inneractive.sdk.flow.storepromo.model.c cVar) throws JSONException {
        this.f28294d = new com.fyber.inneractive.sdk.flow.storepromo.ui.c(IAConfigManager.Q.f27762v.a(), aVar, this.f28296f);
        u uVar = u.VAST_EVENT_SP_LOADED;
        InneractiveAdRequest inneractiveAdRequest = this.f28291a;
        e eVar = this.f28292b;
        String str = cVar.f28370h;
        w wVar = new w(uVar, inneractiveAdRequest, eVar);
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("templateURL", str);
        } catch (Exception unused) {
            IAlog.f("Got exception adding param to json object: %s, %s", "templateURL", str);
        }
        wVar.f28823f.put(jSONObject);
        wVar.a((String) null);
        IAlog.a("StorePromoController: onContentLoadedSuccess", new Object[0]);
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, String str2) {
        this.f28297g = true;
        a();
        com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a aVar = this.f28298h;
        if (aVar != null) {
            aVar.a(bVar, str, str2);
        }
    }
}
