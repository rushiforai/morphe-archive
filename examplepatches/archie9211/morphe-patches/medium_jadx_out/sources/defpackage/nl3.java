package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lnl3;", "Lu28;", "Lrl3;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class nl3 extends u28 {
    public static final b5 j = new b5(26);
    public final sl3 b;
    public final hw8 c;
    public final boolean d;
    public final m68 e;
    public final boolean f;
    public final c55 g;
    public final c55 h;
    public final boolean i;

    public nl3(sl3 sl3Var, hw8 hw8Var, boolean z, m68 m68Var, boolean z2, ol3 ol3Var, c55 c55Var, boolean z3) {
        this.b = sl3Var;
        this.c = hw8Var;
        this.d = z;
        this.e = m68Var;
        this.f = z2;
        this.g = ol3Var;
        this.h = c55Var;
        this.i = z3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || nl3.class != obj.getClass()) {
            return false;
        }
        nl3 nl3Var = (nl3) obj;
        return g76.L(this.b, nl3Var.b) && this.c == nl3Var.c && this.d == nl3Var.d && g76.L(this.e, nl3Var.e) && this.f == nl3Var.f && g76.L(this.g, nl3Var.g) && g76.L(this.h, nl3Var.h) && this.i == nl3Var.i;
    }

    @Override // defpackage.u28
    public final q28 f() {
        b5 b5Var = j;
        boolean z = this.d;
        m68 m68Var = this.e;
        hw8 hw8Var = this.c;
        rl3 rl3Var = new rl3(b5Var, z, m68Var, hw8Var);
        rl3Var.J = this.b;
        rl3Var.K = hw8Var;
        rl3Var.L = this.f;
        rl3Var.M = this.g;
        rl3Var.N = this.h;
        rl3Var.O = this.i;
        return rl3Var;
    }

    public final int hashCode() {
        int iHashCode = (((this.c.hashCode() + (this.b.hashCode() * 31)) * 31) + (this.d ? 1231 : 1237)) * 31;
        m68 m68Var = this.e;
        return ((this.h.hashCode() + ((this.g.hashCode() + ((((iHashCode + (m68Var != null ? m68Var.hashCode() : 0)) * 31) + (this.f ? 1231 : 1237)) * 31)) * 31)) * 31) + (this.i ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        boolean z;
        boolean z2;
        rl3 rl3Var = (rl3) q28Var;
        sl3 sl3Var = rl3Var.J;
        sl3 sl3Var2 = this.b;
        if (g76.L(sl3Var, sl3Var2)) {
            z = false;
        } else {
            rl3Var.J = sl3Var2;
            z = true;
        }
        hw8 hw8Var = rl3Var.K;
        hw8 hw8Var2 = this.c;
        if (hw8Var != hw8Var2) {
            rl3Var.K = hw8Var2;
            z = true;
        }
        boolean z3 = rl3Var.O;
        boolean z4 = this.i;
        if (z3 != z4) {
            rl3Var.O = z4;
            z2 = true;
        } else {
            z2 = z;
        }
        rl3Var.M = this.g;
        rl3Var.N = this.h;
        rl3Var.L = this.f;
        rl3Var.c1(j, this.d, this.e, hw8Var2, z2);
    }
}
