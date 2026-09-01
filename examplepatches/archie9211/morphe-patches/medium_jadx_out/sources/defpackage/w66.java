package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lw66;", "Lu28;", "Lx66;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class w66 extends u28 {
    public final a76 b;

    public w66(a76 a76Var) {
        this.b = a76Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        w66 w66Var = obj instanceof w66 ? (w66) obj : null;
        return w66Var != null && this.b == w66Var.b;
    }

    @Override // defpackage.u28
    public final q28 f() {
        x66 x66Var = new x66(0);
        x66Var.p = this.b;
        x66Var.q = true;
        return x66Var;
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        x66 x66Var = (x66) q28Var;
        x66Var.p = this.b;
        x66Var.q = true;
    }
}
