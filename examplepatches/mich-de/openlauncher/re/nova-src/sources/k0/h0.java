package k0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h0 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final g2 f70613a;

    /* renamed from: b, reason: collision with root package name */
    public final g2 f70614b;

    public h0(g2 g2Var, g2 g2Var2) {
        this.f70613a = g2Var;
        this.f70614b = g2Var2;
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        int iA = this.f70613a.a(cVar, nVar) - this.f70614b.a(cVar, nVar);
        if (iA < 0) {
            return 0;
        }
        return iA;
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        int iB = this.f70613a.b(cVar, nVar) - this.f70614b.b(cVar, nVar);
        if (iB < 0) {
            return 0;
        }
        return iB;
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        int iC = this.f70613a.c(cVar) - this.f70614b.c(cVar);
        if (iC < 0) {
            return 0;
        }
        return iC;
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        int iD = this.f70613a.d(cVar) - this.f70614b.d(cVar);
        if (iD < 0) {
            return 0;
        }
        return iD;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h0)) {
            return false;
        }
        h0 h0Var = (h0) obj;
        return Intrinsics.b(h0Var.f70613a, this.f70613a) && Intrinsics.b(h0Var.f70614b, this.f70614b);
    }

    public final int hashCode() {
        return this.f70614b.hashCode() + (this.f70613a.hashCode() * 31);
    }

    public final String toString() {
        return "(" + this.f70613a + " - " + this.f70614b + ')';
    }
}
