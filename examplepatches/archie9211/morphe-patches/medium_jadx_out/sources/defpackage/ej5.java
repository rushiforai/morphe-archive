package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lej5;", "Lu28;", "Lgj5;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ej5 extends u28 {
    public final mkd b;
    public final int c;
    public final int d;

    public ej5(mkd mkdVar, int i, int i2) {
        this.b = mkdVar;
        this.c = i;
        this.d = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ej5)) {
            return false;
        }
        ej5 ej5Var = (ej5) obj;
        return g76.L(this.b, ej5Var.b) && this.c == ej5Var.c && this.d == ej5Var.d;
    }

    @Override // defpackage.u28
    public final q28 f() {
        gj5 gj5Var = new gj5();
        gj5Var.o = this.b;
        gj5Var.p = this.c;
        gj5Var.q = this.d;
        gj5Var.s = -1;
        gj5Var.t = -1;
        return gj5Var;
    }

    public final int hashCode() {
        return (((this.b.hashCode() * 31) + this.c) * 31) + this.d;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        gj5 gj5Var = (gj5) q28Var;
        mkd mkdVar = gj5Var.o;
        mkd mkdVar2 = this.b;
        boolean zL = g76.L(mkdVar, mkdVar2);
        int i = this.c;
        int i2 = this.d;
        if (zL && gj5Var.p == i && gj5Var.q == i2) {
            return;
        }
        gj5Var.o = mkdVar2;
        gj5Var.p = i;
        gj5Var.q = i2;
        gj5Var.u = il7.C(mkdVar2, flb.v0(gj5Var).z);
        gj5Var.r = true;
        gx1.M(gj5Var);
    }
}
