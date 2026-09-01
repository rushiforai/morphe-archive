package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cl1 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;
    public final long g;
    public final long h;
    public final long i;
    public final long j;
    public final long k;
    public final long l;

    public cl1(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, long j11, long j12) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
        this.g = j7;
        this.h = j8;
        this.i = j9;
        this.j = j10;
        this.k = j11;
        this.l = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof cl1)) {
            return false;
        }
        cl1 cl1Var = (cl1) obj;
        long j = cl1Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, cl1Var.b) && ezd.a(this.c, cl1Var.c) && ezd.a(this.d, cl1Var.d) && ezd.a(this.e, cl1Var.e) && ezd.a(this.f, cl1Var.f) && ezd.a(this.g, cl1Var.g) && ezd.a(this.h, cl1Var.h) && ezd.a(this.i, cl1Var.i) && ezd.a(this.j, cl1Var.j) && ezd.a(this.k, cl1Var.k) && ezd.a(this.l, cl1Var.l);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.l) + lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e), 31, this.f), 31, this.g), 31, this.h), 31, this.i), 31, this.j), 31, this.k);
    }
}
