package com.vungle.ads.internal.downloader;

import b.u4;
import com.vungle.ads.internal.AnalyticsClient;
import com.vungle.ads.internal.protos.Sdk;
import com.vungle.ads.internal.util.PathProvider;
import com.vungle.ads.internal.util.u;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final com.vungle.ads.internal.executor.a f46802a;

    /* renamed from: b, reason: collision with root package name */
    public final PathProvider f46803b;

    /* renamed from: c, reason: collision with root package name */
    public final ReentrantLock f46804c;

    /* renamed from: d, reason: collision with root package name */
    public final AtomicBoolean f46805d;

    /* renamed from: e, reason: collision with root package name */
    public volatile boolean f46806e;

    /* renamed from: f, reason: collision with root package name */
    public final LinkedHashSet f46807f;

    /* renamed from: g, reason: collision with root package name */
    public volatile i f46808g;

    /* renamed from: h, reason: collision with root package name */
    public volatile i f46809h;

    /* renamed from: i, reason: collision with root package name */
    public final HashMap f46810i;

    public t(com.vungle.ads.internal.executor.a executors, PathProvider pathProvider) {
        Intrinsics.g(executors, "executors");
        Intrinsics.g(pathProvider, "pathProvider");
        this.f46802a = executors;
        this.f46803b = pathProvider;
        this.f46804c = new ReentrantLock();
        this.f46805d = new AtomicBoolean(false);
        this.f46807f = new LinkedHashSet();
        this.f46810i = new HashMap();
    }

    public static String a(String url) {
        Object objA;
        Intrinsics.g(url, "url");
        try {
            int i5 = Result.f71687b;
            String path = new URI(url).getPath();
            Intrinsics.f(path, "URI(url).path");
            List listH1 = r70.k.h1(r70.k.v1(path, '/'), new char[]{'/'}, 6);
            objA = listH1.size() >= 2 ? b70.g.f1(b70.g.F1(2, listH1), "_", null, null, 0, null, 62) : null;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        return (String) (objA instanceof Result.Failure ? null : objA);
    }

    public final void b(Map vmTemplates) throws IOException {
        String canonicalPath;
        File file;
        String dirCanonical;
        Intrinsics.g(vmTemplates, "vmTemplates");
        if (vmTemplates.isEmpty() || this.f46806e) {
            return;
        }
        File vmDir = this.f46803b.getVmDir();
        try {
            canonicalPath = vmDir.getCanonicalPath();
        } catch (IOException unused) {
            canonicalPath = null;
        }
        Iterator it = b70.g.E1(b70.g.D1(new q(), vmTemplates.entrySet()), 10).iterator();
        while (it.hasNext()) {
            String url = (String) ((Map.Entry) it.next()).getKey();
            if (this.f46806e) {
                return;
            }
            Intrinsics.g(url, "url");
            Intrinsics.g(vmDir, "vmDir");
            String strA = a(url);
            if (strA == null) {
                file = null;
            } else {
                file = new File(vmDir, strA);
                if (canonicalPath == null) {
                    try {
                        dirCanonical = vmDir.getCanonicalPath();
                    } catch (IOException e3) {
                        boolean z11 = u.f47714a;
                        StringBuilder sbK = u4.k("Failed to resolve canonical path for template: ", strA, ", error: ");
                        sbK.append(e3.getMessage());
                        com.vungle.ads.internal.util.t.b("TemplateDownloadManager", sbK.toString());
                    }
                } else {
                    dirCanonical = canonicalPath;
                }
                String canonicalPath2 = file.getCanonicalPath();
                Intrinsics.f(canonicalPath2, "file.canonicalPath");
                Intrinsics.f(dirCanonical, "dirCanonical");
                if (!r70.j.I0(canonicalPath2, dirCanonical, false)) {
                    boolean z12 = u.f47714a;
                    com.vungle.ads.internal.util.t.b("TemplateDownloadManager", "Template file path escapes vmDir: " + strA);
                    file = null;
                }
            }
            if (file != null) {
                boolean z13 = u.f47714a;
                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Pre-downloading template: ".concat(url));
                String absolutePath = file.getAbsolutePath();
                Intrinsics.f(absolutePath, "templateFile.absolutePath");
                a(url, absolutePath, k.LOWEST, new o(this), new r(url));
            }
        }
    }

    public final void a(Set fileNames) {
        Intrinsics.g(fileNames, "fileNames");
        ReentrantLock reentrantLock = this.f46804c;
        reentrantLock.lock();
        try {
            this.f46807f.addAll(fileNames);
        } finally {
            reentrantLock.unlock();
        }
    }

    public static void a(t tVar, String url, String localPath, com.vungle.ads.internal.load.d callback) {
        k priority = k.CRITICAL;
        tVar.getClass();
        Intrinsics.g(url, "url");
        Intrinsics.g(localPath, "localPath");
        Intrinsics.g(priority, "priority");
        Intrinsics.g(callback, "callback");
        tVar.a(url, localPath, priority, new p(tVar), callback);
    }

    public final void a(String str, String str2, k kVar, Function0 function0, Function1 function1) {
        boolean z11;
        boolean z12 = u.f47714a;
        com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Requesting template: " + str);
        if (this.f46806e) {
            int i5 = Result.f71687b;
            function1.invoke(new Result(ResultKt.a(new Exception("TemplateDownloadManager is stopped"))));
            return;
        }
        File file = new File(str2);
        String fileName = file.getName();
        ReentrantLock reentrantLock = this.f46804c;
        reentrantLock.lock();
        try {
            boolean z13 = true;
            boolean z14 = false;
            if (this.f46806e) {
                z11 = false;
            } else {
                LinkedHashSet linkedHashSet = this.f46807f;
                Intrinsics.f(fileName, "fileName");
                linkedHashSet.add(fileName);
                if (file.exists()) {
                    z11 = false;
                    z14 = true;
                } else {
                    List list = (List) this.f46810i.get(str);
                    if (list != null) {
                        list.add(function1);
                        z11 = false;
                    } else {
                        this.f46810i.put(str, ul.b.T(function1));
                        z11 = true;
                        z13 = false;
                    }
                }
                z13 = z11;
            }
            if (z13) {
                int i11 = Result.f71687b;
                function1.invoke(new Result(ResultKt.a(new Exception("TemplateDownloadManager is stopped"))));
                return;
            }
            if (z14) {
                AnalyticsClient.a(AnalyticsClient.INSTANCE, Sdk.SDKMetric.SDKMetricType.VM_TEMPLATE_CACHE_HIT, 1L, null, str, 4);
                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Template cache hit: " + str);
                function1.invoke(new Result(file));
                return;
            }
            if (z11) {
                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Starting template download: " + str);
                i iVar = (i) function0.invoke();
                if (iVar == null) {
                    reentrantLock = this.f46804c;
                    reentrantLock.lock();
                    try {
                        List list2 = (List) this.f46810i.remove(str);
                        if (list2 == null) {
                            list2 = EmptyList.f71733a;
                        }
                        reentrantLock.unlock();
                        int i12 = Result.f71687b;
                        Result.Failure failureA = ResultKt.a(new Exception("TemplateDownloadManager is stopped"));
                        Iterator it = list2.iterator();
                        while (it.hasNext()) {
                            ((Function1) it.next()).invoke(new Result(failureA));
                        }
                        return;
                    } finally {
                        reentrantLock.unlock();
                    }
                }
                File file2 = new File(com.iab.omid.library.vungle.d.a(str2, ".tmp"));
                try {
                    String absolutePath = file2.getAbsolutePath();
                    Intrinsics.f(absolutePath, "tmpFile.absolutePath");
                    iVar.a(new l(kVar, new com.vungle.ads.internal.model.b(str, absolutePath)), new s(str, this, file2, str2));
                } catch (Exception e3) {
                    ReentrantLock reentrantLock2 = this.f46804c;
                    reentrantLock2.lock();
                    try {
                        List list3 = (List) this.f46810i.remove(str);
                        if (list3 == null) {
                            list3 = EmptyList.f71733a;
                        }
                        boolean z15 = this.f46806e;
                        reentrantLock2.unlock();
                        List list4 = list3;
                        boolean z16 = u.f47714a;
                        StringBuilder sbK = u4.k("Failed to start template download: ", str, ", error: ");
                        sbK.append(e3.getMessage());
                        com.vungle.ads.internal.util.t.b("TemplateDownloadManager", sbK.toString());
                        if (z15) {
                            return;
                        }
                        int i13 = Result.f71687b;
                        Result.Failure failureA2 = ResultKt.a(e3);
                        Iterator it2 = list4.iterator();
                        while (it2.hasNext()) {
                            ((Function1) it2.next()).invoke(new Result(failureA2));
                        }
                    } finally {
                        reentrantLock2.unlock();
                    }
                }
            }
        } finally {
            reentrantLock.unlock();
        }
    }

    public final void a(Map map) {
        if (map == null || map.isEmpty() || this.f46806e) {
            return;
        }
        if (!this.f46805d.compareAndSet(false, true)) {
            boolean z11 = u.f47714a;
            com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Initial template cleanup already performed this session, skipping");
            return;
        }
        File[] fileArrListFiles = this.f46803b.getVmDir().listFiles();
        if (fileArrListFiles == null) {
            return;
        }
        for (File file : fileArrListFiles) {
            if (this.f46806e) {
                return;
            }
            String name = file.getName();
            Intrinsics.f(name, "file.name");
            if (r70.j.A0(name, ".html", false) && r70.k.L0(name, '_') && file.isFile()) {
                ReentrantLock reentrantLock = this.f46804c;
                reentrantLock.lock();
                try {
                    if (!this.f46807f.contains(file.getName())) {
                        try {
                            if (file.delete()) {
                                boolean z12 = u.f47714a;
                                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", "Removed expired template: " + file.getName());
                            } else {
                                boolean z13 = u.f47714a;
                                com.vungle.ads.internal.util.t.b("TemplateDownloadManager", "Failed to delete expired template: " + file.getName());
                            }
                        } catch (Exception e3) {
                            boolean z14 = u.f47714a;
                            com.vungle.ads.internal.util.t.b("TemplateDownloadManager", "Error deleting expired template: " + file.getName() + ", error: " + e3.getMessage());
                        }
                    }
                    Unit unit = Unit.f71706a;
                    reentrantLock.unlock();
                } catch (Throwable th2) {
                    reentrantLock.unlock();
                    throw th2;
                }
            }
        }
    }

    public final void a() {
        ReentrantLock reentrantLock = this.f46804c;
        reentrantLock.lock();
        try {
            i iVar = this.f46808g;
            if (iVar != null) {
                iVar.a();
            }
            i iVar2 = this.f46809h;
            if (iVar2 != null) {
                iVar2.a();
            }
            this.f46808g = null;
            this.f46809h = null;
            Collection collectionValues = this.f46810i.values();
            Intrinsics.f(collectionValues, "inFlight.values");
            ArrayList arrayListV0 = b70.c.v0(collectionValues);
            this.f46810i.clear();
            this.f46807f.clear();
            this.f46806e = true;
            Unit unit = Unit.f71706a;
            reentrantLock.unlock();
            int i5 = Result.f71687b;
            Result.Failure failureA = ResultKt.a(new Exception("TemplateDownloadManager is stopped"));
            Iterator it = arrayListV0.iterator();
            while (it.hasNext()) {
                ((Function1) it.next()).invoke(new Result(failureA));
            }
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
