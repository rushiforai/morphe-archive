package com.fyber.inneractive.sdk.flow.storepromo.loader.network.callbacks;

import com.fyber.inneractive.sdk.flow.storepromo.loader.g;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class b implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final g f28353a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.flow.storepromo.model.b f28354b;

    /* renamed from: c, reason: collision with root package name */
    public final String f28355c;

    /* renamed from: d, reason: collision with root package name */
    public final int f28356d;

    public b(com.fyber.inneractive.sdk.flow.storepromo.model.b bVar, String str, g gVar) {
        this.f28354b = bVar;
        this.f28355c = str;
        this.f28353a = gVar;
        this.f28356d = -1;
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x00a2  */
    @Override // com.fyber.inneractive.sdk.network.f0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(Object obj, Exception exc, boolean z11) {
        boolean z12;
        String str = (String) obj;
        if (str != null && exc == null) {
            g gVar = this.f28353a;
            com.fyber.inneractive.sdk.flow.storepromo.model.b bVar = this.f28354b;
            int i5 = this.f28356d;
            gVar.getClass();
            IAlog.a("StorePromoResourcesLoader: onAssetDownloaded: type: %s, sortIndex: %s", bVar, Integer.valueOf(i5));
            com.fyber.inneractive.sdk.flow.storepromo.model.c cVar = gVar.f28326d;
            cVar.f28363a.add(new com.fyber.inneractive.sdk.flow.storepromo.model.a(str, bVar, i5));
            if (bVar == com.fyber.inneractive.sdk.flow.storepromo.model.b.SCREENSHOT) {
                cVar.f28371i++;
            }
            gVar.a(null, false, null, null);
            return;
        }
        com.fyber.inneractive.sdk.flow.storepromo.events.a aVar = exc instanceof com.fyber.inneractive.sdk.flow.storepromo.loader.network.exception.a ? com.fyber.inneractive.sdk.flow.storepromo.events.a.FILE_SIZE_EXCEEDS_LIMIT : com.fyber.inneractive.sdk.flow.storepromo.events.a.DOWNLOAD_RESOURCE_ERROR;
        String str2 = "Unable download store promo asset type: " + this.f28354b + ", error: " + (exc != null ? exc.getMessage() != null ? exc.getMessage() : exc.toString() : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        g gVar2 = this.f28353a;
        String str3 = this.f28355c;
        int i11 = a.f28352a[this.f28354b.ordinal()];
        if ((i11 != 1 ? i11 != 2 ? i11 != 3 ? i11 != 4 ? com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.UNKNOWN_FAILURE : com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.RATING_ICON_FAILURE : com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.VIDEO_FAILURE : com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.SCREENSHOT_FAILURE : com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.APP_ICON_FAILURE) == com.fyber.inneractive.sdk.flow.storepromo.loader.network.b.SCREENSHOT_FAILURE) {
            int i12 = gVar2.f28328f;
            int i13 = gVar2.f28329g + 1;
            gVar2.f28329g = i13;
            z12 = i12 - i13 < 2;
        }
        gVar2.a(aVar, z12, str2, str3);
    }

    public b(com.fyber.inneractive.sdk.flow.storepromo.model.b bVar, String str, g gVar, int i5) {
        this.f28354b = bVar;
        this.f28355c = str;
        this.f28353a = gVar;
        this.f28356d = i5;
    }
}
