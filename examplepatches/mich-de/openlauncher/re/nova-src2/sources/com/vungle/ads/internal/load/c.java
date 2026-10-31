package com.vungle.ads.internal.load;

import com.vungle.ads.AssetRequestError;
import com.vungle.ads.NativeAssetError;
import com.vungle.ads.PrivacyIconFallbackError;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import java.io.File;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;

/* loaded from: classes4.dex */
public final class c implements com.vungle.ads.internal.downloader.e {

    /* renamed from: a, reason: collision with root package name */
    public boolean f46876a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i f46877b;

    public c(i iVar) {
        this.f46877b = iVar;
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(com.vungle.ads.internal.downloader.l downloadRequest) {
        Intrinsics.g(downloadRequest, "downloadRequest");
        boolean z11 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onStart called: ");
        sbA.append(downloadRequest.a().h());
        t.c("BaseAdLoader", sbA.toString());
        downloadRequest.f();
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(com.vungle.ads.internal.downloader.d progress, com.vungle.ads.internal.downloader.l downloadRequest) throws Throwable {
        Intrinsics.g(progress, "progress");
        Intrinsics.g(downloadRequest, "downloadRequest");
        com.vungle.ads.internal.model.b bVarA = downloadRequest.a();
        Integer numE = bVarA.e();
        boolean z11 = u.f47714a;
        t.a("BaseAdLoader", "Download progress: " + progress + " url: " + bVarA.h());
        if (this.f46876a || numE == null || progress.a() < numE.intValue()) {
            return;
        }
        this.f46876a = true;
        if (new IntRange(1, 99, 1).g(numE.intValue())) {
            downloadRequest.h();
        }
        t.c("BaseAdLoader", "Download progress: hit chunk percentage=" + numE + " for url: " + bVarA.h());
        if (bVarA.o()) {
            ((com.vungle.ads.internal.executor.d) this.f46877b.g()).b().execute(new ae.c(26, this.f46877b, bVarA));
        }
    }

    public static final void a(i this$0, com.vungle.ads.internal.model.b adAsset) {
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(adAsset, "$adAsset");
        this$0.f46896j.remove(adAsset.h());
        if (this$0.f46896j.isEmpty()) {
            if (this$0.f46902r.get()) {
                i.h(this$0);
            } else {
                this$0.a();
                this$0.a(new AssetRequestError("Failed to download required assets."));
            }
        }
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(com.vungle.ads.internal.downloader.c cVar, com.vungle.ads.internal.downloader.l downloadRequest) {
        Intrinsics.g(downloadRequest, "downloadRequest");
        boolean z11 = u.f47714a;
        t.b("BaseAdLoader", "onError called: " + cVar);
        ((com.vungle.ads.internal.executor.d) this.f46877b.g()).b().execute(new c40.e(downloadRequest, this.f46877b, this, cVar, 3));
    }

    public static final void a(com.vungle.ads.internal.downloader.l downloadRequest, i this$0, c this$1, com.vungle.ads.internal.downloader.c cVar) {
        Intrinsics.g(downloadRequest, "$downloadRequest");
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(this$1, "this$1");
        com.vungle.ads.internal.model.b bVarA = downloadRequest.a();
        if (bVarA.n()) {
            File fileB = com.vungle.ads.internal.downloader.j.b(this$0.f().getVmDir());
            if (fileB != null && fileB.exists()) {
                this$1.a(fileB, downloadRequest);
                return;
            }
            new PrivacyIconFallbackError("Failed to inject default privacy icon").setLogEntry$vungle_ads_release(this$0.e()).logErrorNoReturnValue$vungle_ads_release();
        } else if (bVarA.i()) {
            File fileA = com.vungle.ads.internal.downloader.j.a(this$0.f().getVmDir());
            if (fileA != null && fileA.exists()) {
                this$1.a(fileA, downloadRequest);
                return;
            }
            new NativeAssetError("Failed to inject default AI label").setLogEntry$vungle_ads_release(this$0.e()).logErrorNoReturnValue$vungle_ads_release();
        }
        bVarA.a(com.vungle.ads.internal.model.a.DOWNLOAD_FAILED);
        this$0.f46901q.set(false);
        if (bVarA.o()) {
            this$0.f46902r.set(false);
        }
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to download assets ");
        sbA.append(bVarA.h());
        sbA.append(". error: ");
        sbA.append(cVar);
        sbA.append(" errorType=");
        sbA.append(com.vungle.ads.internal.platform.e.a(cVar != null ? cVar.a() : null));
        sbA.append(" proxyEnabled=");
        sbA.append(com.vungle.ads.internal.platform.e.e(this$0.d()));
        sbA.append(" privateDns=");
        sbA.append(com.vungle.ads.internal.platform.e.b(this$0.d()));
        sbA.append(" network=");
        sbA.append(com.vungle.ads.internal.platform.e.a(this$0.d()));
        new AssetRequestError(sbA.toString()).setLogEntry$vungle_ads_release(this$0.e()).logErrorNoReturnValue$vungle_ads_release();
        if (bVarA.o()) {
            this$0.f46896j.remove(downloadRequest.a().h());
            if (this$0.f46896j.isEmpty()) {
                this$0.a();
                this$0.a(new AssetRequestError("Error: Failed to download required assets."));
                return;
            }
        }
        if (this$0.f46895i.decrementAndGet() <= 0) {
            this$0.a(new AssetRequestError("Error: Failed to download assets."));
        }
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(File file, com.vungle.ads.internal.downloader.l downloadRequest) {
        Intrinsics.g(file, "file");
        Intrinsics.g(downloadRequest, "downloadRequest");
        ((com.vungle.ads.internal.executor.d) this.f46877b.g()).b().execute(new c40.e(file, this, downloadRequest, this.f46877b, 2));
    }

    public static final void a(File file, c this$0, com.vungle.ads.internal.downloader.l downloadRequest, i this$1) {
        Intrinsics.g(file, "$file");
        Intrinsics.g(this$0, "this$0");
        Intrinsics.g(downloadRequest, "$downloadRequest");
        Intrinsics.g(this$1, "this$1");
        if (!file.exists()) {
            this$0.a(new com.vungle.ads.internal.downloader.c(-1, new IOException("Downloaded file not found!"), 3), downloadRequest);
            return;
        }
        com.vungle.ads.internal.model.b bVarA = downloadRequest.a();
        bVarA.b(file.length());
        bVarA.a(com.vungle.ads.internal.model.a.DOWNLOAD_SUCCESS);
        Integer numE = bVarA.e();
        if (numE == null || numE.intValue() == 0 || numE.intValue() == 100) {
            downloadRequest.h();
        }
        if (bVarA.k()) {
            downloadRequest.i();
            this$1.f46905u.a(Long.valueOf(file.length()));
            AnalyticsClient.INSTANCE.a(this$1.f46905u, this$1.e(), bVarA.h());
        } else if (bVarA.m()) {
            this$1.f46904t.a(Long.valueOf(file.length()));
            AnalyticsClient.INSTANCE.a(this$1.f46904t, this$1.e(), bVarA.h());
        }
        i0 i0VarC = this$1.c();
        if (i0VarC != null) {
            i0VarC.a(file, bVarA.a());
        }
        if (bVarA.k() && !i.a(this$1, bVarA, this$1.c())) {
            this$1.f46901q.set(false);
            if (bVarA.o()) {
                this$1.f46902r.set(false);
            }
        }
        if (bVarA.o()) {
            this$1.f46896j.remove(bVarA.h());
            if (this$1.f46896j.isEmpty()) {
                if (this$1.f46902r.get()) {
                    i.h(this$1);
                } else {
                    this$1.a();
                    this$1.a(new AssetRequestError("Failed to download required assets."));
                    return;
                }
            }
        }
        if (this$1.f46895i.decrementAndGet() <= 0) {
            if (this$1.f46901q.get()) {
                i.a(this$1, this$1.b());
            } else {
                this$1.a(new AssetRequestError("Failed to download assets."));
            }
        }
    }
}
