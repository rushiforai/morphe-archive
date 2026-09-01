package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Liy8;", "Lu28;", "Lky8;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class iy8 extends u28 {
    public final hy8 b;

    public iy8(hy8 hy8Var) {
        this.b = hy8Var;
    }

    public final boolean equals(Object obj) {
        iy8 iy8Var = obj instanceof iy8 ? (iy8) obj : null;
        if (iy8Var == null) {
            return false;
        }
        return g76.L(this.b, iy8Var.b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        ky8 ky8Var = new ky8();
        ky8Var.o = this.b;
        return ky8Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((ky8) q28Var).o = this.b;
    }
}
