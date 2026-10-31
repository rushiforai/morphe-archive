package com.fyber.inneractive.sdk.util;

import android.os.Handler;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.tiktok.util.UrlConst;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f31183a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.web.e f31184b;

    public e(com.fyber.inneractive.sdk.web.e eVar, String str) {
        this.f31184b = eVar;
        this.f31183a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        com.fyber.inneractive.sdk.web.e eVar = this.f31184b;
        Object obj = this.f31183a;
        eVar.getClass();
        String str = (String) obj;
        String str2 = s.a() ? "http://" : UrlConst.HTTPS;
        if (!TextUtils.isEmpty(str) && !eVar.f31279a.isTerminated() && !eVar.f31279a.isShutdown()) {
            if (TextUtils.isEmpty(eVar.f31289k)) {
                eVar.f31290l.f31316p = str2.concat("wv.inner-active.mobi/");
            } else {
                com.fyber.inneractive.sdk.web.i iVar = eVar.f31290l;
                StringBuilder sbQ = a2.c.q(str2);
                sbQ.append(eVar.f31289k);
                iVar.f31316p = sbQ.toString();
            }
            if (eVar.f31284f) {
                return;
            }
            com.fyber.inneractive.sdk.web.i iVar2 = eVar.f31290l;
            com.fyber.inneractive.sdk.web.m mVar = iVar2.f31304b;
            if (mVar != null) {
                mVar.loadDataWithBaseURL(iVar2.f31316p, str, "text/html", "utf-8", null);
                eVar.f31290l.f31317q = str;
            } else {
                InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, com.fyber.inneractive.sdk.flow.i.COULD_NOT_LOAD_TO_WEBVIEW);
                com.fyber.inneractive.sdk.web.g gVar = iVar2.f31308f;
                if (gVar != null) {
                    gVar.a(iVar2, inneractiveInfrastructureError);
                }
                iVar2.b(true);
            }
        } else if (!eVar.f31279a.isTerminated() && !eVar.f31279a.isShutdown()) {
            com.fyber.inneractive.sdk.web.i iVar3 = eVar.f31290l;
            InneractiveInfrastructureError inneractiveInfrastructureError2 = new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, com.fyber.inneractive.sdk.flow.i.EMPTY_FINAL_HTML);
            com.fyber.inneractive.sdk.web.g gVar2 = iVar3.f31308f;
            if (gVar2 != null) {
                gVar2.a(iVar3, inneractiveInfrastructureError2);
            }
            iVar3.b(true);
        }
        eVar.f31284f = true;
        eVar.f31279a.shutdownNow();
        Handler handler = eVar.f31280b;
        if (handler != null) {
            d dVar = eVar.f31282d;
            if (dVar != null) {
                handler.removeCallbacks(dVar);
            }
            e eVar2 = eVar.f31281c;
            if (eVar2 != null) {
                eVar.f31280b.removeCallbacks(eVar2);
            }
            eVar.f31280b = null;
        }
        eVar.f31290l.o = null;
    }
}
