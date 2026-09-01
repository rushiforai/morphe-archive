package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r61 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public r61(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof r61)) {
            return false;
        }
        r61 r61Var = (r61) obj;
        long j = r61Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, r61Var.b) && ezd.a(this.c, r61Var.c) && ezd.a(this.d, r61Var.d);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }
}
