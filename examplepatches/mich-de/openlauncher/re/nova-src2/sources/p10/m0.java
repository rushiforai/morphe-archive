package p10;

import b.c9;
import b.u4;

/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f81837a;

    /* renamed from: b, reason: collision with root package name */
    public final long f81838b;

    /* renamed from: c, reason: collision with root package name */
    public final long f81839c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f81840d;

    /* renamed from: e, reason: collision with root package name */
    public final int f81841e;

    /* renamed from: f, reason: collision with root package name */
    public final long f81842f;

    /* renamed from: g, reason: collision with root package name */
    public final int f81843g;

    /* renamed from: h, reason: collision with root package name */
    public final f0 f81844h;

    public m0(long j11, long j12, long j13, boolean z11, int i5, long j14, int i11, f0 f0Var) {
        this.f81837a = j11;
        this.f81838b = j12;
        this.f81839c = j13;
        this.f81840d = z11;
        this.f81841e = i5;
        this.f81842f = j14;
        this.f81843g = i11;
        this.f81844h = f0Var;
    }

    public static m0 a(m0 m0Var, long j11, long j12, long j13, int i5, long j14, int i11, f0 f0Var, int i12) {
        if ((i12 & 1) != 0) {
            j11 = m0Var.f81837a;
        }
        long j15 = j11;
        long j16 = (i12 & 2) != 0 ? m0Var.f81838b : j12;
        long j17 = (i12 & 4) != 0 ? m0Var.f81839c : j13;
        boolean z11 = (i12 & 8) != 0 ? m0Var.f81840d : true;
        int i13 = (i12 & 16) != 0 ? m0Var.f81841e : i5;
        long j18 = (i12 & 32) != 0 ? m0Var.f81842f : j14;
        int i14 = (i12 & 64) != 0 ? m0Var.f81843g : i11;
        f0 f0Var2 = (i12 & 128) != 0 ? m0Var.f81844h : f0Var;
        m0Var.getClass();
        return new m0(j15, j16, j17, z11, i13, j18, i14, f0Var2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return this.f81837a == m0Var.f81837a && this.f81838b == m0Var.f81838b && this.f81839c == m0Var.f81839c && this.f81840d == m0Var.f81840d && this.f81841e == m0Var.f81841e && this.f81842f == m0Var.f81842f && this.f81843g == m0Var.f81843g && this.f81844h == m0Var.f81844h;
    }

    public final int hashCode() {
        return this.f81844h.hashCode() + u4.a(this.f81843g, b.c0.d(u4.a(this.f81841e, c9.f(b.c0.d(b.c0.d(Long.hashCode(this.f81837a) * 31, 31, this.f81838b), 31, this.f81839c), 31, this.f81840d), 31), 31, this.f81842f), 31);
    }

    public final String toString() {
        StringBuilder sbU = b.c0.u(this.f81837a, "OnboardingRewardsUiState(balance=", ", projectedEarn=");
        sbU.append(this.f81838b);
        b.c0.B(sbU, ", earnedCoins=", this.f81839c, ", projectionReady=");
        sbU.append(this.f81840d);
        sbU.append(", remainingToday=");
        sbU.append(this.f81841e);
        sbU.append(", goalCost=");
        sbU.append(this.f81842f);
        sbU.append(", goalDays=");
        sbU.append(this.f81843g);
        sbU.append(", phase=");
        sbU.append(this.f81844h);
        sbU.append(")");
        return sbU.toString();
    }
}
