package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xk1 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public xk1(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xk1)) {
            return false;
        }
        xk1 xk1Var = (xk1) obj;
        long j = xk1Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, xk1Var.b) && ezd.a(this.c, xk1Var.c) && ezd.a(this.d, xk1Var.d);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }

    public final String toString() {
        String strH = uu1.h(this.a);
        String strH2 = uu1.h(this.b);
        return km4.C(y30.u("ChartColors(backStrongColor=", strH, ", backWeakColor=", strH2, ", frontStrongColor="), uu1.h(this.c), ", frontWeakColor=", uu1.h(this.d), ")");
    }
}
