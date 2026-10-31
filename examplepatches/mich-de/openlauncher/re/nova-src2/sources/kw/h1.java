package kw;

import kotlin.ULong;

/* loaded from: classes4.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f72388a;

    /* renamed from: b, reason: collision with root package name */
    public final long f72389b;

    /* renamed from: c, reason: collision with root package name */
    public final long f72390c;

    /* renamed from: d, reason: collision with root package name */
    public final long f72391d;

    /* renamed from: e, reason: collision with root package name */
    public final long f72392e;

    public h1(long j11, long j12, long j13, long j14, long j15) {
        this.f72388a = j11;
        this.f72389b = j12;
        this.f72390c = j13;
        this.f72391d = j14;
        this.f72392e = j15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h1)) {
            return false;
        }
        h1 h1Var = (h1) obj;
        long j11 = h1Var.f72388a;
        int i5 = i2.s.n;
        return ULong.a(this.f72388a, j11) && ULong.a(this.f72389b, h1Var.f72389b) && ULong.a(this.f72390c, h1Var.f72390c) && ULong.a(this.f72391d, h1Var.f72391d) && ULong.a(this.f72392e, h1Var.f72392e);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f72392e) + b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f72388a) * 31, 31, this.f72389b), 31, this.f72390c), 31, this.f72391d);
    }

    public final String toString() {
        String strH = i2.s.h(this.f72388a);
        String strH2 = i2.s.h(this.f72389b);
        String strH3 = i2.s.h(this.f72390c);
        String strH4 = i2.s.h(this.f72391d);
        String strH5 = i2.s.h(this.f72392e);
        StringBuilder sbW = b.c0.w("OTPElementColors(selectedBorder=", strH, ", placeholder=", strH2, ", background=");
        b.c0.D(sbW, strH3, ", selectedBackground=", strH4, ", unselectedBorder=");
        return b.c0.q(sbW, strH5, ")");
    }
}
