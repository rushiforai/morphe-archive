package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hqe implements y3f {
    public final String a;
    public final k49 b;

    public hqe(k36 k36Var, String str) {
        this.a = str;
        this.b = qo7.u(k36Var);
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        return e().b;
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        return e().c;
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        return e().d;
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        return e().a;
    }

    public final k36 e() {
        return (k36) this.b.getValue();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof hqe) {
            return g76.L(e(), ((hqe) obj).e());
        }
        return false;
    }

    public final void f(k36 k36Var) {
        this.b.setValue(k36Var);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(this.a);
        sb.append("(left=");
        sb.append(e().a);
        sb.append(", top=");
        sb.append(e().b);
        sb.append(", right=");
        sb.append(e().c);
        sb.append(", bottom=");
        return km4.A(sb, e().d, ')');
    }
}
