package com.vungle.ads.internal.downloader;

/* loaded from: classes4.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public int f46768a;

    /* renamed from: b, reason: collision with root package name */
    public int f46769b;

    /* renamed from: c, reason: collision with root package name */
    public long f46770c;

    /* renamed from: d, reason: collision with root package name */
    public long f46771d;

    /* renamed from: e, reason: collision with root package name */
    public long f46772e;

    public final int a() {
        return this.f46769b;
    }

    public final int b() {
        return this.f46768a;
    }

    public final void c(long j11) {
        this.f46770c = j11;
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Progress(status=");
        sbA.append(this.f46768a);
        sbA.append(", percent=");
        sbA.append(this.f46769b);
        sbA.append(", startAt=");
        sbA.append(this.f46770c);
        sbA.append(", readed=");
        sbA.append(this.f46771d);
        sbA.append(", total=");
        return a2.c.n(sbA, this.f46772e, ')');
    }

    public final void a(int i5) {
        this.f46769b = i5;
    }

    public final void b(int i5) {
        this.f46768a = i5;
    }

    public final void a(long j11) {
        this.f46771d = j11;
    }

    public final void b(long j11) {
        this.f46772e = j11;
    }
}
