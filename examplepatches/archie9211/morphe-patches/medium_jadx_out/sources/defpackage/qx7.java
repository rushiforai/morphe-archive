package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qx7 {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;

    public qx7(long j, long j2, long j3, long j4, long j5, long j6) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof qx7)) {
            return false;
        }
        qx7 qx7Var = (qx7) obj;
        long j = qx7Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, qx7Var.b) && ezd.a(this.c, qx7Var.c) && ezd.a(this.d, qx7Var.d) && ezd.a(this.e, qx7Var.e) && ezd.a(this.f, qx7Var.f);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.f) + lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e);
    }
}
