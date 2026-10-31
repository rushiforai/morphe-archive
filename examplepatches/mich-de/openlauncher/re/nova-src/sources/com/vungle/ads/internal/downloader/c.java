package com.vungle.ads.internal.downloader;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final int f46765a;

    /* renamed from: b, reason: collision with root package name */
    public final Throwable f46766b;

    /* renamed from: c, reason: collision with root package name */
    public final int f46767c;

    public c(int i5, Throwable cause, int i11) {
        Intrinsics.g(cause, "cause");
        this.f46765a = i5;
        this.f46766b = cause;
        this.f46767c = i11;
    }

    public final Throwable a() {
        return this.f46766b;
    }

    public final int b() {
        return this.f46767c;
    }

    public final int c() {
        return this.f46765a;
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("DownloadError(serverCode=");
        sbA.append(this.f46765a);
        sbA.append(", reason=");
        sbA.append(this.f46767c);
        sbA.append(", cause=");
        sbA.append(this.f46766b);
        sbA.append(')');
        return sbA.toString();
    }
}
