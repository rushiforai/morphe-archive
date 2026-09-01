package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f61 {
    public m73 a;
    public ip6 b;
    public e61 c;
    public long d;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f61)) {
            return false;
        }
        f61 f61Var = (f61) obj;
        return g76.L(this.a, f61Var.a) && this.b == f61Var.b && g76.L(this.c, f61Var.c) && dfc.a(this.d, f61Var.d);
    }

    public final int hashCode() {
        int iHashCode = (this.c.hashCode() + ((this.b.hashCode() + (this.a.hashCode() * 31)) * 31)) * 31;
        long j = this.d;
        return ((int) (j ^ (j >>> 32))) + iHashCode;
    }

    public final String toString() {
        return "DrawParams(density=" + this.a + ", layoutDirection=" + this.b + ", canvas=" + this.c + ", size=" + ((Object) dfc.f(this.d)) + ')';
    }
}
