package com.vungle.ads.internal.downloader;

import com.vungle.ads.internal.util.u;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s implements e {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f46798a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t f46799b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ File f46800c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f46801d;

    public s(String str, t tVar, File file, String str2) {
        this.f46798a = str;
        this.f46799b = tVar;
        this.f46800c = file;
        this.f46801d = str2;
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(d progress, l downloadRequest) {
        Intrinsics.g(progress, "progress");
        Intrinsics.g(downloadRequest, "downloadRequest");
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(l downloadRequest) {
        Intrinsics.g(downloadRequest, "downloadRequest");
        boolean z11 = u.f47714a;
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Template download started: ");
        sbA.append(this.f46798a);
        com.vungle.ads.internal.util.t.a("TemplateDownloadManager", sbA.toString());
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(File file, l downloadRequest) {
        Intrinsics.g(file, "file");
        Intrinsics.g(downloadRequest, "downloadRequest");
        ReentrantLock reentrantLock = this.f46799b.f46804c;
        t tVar = this.f46799b;
        String str = this.f46798a;
        reentrantLock.lock();
        try {
            List list = (List) tVar.f46810i.remove(str);
            if (list == null) {
                list = EmptyList.f71733a;
            }
            boolean z11 = tVar.f46806e;
            reentrantLock.unlock();
            List<Function1> list2 = list;
            if (z11) {
                this.f46800c.delete();
                return;
            }
            File file2 = new File(this.f46801d);
            if (this.f46800c.renameTo(file2)) {
                boolean z12 = u.f47714a;
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Template download succeeded: ");
                sbA.append(this.f46798a);
                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", sbA.toString());
                Iterator it = list2.iterator();
                while (it.hasNext()) {
                    ((Function1) it.next()).invoke(new Result(file2));
                }
                return;
            }
            this.f46800c.delete();
            if (file2.exists()) {
                boolean z13 = u.f47714a;
                StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Template download succeeded: ");
                sbA2.append(this.f46798a);
                com.vungle.ads.internal.util.t.a("TemplateDownloadManager", sbA2.toString());
                Iterator it2 = list2.iterator();
                while (it2.hasNext()) {
                    ((Function1) it2.next()).invoke(new Result(file2));
                }
                return;
            }
            boolean z14 = u.f47714a;
            StringBuilder sbA3 = com.iab.omid.library.vungle.internal.l.a("Template download failed to promote: ");
            sbA3.append(this.f46798a);
            com.vungle.ads.internal.util.t.b("TemplateDownloadManager", sbA3.toString());
            String str2 = this.f46798a;
            for (Function1 function1 : list2) {
                int i5 = Result.f71687b;
                function1.invoke(new Result(ResultKt.a(new Exception(com.iab.omid.library.vungle.d.a("Failed to promote template: ", str2)))));
            }
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }

    @Override // com.vungle.ads.internal.downloader.e
    public final void a(c cVar, l downloadRequest) {
        Intrinsics.g(downloadRequest, "downloadRequest");
        ReentrantLock reentrantLock = this.f46799b.f46804c;
        t tVar = this.f46799b;
        String str = this.f46798a;
        reentrantLock.lock();
        try {
            List list = (List) tVar.f46810i.remove(str);
            if (list == null) {
                list = EmptyList.f71733a;
            }
            boolean z11 = tVar.f46806e;
            reentrantLock.unlock();
            List<Function1> list2 = list;
            this.f46800c.delete();
            if (z11) {
                return;
            }
            Throwable thA = cVar.a();
            if (thA == null) {
                StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Template download failed: ");
                sbA.append(this.f46798a);
                thA = new Exception(sbA.toString());
            }
            boolean z12 = u.f47714a;
            StringBuilder sbA2 = com.iab.omid.library.vungle.internal.l.a("Template download failed: ");
            sbA2.append(this.f46798a);
            sbA2.append(", error: ");
            sbA2.append(thA.getMessage());
            com.vungle.ads.internal.util.t.b("TemplateDownloadManager", sbA2.toString());
            for (Function1 function1 : list2) {
                int i5 = Result.f71687b;
                function1.invoke(new Result(ResultKt.a(thA)));
            }
        } catch (Throwable th2) {
            reentrantLock.unlock();
            throw th2;
        }
    }
}
