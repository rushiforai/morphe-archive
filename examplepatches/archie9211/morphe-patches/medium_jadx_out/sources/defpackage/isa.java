package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class isa {
    public final long a;
    public final long b;
    public final long c;
    public final long d;

    public isa(long j, long j2, long j3, long j4) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof isa)) {
            return false;
        }
        isa isaVar = (isa) obj;
        long j = isaVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, isaVar.b) && ezd.a(this.c, isaVar.c) && ezd.a(this.d, isaVar.d);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.d) + lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c);
    }
}
