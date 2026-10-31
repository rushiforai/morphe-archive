package com.fyber.inneractive.sdk.web.remoteui;

import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.web.m;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class b extends m implements a, com.fyber.inneractive.sdk.player.ui.remote.a {

    /* renamed from: h, reason: collision with root package name */
    public a f31373h;

    /* renamed from: i, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.ui.remote.a f31374i;

    /* renamed from: j, reason: collision with root package name */
    public boolean f31375j = false;

    /* renamed from: k, reason: collision with root package name */
    public final c f31376k;

    public b() {
        c cVar = new c(this, this);
        this.f31376k = cVar;
        setWebViewClient(cVar);
        getSettings().setJavaScriptEnabled(true);
        setHorizontalScrollBarEnabled(false);
        setHorizontalScrollbarOverlay(false);
        setVerticalScrollBarEnabled(false);
        setVerticalScrollbarOverlay(false);
        getSettings().setSupportZoom(false);
        setBackgroundColor(0);
    }

    @Override // com.fyber.inneractive.sdk.web.remoteui.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, boolean z11, HashMap map) {
        this.f31375j = false;
        a aVar = this.f31373h;
        if (aVar != null) {
            aVar.a(bVar, str, z11, map);
        }
    }

    @Override // com.fyber.inneractive.sdk.web.m, android.webkit.WebView
    public final void destroy() {
        this.f31373h = null;
        this.f31374i = null;
        c cVar = this.f31376k;
        cVar.getClass();
        IAlog.a("%s: destroy()", "RemoteUiWebViewClient");
        cVar.f31378b = null;
        cVar.f31377a = null;
        super.destroy();
    }

    public void setCommandHandler(com.fyber.inneractive.sdk.player.ui.remote.a aVar) {
        this.f31374i = aVar;
    }

    public void setResultFailureListener(a aVar) {
        this.f31373h = aVar;
    }

    public void setUiReady(boolean z11) {
        this.f31375j = z11;
    }

    @Override // com.fyber.inneractive.sdk.player.ui.remote.a
    public final void a(String str, HashMap map) {
        com.fyber.inneractive.sdk.player.ui.remote.a aVar = this.f31374i;
        if (aVar != null) {
            aVar.a(str, map);
        }
    }
}
