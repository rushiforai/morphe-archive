package com.vungle.ads.internal;

import android.os.Build;
import com.vungle.ads.internal.network.VungleApiClient;
import com.vungle.ads.internal.protos.Sdk;
import java.util.concurrent.Executors;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(bv = {}, d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u0002\n\u0002\b\u0005\bÆ\u0002\u0018\u00002\u00020\u0001:\u0001\u0006B\t\b\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\b\u0010\u0003\u001a\u00020\u0002H\u0002¨\u0006\u0007"}, d2 = {"Lcom/vungle/ads/internal/AnalyticsClient;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "report", "<init>", "()V", "com/vungle/ads/internal/w", "vungle-ads_release"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class AnalyticsClient {

    /* renamed from: e, reason: collision with root package name */
    public static VungleApiClient f46709e;

    /* renamed from: f, reason: collision with root package name */
    public static com.vungle.ads.internal.executor.j f46710f;

    /* renamed from: g, reason: collision with root package name */
    public static boolean f46711g;

    @NotNull
    public static final AnalyticsClient INSTANCE = new AnalyticsClient();

    /* renamed from: a, reason: collision with root package name */
    public static final LinkedBlockingQueue f46705a = new LinkedBlockingQueue();

    /* renamed from: b, reason: collision with root package name */
    public static final LinkedBlockingQueue f46706b = new LinkedBlockingQueue();

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedBlockingQueue f46707c = new LinkedBlockingQueue();

    /* renamed from: d, reason: collision with root package name */
    public static final LinkedBlockingQueue f46708d = new LinkedBlockingQueue();

    /* renamed from: h, reason: collision with root package name */
    public static int f46712h = 2;

    /* renamed from: i, reason: collision with root package name */
    public static boolean f46713i = true;

    /* renamed from: j, reason: collision with root package name */
    public static final AtomicBoolean f46714j = new AtomicBoolean(false);

    private AnalyticsClient() {
    }

    public static void a(AnalyticsClient analyticsClient, q1 q1Var, com.vungle.ads.internal.util.s sVar) throws Throwable {
        analyticsClient.a(q1Var, sVar, q1Var.f46813b);
    }

    public static final void b(Sdk.SDKError.Reason reason, String message, com.vungle.ads.internal.util.s sVar) {
        Intrinsics.g(reason, "$reason");
        Intrinsics.g(message, "$message");
        AnalyticsClient analyticsClient = INSTANCE;
        synchronized (analyticsClient) {
            if (f46712h != 1) {
                try {
                    Sdk.SDKError.Builder builderA = a(reason, message, sVar);
                    LinkedBlockingQueue linkedBlockingQueue = f46705a;
                    linkedBlockingQueue.put(builderA);
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", new z(reason, message, builderA));
                    if (linkedBlockingQueue.size() >= 20) {
                        analyticsClient.report();
                    }
                } catch (Exception e3) {
                    boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", "Cannot logError", e3);
                }
            }
        }
    }

    private final synchronized void report() {
        VungleApiClient vungleApiClient;
        VungleApiClient vungleApiClient2;
        try {
            if (f46712h != 1) {
                LinkedBlockingQueue linkedBlockingQueue = f46705a;
                if (linkedBlockingQueue.size() > 0) {
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Sending ");
                    sbA.append(linkedBlockingQueue.size());
                    sbA.append(" errors");
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", sbA.toString());
                    LinkedBlockingQueue linkedBlockingQueue2 = new LinkedBlockingQueue();
                    linkedBlockingQueue.drainTo(linkedBlockingQueue2);
                    if (!linkedBlockingQueue2.isEmpty() && (vungleApiClient2 = f46709e) != null) {
                        vungleApiClient2.a(linkedBlockingQueue2, new x(linkedBlockingQueue2));
                    }
                }
            }
            if (f46711g) {
                LinkedBlockingQueue linkedBlockingQueue3 = f46706b;
                if (linkedBlockingQueue3.size() > 0) {
                    boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                    StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Sending ");
                    sbA2.append(linkedBlockingQueue3.size());
                    sbA2.append(" metrics");
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", sbA2.toString());
                    LinkedBlockingQueue linkedBlockingQueue4 = new LinkedBlockingQueue();
                    linkedBlockingQueue3.drainTo(linkedBlockingQueue4);
                    if (!linkedBlockingQueue4.isEmpty() && (vungleApiClient = f46709e) != null) {
                        vungleApiClient.a(linkedBlockingQueue4, new y(linkedBlockingQueue4));
                    }
                }
            }
        } finally {
        }
    }

    public final synchronized void c(Sdk.SDKError.Reason reason, String message, com.vungle.ads.internal.util.s sVar) {
        com.vungle.ads.internal.executor.j jVar;
        Intrinsics.g(reason, "reason");
        Intrinsics.g(message, "message");
        try {
            jVar = f46710f;
        } catch (Exception e3) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AnalyticsClient", "Cannot logError " + reason + ", " + message + ", " + sVar, e3);
        }
        if (jVar != null) {
            jVar.execute(new androidx.fragment.app.d(4, reason, message, sVar));
        } else {
            f46707c.put(a(reason, message, sVar));
        }
    }

    public final synchronized void a(VungleApiClient vungleApiClient, com.vungle.ads.internal.executor.j executor, int i5, boolean z11) {
        try {
            Intrinsics.g(vungleApiClient, "vungleApiClient");
            Intrinsics.g(executor, "executor");
            f46712h = t.a(i5);
            f46711g = z11;
            if (i5 == u.a(3)) {
                boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.u.f47714a = true;
            } else if (i5 == u.a(2) || i5 == u.a(1)) {
                boolean z13 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.u.f47714a = false;
            }
            f46709e = vungleApiClient;
            if (f46714j.getAndSet(true)) {
                boolean z14 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AnalyticsClient", "AnalyticsClient already initialized");
                return;
            }
            f46710f = executor;
            try {
                LinkedBlockingQueue linkedBlockingQueue = f46707c;
                if (!linkedBlockingQueue.isEmpty()) {
                    linkedBlockingQueue.drainTo(f46705a);
                }
            } catch (Exception e3) {
                boolean z15 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AnalyticsClient", "Failed to add pendingErrors to errors queue.", e3);
            }
            try {
                LinkedBlockingQueue linkedBlockingQueue2 = f46708d;
                if (!linkedBlockingQueue2.isEmpty()) {
                    linkedBlockingQueue2.drainTo(f46706b);
                }
            } catch (Exception e11) {
                boolean z16 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AnalyticsClient", "Failed to add pendingMetrics to metrics queue.", e11);
            }
            if (f46713i) {
                Executors.newSingleThreadScheduledExecutor().scheduleWithFixedDelay(new c40.b(executor, 0), 5000L, 5000L, TimeUnit.MILLISECONDS);
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void c(Sdk.SDKMetric.SDKMetricType metricType, long j11, com.vungle.ads.internal.util.s sVar, String str) {
        Sdk.SDKMetric.SDKMetricType sDKMetricType;
        long j12;
        com.vungle.ads.internal.util.s sVar2;
        String str2;
        com.vungle.ads.internal.executor.j jVar;
        Intrinsics.g(metricType, "metricType");
        try {
            jVar = f46710f;
        } catch (Exception e3) {
            e = e3;
            sDKMetricType = metricType;
            j12 = j11;
            sVar2 = sVar;
            str2 = str;
        }
        if (jVar == null) {
            f46708d.put(a(metricType, j11, sVar, str));
            return;
        }
        sDKMetricType = metricType;
        j12 = j11;
        sVar2 = sVar;
        str2 = str;
        try {
            jVar.execute(new c40.a(sDKMetricType, j12, sVar2, str2));
        } catch (Exception e11) {
            e = e11;
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("AnalyticsClient", "Cannot logMetric " + sDKMetricType + ", " + j12 + ", " + sVar2 + ", " + str2, e);
        }
    }

    public static final void b(Sdk.SDKMetric.SDKMetricType metricType, long j11, com.vungle.ads.internal.util.s sVar, String str) {
        Intrinsics.g(metricType, "$metricType");
        AnalyticsClient analyticsClient = INSTANCE;
        synchronized (analyticsClient) {
            if (f46711g) {
                try {
                    Sdk.SDKMetric.Builder builderA = a(metricType, j11, sVar, str);
                    LinkedBlockingQueue linkedBlockingQueue = f46706b;
                    linkedBlockingQueue.put(builderA);
                    boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", new a0(metricType, j11, sVar, builderA));
                    if (linkedBlockingQueue.size() >= 20) {
                        analyticsClient.report();
                    }
                } catch (Exception e3) {
                    boolean z12 = com.vungle.ads.internal.util.u.f47714a;
                    com.vungle.ads.internal.util.t.a("AnalyticsClient", "Cannot logMetrics", e3);
                }
            }
        }
    }

    public static final void a(com.vungle.ads.internal.executor.j executor) {
        Intrinsics.g(executor, "$executor");
        executor.execute(new a10.a(3));
    }

    public static final void a() {
        INSTANCE.report();
    }

    public static Sdk.SDKError.Builder a(Sdk.SDKError.Reason reason, String str, com.vungle.ads.internal.util.s sVar) {
        String strL;
        String strG;
        String strH;
        String strC;
        String strM;
        String strD;
        String string;
        String strI;
        Long lA;
        Boolean boolB;
        Boolean boolF;
        Boolean boolK;
        String strE;
        h hVarD;
        Sdk.SDKError.Builder builderNewBuilder = Sdk.SDKError.newBuilder();
        String str2 = Build.MANUFACTURER;
        Sdk.SDKError.Builder at2 = builderNewBuilder.setOs("Amazon".equals(str2) ? "amazon" : "android").setOsVersion(String.valueOf(Build.VERSION.SDK_INT)).setMake(str2).setModel(Build.MODEL).setReason(reason).setMessage(str).setAt(System.currentTimeMillis());
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (sVar == null || (strL = sVar.l()) == null) {
            strL = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder placementReferenceId = at2.setPlacementReferenceId(strL);
        if (sVar == null || (strG = sVar.g()) == null) {
            strG = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder creativeId = placementReferenceId.setCreativeId(strG);
        if (sVar == null || (strH = sVar.h()) == null) {
            strH = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder eventId = creativeId.setEventId(strH);
        if (sVar == null || (strC = sVar.c()) == null) {
            strC = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder adSource = eventId.setAdSource(strC);
        if (sVar == null || (strM = sVar.m()) == null) {
            strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder vmVersion = adSource.setVmVersion(strM);
        if (sVar == null || (strD = sVar.j()) == null) {
            strD = com.vungle.ads.internal.network.f0.d();
        }
        Sdk.SDKError.Builder mediationName = vmVersion.setMediationName(strD);
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        Sdk.SDKError.Builder appState = mediationName.setAppState(com.vungle.ads.internal.util.a.a() ? 0L : 2L);
        if (sVar == null || (hVarD = sVar.d()) == null || (string = hVarD.toString()) == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder adState = appState.setAdState(string);
        if (sVar == null || (strI = sVar.i()) == null) {
            strI = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKError.Builder experiments = adState.setExperiments(strI);
        if (sVar != null && (strE = sVar.e()) != null) {
            str3 = strE;
        }
        Sdk.SDKError.Builder adapterAdFormat = experiments.setAdapterAdFormat(str3);
        if (sVar != null && (boolK = sVar.k()) != null) {
            adapterAdFormat.setIsPartialDownloadEnabled(boolK.booleanValue());
        }
        if (sVar != null && (boolF = sVar.f()) != null) {
            adapterAdFormat.setIsAdoEnabled(boolF.booleanValue());
        }
        if (sVar != null && (boolB = sVar.b()) != null) {
            adapterAdFormat.setIsAdPodding(boolB.booleanValue());
        }
        if (sVar != null && (lA = sVar.a()) != null) {
            adapterAdFormat.setAdLoadType(lA.longValue());
        }
        Intrinsics.f(adapterAdFormat, "newBuilder()\n           …dType(it) }\n            }");
        return adapterAdFormat;
    }

    public static /* synthetic */ void a(AnalyticsClient analyticsClient, Sdk.SDKMetric.SDKMetricType sDKMetricType, long j11, com.vungle.ads.internal.util.s sVar, String str, int i5) {
        if ((i5 & 2) != 0) {
            j11 = 0;
        }
        analyticsClient.c(sDKMetricType, j11, (i5 & 4) != 0 ? null : sVar, (i5 & 8) != 0 ? null : str);
    }

    public static Sdk.SDKMetric.Builder a(Sdk.SDKMetric.SDKMetricType sDKMetricType, long j11, com.vungle.ads.internal.util.s sVar, String str) {
        String strL;
        String strG;
        String strH;
        String strD;
        String strC;
        String strM;
        String string;
        String strI;
        Long lA;
        Boolean boolB;
        Boolean boolF;
        Boolean boolK;
        String strE;
        h hVarD;
        Sdk.SDKMetric.Builder value = Sdk.SDKMetric.newBuilder().setType(sDKMetricType).setValue(j11);
        String str2 = Build.MANUFACTURER;
        Sdk.SDKMetric.Builder osVersion = value.setMake(str2).setModel(Build.MODEL).setOs("Amazon".equals(str2) ? "amazon" : "android").setOsVersion(String.valueOf(Build.VERSION.SDK_INT));
        String str3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (sVar == null || (strL = sVar.l()) == null) {
            strL = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder placementReferenceId = osVersion.setPlacementReferenceId(strL);
        if (sVar == null || (strG = sVar.g()) == null) {
            strG = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder creativeId = placementReferenceId.setCreativeId(strG);
        if (sVar == null || (strH = sVar.h()) == null) {
            strH = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder eventId = creativeId.setEventId(strH);
        if (str == null) {
            str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder meta = eventId.setMeta(str);
        if (sVar == null || (strD = sVar.j()) == null) {
            strD = com.vungle.ads.internal.network.f0.d();
        }
        Sdk.SDKMetric.Builder mediationName = meta.setMediationName(strD);
        if (sVar == null || (strC = sVar.c()) == null) {
            strC = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder adSource = mediationName.setAdSource(strC);
        if (sVar == null || (strM = sVar.m()) == null) {
            strM = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder vmVersion = adSource.setVmVersion(strM);
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        Sdk.SDKMetric.Builder appState = vmVersion.setAppState(com.vungle.ads.internal.util.a.a() ? 0L : 2L);
        if (sVar == null || (hVarD = sVar.d()) == null || (string = hVarD.toString()) == null) {
            string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder adState = appState.setAdState(string);
        if (sVar == null || (strI = sVar.i()) == null) {
            strI = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        Sdk.SDKMetric.Builder experiments = adState.setExperiments(strI);
        if (sVar != null && (strE = sVar.e()) != null) {
            str3 = strE;
        }
        Sdk.SDKMetric.Builder adapterAdFormat = experiments.setAdapterAdFormat(str3);
        if (sVar != null && (boolK = sVar.k()) != null) {
            adapterAdFormat.setIsPartialDownloadEnabled(boolK.booleanValue());
        }
        if (sVar != null && (boolF = sVar.f()) != null) {
            adapterAdFormat.setIsAdoEnabled(boolF.booleanValue());
        }
        if (sVar != null && (boolB = sVar.b()) != null) {
            adapterAdFormat.setIsAdPodding(boolB.booleanValue());
        }
        if (sVar != null && (lA = sVar.a()) != null) {
            adapterAdFormat.setAdLoadType(lA.longValue());
        }
        Intrinsics.f(adapterAdFormat, "newBuilder()\n           …dType(it) }\n            }");
        return adapterAdFormat;
    }

    public static void a(AnalyticsClient analyticsClient, k2 singleValueMetric, com.vungle.ads.internal.util.s sVar, int i5) {
        AnalyticsClient analyticsClient2;
        com.vungle.ads.internal.util.s sVar2 = (i5 & 2) != 0 ? null : sVar;
        String strA = (i5 & 4) != 0 ? singleValueMetric.a() : null;
        synchronized (analyticsClient) {
            try {
                Intrinsics.g(singleValueMetric, "singleValueMetric");
                analyticsClient2 = analyticsClient;
                try {
                    analyticsClient2.c(singleValueMetric.b(), singleValueMetric.c(), sVar2, strA);
                } catch (Throwable th2) {
                    th = th2;
                    Throwable th3 = th;
                    throw th3;
                }
            } catch (Throwable th4) {
                th = th4;
                analyticsClient2 = analyticsClient;
            }
        }
    }

    public final synchronized void a(k2 singleValueMetric, com.vungle.ads.internal.util.s sVar, String str) {
        try {
            try {
                Intrinsics.g(singleValueMetric, "singleValueMetric");
                c(singleValueMetric.b(), singleValueMetric.c(), sVar, str);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public static void a(AnalyticsClient analyticsClient, p1 p1Var, com.vungle.ads.internal.util.s sVar) throws Throwable {
        AnalyticsClient analyticsClient2;
        String strA = p1Var.a();
        synchronized (analyticsClient) {
            try {
                if (p1Var.d()) {
                    analyticsClient2 = analyticsClient;
                } else {
                    try {
                        synchronized (analyticsClient) {
                            try {
                                analyticsClient2 = analyticsClient;
                                try {
                                    analyticsClient2.c(p1Var.b(), p1Var.c(), sVar, strA);
                                    p1Var.e();
                                } catch (Throwable th2) {
                                    th = th2;
                                    Throwable th3 = th;
                                    throw th3;
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                analyticsClient2 = analyticsClient;
                            }
                        }
                    } catch (Throwable th5) {
                        th = th5;
                        throw th;
                    }
                }
                return;
            } catch (Throwable th6) {
                th = th6;
            }
        }
        throw th;
    }

    public static void a(AnalyticsClient analyticsClient, l2 timeIntervalMetric, com.vungle.ads.internal.util.s sVar, int i5) throws Throwable {
        AnalyticsClient analyticsClient2;
        com.vungle.ads.internal.util.s sVar2 = (i5 & 2) != 0 ? null : sVar;
        String strA = (i5 & 4) != 0 ? timeIntervalMetric.a() : null;
        synchronized (analyticsClient) {
            try {
                Intrinsics.g(timeIntervalMetric, "timeIntervalMetric");
                analyticsClient2 = analyticsClient;
                try {
                    analyticsClient2.c(timeIntervalMetric.b(), timeIntervalMetric.c(), sVar2, strA);
                } catch (Throwable th2) {
                    th = th2;
                    Throwable th3 = th;
                    throw th3;
                }
            } catch (Throwable th4) {
                th = th4;
                analyticsClient2 = analyticsClient;
            }
        }
    }

    public final synchronized void a(l2 timeIntervalMetric, com.vungle.ads.internal.util.s sVar, String str) throws Throwable {
        try {
            try {
                Intrinsics.g(timeIntervalMetric, "timeIntervalMetric");
                c(timeIntervalMetric.b(), timeIntervalMetric.c(), sVar, str);
            } catch (Throwable th2) {
                th = th2;
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
            throw th;
        }
    }

    public final synchronized void a(q1 oneShotTimeIntervalMetric, com.vungle.ads.internal.util.s sVar, String str) throws Throwable {
        try {
            try {
                Intrinsics.g(oneShotTimeIntervalMetric, "oneShotTimeIntervalMetric");
                if (!oneShotTimeIntervalMetric.f()) {
                    synchronized (this) {
                        try {
                            try {
                                c(oneShotTimeIntervalMetric.b(), oneShotTimeIntervalMetric.c(), sVar, str);
                                oneShotTimeIntervalMetric.g();
                            } catch (Throwable th2) {
                                th = th2;
                                throw th;
                            }
                        } catch (Throwable th3) {
                            th = th3;
                        }
                    }
                }
            } catch (Throwable th4) {
                th = th4;
                throw th;
            }
        } catch (Throwable th5) {
            th = th5;
            throw th;
        }
    }
}
