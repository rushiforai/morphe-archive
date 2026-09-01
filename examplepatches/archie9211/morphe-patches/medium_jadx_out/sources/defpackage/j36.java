package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j36 implements hy8 {
    public final y3f a;
    public final m73 b;

    public j36(y3f y3fVar, m73 m73Var) {
        this.a = y3fVar;
        this.b = m73Var;
    }

    @Override // defpackage.hy8
    public final float a() {
        y3f y3fVar = this.a;
        m73 m73Var = this.b;
        return m73Var.N(y3fVar.c(m73Var));
    }

    @Override // defpackage.hy8
    public final float b(ip6 ip6Var) {
        y3f y3fVar = this.a;
        m73 m73Var = this.b;
        return m73Var.N(y3fVar.d(m73Var, ip6Var));
    }

    @Override // defpackage.hy8
    public final float c(ip6 ip6Var) {
        y3f y3fVar = this.a;
        m73 m73Var = this.b;
        return m73Var.N(y3fVar.b(m73Var, ip6Var));
    }

    @Override // defpackage.hy8
    public final float d() {
        y3f y3fVar = this.a;
        m73 m73Var = this.b;
        return m73Var.N(y3fVar.a(m73Var));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j36)) {
            return false;
        }
        j36 j36Var = (j36) obj;
        return g76.L(this.a, j36Var.a) && g76.L(this.b, j36Var.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "InsetsPaddingValues(insets=" + this.a + ", density=" + this.b + ')';
    }
}
