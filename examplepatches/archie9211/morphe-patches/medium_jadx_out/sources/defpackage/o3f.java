package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o3f implements hy7 {
    public final wq0 a;

    public o3f(wq0 wq0Var) {
        this.a = wq0Var;
    }

    @Override // defpackage.hy7
    public final int a(o46 o46Var, long j, int i, ip6 ip6Var) {
        int i2 = (int) (j >> 32);
        if (i >= i2) {
            return Math.round((1.0f + (ip6Var == ip6.Ltr ? 0.0f : -0.0f)) * ((i2 - i) / 2.0f));
        }
        return iq7.v(this.a.a(i, i2, ip6Var), 0, i2 - i);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof o3f) && this.a.equals(((o3f) obj).a);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.a.a) * 31;
    }

    public final String toString() {
        return "Horizontal(alignment=" + this.a + ", margin=0)";
    }
}
