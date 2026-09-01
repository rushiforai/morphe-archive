package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ej2 extends bo {
    public final wd n;

    public ej2(yq0 yq0Var) {
        this.n = yq0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ej2) && g76.L(this.n, ((ej2) obj).n);
    }

    public final int hashCode() {
        return this.n.hashCode();
    }

    public final String toString() {
        return "HorizontalCrossAxisAlignment(horizontal=" + this.n + ')';
    }

    @Override // defpackage.bo
    public final int y(int i, int i2, ip6 ip6Var) {
        return this.n.a(i2, i, ip6Var);
    }
}
