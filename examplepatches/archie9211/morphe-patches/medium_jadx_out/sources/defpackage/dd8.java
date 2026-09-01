package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Ldd8;", "Lu28;", "Lhd8;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class dd8 extends u28 {
    public final zc8 b;
    public final cd8 c;

    public dd8(zc8 zc8Var, cd8 cd8Var) {
        this.b = zc8Var;
        this.c = cd8Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof dd8)) {
            return false;
        }
        dd8 dd8Var = (dd8) obj;
        return g76.L(dd8Var.b, this.b) && g76.L(dd8Var.c, this.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new hd8(this.b, this.c);
    }

    public final int hashCode() {
        int iHashCode = this.b.hashCode() * 31;
        cd8 cd8Var = this.c;
        return iHashCode + (cd8Var != null ? cd8Var.hashCode() : 0);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        hd8 hd8Var = (hd8) q28Var;
        hd8Var.o = this.b;
        cd8 cd8Var = hd8Var.p;
        if (cd8Var.a == hd8Var) {
            cd8Var.a = null;
        }
        cd8 cd8Var2 = this.c;
        if (cd8Var2 == null) {
            cd8Var = new cd8();
            hd8Var.p = cd8Var;
        } else if (cd8Var2 != cd8Var) {
            hd8Var.p = cd8Var2;
            cd8Var = cd8Var2;
        }
        if (hd8Var.n) {
            cd8Var.a = hd8Var;
            cd8Var.b = null;
            hd8Var.q = null;
            cd8Var.c = new v5f(1, hd8Var);
            cd8Var.d = hd8Var.u0();
        }
    }
}
