package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y0e implements y3f {
    public final y3f a;
    public final y3f b;

    public y0e(y3f y3fVar, y3f y3fVar2) {
        this.a = y3fVar;
        this.b = y3fVar2;
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        return Math.max(this.a.a(m73Var), this.b.a(m73Var));
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        return Math.max(this.a.b(m73Var, ip6Var), this.b.b(m73Var, ip6Var));
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        return Math.max(this.a.c(m73Var), this.b.c(m73Var));
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        return Math.max(this.a.d(m73Var, ip6Var), this.b.d(m73Var, ip6Var));
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y0e)) {
            return false;
        }
        y0e y0eVar = (y0e) obj;
        return g76.L(y0eVar.a, this.a) && g76.L(y0eVar.b, this.b);
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + this.a.hashCode();
    }

    public final String toString() {
        return "(" + this.a + " ∪ " + this.b + ')';
    }
}
