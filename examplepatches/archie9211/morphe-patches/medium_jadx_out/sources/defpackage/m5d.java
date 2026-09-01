package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m5d {
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
    public final long m;
    public final long n;
    public final long o;
    public final long p;

    public m5d(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10, long j11, long j12, long j13, long j14, long j15, long j16) {
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
        this.m = j13;
        this.n = j14;
        this.o = j15;
        this.p = j16;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof m5d)) {
            return false;
        }
        m5d m5dVar = (m5d) obj;
        long j = m5dVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, m5dVar.b) && ezd.a(this.c, m5dVar.c) && ezd.a(this.d, m5dVar.d) && ezd.a(this.e, m5dVar.e) && ezd.a(this.f, m5dVar.f) && ezd.a(this.g, m5dVar.g) && ezd.a(this.h, m5dVar.h) && ezd.a(this.i, m5dVar.i) && ezd.a(this.j, m5dVar.j) && ezd.a(this.k, m5dVar.k) && ezd.a(this.l, m5dVar.l) && ezd.a(this.m, m5dVar.m) && ezd.a(this.n, m5dVar.n) && ezd.a(this.o, m5dVar.o) && ezd.a(this.p, m5dVar.p);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.p) + lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e), 31, this.f), 31, this.g), 31, this.h), 31, this.i), 31, this.j), 31, this.k), 31, this.l), 31, this.m), 31, this.n), 31, this.o);
    }
}
