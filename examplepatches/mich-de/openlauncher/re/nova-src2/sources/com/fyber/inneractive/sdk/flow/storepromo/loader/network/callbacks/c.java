package com.fyber.inneractive.sdk.flow.storepromo.loader.network.callbacks;

import b.c0;
import com.fyber.inneractive.sdk.flow.storepromo.loader.g;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class c implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final g f28357a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f28358b = false;

    /* renamed from: c, reason: collision with root package name */
    public final String f28359c;

    public c(g gVar, String str) {
        this.f28357a = gVar;
        this.f28359c = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0067  */
    @Override // com.fyber.inneractive.sdk.network.f0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, Exception exc, boolean z11) {
        boolean z12;
        String str = (String) obj;
        if (this.f28358b) {
            IAlog.a("StorePromoTemplateCallback: onNetworkResult: the cached response was applied and this one being cached", new Object[0]);
            return;
        }
        IAlog.a(a2.c.l("StorePromoTemplateCallback: onNetworkResult: fromCache: ", z11), new Object[0]);
        this.f28358b = true;
        if (str != null && exc == null) {
            g gVar = this.f28357a;
            gVar.getClass();
            IAlog.a("StorePromoResourcesLoader: onTemplateDownloaded", new Object[0]);
            gVar.f28326d.f28365c = str;
            gVar.a(null, false, null, null);
            return;
        }
        String strK = c0.k("Unable download store promo template, error: ", exc != null ? exc.getMessage() != null ? exc.getMessage() : exc.toString() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        g gVar2 = this.f28357a;
        com.fyber.inneractive.sdk.flow.storepromo.events.a aVar = com.fyber.inneractive.sdk.flow.storepromo.events.a.DOWNLOAD_RESOURCE_ERROR;
        String str2 = this.f28359c;
        if (com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.TEMPLATE_FAILURE == com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.SCREENSHOT_FAILURE) {
            int i5 = gVar2.f28328f;
            int i11 = gVar2.f28329g + 1;
            gVar2.f28329g = i11;
            z12 = i5 - i11 < 2;
        }
        gVar2.a(aVar, z12, strK, str2);
    }
}
