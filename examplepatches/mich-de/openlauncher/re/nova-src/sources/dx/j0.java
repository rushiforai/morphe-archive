package dx;

import androidx.recyclerview.widget.u1;
import b.c9;
import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f49717a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f49718b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f49719c;

    /* renamed from: d, reason: collision with root package name */
    public final long f49720d;

    /* renamed from: e, reason: collision with root package name */
    public final int f49721e;

    /* renamed from: f, reason: collision with root package name */
    public final long f49722f;

    /* renamed from: g, reason: collision with root package name */
    public final long f49723g;

    /* renamed from: h, reason: collision with root package name */
    public final int f49724h;

    /* renamed from: i, reason: collision with root package name */
    public final int f49725i;

    /* renamed from: j, reason: collision with root package name */
    public final int f49726j;

    /* renamed from: k, reason: collision with root package name */
    public final int f49727k;

    /* renamed from: l, reason: collision with root package name */
    public final int f49728l;

    /* renamed from: m, reason: collision with root package name */
    public final long f49729m;
    public final s0 n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f49730p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f49731q;

    public j0(int i5, int i11, int i12, long j11) {
        i5 = (i12 & 128) != 0 ? 2 : i5;
        int i13 = (i12 & 256) != 0 ? 2 : 4;
        i11 = (i12 & 1024) != 0 ? 2 : i11;
        int i14 = (i12 & 2048) != 0 ? 0 : 20;
        j11 = (i12 & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 ? 30000L : j11;
        s0 defaultRetryPolicy = s0.f49791a;
        Intrinsics.g(defaultRetryPolicy, "defaultRetryPolicy");
        this.f49717a = "ca-app-pub-4858839354660716~2363379427";
        this.f49718b = true;
        this.f49719c = true;
        this.f49720d = 3300000L;
        this.f49721e = 1;
        this.f49722f = 5000L;
        this.f49723g = 15000L;
        this.f49724h = i5;
        this.f49725i = i13;
        this.f49726j = 1;
        this.f49727k = i11;
        this.f49728l = i14;
        this.f49729m = j11;
        this.n = defaultRetryPolicy;
        this.o = com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a.f39430h;
        this.f49730p = 300000L;
        this.f49731q = true;
        if (r70.k.U0("ca-app-pub-4858839354660716~2363379427")) {
            throw new IllegalArgumentException("adMobApplicationId must not be blank");
        }
        if (i5 < 0 || i5 >= 11) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (i11 < 0 || i11 >= 11) {
            throw new IllegalArgumentException("Failed requirement.");
        }
        if (j11 < 0) {
            throw new IllegalArgumentException("Failed requirement.");
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j0)) {
            return false;
        }
        j0 j0Var = (j0) obj;
        return Intrinsics.b(this.f49717a, j0Var.f49717a) && this.f49718b == j0Var.f49718b && this.f49719c == j0Var.f49719c && this.f49720d == j0Var.f49720d && this.f49721e == j0Var.f49721e && this.f49722f == j0Var.f49722f && this.f49723g == j0Var.f49723g && this.f49724h == j0Var.f49724h && this.f49725i == j0Var.f49725i && this.f49726j == j0Var.f49726j && this.f49727k == j0Var.f49727k && this.f49728l == j0Var.f49728l && this.f49729m == j0Var.f49729m && Intrinsics.b(this.n, j0Var.n) && this.o == j0Var.o && this.f49730p == j0Var.f49730p && this.f49731q == j0Var.f49731q;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f49731q) + b.c0.d(b.c0.d((this.n.hashCode() + b.c0.d(u4.a(this.f49728l, u4.a(this.f49727k, u4.a(this.f49726j, u4.a(this.f49725i, u4.a(this.f49724h, b.c0.d(b.c0.d(u4.a(this.f49721e, b.c0.d(c9.f(c9.f(this.f49717a.hashCode() * 31, 31, this.f49718b), 31, this.f49719c), 31, this.f49720d), 31), 31, this.f49722f), 31, this.f49723g), 31), 31), 31), 31), 31), 31, this.f49729m)) * 31, 31, this.o), 31, this.f49730p);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GlobalAdConfig(adMobApplicationId=");
        sb2.append(this.f49717a);
        sb2.append(", poolEnabled=");
        sb2.append(this.f49718b);
        sb2.append(", impressedReuseEnabled=");
        sb2.append(this.f49719c);
        sb2.append(", maxWarmAgeMs=");
        sb2.append(this.f49720d);
        sb2.append(", maxWarmReuseCount=");
        sb2.append(this.f49721e);
        sb2.append(", requestTimeoutMs=");
        sb2.append(this.f49722f);
        b.c0.B(sb2, ", cascadeBudgetMs=", this.f49723g, ", nativePreloadBufferSize=");
        b.c0.A(sb2, this.f49724h, ", iconPreloadBufferSize=", this.f49725i, ", rewardedPreloadBufferSize=");
        b.c0.A(sb2, this.f49726j, ", bannerPreloadBufferSize=", this.f49727k, ", bannerPreloadHorizontalMarginDp=");
        sb2.append(this.f49728l);
        sb2.append(", mobileAdsInitGraceMs=");
        sb2.append(this.f49729m);
        sb2.append(", defaultRetryPolicy=");
        sb2.append(this.n);
        sb2.append(", bannerWidthWaitMs=");
        sb2.append(this.o);
        b.c0.B(sb2, ", maxBannerWarmAgeMs=", this.f49730p, ", bannerImpressedReuseEnabled=");
        return a80.m.k(sb2, this.f49731q, ")");
    }
}
