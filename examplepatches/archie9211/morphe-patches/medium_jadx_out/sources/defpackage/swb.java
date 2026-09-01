package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lswb;", "Lu28;", "Luwb;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class swb extends u28 {
    public final boolean b;
    public final m68 c;
    public final w06 d;
    public final boolean e;
    public final boolean f;
    public final vkb g;
    public final m45 h;

    public swb(boolean z, m68 m68Var, w06 w06Var, boolean z2, boolean z3, vkb vkbVar, m45 m45Var) {
        this.b = z;
        this.c = m68Var;
        this.d = w06Var;
        this.e = z2;
        this.f = z3;
        this.g = vkbVar;
        this.h = m45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || swb.class != obj.getClass()) {
            return false;
        }
        swb swbVar = (swb) obj;
        return this.b == swbVar.b && g76.L(this.c, swbVar.c) && g76.L(this.d, swbVar.d) && this.e == swbVar.e && this.f == swbVar.f && this.g.equals(swbVar.g) && this.h == swbVar.h;
    }

    @Override // defpackage.u28
    public final q28 f() {
        uwb uwbVar = new uwb(this.c, this.d, this.e, this.f, null, this.g, this.h);
        uwbVar.O = this.b;
        return uwbVar;
    }

    public final int hashCode() {
        int i = (this.b ? 1231 : 1237) * 31;
        m68 m68Var = this.c;
        int iHashCode = (i + (m68Var != null ? m68Var.hashCode() : 0)) * 31;
        w06 w06Var = this.d;
        return this.h.hashCode() + ((((((((iHashCode + (w06Var != null ? w06Var.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + this.g.a) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        uwb uwbVar = (uwb) q28Var;
        boolean z = uwbVar.O;
        boolean z2 = this.b;
        if (z != z2) {
            uwbVar.O = z2;
            dl7.u(uwbVar);
        }
        uwbVar.X0(this.c, this.d, this.e, this.f, null, this.g, this.h);
    }
}
