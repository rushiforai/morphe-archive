package com.vungle.ads.internal.downloader;

import b.u4;
import com.vungle.ads.AssetWriteError;
import com.vungle.ads.InvalidAssetUrlError;
import com.vungle.ads.NoSpaceError;
import com.vungle.ads.OutOfMemory;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.k2;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.u;
import java.io.File;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import m90.c0;
import x80.e0;
import x80.g0;
import x80.m0;
import x80.p0;

/* loaded from: classes4.dex */
public final class i implements n {

    /* renamed from: a, reason: collision with root package name */
    public final com.vungle.ads.internal.executor.j f46779a;

    /* renamed from: b, reason: collision with root package name */
    public final PathProvider f46780b;

    /* renamed from: c, reason: collision with root package name */
    public final Lazy f46781c;

    /* renamed from: d, reason: collision with root package name */
    public final CopyOnWriteArrayList f46782d;

    public i(com.vungle.ads.internal.executor.j downloadExecutor, PathProvider pathProvider) {
        Intrinsics.g(downloadExecutor, "downloadExecutor");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f46779a = downloadExecutor;
        this.f46780b = pathProvider;
        this.f46781c = LazyKt.a(new h(this));
        this.f46782d = new CopyOnWriteArrayList();
    }

    public final void a(l lVar, e eVar) {
        this.f46782d.add(lVar);
        this.f46779a.a(new g(this, lVar, eVar), new androidx.fragment.app.d(11, this, lVar, eVar));
    }

