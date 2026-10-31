package l1;

import kotlin.ULong;

/* loaded from: classes.dex */
public final class u7 {

    /* renamed from: a, reason: collision with root package name */
    public final long f74080a;

    /* renamed from: b, reason: collision with root package name */
    public final long f74081b;

    /* renamed from: c, reason: collision with root package name */
    public final long f74082c;

    /* renamed from: d, reason: collision with root package name */
    public final long f74083d;

    /* renamed from: e, reason: collision with root package name */
    public final long f74084e;

    /* renamed from: f, reason: collision with root package name */
    public final long f74085f;

    /* renamed from: g, reason: collision with root package name */
    public final long f74086g;

    /* renamed from: h, reason: collision with root package name */
    public final long f74087h;

    /* renamed from: i, reason: collision with root package name */
    public final long f74088i;

    /* renamed from: j, reason: collision with root package name */
    public final long f74089j;

    /* renamed from: k, reason: collision with root package name */
    public final long f74090k;

    /* renamed from: l, reason: collision with root package name */
    public final long f74091l;

    /* renamed from: m, reason: collision with root package name */
    public final long f74092m;
    public final long n;
    public final long o;

    /* renamed from: p, reason: collision with root package name */
    public final long f74093p;

    public u7(long j11, long j12, long j13, long j14, long j15, long j16, long j17, long j18, long j19, long j21, long j22, long j23, long j24, long j25, long j26, long j27) {
        this.f74080a = j11;
        this.f74081b = j12;
        this.f74082c = j13;
        this.f74083d = j14;
        this.f74084e = j15;
        this.f74085f = j16;
        this.f74086g = j17;
        this.f74087h = j18;
        this.f74088i = j19;
        this.f74089j = j21;
        this.f74090k = j22;
        this.f74091l = j23;
        this.f74092m = j24;
        this.n = j25;
        this.o = j26;
        this.f74093p = j27;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof u7)) {
            return false;
        }
        u7 u7Var = (u7) obj;
        long j11 = u7Var.f74080a;
        int i5 = i2.s.n;
        return ULong.a(this.f74080a, j11) && ULong.a(this.f74081b, u7Var.f74081b) && ULong.a(this.f74082c, u7Var.f74082c) && ULong.a(this.f74083d, u7Var.f74083d) && ULong.a(this.f74084e, u7Var.f74084e) && ULong.a(this.f74085f, u7Var.f74085f) && ULong.a(this.f74086g, u7Var.f74086g) && ULong.a(this.f74087h, u7Var.f74087h) && ULong.a(this.f74088i, u7Var.f74088i) && ULong.a(this.f74089j, u7Var.f74089j) && ULong.a(this.f74090k, u7Var.f74090k) && ULong.a(this.f74091l, u7Var.f74091l) && ULong.a(this.f74092m, u7Var.f74092m) && ULong.a(this.n, u7Var.n) && ULong.a(this.o, u7Var.o) && ULong.a(this.f74093p, u7Var.f74093p);
    }

    public final int hashCode() {
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f74093p) + b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(b.c0.d(Long.hashCode(this.f74080a) * 31, 31, this.f74081b), 31, this.f74082c), 31, this.f74083d), 31, this.f74084e), 31, this.f74085f), 31, this.f74086g), 31, this.f74087h), 31, this.f74088i), 31, this.f74089j), 31, this.f74090k), 31, this.f74091l), 31, this.f74092m), 31, this.n), 31, this.o);
    }
}
