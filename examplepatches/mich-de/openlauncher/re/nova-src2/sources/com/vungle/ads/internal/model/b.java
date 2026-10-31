package com.vungle.ads.internal.model;

import b.c9;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final String f46928a;

    /* renamed from: b, reason: collision with root package name */
    public final String f46929b;

    /* renamed from: c, reason: collision with root package name */
    public final String f46930c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f46931d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f46932e;

    /* renamed from: f, reason: collision with root package name */
    public a f46933f;

    /* renamed from: g, reason: collision with root package name */
    public String f46934g;

    /* renamed from: h, reason: collision with root package name */
    public long f46935h;

    /* renamed from: i, reason: collision with root package name */
    public long f46936i;

    /* renamed from: j, reason: collision with root package name */
    public long f46937j;

    /* renamed from: k, reason: collision with root package name */
    public Long f46938k;

    /* renamed from: l, reason: collision with root package name */
    public final Object f46939l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicBoolean f46940m;

    public /* synthetic */ b(String str, String str2) {
        this("vmURL", str, str2, true, null);
    }

    public final String a() {
        return this.f46928a;
    }

    public final void b(long j11) {
        this.f46935h = j11;
    }

    public final String c() {
        return this.f46930c;
    }

    public final String d() {
        return this.f46934g;
    }

    public final Integer e() {
        return this.f46932e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !b.class.equals(obj.getClass())) {
            return false;
        }
        b bVar = (b) obj;
        if (this.f46933f == bVar.f46933f && this.f46935h == bVar.f46935h && this.f46931d == bVar.f46931d && Intrinsics.b(this.f46928a, bVar.f46928a) && Intrinsics.b(this.f46929b, bVar.f46929b) && this.f46936i == bVar.f46936i && Intrinsics.b(this.f46932e, bVar.f46932e)) {
            return Intrinsics.b(this.f46930c, bVar.f46930c);
        }
        return false;
    }

    public final Long f() {
        return this.f46938k;
    }

    public final long g() {
        return this.f46937j;
    }

    public final String h() {
        return this.f46929b;
    }

    public final int hashCode() {
        int iHashCode = (this.f46933f.hashCode() + b.c0.e(b.c0.e(this.f46928a.hashCode() * 31, 31, this.f46929b), 31, this.f46930c)) * 31;
        long j11 = this.f46935h;
        int iF = c9.f((iHashCode + ((int) (j11 ^ (j11 >>> 32)))) * 31, 31, this.f46931d);
        long j12 = this.f46936i;
        int i5 = (iF + ((int) (j12 ^ (j12 >>> 32)))) * 31;
        Integer num = this.f46932e;
        return i5 + (num != null ? num.hashCode() : 0);
    }

    public final boolean i() {
        return Intrinsics.b(this.f46928a, "VUNGLE_AI_LABEL_ICON_URL");
    }

    public final boolean j() {
        return this.f46933f == a.DOWNLOAD_SUCCESS;
    }

    public final boolean k() {
        return Intrinsics.b(this.f46928a, "vmURL");
    }

    public final boolean l() {
        return Intrinsics.b(this.f46928a, "MAIN_IMAGE") || Intrinsics.b(this.f46928a, "MAIN_VIDEO");
    }

    public final boolean m() {
        return Intrinsics.b(this.f46928a, "MAIN_VIDEO");
    }

    public final boolean n() {
        return Intrinsics.b(this.f46928a, "VUNGLE_PRIVACY_ICON_URL");
    }

    public final boolean o() {
        return this.f46931d;
    }

    public final boolean p() {
        return this.f46940m.get();
    }

    public final void q() {
        if (this.f46940m.getAndSet(false)) {
            synchronized (this.f46939l) {
                this.f46939l.notifyAll();
                Unit unit = Unit.f71706a;
            }
        }
    }

    public final void r() {
        Object objA;
        this.f46940m.set(true);
        synchronized (this.f46939l) {
            try {
                int i5 = Result.f71687b;
                this.f46939l.wait();
                objA = Unit.f71706a;
            } catch (Throwable th2) {
                int i11 = Result.f71687b;
                objA = ResultKt.a(th2);
            }
            Throwable thA = Result.a(objA);
            if (thA != null) {
                boolean z11 = com.vungle.ads.internal.util.u.f47714a;
                com.vungle.ads.internal.util.t.a("AdAsset", "Interrupted while waiting for file download: " + this, thA);
            }
        }
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("AdAsset(adIdentifier=");
        sbA.append(this.f46928a);
        sbA.append(", serverPath=");
        sbA.append(this.f46929b);
        sbA.append(", localPath=");
        sbA.append(this.f46930c);
        sbA.append(", status=");
        sbA.append(this.f46933f);
        sbA.append(", fileSize=");
        sbA.append(this.f46935h);
        sbA.append(", contentLength=");
        sbA.append(this.f46936i);
        sbA.append(", isRequired=");
        sbA.append(this.f46931d);
        sbA.append(", percentage=");
        return a2.c.o(sbA, this.f46932e, ')');
    }

    public b(String adIdentifier, String serverPath, String localPath, boolean z11, Integer num) {
        Intrinsics.g(adIdentifier, "adIdentifier");
        Intrinsics.g(serverPath, "serverPath");
        Intrinsics.g(localPath, "localPath");
        this.f46928a = adIdentifier;
        this.f46929b = serverPath;
        this.f46930c = localPath;
        this.f46931d = z11;
        this.f46932e = num;
        this.f46933f = a.NEW;
        this.f46934g = "application/octet-stream";
        this.f46939l = new Object();
        this.f46940m = new AtomicBoolean(false);
    }

    public final void a(a aVar) {
        Intrinsics.g(aVar, "<set-?>");
        this.f46933f = aVar;
    }

    public final long b() {
        return this.f46936i;
    }

    public final void c(long j11) {
        this.f46937j = j11;
    }

    public final void a(String str) {
        Intrinsics.g(str, "<set-?>");
        this.f46934g = str;
    }

    public final void a(long j11) {
        this.f46936i = j11;
    }

    public final void a(Long l9) {
        this.f46938k = l9;
    }
}
