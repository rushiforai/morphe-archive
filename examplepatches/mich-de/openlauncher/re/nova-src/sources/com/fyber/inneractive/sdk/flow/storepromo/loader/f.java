package com.fyber.inneractive.sdk.flow.storepromo.loader;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.g1;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class f implements com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a, com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a f28317a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.model.c f28318b;

    /* renamed from: c, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.b f28319c;

    /* renamed from: e, reason: collision with root package name */
    public a f28321e;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b f28320d = new com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b(this);

    /* renamed from: f, reason: collision with root package name */
    public i f28322f = new i();

    public f(com.fyber.inneractive.sdk.flow.storepromo.model.c cVar, a aVar) {
        this.f28321e = aVar;
        this.f28319c = new com.fyber.inneractive.sdk.flow.storepromo.controller.webview.b(this, this.f28321e);
        try {
            this.f28317a = new com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a(this.f28319c);
        } catch (Throwable th2) {
            IAlog.a("failed to create a promo webview", new Object[0]);
            this.f28321e.a(com.fyber.inneractive.sdk.network.events.b.NO_WEBVIEW_INSTALLED, th2.getLocalizedMessage(), null);
        }
        this.f28318b = cVar;
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a(int i5, g1 g1Var) {
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void b() {
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = this.f28317a;
        if (aVar != null) {
            aVar.a("DTStorePromoBridge.nativeCallComplete()");
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a() {
        com.fyber.inneractive.sdk.flow.storepromo.model.c cVar;
        a aVar;
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar2 = this.f28317a;
        if (aVar2 == null || (cVar = this.f28318b) == null || (aVar = this.f28321e) == null) {
            return;
        }
        aVar.a(aVar2, cVar);
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.bridge.a
    public final void a(HashMap map) {
        String str = (String) map.get("error");
        if (TextUtils.isEmpty(str)) {
            str = "Unknown error occurred on Store Promo side";
        }
        a aVar = this.f28321e;
        if (aVar != null) {
            aVar.a(com.fyber.inneractive.sdk.network.events.b.TEMPLATE_ERROR, str, null);
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.a
    public final void a(String str, HashMap map) throws NumberFormatException {
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = this.f28317a;
        if (aVar == null) {
            IAlog.b("StorePromoContentLoader: onCommandReceived: command: %s the webview is null", str);
            return;
        }
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.handler.b bVar = this.f28320d;
        if (bVar != null) {
            bVar.a(str, map, aVar.getLastClickedLocation());
        }
    }
}
