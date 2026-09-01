package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lzrb;", "Lu28;", "Lasb;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class zrb extends u28 {
    public final nsb b;
    public final hw8 c;
    public final boolean d;
    public final dn4 e;
    public final m68 f;
    public final xy0 g;
    public final boolean h;
    public final fx8 i;

    public zrb(xy0 xy0Var, dn4 dn4Var, m68 m68Var, hw8 hw8Var, fx8 fx8Var, nsb nsbVar, boolean z, boolean z2) {
        this.b = nsbVar;
        this.c = hw8Var;
        this.d = z;
        this.e = dn4Var;
        this.f = m68Var;
        this.g = xy0Var;
        this.h = z2;
        this.i = fx8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || zrb.class != obj.getClass()) {
            return false;
        }
        zrb zrbVar = (zrb) obj;
        return this.b.equals(zrbVar.b) && this.c == zrbVar.c && this.d == zrbVar.d && g76.L(this.e, zrbVar.e) && g76.L(this.f, zrbVar.f) && g76.L(this.g, zrbVar.g) && this.h == zrbVar.h && g76.L(this.i, zrbVar.i);
    }

    @Override // defpackage.u28
    public final q28 f() {
        asb asbVar = new asb();
        asbVar.q = this.b;
        asbVar.r = this.c;
        asbVar.s = this.d;
        asbVar.t = this.e;
        asbVar.u = this.f;
        asbVar.v = this.g;
        asbVar.w = this.h;
        asbVar.x = this.i;
        return asbVar;
    }

    public final int hashCode() {
        int iHashCode = (((((this.c.hashCode() + (this.b.hashCode() * 31)) * 31) + (this.d ? 1231 : 1237)) * 31) + 1237) * 31;
        dn4 dn4Var = this.e;
        int iHashCode2 = (iHashCode + (dn4Var != null ? dn4Var.hashCode() : 0)) * 31;
        m68 m68Var = this.f;
        int iHashCode3 = (iHashCode2 + (m68Var != null ? m68Var.hashCode() : 0)) * 31;
        xy0 xy0Var = this.g;
        int iHashCode4 = (((iHashCode3 + (xy0Var != null ? xy0Var.hashCode() : 0)) * 31) + (this.h ? 1231 : 1237)) * 31;
        fx8 fx8Var = this.i;
        return iHashCode4 + (fx8Var != null ? fx8Var.hashCode() : 0);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((asb) q28Var).N0(this.g, this.e, this.f, this.c, this.i, this.b, this.h, this.d);
    }
}