    /* JADX WARN: Code restructure failed: missing block: B:140:0x035c, code lost:
    
        r20.flush();
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x0364, code lost:
    
        if (r6.b() != 1) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x0366, code lost:
    
        r6.b(4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x036a, code lost:
    
        if (r30 == null) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x036c, code lost:
    
        r30.a(r6, r29);
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x036f, code lost:
    
        r0 = r15.f95559g;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x0371, code lost:
    
        if (r0 == null) goto L148;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x0373, code lost:
    
        r0.close();
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x0376, code lost:
    
        r14.cancel();
        com.vungle.ads.internal.util.n.a(r20);
        com.vungle.ads.internal.util.n.a(r13);
        r0 = com.vungle.ads.internal.util.u.f47714a;
        r0 = com.iab.omid.library.vungle.internal.l.a("download status: ");
        r0.append(r6.b());
        com.vungle.ads.internal.util.t.a("AssetDownloader", r0.toString());
        r5 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x025d, code lost:
    
        r20 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:93:0x0260, code lost:
    
        r6.b(3);
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:172:0x0408  */
    /* JADX WARN: Removed duplicated region for block: B:173:0x040b  */
    /* JADX WARN: Removed duplicated region for block: B:175:0x040e  */
    /* JADX WARN: Removed duplicated region for block: B:179:0x0419  */
    /* JADX WARN: Removed duplicated region for block: B:184:0x043f A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:188:0x0446  */
    /* JADX WARN: Removed duplicated region for block: B:191:0x045d  */
    /* JADX WARN: Removed duplicated region for block: B:202:0x04a3  */
    /* JADX WARN: Removed duplicated region for block: B:203:0x04a6  */
    /* JADX WARN: Removed duplicated region for block: B:205:0x04a9  */
    /* JADX WARN: Removed duplicated region for block: B:209:0x04b4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final c b(l lVar, e eVar) throws Throwable {
        c0 c0VarQ;
        m90.i iVarSource;
        b90.j jVarC;
        com.vungle.ads.internal.model.b bVar;
        int i5;
        m0 m0VarL;
        p0 p0Var;
        int iB;
        p0 p0Var2;
        int i11;
        long jContentLength;
        int i12;
        long j11;
        long j12;
        long j13;
        long j14;
        int i13;
        StringBuilder sb2;
        com.vungle.ads.internal.model.b bVarA = lVar.a();
        boolean z11 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("launch request in thread: ");
        sbA.append(Thread.currentThread().getId());
        sbA.append(" request: ");
        sbA.append(bVarA.h());
        com.vungle.ads.internal.util.t.a("AssetDownloader", sbA.toString());
        b90.j jVar = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        if (lVar.e()) {
            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Request ");
            sbA2.append(bVarA.h());
            sbA2.append(" is cancelled before starting");
            com.vungle.ads.internal.util.t.a("AssetDownloader", sbA2.toString());
            new d().b(3);
            return null;
        }
        d dVar = new d();
        dVar.c(System.currentTimeMillis());
        String strH = bVarA.h();
        String strC = bVarA.c();
        if (strH.length() == 0 || !com.vungle.ads.internal.util.n.a(strH)) {
            return new c(-1, new InvalidAssetUrlError(com.iab.omid.library.vungle.d.a("invalid url: ", strH)).setLogEntry$vungle_ads_release(lVar.c()).logError$vungle_ads_release(), 4);
        }
        if (strC.length() == 0) {
            return new c(-1, new AssetWriteError(com.iab.omid.library.vungle.d.a("invalid path: ", strC)).setLogEntry$vungle_ads_release(lVar.c()).logError$vungle_ads_release(), 3);
        }
        String absolutePath = this.f46780b.c().getAbsolutePath();
        Intrinsics.f(absolutePath, "pathProvider.getVungleDir().absolutePath");
        long jA = PathProvider.a(absolutePath);
        int i14 = 1;
        if (jA < 20971520) {
            new NoSpaceError(u4.g(jA, "Insufficient space ")).setLogEntry$vungle_ads_release(lVar.c()).logErrorNoReturnValue$vungle_ads_release();
            return new c(-1, new NoSpaceError(objArr2 == true ? 1 : 0, i14, objArr == true ? 1 : 0).setLogEntry$vungle_ads_release(lVar.c()).logError$vungle_ads_release(), 2);
        }
        File file = new File(strC);
        if (file.exists()) {
            StringBuilder sbA3 = com.iab.omid.library.vungle.internal.l.a("Deleting existing file before download: ");
            sbA3.append(file.getAbsolutePath());
            com.vungle.ads.internal.util.t.a("AssetDownloader", sbA3.toString());
            if (!file.delete()) {
                return new c(-1, new AssetWriteError("Cannot delete partial file for restart").setLogEntry$vungle_ads_release(lVar.c()).logError$vungle_ads_release(), 2);
            }
        }
        int i15 = -1;
        try {
            File parentFile = file.getParentFile();
            if (parentFile != null) {
                try {
                    if (!parentFile.exists()) {
                        parentFile.mkdirs();
                    }
                } catch (Exception e3) {
                    e = e3;
                    bVar = bVarA;
                    c0VarQ = null;
                    iVarSource = null;
                    m0VarL = null;
                    i5 = i15;
                    try {
                        boolean z12 = u.f47714a;
                        com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                        dVar.b(7);
                        c cVar = new c(i5, e, 1);
                        if ((m0VarL == null ? m0VarL.f95559g : null) != null) {
                        }
                        if (jVar != null) {
                        }
                        com.vungle.ads.internal.util.n.a(c0VarQ);
                        com.vungle.ads.internal.util.n.a(iVarSource);
                        com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                        iB = dVar.b();
                        if (iB == 7) {
                        }
                        return cVar;
                    } catch (Throwable th2) {
                        th = th2;
                        jVarC = jVar;
                        if ((m0VarL != null ? m0VarL.f95559g : null) != null) {
                            p0Var.close();
                            Unit unit = Unit.f71706a;
                        }
                        if (jVarC != null) {
                        }
                        com.vungle.ads.internal.util.n.a(c0VarQ);
                        com.vungle.ads.internal.util.n.a(iVarSource);
                        boolean z13 = u.f47714a;
                        StringBuilder sbA4 = com.iab.omid.library.vungle.internal.l.a("download status: ");
                        sbA4.append(dVar.b());
                        com.vungle.ads.internal.util.t.a("AssetDownloader", sbA4.toString());
                        throw th;
                    }
                } catch (Throwable th3) {
                    th = th3;
                    c0VarQ = null;
                    iVarSource = null;
                    jVarC = null;
                    m0VarL = null;
                    if ((m0VarL != null ? m0VarL.f95559g : null) != null) {
                    }
                    if (jVarC != null) {
                    }
                    com.vungle.ads.internal.util.n.a(c0VarQ);
                    com.vungle.ads.internal.util.n.a(iVarSource);
                    boolean z132 = u.f47714a;
                    StringBuilder sbA42 = com.iab.omid.library.vungle.internal.l.a("download status: ");
                    sbA42.append(dVar.b());
                    com.vungle.ads.internal.util.t.a("AssetDownloader", sbA42.toString());
                    throw th;
                }
            }
            g0 g0Var = new g0();
            g0Var.k(strH);
            jVarC = ((e0) this.f46781c.getValue()).c(g0Var.b());
        } catch (Exception e11) {
            e = e11;
            bVar = bVarA;
            i5 = -1;
            c0VarQ = null;
            jVar = null;
            iVarSource = null;
            m0VarL = null;
        } catch (Throwable th4) {
            th = th4;
            c0VarQ = null;
            iVarSource = null;
            jVarC = null;
        }
        try {
            m0VarL = jVarC.l();
            try {
                try {
                    i15 = m0VarL.f95556d;
                    try {
                        if (!m0VarL.c()) {
                            bVar = bVarA;
                            i11 = i15;
                            try {
                                throw new m(m0VarL.f95555c);
                            } catch (Exception e12) {
                                e = e12;
                                jVar = jVarC;
                                i5 = i11;
                                c0VarQ = null;
                                iVarSource = null;
                                boolean z122 = u.f47714a;
                                com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                                dVar.b(7);
                                c cVar2 = new c(i5, e, 1);
                                if ((m0VarL == null ? m0VarL.f95559g : null) != null) {
                                }
                                if (jVar != null) {
                                }
                                com.vungle.ads.internal.util.n.a(c0VarQ);
                                com.vungle.ads.internal.util.n.a(iVarSource);
                                com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                                iB = dVar.b();
                                if (iB == 7) {
                                }
                                return cVar2;
                            }
                        }
                        if (m0VarL.f95561i != null) {
                            AnalyticsClient.INSTANCE.a(new k2(Sdk.SDKMetric.SDKMetricType.CACHED_ASSETS_USED), lVar.c(), strH);
                            Unit unit2 = Unit.f71706a;
                        }
                        p0 p0VarA = a(m0VarL);
                        String strB = m0VarL.f95558f.b("Content-Type");
                        if (strB == null) {
                            strB = null;
                        }
                        if (strB != null) {
                            lVar.a().a(strB);
                            Unit unit3 = Unit.f71706a;
                        }
                        iVarSource = p0VarA != null ? p0VarA.source() : null;
                        try {
                            com.vungle.ads.internal.util.t.a("AssetDownloader", "Start download from url: " + strH + " mimeType=" + strB);
                            c0VarQ = x7.f.q(x7.f.T(file));
                            if (p0VarA != null) {
                                try {
                                    jContentLength = p0VarA.contentLength();
                                } catch (Exception e13) {
                                    e = e13;
                                    bVar = bVarA;
                                    jVar = jVarC;
                                    i5 = i15;
                                    boolean z1222 = u.f47714a;
                                    com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                                    dVar.b(7);
                                    c cVar22 = new c(i5, e, 1);
                                    if ((m0VarL == null ? m0VarL.f95559g : null) != null) {
                                    }
                                    if (jVar != null) {
                                    }
                                    com.vungle.ads.internal.util.n.a(c0VarQ);
                                    com.vungle.ads.internal.util.n.a(iVarSource);
                                    com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                                    iB = dVar.b();
                                    if (iB == 7) {
                                    }
                                    return cVar22;
                                } catch (Throwable th5) {
                                    th = th5;
                                    if ((m0VarL != null ? m0VarL.f95559g : null) != null) {
                                    }
                                    if (jVarC != null) {
                                    }
                                    com.vungle.ads.internal.util.n.a(c0VarQ);
                                    com.vungle.ads.internal.util.n.a(iVarSource);
                                    boolean z1322 = u.f47714a;
                                    StringBuilder sbA422 = com.iab.omid.library.vungle.internal.l.a("download status: ");
                                    sbA422.append(dVar.b());
                                    com.vungle.ads.internal.util.t.a("AssetDownloader", sbA422.toString());
                                    throw th;
                                }
                            } else {
                                jContentLength = 0;
                            }
                            try {
                                dVar.b(0);
                                dVar.b(jContentLength);
                                c0 c0Var = c0VarQ;
                                try {
                                    try {
                                        dVar.a(0L);
                                        dVar.a(0);
                                        bVarA.a(jContentLength);
                                        if (eVar != null) {
                                            try {
                                                eVar.a(dVar, lVar);
                                            } catch (Exception e14) {
                                                e = e14;
                                                bVar = bVarA;
                                                jVar = jVarC;
                                                c0VarQ = c0Var;
                                                i5 = i15;
                                                boolean z12222 = u.f47714a;
                                                com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                                                dVar.b(7);
                                                c cVar222 = new c(i5, e, 1);
                                                if ((m0VarL == null ? m0VarL.f95559g : null) != null && (p0Var2 = m0VarL.f95559g) != null) {
                                                    p0Var2.close();
                                                    Unit unit4 = Unit.f71706a;
                                                }
                                                if (jVar != null) {
                                                    jVar.cancel();
                                                    Unit unit5 = Unit.f71706a;
                                                }
                                                com.vungle.ads.internal.util.n.a(c0VarQ);
                                                com.vungle.ads.internal.util.n.a(iVarSource);
                                                com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                                                iB = dVar.b();
                                                if (iB == 7 || iB == 0) {
                                                    return cVar222;
                                                }
                                                if (iB != 3) {
                                                    com.vungle.ads.internal.util.t.a("AssetDownloader", "On cancel " + lVar);
                                                    if (eVar != null) {
                                                        eVar.a(dVar, lVar);
                                                    }
                                                } else {
                                                    com.vungle.ads.internal.util.t.a("AssetDownloader", "On success " + lVar);
                                                    if (eVar != null) {
                                                        eVar.a(file, lVar);
                                                    }
                                                    int iB2 = lVar.b();
                                                    if (iB2 > 0) {
                                                        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
                                                        Sdk.SDKMetric.SDKMetricType sDKMetricType = Sdk.SDKMetric.SDKMetricType.ASSET_DOWNLOAD_RETRY_STATUS;
                                                        com.vungle.ads.internal.util.s sVarC = lVar.c();
                                                        StringBuilder sbJ = u4.j(iB2, "retryCount=", " url=");
                                                        sbJ.append(lVar.a().h());
                                                        analyticsClient.c(sDKMetricType, 1L, sVarC, sbJ.toString());
                                                    }
                                                }
                                                return null;
                                            }
                                        }
                                        int i16 = 0;
                                        long j15 = 0;
                                        while (true) {
                                            if (iVarSource != null) {
                                                j11 = j15;
                                                c0VarQ = c0Var;
                                                j12 = jContentLength;
                                                j13 = iVarSource.read(c0VarQ.f76099b, 8192L);
                                            } else {
                                                j11 = j15;
                                                j12 = jContentLength;
                                                c0VarQ = c0Var;
                                                j13 = -1;
                                            }
                                            Unit unit6 = Unit.f71706a;
                                            if (j13 <= 0) {
                                                c0Var = c0VarQ;
                                                break;
                                            }
                                            if (lVar.e()) {
                                                break;
                                            }
                                            c0Var = c0VarQ;
                                            if (!file.exists()) {
                                                new AssetWriteError("Asset save error " + strH).setLogEntry$vungle_ads_release(lVar.c()).logErrorNoReturnValue$vungle_ads_release();
                                                throw new m("File is not existing");
                                            }
                                            dVar.b(1);
                                            c0Var.a();
                                            c0Var.flush();
                                            long j16 = j11 + j13;
                                            dVar.a(j16);
                                            Long lF = bVarA.f();
                                            long jLongValue = lF != null ? lF.longValue() : bVarA.g();
                                            if (!bVarA.p() || j16 < jLongValue) {
                                                bVar = bVarA;
                                                i12 = i15;
                                            } else {
                                                boolean z14 = u.f47714a;
                                                bVar = bVarA;
                                                try {
                                                    sb2 = new StringBuilder();
                                                    i12 = i15;
                                                } catch (Exception e15) {
                                                    e = e15;
                                                    i12 = i15;
                                                    jVar = jVarC;
                                                    c0VarQ = c0Var;
                                                    i5 = i12;
                                                    boolean z122222 = u.f47714a;
                                                    com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                                                    dVar.b(7);
                                                    c cVar2222 = new c(i5, e, 1);
                                                    if ((m0VarL == null ? m0VarL.f95559g : null) != null) {
                                                        p0Var2.close();
                                                        Unit unit42 = Unit.f71706a;
                                                    }
                                                    if (jVar != null) {
                                                    }
                                                    com.vungle.ads.internal.util.n.a(c0VarQ);
                                                    com.vungle.ads.internal.util.n.a(iVarSource);
                                                    com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                                                    iB = dVar.b();
                                                    if (iB == 7) {
                                                        if (iB != 3) {
                                                        }
                                                        return null;
                                                    }
                                                    return cVar2222;
                                                }
                                                try {
                                                    sb2.append("Downloader totalRead=");
                                                    sb2.append(j16);
                                                    sb2.append(" requiredBytes=");
                                                    sb2.append(jLongValue);
                                                    com.vungle.ads.internal.util.t.b("AssetDownloader", sb2.toString());
                                                    bVar.q();
                                                } catch (Exception e16) {
                                                    e = e16;
                                                    jVar = jVarC;
                                                    c0VarQ = c0Var;
                                                    i5 = i12;
                                                    boolean z1222222 = u.f47714a;
                                                    com.vungle.ads.internal.util.t.b("AssetDownloader", "Download exception for " + bVar.h() + ": " + e);
                                                    dVar.b(7);
                                                    c cVar22222 = new c(i5, e, 1);
                                                    if ((m0VarL == null ? m0VarL.f95559g : null) != null) {
                                                    }
                                                    if (jVar != null) {
                                                    }
                                                    com.vungle.ads.internal.util.n.a(c0VarQ);
                                                    com.vungle.ads.internal.util.n.a(iVarSource);
                                                    com.vungle.ads.internal.util.t.a("AssetDownloader", "download status: " + dVar.b());
                                                    iB = dVar.b();
                                                    if (iB == 7) {
                                                    }
                                                    return cVar22222;
                                                }
                                            }
                                            if (j12 > 0) {
                                                j14 = j16;
                                                i13 = (int) ((100 * j14) / j12);
                                            } else {
                                                j14 = j16;
                                                i13 = i16;
                                            }
                                            while (dVar.a() + 1 <= Math.min(i13, 100)) {
                                                dVar.b(1);
                                                dVar.a(dVar.a() + 1);
                                                if (dVar.a() >= 100) {
                                                    dVar.b(4);
                                                }
                                                if (eVar != null) {
                                                    eVar.a(dVar, lVar);
                                                }
                                            }
                                            i16 = i13;
                                            bVarA = bVar;
                                            i15 = i12;
                                            jContentLength = j12;
                                            j15 = j14;
                                        }
                                    } catch (Exception e17) {
                                        e = e17;
                                        bVar = bVarA;
                                    }
                                } catch (Throwable th6) {
                                    th = th6;
                                    c0VarQ = c0Var;
                                    if ((m0VarL != null ? m0VarL.f95559g : null) != null && (p0Var = m0VarL.f95559g) != null) {
                                        p0Var.close();
                                        Unit unit7 = Unit.f71706a;
                                    }
                                    if (jVarC != null) {
                                        jVarC.cancel();
                                        Unit unit8 = Unit.f71706a;
                                    }
                                    com.vungle.ads.internal.util.n.a(c0VarQ);
                                    com.vungle.ads.internal.util.n.a(iVarSource);
                                    boolean z13222 = u.f47714a;
                                    StringBuilder sbA4222 = com.iab.omid.library.vungle.internal.l.a("download status: ");
                                    sbA4222.append(dVar.b());
                                    com.vungle.ads.internal.util.t.a("AssetDownloader", sbA4222.toString());
                                    throw th;
                                }
                            } catch (Exception e18) {
                                e = e18;
                                bVar = bVarA;
                                i12 = i15;
                                jVar = jVarC;
                            } catch (Throwable th7) {
                                th = th7;
                            }
                        } catch (Exception e19) {
                            e = e19;
                            bVar = bVarA;
                            jVar = jVarC;
                            i5 = i15;
                            c0VarQ = null;
                        } catch (Throwable th8) {
                            th = th8;
                            c0VarQ = null;
                        }
                    } catch (Exception e21) {
                        e = e21;
                        bVar = bVarA;
                        i11 = i15;
                    }
                } catch (Exception e22) {
                    e = e22;
                    bVar = bVarA;
                    jVar = jVarC;
                    c0VarQ = null;
                    iVarSource = null;
                }
            } catch (Throwable th9) {
                th = th9;
                c0VarQ = null;
                iVarSource = null;
            }
        } catch (Exception e23) {
            e = e23;
            bVar = bVarA;
            jVar = jVarC;
            c0VarQ = null;
            iVarSource = null;
            m0VarL = null;
        } catch (Throwable th10) {
            th = th10;
            c0VarQ = null;
            iVarSource = null;
            m0VarL = null;
            if ((m0VarL != null ? m0VarL.f95559g : null) != null) {
            }
            if (jVarC != null) {
            }
            com.vungle.ads.internal.util.n.a(c0VarQ);
            com.vungle.ads.internal.util.n.a(iVarSource);
            boolean z132222 = u.f47714a;
            StringBuilder sbA42222 = com.iab.omid.library.vungle.internal.l.a("download status: ");
            sbA42222.append(dVar.b());
            com.vungle.ads.internal.util.t.a("AssetDownloader", sbA42222.toString());
            throw th;
        }
    }

    public static final void a(i this$0, l lVar, e eVar) {
        Intrinsics.g(this$0, "this$0");
        this$0.f46782d.remove(lVar);
        c cVar = new c(-1, new OutOfMemory("Failed to execute download request: " + lVar.a().h()), 4);
        if (eVar != null) {
            eVar.a(cVar, lVar);
        }
    }

    public final void a() {
        for (l lVar : this.f46782d) {
            if (lVar != null && !lVar.f46792e.get()) {
                lVar.f46792e.set(true);
            }
        }
        this.f46782d.clear();
    }

    public static p0 a(m0 m0Var) {
        p0 p0Var = m0Var.f95559g;
        x80.u uVar = m0Var.f95558f;
        String strB = uVar.b("Content-Encoding");
        if (strB == null) {
            strB = null;
        }
        if (!"gzip".equalsIgnoreCase(strB) || p0Var == null) {
            return p0Var;
        }
        m90.r rVar = new m90.r(p0Var.source());
        String strB2 = uVar.b("Content-Type");
        return new c90.g(strB2 == null ? null : strB2, -1L, x7.f.r(rVar), 0);
    }
}
