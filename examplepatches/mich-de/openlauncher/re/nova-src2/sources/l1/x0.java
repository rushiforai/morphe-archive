package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class x0 {

    /* renamed from: a, reason: collision with root package name */
    public final long f74206a;

    /* renamed from: b, reason: collision with root package name */
    public final long f74207b;

    /* renamed from: c, reason: collision with root package name */
    public final long f74208c;

    /* renamed from: d, reason: collision with root package name */
    public final long f74209d;

    /* renamed from: e, reason: collision with root package name */
    public final long f74210e;

    /* renamed from: f, reason: collision with root package name */
    public final long f74211f;

    /* renamed from: g, reason: collision with root package name */
    public final long f74212g;

    /* renamed from: h, reason: collision with root package name */
    public final long f74213h;

    /* renamed from: i, reason: collision with root package name */
    public final long f74214i;

    /* renamed from: j, reason: collision with root package name */
    public final long f74215j;

    /* renamed from: k, reason: collision with root package name */
    public final long f74216k;

    /* renamed from: l, reason: collision with root package name */
    public final long f74217l;

    public x0(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22, long j23) {
        this.f74206a = j11;
        this.f74207b = j12;
        this.f74208c = j13;
        this.f74209d = j14;
        this.f74210e = j15;
        this.f74211f = j16;
        this.f74212g = j17;
        this.f74213h = j18;
        this.f74214i = j19;
        this.f74215j = j21;
        this.f74216k = j22;
        this.f74217l = j23;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof x0)) {
            return false;
        }
        x0 x0Var = (x0) obj;
        long j11 = x0Var.f74206a;
        int i5 = i2.s.n;
        return ULong.a(this.f74206a, j11) && ULong.a(this.f74207b, x0Var.f74207b) && ULong.a(this.f74208c, x0Var.f74208c) && ULong.a(this.f74209d, x0Var.f74209d) && ULong.a(this.f74210e, x0Var.f74210e) && ULong.a(this.f74211f, x0Var.f74211f) && ULong.a(this.f74212g, x0Var.f74212g) && ULong.a(this.f74213h, x0Var.f74213h) && ULong.a(this.f74214i, x0Var.f74214i) && ULong.a(this.f74215j, x0Var.f74215j) && ULong.a(this.f74216k, x0Var.f74216k) && ULong.a(this.f74217l, x0Var.f74217l);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f74217l) + b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f74206a) * 31, 31, this.f74207b), 31, this.f74208c), 31, this.f74209d), 31, this.f74210e), 31, this.f74211f), 31, this.f74212g), 31, this.f74213h), 31, this.f74214i), 31, this.f74215j), 31, this.f74216k);
    }
}
