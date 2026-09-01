package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fj2 extends bo {
    public final zq0 n;

    public fj2(zq0 zq0Var) {
        this.n = zq0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof fj2) && g76.L(this.n, ((fj2) obj).n);
    }

    public final int hashCode() {
        return this.n.hashCode();
    }

    public final String toString() {
        return "VerticalCrossAxisAlignment(vertical=" + this.n + ')';
    }

    @Override // defpackage.bo
    public final int y(int i, int i2, ip6 ip6Var) {
        return this.n.a(i2, i);
    }
}
