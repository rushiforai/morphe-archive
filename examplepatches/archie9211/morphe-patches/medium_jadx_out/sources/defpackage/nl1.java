package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nl1 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;
    public final long g;
    public final long h;

    public nl1(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
        this.g = j7;
        this.h = j8;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof nl1)) {
            return false;
        }
        nl1 nl1Var = (nl1) obj;
        long j = nl1Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, nl1Var.b) && ezd.a(this.c, nl1Var.c) && ezd.a(this.d, nl1Var.d) && ezd.a(this.e, nl1Var.e) && ezd.a(this.f, nl1Var.f) && ezd.a(this.g, nl1Var.g) && ezd.a(this.h, nl1Var.h);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.h) + lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e), 31, this.f), 31, this.g);
    }
}
