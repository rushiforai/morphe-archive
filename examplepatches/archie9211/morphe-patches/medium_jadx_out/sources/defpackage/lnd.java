package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Llnd;", "Lu28;", "Lmnd;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class lnd extends u28 {
    public final boolean b;
    public final m68 c;
    public final boolean d;
    public final vkb e;
    public final x45 f;

    public lnd(boolean z, m68 m68Var, boolean z2, vkb vkbVar, x45 x45Var) {
        this.b = z;
        this.c = m68Var;
        this.d = z2;
        this.e = vkbVar;
        this.f = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || lnd.class != obj.getClass()) {
            return false;
        }
        lnd lndVar = (lnd) obj;
        return this.b == lndVar.b && g76.L(this.c, lndVar.c) && this.d == lndVar.d && this.e.equals(lndVar.e) && this.f == lndVar.f;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new mnd(this.b, this.c, this.d, this.e, this.f);
    }

    public final int hashCode() {
        int i = (this.b ? 1231 : 1237) * 31;
        m68 m68Var = this.c;
        return this.f.hashCode() + ((((((((i + (m68Var != null ? m68Var.hashCode() : 0)) * 961) + 1237) * 31) + (this.d ? 1231 : 1237)) * 31) + this.e.a) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        mnd mndVar = (mnd) q28Var;
        boolean z = mndVar.O;
        boolean z2 = this.b;
        if (z != z2) {
            mndVar.O = z2;
            dl7.u(mndVar);
        }
        mndVar.P = this.f;
        mndVar.X0(this.c, null, false, this.d, null, this.e, mndVar.Q);
    }
}
