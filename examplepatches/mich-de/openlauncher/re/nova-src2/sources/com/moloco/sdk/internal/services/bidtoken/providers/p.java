package com.moloco.sdk.internal.services.bidtoken.providers;

import b.c0;
import b.u4;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class p {

    /* renamed from: i, reason: collision with root package name */
    public static final int f37813i = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f37814a;

    /* renamed from: b, reason: collision with root package name */
    public final long f37815b;

    /* renamed from: c, reason: collision with root package name */
    public final long f37816c;

    /* renamed from: d, reason: collision with root package name */
    public final int f37817d;

    /* renamed from: e, reason: collision with root package name */
    public final int f37818e;

    /* renamed from: f, reason: collision with root package name */
    public final int f37819f;

    /* renamed from: g, reason: collision with root package name */
    public final int f37820g;

    /* renamed from: h, reason: collision with root package name */
    public final int f37821h;

    public p(@NotNull String sessionId, long j11, long j12, int i5, int i11, int i12, int i13, int i14) {
        Intrinsics.g(sessionId, "sessionId");
        this.f37814a = sessionId;
        this.f37815b = j11;
        this.f37816c = j12;
        this.f37817d = i5;
        this.f37818e = i11;
        this.f37819f = i12;
        this.f37820g = i13;
        this.f37821h = i14;
    }

    @NotNull
    public final String a() {
        return this.f37814a;
    }

    public final long b() {
        return this.f37815b;
    }

    public final long c() {
        return this.f37816c;
    }

    public final int d() {
        return this.f37817d;
    }

    public final int e() {
        return this.f37818e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f37814a, pVar.f37814a) && this.f37815b == pVar.f37815b && this.f37816c == pVar.f37816c && this.f37817d == pVar.f37817d && this.f37818e == pVar.f37818e && this.f37819f == pVar.f37819f && this.f37820g == pVar.f37820g && this.f37821h == pVar.f37821h;
    }

    public final int f() {
        return this.f37819f;
    }

    public final int g() {
        return this.f37820g;
    }

    public final int h() {
        return this.f37821h;
    }

    public int hashCode() {
        return Integer.hashCode(this.f37821h) + u4.a(this.f37820g, u4.a(this.f37819f, u4.a(this.f37818e, u4.a(this.f37817d, c0.d(c0.d(this.f37814a.hashCode() * 31, 31, this.f37815b), 31, this.f37816c), 31), 31), 31), 31);
    }

    public final int i() {
        return this.f37817d;
    }

    public final int j() {
        return this.f37820g;
    }

    public final long k() {
        return this.f37816c;
    }

    public final int l() {
        return this.f37818e;
    }

    public final int m() {
        return this.f37819f;
    }

    public final int n() {
        return this.f37821h;
    }

    @NotNull
    public final String o() {
        return this.f37814a;
    }

    public final long p() {
        return this.f37815b;
    }

    public final boolean q() {
        return this.f37814a.length() > 0;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("IlrdSignal(sessionId=");
        sb2.append(this.f37814a);
        sb2.append(", sessionStartTs=");
        sb2.append(this.f37815b);
        sb2.append(", lastImpressionTs=");
        sb2.append(this.f37816c);
        sb2.append(", bannerImpressionCount=");
        sb2.append(this.f37817d);
        sb2.append(", mrecImpressionCount=");
        sb2.append(this.f37818e);
        sb2.append(", nativeImpressionCount=");
        sb2.append(this.f37819f);
        sb2.append(", interstitialImpressionCount=");
        sb2.append(this.f37820g);
        sb2.append(", rewardedImpressionCount=");
        return a2.c.m(sb2, this.f37821h, ')');
    }

    @NotNull
    public final p a(@NotNull String sessionId, long j11, long j12, int i5, int i11, int i12, int i13, int i14) {
        Intrinsics.g(sessionId, "sessionId");
        return new p(sessionId, j11, j12, i5, i11, i12, i13, i14);
    }

    public static /* synthetic */ p a(p pVar, String str, long j11, long j12, int i5, int i11, int i12, int i13, int i14, int i15, Object obj) {
        if ((i15 & 1) != 0) {
            str = pVar.f37814a;
        }
        if ((i15 & 2) != 0) {
            j11 = pVar.f37815b;
        }
        if ((i15 & 4) != 0) {
            j12 = pVar.f37816c;
        }
        if ((i15 & 8) != 0) {
            i5 = pVar.f37817d;
        }
        if ((i15 & 16) != 0) {
            i11 = pVar.f37818e;
        }
        if ((i15 & 32) != 0) {
            i12 = pVar.f37819f;
        }
        if ((i15 & 64) != 0) {
            i13 = pVar.f37820g;
        }
        if ((i15 & 128) != 0) {
            i14 = pVar.f37821h;
        }
        int i16 = i14;
        int i17 = i12;
        int i18 = i5;
        long j13 = j12;
        return pVar.a(str, j11, j13, i18, i11, i17, i13, i16);
    }
}
