package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f44 implements y3f {
    public final y3f a;
    public final y3f b;

    public f44(y3f y3fVar, y3f y3fVar2) {
        this.a = y3fVar;
        this.b = y3fVar2;
    }

    @Override // defpackage.y3f
    public final int a(m73 m73Var) {
        int iA = this.a.a(m73Var) - this.b.a(m73Var);
        if (iA < 0) {
            return 0;
        }
        return iA;
    }

    @Override // defpackage.y3f
    public final int b(m73 m73Var, ip6 ip6Var) {
        int iB = this.a.b(m73Var, ip6Var) - this.b.b(m73Var, ip6Var);
        if (iB < 0) {
            return 0;
        }
        return iB;
    }

    @Override // defpackage.y3f
    public final int c(m73 m73Var) {
        int iC = this.a.c(m73Var) - this.b.c(m73Var);
        if (iC < 0) {
            return 0;
        }
        return iC;
    }

    @Override // defpackage.y3f
    public final int d(m73 m73Var, ip6 ip6Var) {
        int iD = this.a.d(m73Var, ip6Var) - this.b.d(m73Var, ip6Var);
        if (iD < 0) {
            return 0;
        }
        return iD;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f44)) {
            return false;
        }
        f44 f44Var = (f44) obj;
        return g76.L(f44Var.a, this.a) && g76.L(f44Var.b, this.b);
    }

    public final int hashCode() {
        return this.b.hashCode() + (this.a.hashCode() * 31);
    }

    public final String toString() {
        return "(" + this.a + " - " + this.b + ')';
    }
}
