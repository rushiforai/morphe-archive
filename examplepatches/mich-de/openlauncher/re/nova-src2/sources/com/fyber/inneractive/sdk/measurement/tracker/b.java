package com.fyber.inneractive.sdk.measurement.tracker;

import android.webkit.WebView;
import com.fyber.inneractive.sdk.util.q0;
import com.fyber.inneractive.sdk.web.m;
import un.g;
import un.h;
import un.i;

/* loaded from: classes3.dex */
public final class b extends e {
    public b(i iVar, m mVar) {
        super(iVar, mVar);
    }

    @Override // com.fyber.inneractive.sdk.measurement.tracker.e
    public final void a(m mVar) {
        super.a(mVar);
        StringBuilder sb2 = new StringBuilder("javascript:FyberMraidVideoTracker.initOmid(\"Fyber\",\"");
        this.f28530d.getClass();
        sb2.append(this.f28530d.f91394a);
        sb2.append("\");");
        mVar.loadUrl(sb2.toString());
    }

    @Override // com.fyber.inneractive.sdk.measurement.tracker.e
    public final un.c b() {
        try {
            un.e eVar = un.e.DEFINED_BY_JAVASCRIPT;
            g gVar = g.DEFINED_BY_JAVASCRIPT;
            h hVar = h.JAVASCRIPT;
            return un.c.a(eVar, gVar, hVar, hVar);
        } catch (Throwable unused) {
            return null;
        }
    }

    @Override // com.fyber.inneractive.sdk.measurement.tracker.e
    public final void c() {
        WebView webView;
        if (this.f28529c || this.f28527a == null || (webView = this.f28531e) == null) {
            return;
        }
        this.f28529c = true;
        q0.a(webView, "FyberMraidVideoTracker.impression();");
    }

    @Override // com.fyber.inneractive.sdk.measurement.tracker.e
    public final void a() {
        WebView webView = this.f28531e;
        if (webView != null) {
            q0.a(webView, "FyberMraidVideoTracker.adUserInteraction();");
        }
    }
}
