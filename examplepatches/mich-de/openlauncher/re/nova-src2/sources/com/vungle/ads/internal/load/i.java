package com.vungle.ads.internal.load;

import aa.x;
import android.content.Context;
import android.webkit.URLUtil;
import com.vungle.ads.AdExpiredError;
import com.vungle.ads.AdPayloadError;
import com.vungle.ads.AdResponseEmptyError;
import com.vungle.ads.AssetWriteError;
import com.vungle.ads.InvalidAssetUrlError;
import com.vungle.ads.InvalidEventIdError;
import com.vungle.ads.InvalidTemplateURLError;
import com.vungle.ads.NativeAssetError;
import com.vungle.ads.OmSdkJsError;
import com.vungle.ads.PlacementMismatchError;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.ConfigManager;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.l2;
import com.vungle.ads.internal.model.i0;
import com.vungle.ads.internal.model.v;
import com.vungle.ads.internal.model.w2;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.presenter.f0;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.q0;
import com.vungle.ads.internal.task.r;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.s;
import com.vungle.ads.internal.util.t;
import com.vungle.ads.internal.util.u;
import h6.c1;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class i {
    public long A;

    /* renamed from: a, reason: collision with root package name */
    public final Context f46887a;

    /* renamed from: b, reason: collision with root package name */
    public final VungleApiClient f46888b;

    /* renamed from: c, reason: collision with root package name */
    public final com.vungle.ads.internal.executor.a f46889c;

    /* renamed from: d, reason: collision with root package name */
    public final com.vungle.ads.internal.omsdk.c f46890d;

    /* renamed from: e, reason: collision with root package name */
    public final com.vungle.ads.internal.downloader.n f46891e;

    /* renamed from: f, reason: collision with root package name */
    public final PathProvider f46892f;

    /* renamed from: g, reason: collision with root package name */
    public final b f46893g;

    /* renamed from: h, reason: collision with root package name */
    public final Lazy f46894h;

    /* renamed from: i, reason: collision with root package name */
    public final AtomicLong f46895i;

    /* renamed from: j, reason: collision with root package name */
    public final LinkedHashSet f46896j;

    /* renamed from: k, reason: collision with root package name */
    public a f46897k;

    /* renamed from: l, reason: collision with root package name */
    public final AtomicBoolean f46898l;

    /* renamed from: m, reason: collision with root package name */
    public AtomicBoolean f46899m;
    public AtomicBoolean n;
    public final ArrayList o;

    /* renamed from: p, reason: collision with root package name */
    public i0 f46900p;

    /* renamed from: q, reason: collision with root package name */
    public AtomicBoolean f46901q;

    /* renamed from: r, reason: collision with root package name */
    public AtomicBoolean f46902r;

    /* renamed from: s, reason: collision with root package name */
    public final l2 f46903s;

    /* renamed from: t, reason: collision with root package name */
    public k2 f46904t;

    /* renamed from: u, reason: collision with root package name */
    public k2 f46905u;

    /* renamed from: v, reason: collision with root package name */
    public l2 f46906v;

    /* renamed from: w, reason: collision with root package name */
    public l2 f46907w;

    /* renamed from: x, reason: collision with root package name */
    public l2 f46908x;

    /* renamed from: y, reason: collision with root package name */
    public l2 f46909y;

    /* renamed from: z, reason: collision with root package name */
    public s f46910z;

    public i(Context context, VungleApiClient vungleApiClient, com.vungle.ads.internal.executor.d sdkExecutors, com.vungle.ads.internal.omsdk.c omInjector, com.vungle.ads.internal.downloader.n downloader, PathProvider pathProvider, b adRequest) {
        Intrinsics.g(context, "context");
        Intrinsics.g(vungleApiClient, "vungleApiClient");
        Intrinsics.g(sdkExecutors, "sdkExecutors");
        Intrinsics.g(omInjector, "omInjector");
        Intrinsics.g(downloader, "downloader");
        Intrinsics.g(pathProvider, "pathProvider");
        Intrinsics.g(adRequest, "adRequest");
        this.f46887a = context;
        this.f46888b = vungleApiClient;
        this.f46889c = sdkExecutors;
        this.f46890d = omInjector;
        this.f46891e = downloader;
        this.f46892f = pathProvider;
        this.f46893g = adRequest;
        this.f46894h = LazyKt.b(LazyThreadSafetyMode.f71679a, new h(context));
        this.f46895i = new AtomicLong(0L);
        this.f46896j = new LinkedHashSet();
        this.f46898l = new AtomicBoolean(false);
        this.f46899m = new AtomicBoolean(false);
        this.n = new AtomicBoolean(false);
        this.o = new ArrayList();
        this.f46901q = new AtomicBoolean(true);
        this.f46902r = new AtomicBoolean(true);
        this.f46903s = new l2(Sdk.SDKMetric.SDKMetricType.AD_REQUEST_TO_RESPONSE_DURATION_MS);
        this.f46904t = new k2(Sdk.SDKMetric.SDKMetricType.ASSET_FILE_SIZE);
        this.f46905u = new k2(Sdk.SDKMetric.SDKMetricType.TEMPLATE_HTML_SIZE);
        this.f46906v = new l2(Sdk.SDKMetric.SDKMetricType.ASSET_DOWNLOAD_DURATION_MS);
        this.f46907w = new l2(Sdk.SDKMetric.SDKMetricType.AD_REQUIRED_DOWNLOAD_DURATION_MS);
        this.f46908x = new l2(Sdk.SDKMetric.SDKMetricType.AD_OPTIONAL_DOWNLOAD_DURATION_MS);
        this.f46909y = new l2(Sdk.SDKMetric.SDKMetricType.AD_PRELOAD_TO_READY_DURATION_MS);
    }

    public static final void i(i this$0) {
        Intrinsics.g(this$0, "this$0");
        this$0.f46903s.e();
        this$0.k();
    }

    public final VungleApiClient h() {
        return this.f46888b;
    }

    public abstract void i();

    public final void j() {
        i0 i0Var = this.f46900p;
        if (i0Var == null || this.n.get() || !this.f46899m.compareAndSet(false, true)) {
            return;
        }
        if (i0Var.H()) {
            this.f46909y.e();
            String strValueOf = String.valueOf(i0Var.p());
            boolean z11 = u.f47714a;
            t.c("BaseAdLoader", "start preloading");
            long jCurrentTimeMillis = System.currentTimeMillis() - this.A;
            ReentrantLock reentrantLock = f0.f47373a;
            f0.a(this.f46887a, i0Var, this.f46893g.c(), strValueOf, i0Var.v(), new f(this, i0Var), Long.valueOf(jCurrentTimeMillis));
        } else {
            i();
            a aVar = this.f46897k;
            if (aVar != null) {
                aVar.onSuccess(i0Var);
            }
        }
        ((r) ((com.vungle.ads.internal.task.g) LazyKt.b(LazyThreadSafetyMode.f71679a, new g(this.f46887a)).getValue())).a(com.vungle.ads.internal.task.j.a());
    }

    public abstract void k();

    public static final void a(i iVar, b bVar) throws Throwable {
        iVar.getClass();
        boolean z11 = u.f47714a;
        t.a("BaseAdLoader", "All download completed " + bVar);
        i0 i0Var = iVar.f46900p;
        if (i0Var != null) {
            i0Var.f47050f = true;
        }
        iVar.j();
        iVar.f46906v.d();
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        AnalyticsClient.a(analyticsClient, iVar.f46906v, iVar.f46910z, 4);
        iVar.f46908x.d();
        AnalyticsClient.a(analyticsClient, iVar.f46908x, iVar.f46910z, 4);
    }

    public static final void h(i iVar) throws Throwable {
        iVar.f46907w.d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, iVar.f46907w, iVar.f46910z, 4);
        iVar.j();
    }

    public final b b() {
        return this.f46893g;
    }

    public final i0 c() {
        return this.f46900p;
    }

    public final Context d() {
        return this.f46887a;
    }

    public final s e() {
        return this.f46910z;
    }

    public final PathProvider f() {
        return this.f46892f;
    }

    public final com.vungle.ads.internal.executor.a g() {
        return this.f46889c;
    }

    public static final boolean a(i iVar, com.vungle.ads.internal.model.b bVar, i0 i0Var) {
        iVar.getClass();
        if (i0Var != null && bVar.j() && bVar.f46930c.length() != 0) {
            File file = new File(bVar.f46930c);
            if (file.exists() && file.length() == bVar.f46935h) {
                File fileB = iVar.f46892f.b(i0Var.h());
                if (fileB != null && fileB.isDirectory()) {
                    com.vungle.ads.internal.util.m mVar = com.vungle.ads.internal.util.n.f47696a;
                    return true;
                }
                boolean z11 = u.f47714a;
                t.b("BaseAdLoader", "Unable to access Destination Directory");
            }
        }
        return false;
    }

    public final void a(s sVar) {
        this.f46910z = sVar;
    }

    public final void a(com.vungle.ads.internal.s adLoaderCallback) {
        Intrinsics.g(adLoaderCallback, "adLoaderCallback");
        this.f46897k = adLoaderCallback;
        this.A = System.currentTimeMillis();
        ((com.vungle.ads.internal.executor.d) this.f46889c).b().execute(new x(this, 23));
    }

    public final void a() {
        this.f46898l.set(true);
        ((com.vungle.ads.internal.downloader.i) this.f46891e).a();
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x007f  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0089  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0096 A[EDGE_INSN: B:54:0x0096->B:40:0x0096 BREAK  A[LOOP:1: B:35:0x0083->B:56:?], SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(VungleError error) {
        boolean z11;
        Iterator it;
        Intrinsics.g(error, "error");
        if (this.f46899m.get()) {
            return;
        }
        boolean z12 = true;
        if (this.n.compareAndSet(false, true)) {
            i0 i0Var = this.f46900p;
            if (i0Var != null && i0Var.A()) {
                ArrayList arrayList = this.o;
                ArrayList arrayList2 = new ArrayList();
                ArrayList arrayList3 = new ArrayList();
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    Object next = it2.next();
                    if (((com.vungle.ads.internal.model.b) next).l()) {
                        arrayList2.add(next);
                    } else {
                        arrayList3.add(next);
                    }
                }
                ArrayList arrayList4 = arrayList2;
                ArrayList arrayList5 = arrayList3;
                if (!(arrayList4 instanceof Collection) || !arrayList4.isEmpty()) {
                    Iterator it3 = arrayList4.iterator();
                    while (it3.hasNext()) {
                        if (((com.vungle.ads.internal.model.b) it3.next()).j()) {
                            z11 = true;
                            break;
                        }
                    }
                    z11 = false;
                    if ((arrayList5 instanceof Collection) || !arrayList5.isEmpty()) {
                        it = arrayList5.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                break;
                            } else if (!((com.vungle.ads.internal.model.b) it.next()).j()) {
                                z12 = false;
                                break;
                            }
                        }
                    }
                    if (z11 && z12) {
                        this.n.set(false);
                        j();
                        return;
                    }
                } else {
                    z11 = false;
                    if (arrayList5 instanceof Collection) {
                        it = arrayList5.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                            }
                        }
                        if (z11) {
                            this.n.set(false);
                            j();
                            return;
                        }
                    }
                }
            }
            a aVar = this.f46897k;
            if (aVar != null) {
                aVar.onFailure(error);
            }
        }
    }

    public final void a(i0 advertisement, k2 k2Var) throws Throwable {
        com.vungle.ads.internal.downloader.k kVar;
        com.vungle.ads.internal.model.i iVarC;
        Integer numF;
        List listE;
        Intrinsics.g(advertisement, "advertisement");
        this.f46900p = advertisement;
        advertisement.E();
        advertisement.a(this.f46910z);
        s sVar = this.f46910z;
        if (sVar != null) {
            sVar.d(advertisement.h());
        }
        s sVar2 = this.f46910z;
        if (sVar2 != null) {
            sVar2.c(advertisement.n());
        }
        s sVar3 = this.f46910z;
        if (sVar3 != null) {
            sVar3.b(advertisement.l());
        }
        s sVar4 = this.f46910z;
        if (sVar4 != null) {
            sVar4.f(advertisement.t());
        }
        s sVar5 = this.f46910z;
        if (sVar5 != null) {
            sVar5.h(advertisement.u());
        }
        s sVar6 = this.f46910z;
        if (sVar6 != null) {
            sVar6.c(Boolean.valueOf(advertisement.B()));
        }
        s sVar7 = this.f46910z;
        if (sVar7 != null) {
            sVar7.b(Boolean.valueOf(advertisement.b()));
        }
        s sVar8 = this.f46910z;
        if (sVar8 != null) {
            sVar8.a(Boolean.valueOf(advertisement.y()));
        }
        s sVar9 = this.f46910z;
        if (sVar9 != null) {
            sVar9.e(advertisement.o());
        }
        this.f46903s.d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f46903s, this.f46910z, 4);
        w2 w2VarF = advertisement.f();
        if (w2VarF != null) {
            ConfigManager.INSTANCE.a(this.f46887a, w2VarF, q0.AD_RESPONSE, k2Var);
        }
        VungleError vungleErrorA = a(advertisement);
        if (vungleErrorA != null) {
            a(vungleErrorA.setLogEntry$vungle_ads_release(this.f46910z).logError$vungle_ads_release());
            return;
        }
        File fileB = this.f46892f.b(advertisement.h());
        if (fileB != null && fileB.isDirectory() && fileB.exists()) {
            i0 i0Var = this.f46900p;
            if (i0Var != null && i0Var.C()) {
                try {
                    this.f46890d.b();
                    this.f46890d.a(this.f46892f.getVmDir());
                } catch (Exception e3) {
                    boolean z11 = u.f47714a;
                    StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Failed to inject OMSDK: ");
                    sbA.append(e3.getMessage());
                    t.b("BaseAdLoader", sbA.toString());
                    new OmSdkJsError(Sdk.SDKError.Reason.OMSDK_JS_WRITE_FAILED, c1.s(e3, com.iab.omid.library.vungle.internal.l.a("Failed to inject OMSDK: "))).setLogEntry$vungle_ads_release(this.f46910z).logErrorNoReturnValue$vungle_ads_release();
                }
            }
            Lazy lazyB = LazyKt.b(LazyThreadSafetyMode.f71679a, new e(this.f46887a));
            com.vungle.ads.internal.model.i iVarC2 = advertisement.c();
            if (iVarC2 != null && (listE = iVarC2.e()) != null) {
                Iterator it = listE.iterator();
                while (it.hasNext()) {
                    ((com.vungle.ads.internal.network.r) lazyB.getValue()).a(new com.vungle.ads.internal.network.p((String) it.next()).b("load_ad").a(this.f46910z).a(), false);
                }
            }
            if (!this.o.isEmpty()) {
                this.o.clear();
            }
            this.o.addAll(advertisement.a(fileB));
            if (this.o.isEmpty()) {
                advertisement.F();
                this.f46906v.e();
                this.f46906v.d();
                AnalyticsClient.a(AnalyticsClient.INSTANCE, this.f46906v, this.f46910z, 4);
                j();
                return;
            }
            this.f46906v.e();
            this.f46907w.e();
            this.f46908x.e();
            this.f46895i.set(this.o.size());
            i0 i0Var2 = this.f46900p;
            int iIntValue = (i0Var2 == null || (iVarC = i0Var2.c()) == null || (numF = iVarC.f()) == null) ? 0 : numF.intValue();
            if (iIntValue > 5) {
                iIntValue = 5;
            }
            Iterator it2 = this.o.iterator();
            while (it2.hasNext()) {
                com.vungle.ads.internal.model.b bVar = (com.vungle.ads.internal.model.b) it2.next();
                if (bVar.o()) {
                    this.f46896j.add(bVar.h());
                }
            }
            Iterator it3 = this.o.iterator();
            while (it3.hasNext()) {
                com.vungle.ads.internal.model.b bVar2 = (com.vungle.ads.internal.model.b) it3.next();
                if (bVar2.f46931d) {
                    kVar = com.vungle.ads.internal.downloader.k.CRITICAL;
                } else {
                    kVar = com.vungle.ads.internal.downloader.k.HIGHEST;
                }
                com.vungle.ads.internal.downloader.l lVar = new com.vungle.ads.internal.downloader.l(kVar, bVar2, this.f46910z, iIntValue);
                if (bVar2.k()) {
                    lVar.g();
                    c cVar = new c(this);
                    String strH = bVar2.h();
                    com.vungle.ads.internal.downloader.t.a((com.vungle.ads.internal.downloader.t) this.f46894h.getValue(), strH, bVar2.c(), new d(this, strH, cVar, lVar));
                } else {
                    ((com.vungle.ads.internal.downloader.i) this.f46891e).a(lVar, new c(this));
                }
            }
            return;
        }
        a(new AssetWriteError(c1.q(fileB, "Invalid directory. ")).setLogEntry$vungle_ads_release(this.f46910z).logError$vungle_ads_release());
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x0169  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0126  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public VungleError a(i0 adPayload) {
        VungleError invalidTemplateURLError;
        com.vungle.ads.internal.model.o oVar;
        com.vungle.ads.internal.model.o oVar2;
        Intrinsics.g(adPayload, "adPayload");
        com.vungle.ads.internal.model.i iVarC = adPayload.c();
        if (iVarC != null && iVarC.i() != null) {
            com.vungle.ads.internal.model.i iVarC2 = adPayload.c();
            Integer numB = iVarC2 != null ? iVarC2.b() : null;
            com.vungle.ads.internal.model.i iVarC3 = adPayload.c();
            Integer numI = iVarC3 != null ? iVarC3.i() : null;
            com.vungle.ads.internal.model.i iVarC4 = adPayload.c();
            String str = "Response error: " + numI + ", Request failed with error: " + numB + ", " + (iVarC4 != null ? iVarC4.d() : null);
            if ((numB != null && numB.intValue() == 10001) || ((numB != null && numB.intValue() == 10002) || ((numB != null && numB.intValue() == 20001) || ((numB != null && numB.intValue() == 30001) || (numB != null && numB.intValue() == 30002))))) {
                Sdk.SDKError.Reason reasonForNumber = Sdk.SDKError.Reason.forNumber(numB.intValue());
                Intrinsics.f(reasonForNumber, "forNumber(errorCode)");
                return new AdPayloadError(reasonForNumber, str);
            }
            return new AdPayloadError(Sdk.SDKError.Reason.PLACEMENT_SLEEP, str);
        }
        String strB = this.f46893g.c().b();
        i0 i0Var = this.f46900p;
        if (!Intrinsics.b(strB, i0Var != null ? i0Var.D() : null)) {
            StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Waterfall request and responses placement don't match ");
            i0 i0Var2 = this.f46900p;
            return new PlacementMismatchError(c1.t(sbA, i0Var2 != null ? i0Var2.D() : null, '.'));
        }
        com.vungle.ads.internal.model.i iVarK = adPayload.k();
        v vVar = iVarK != null ? iVarK.f47039u : null;
        if (vVar == null) {
            invalidTemplateURLError = new AdResponseEmptyError("Missing template settings");
        } else {
            Map map = vVar.f47165b;
            if (adPayload.A()) {
                if (((map == null || (oVar2 = (com.vungle.ads.internal.model.o) map.get("MAIN_IMAGE")) == null) ? null : oVar2.f47102a) == null) {
                    if (((map == null || (oVar = (com.vungle.ads.internal.model.o) map.get("MAIN_VIDEO")) == null) ? null : oVar.f47102a) == null) {
                        invalidTemplateURLError = new NativeAssetError("Unable to load null main asset.");
                    }
                } else {
                    com.vungle.ads.internal.model.o oVar3 = (com.vungle.ads.internal.model.o) map.get("VUNGLE_PRIVACY_ICON_URL");
                    if ((oVar3 != null ? oVar3.f47102a : null) == null) {
                        invalidTemplateURLError = new NativeAssetError("Unable to load null privacy image.");
                    } else if (map != null) {
                        for (Map.Entry entry : map.entrySet()) {
                            String str2 = ((com.vungle.ads.internal.model.o) entry.getValue()).f47102a;
                            if (str2 != null && str2.length() != 0) {
                                if (str2 == null || str2.length() == 0 || (!URLUtil.isHttpsUrl(str2) && !URLUtil.isHttpUrl(str2))) {
                                    invalidTemplateURLError = new InvalidAssetUrlError(com.iab.omid.library.vungle.d.a("Invalid asset URL ", str2));
                                    break;
                                }
                            } else {
                                StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("None asset URL for ");
                                sbA2.append((String) entry.getKey());
                                invalidTemplateURLError = new InvalidAssetUrlError(sbA2.toString());
                                break;
                            }
                        }
                        invalidTemplateURLError = null;
                    } else {
                        invalidTemplateURLError = null;
                    }
                }
            } else {
                com.vungle.ads.internal.model.i iVarK2 = adPayload.k();
                String str3 = iVarK2 != null ? iVarK2.n : null;
                if (str3 != null && str3.length() != 0) {
                    if (str3 == null || str3.length() == 0 || (!URLUtil.isHttpsUrl(str3) && !URLUtil.isHttpUrl(str3))) {
                        invalidTemplateURLError = new InvalidTemplateURLError(com.iab.omid.library.vungle.d.a("Failed to load vm url: ", str3));
                    }
                } else {
                    invalidTemplateURLError = new InvalidTemplateURLError("Failed to prepare null vmURL for downloading.");
                }
            }
        }
        if (invalidTemplateURLError != null) {
            return invalidTemplateURLError;
        }
        if (adPayload.x()) {
            StringBuilder sbA3 = com.iab.omid.library.vungle.internal.l.a("The ad markup has expired for playback. Ad expiry: ");
            com.vungle.ads.internal.model.i iVarC5 = adPayload.c();
            sbA3.append(iVarC5 != null ? iVarC5.c() : null);
            sbA3.append(", device: ");
            sbA3.append(System.currentTimeMillis());
            return new AdExpiredError(sbA3.toString());
        }
        String strH = adPayload.h();
        if (strH == null || strH.length() == 0) {
            return new InvalidEventIdError("Event id is invalid.");
        }
        return null;
    }
}
