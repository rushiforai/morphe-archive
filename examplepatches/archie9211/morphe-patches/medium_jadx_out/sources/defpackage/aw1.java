package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Law1;", "Lu28;", "Lcw1;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class aw1 extends u28 {
    public final m68 b;
    public final m45 c;

    public aw1(m45 m45Var, m68 m68Var) {
        this.b = m68Var;
        this.c = m45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || aw1.class != obj.getClass()) {
            return false;
        }
        aw1 aw1Var = (aw1) obj;
        return g76.L(this.b, aw1Var.b) && this.c == aw1Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new cw1(this.c, this.b);
    }

    public final int hashCode() {
        m68 m68Var = this.b;
        return ((this.c.hashCode() + ((((((m68Var != null ? m68Var.hashCode() : 0) * 961) + 1237) * 31) + 1231) * 29791)) * 923521) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        cw1 cw1Var = (cw1) q28Var;
        cw1Var.getClass();
        boolean z = !cw1Var.v;
        cw1Var.X0(this.b, null, false, true, null, null, this.c);
        if (z) {
            w4d w4dVar = cw1Var.z;
            if (w4dVar != null) {
                w4dVar.K0();
            }
            cw1Var.Y0(false);
            cw1Var.Y0(true);
        }
    }
}
