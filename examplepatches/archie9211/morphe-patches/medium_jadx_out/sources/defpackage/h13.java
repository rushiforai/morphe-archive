package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h13 {
    public final long a;
    public final long b;
    public final long c;

    public h13(long j, long j2, long j3) {
        this.a = j;
        this.b = j2;
        this.c = j3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || h13.class != obj.getClass()) {
            return false;
        }
        h13 h13Var = (h13) obj;
        long j = h13Var.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, h13Var.b) && ezd.a(this.c, h13Var.c);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.c) + lv8.g(ev6.n(this.a) * 31, 31, this.b);
    }
}
