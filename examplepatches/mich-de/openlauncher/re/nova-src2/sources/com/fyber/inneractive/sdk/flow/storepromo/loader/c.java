package com.fyber.inneractive.sdk.flow.storepromo.loader;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f28312a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f28313b;

    public c(d dVar, String str) {
        this.f28313b = dVar;
        this.f28312a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        f fVar = this.f28313b.f28314a;
        String str = this.f28312a;
        com.fyber.inneractive.sdk.flow.storepromo.controller.webview.a aVar = fVar.f28317a;
        if (aVar != null) {
            try {
                aVar.loadDataWithBaseURL(null, str, "text/html", "UTF-8", null);
            } catch (Throwable th2) {
                if (fVar.f28321e != null) {
                    fVar.f28321e.a(com.fyber.inneractive.sdk.network.events.b.WEB_VIEW_CRASH_ERROR, fq.c.f(th2, new StringBuilder("Unable to load data: ")), com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                }
            }
        }
    }
}
