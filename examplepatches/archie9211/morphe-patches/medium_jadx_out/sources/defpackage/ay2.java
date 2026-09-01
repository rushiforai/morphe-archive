package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ay2 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public ay2(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final l78 a(boolean z, x12 x12Var) {
        p65 p65Var = (p65) x12Var;
        p65Var.Y(-2133647540);
        l78 l78VarY = qo7.y(new uu1(z ? this.b : this.d), p65Var);
        p65Var.p(false);
        return l78VarY;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || ay2.class != obj.getClass()) {
            return false;
        }
        ay2 ay2Var = (ay2) obj;
        long j = ay2Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, ay2Var.b) && ezd.a(this.c, ay2Var.c) && ezd.a(this.d, ay2Var.d);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }
}
