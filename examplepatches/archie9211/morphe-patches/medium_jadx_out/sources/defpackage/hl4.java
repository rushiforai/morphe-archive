package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hl4 implements y3f {
    public final int a;

    public hl4(int i) {
        this.a = i;
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        return this.a;
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        return 0;
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        return 0;
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof hl4) && this.a == ((hl4) obj).a;
    }

    public final int hashCode() {
        return this.a * 961;
    }

    public final String toString() {
        return ho2.H(new StringBuilder("Insets(left=0, top="), this.a, ", right=0, bottom=0)");
    }
}
