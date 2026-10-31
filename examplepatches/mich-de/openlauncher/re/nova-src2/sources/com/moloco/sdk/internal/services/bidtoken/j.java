package com.moloco.sdk.internal.services.bidtoken;

import b.u4;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class j {

    /* renamed from: d, reason: collision with root package name */
    public static final int f37716d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final long f37717a;

    /* renamed from: b, reason: collision with root package name */
    public final int f37718b;

    /* renamed from: c, reason: collision with root package name */
    public final long f37719c;

    public j(long j11, int i5, long j12) {
        this.f37717a = j11;
        this.f37718b = i5;
        this.f37719c = j12;
    }

    public final long a() {
        return this.f37717a;
    }

    public final int b() {
        return this.f37718b;
    }

    public final long c() {
        return this.f37719c;
    }

    public final long d() {
        return this.f37719c;
    }

    public final int e() {
        return this.f37718b;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return this.f37717a == jVar.f37717a && this.f37718b == jVar.f37718b && this.f37719c == jVar.f37719c;
    }

    public final long f() {
        return this.f37717a;
    }

    public int hashCode() {
        return Long.hashCode(this.f37719c) + u4.a(this.f37718b, Long.hashCode(this.f37717a) * 31, 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("BidTokenHttpRequestInfo(requestTimeoutMillis=");
        sb2.append(this.f37717a);
        sb2.append(", fetchRetryMax=");
        sb2.append(this.f37718b);
        sb2.append(", fetchRetryDelayMillis=");
        return a2.c.n(sb2, this.f37719c, ')');
    }

    @NotNull
    public final j a(long j11, int i5, long j12) {
        return new j(j11, i5, j12);
    }

    public static /* synthetic */ j a(j jVar, long j11, int i5, long j12, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            j11 = jVar.f37717a;
        }
        long j13 = j11;
        if ((i11 & 2) != 0) {
            i5 = jVar.f37718b;
        }
        int i12 = i5;
        if ((i11 & 4) != 0) {
            j12 = jVar.f37719c;
        }
        return jVar.a(j13, i12, j12);
    }
}
