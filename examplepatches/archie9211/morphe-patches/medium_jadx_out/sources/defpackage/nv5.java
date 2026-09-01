package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nv5 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public nv5(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final nv5 a(long j, long j2, long j3, long j4) {
        return new nv5(j != 16 ? j : this.a, j2 != 16 ? j2 : this.b, j3 != 16 ? j3 : this.c, j4 != 16 ? j4 : this.d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof nv5)) {
            return false;
        }
        nv5 nv5Var = (nv5) obj;
        long j = nv5Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, nv5Var.b) && ezd.a(this.c, nv5Var.c) && ezd.a(this.d, nv5Var.d);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }
}
