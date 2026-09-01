package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lkz3;", "Lu28;", "Lxz3;", "animation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class kz3 extends u28 {
    public final dsd b;
    public final xrd c;
    public final xrd d;
    public final xrd e;
    public final zz3 f;
    public final k54 g;
    public final m45 h;
    public final lz3 i;

    public kz3(dsd dsdVar, xrd xrdVar, xrd xrdVar2, xrd xrdVar3, zz3 zz3Var, k54 k54Var, m45 m45Var, lz3 lz3Var) {
        this.b = dsdVar;
        this.c = xrdVar;
        this.d = xrdVar2;
        this.e = xrdVar3;
        this.f = zz3Var;
        this.g = k54Var;
        this.h = m45Var;
        this.i = lz3Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof kz3)) {
            return false;
        }
        kz3 kz3Var = (kz3) obj;
        return kz3Var.b == this.b && g76.L(kz3Var.c, this.c) && g76.L(kz3Var.d, this.d) && g76.L(kz3Var.e, this.e) && kz3Var.f.equals(this.f) && g76.L(kz3Var.g, this.g) && kz3Var.h == this.h && g76.L(kz3Var.i, this.i);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new xz3(this.b, this.c, this.d, this.e, this.f, this.g, this.h, this.i);
    }

    public final int hashCode() {
        int iHashCode = this.b.hashCode() * 31;
        xrd xrdVar = this.c;
        int iHashCode2 = (iHashCode + (xrdVar != null ? xrdVar.hashCode() : 0)) * 31;
        xrd xrdVar2 = this.d;
        int iHashCode3 = (iHashCode2 + (xrdVar2 != null ? xrdVar2.hashCode() : 0)) * 31;
        xrd xrdVar3 = this.e;
        return this.i.hashCode() + ((this.h.hashCode() + ((this.g.a.hashCode() + ((this.f.a.hashCode() + ((iHashCode3 + (xrdVar3 != null ? xrdVar3.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        xz3 xz3Var = (xz3) q28Var;
        xz3Var.p = this.b;
        xz3Var.q = this.c;
        xz3Var.r = this.d;
        xz3Var.s = this.e;
        xz3Var.t = this.f;
        xz3Var.u = this.g;
        xz3Var.v = this.h;
        xz3Var.w = this.i;
    }
}
