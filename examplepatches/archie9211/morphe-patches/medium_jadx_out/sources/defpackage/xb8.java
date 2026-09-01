package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xb8 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;
    public final long g;

    public xb8(long j, long j2, long j3, long j4, long j5, long j6, long j7) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
        this.g = j7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof xb8)) {
            return false;
        }
        xb8 xb8Var = (xb8) obj;
        long j = xb8Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.d, xb8Var.d) && ezd.a(this.b, xb8Var.b) && ezd.a(this.e, xb8Var.e) && ezd.a(this.c, xb8Var.c) && ezd.a(this.f, xb8Var.f) && ezd.a(this.g, xb8Var.g);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.g) + lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.d), 31, this.b), 31, this.e), 31, this.c), 31, this.f);
    }
}
