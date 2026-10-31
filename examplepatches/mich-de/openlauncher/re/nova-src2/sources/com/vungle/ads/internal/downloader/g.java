package com.vungle.ads.internal.downloader;

import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.u;

/* loaded from: classes4.dex */
public final class g extends com.vungle.ads.internal.task.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ i f46775a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l f46776b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f46777c;

    public g(i iVar, l lVar, e eVar) {
        this.f46775a = iVar;
        this.f46776b = lVar;
        this.f46777c = eVar;
    }

    @Override // com.vungle.ads.internal.task.i
    public final int a() {
        return this.f46776b.f46788a.f46787a;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        i iVar = this.f46775a;
        l lVar = this.f46776b;
        e eVar = this.f46777c;
        if (eVar != null) {
            iVar.getClass();
            eVar.a(lVar);
        }
        c cVarB = iVar.b(lVar, eVar);
        while (true) {
            if (cVarB != null) {
                if (!lVar.f46792e.get()) {
                    Integer num = lVar.f46789b.f46932e;
                    if (num != null && num.intValue() < 100) {
                        boolean z11 = u.f47714a;
                        com.vungle.ads.internal.util.t.a("AssetDownloader", "Partial download asset (percentage=" + num + "), not retrying");
                        break;
                    }
                    if (lVar.f46793f.get() >= lVar.f46791d) {
                        boolean z12 = u.f47714a;
                        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Max retry attempts reached (");
                        sbA.append(lVar.f46791d);
                        sbA.append(')');
                        com.vungle.ads.internal.util.t.a("AssetDownloader", sbA.toString());
                        break;
                    }
                    if (!a.a(cVarB)) {
                        boolean z13 = u.f47714a;
                        StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Error reason ");
                        sbA2.append(cVarB.f46767c);
                        sbA2.append(" is not retryable");
                        com.vungle.ads.internal.util.t.a("AssetDownloader", sbA2.toString());
                        break;
                    }
                    lVar.f46793f.incrementAndGet();
                    lVar.a("Error: " + cVarB.f46766b.getMessage() + ", Code: " + cVarB.f46765a + ", Reason: " + cVarB.f46767c);
                    boolean z14 = u.f47714a;
                    StringBuilder sbA3 = com.iab.omid.library.vungle.internal.l.a("Download failed, retrying immediately. Attempt ");
                    sbA3.append(lVar.f46793f.get());
                    sbA3.append('/');
                    sbA3.append(lVar.f46791d);
                    sbA3.append(". URL: ");
                    sbA3.append(lVar.f46789b.f46929b);
                    sbA3.append(", Error: ");
                    sbA3.append(cVarB.f46766b.getMessage());
                    com.vungle.ads.internal.util.t.c("AssetDownloader", sbA3.toString());
                    cVarB = iVar.b(lVar, eVar);
                } else {
                    boolean z15 = u.f47714a;
                    com.vungle.ads.internal.util.t.a("AssetDownloader", "Download cancelled, not retrying");
                    break;
                }
            } else {
                break;
            }
        }
        if (cVarB != null) {
            boolean z16 = u.f47714a;
            StringBuilder sbA4 = com.iab.omid.library.vungle.internal.l.a("Download failed after ");
            sbA4.append(lVar.f46793f.get() + 1);
            sbA4.append(" attempts. URL: ");
            sbA4.append(lVar.f46789b.f46929b);
            sbA4.append(". Retry history: ");
            sbA4.append(lVar.d());
            com.vungle.ads.internal.util.t.b("AssetDownloader", sbA4.toString());
            if (lVar.f46793f.get() > 0) {
                AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                Sdk.SDKMetric.SDKMetricType sDKMetricType = Sdk.SDKMetric.SDKMetricType.ASSET_DOWNLOAD_RETRY_STATUS;
                com.vungle.ads.internal.util.s sVar = lVar.f46790c;
                StringBuilder sbA5 = com.iab.omid.library.vungle.internal.l.a("retryCount=");
                sbA5.append(lVar.f46793f.get());
                sbA5.append(" url=");
                sbA5.append(lVar.f46789b.f46929b);
                analyticsClient.c(sDKMetricType, 2L, sVar, sbA5.toString());
            }
            if (eVar != null) {
                eVar.a(cVarB, lVar);
            }
        }
        iVar.f46782d.remove(lVar);
    }
}
