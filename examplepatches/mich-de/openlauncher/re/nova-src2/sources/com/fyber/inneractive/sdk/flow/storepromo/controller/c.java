package com.fyber.inneractive.sdk.flow.storepromo.controller;

import com.fyber.inneractive.sdk.flow.storepromo.loader.f;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class c implements com.fyber.inneractive.sdk.flow.storepromo.loader.a, com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a, com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.storepromo.controller.webview.b f28300a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a f28301b;

    /* renamed from: d, reason: collision with root package name */
    public f f28303d;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.loader.a f28305f;

    /* renamed from: g, reason: collision with root package name */
    public b f28306g;

    /* renamed from: e, reason: collision with root package name */
    public boolean f28304e = false;

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b f28302c = new com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b(this);

    public c(com.fyber.inneractive.sdk.flow.storepromo.model.c cVar, com.fyber.inneractive.sdk.flow.storepromo.loader.a aVar, b bVar) {
        this.f28305f = aVar;
        this.f28306g = bVar;
        this.f28300a = new com.fyber.inneractive.sdk.flow.storepromo.controller.webview.b(this, aVar);
        this.f28303d = new f(cVar, this);
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a() {
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void b() {
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = this.f28301b;
        if (aVar != null) {
            aVar.a("DTStorePromoBridge.nativeCallComplete()");
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a(HashMap map) {
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a
    public final void a(String str, HashMap map) throws NumberFormatException {
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = this.f28301b;
        if (aVar == null) {
            IAlog.b("StorePromoWebViewController: onCommandReceived: command: %s the webview is null", str);
            return;
        }
        g1 lastClickedLocation = aVar.getLastClickedLocation();
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b bVar = this.f28302c;
        if (bVar != null) {
            bVar.a(str, map, lastClickedLocation);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a(int i5, g1 g1Var) {
        if (i5 != 0) {
            b bVar = this.f28306g;
            if (bVar != null) {
                a aVar = a.INSTALL;
                IAlog.a("StorePromoView: onClick: type: " + aVar, new Object[0]);
                if (aVar == a.CLOSE) {
                    bVar.a();
                    return;
                }
                com.fyber.inneractive.sdk.flow.storepromo.loader.b bVar2 = bVar.f28295e;
                if (bVar2 != null) {
                    bVar2.a(g1Var);
                    return;
                }
                return;
            }
            return;
        }
        b bVar3 = this.f28306g;
        if (bVar3 != null) {
            IAlog.a("StorePromoView: onClick: type: " + a.CLOSE, new Object[0]);
            bVar3.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.loader.a
    public final void a(com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar, com.fyber.inneractive.sdk.flow.storepromo.model.c cVar) {
        IAlog.a("StorePromoWebViewController: onContentLoadedSuccess: content is loaded successfully", new Object[0]);
        this.f28304e = true;
        this.f28301b = aVar;
        aVar.setWebViewClient(this.f28300a);
        com.fyber.inneractive.sdk.flow.storepromo.loader.a aVar2 = this.f28305f;
        if (aVar2 != null) {
            aVar2.a(this.f28301b, cVar);
            this.f28305f = null;
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.listener.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, String str2) {
        this.f28304e = false;
        com.fyber.inneractive.sdk.flow.storepromo.loader.a aVar = this.f28305f;
        if (aVar != null) {
            aVar.a(bVar, str, str2);
            this.f28305f = null;
        }
    }
}
