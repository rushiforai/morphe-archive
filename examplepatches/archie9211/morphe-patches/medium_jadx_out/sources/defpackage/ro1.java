package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lro1;", "Lu28;", "Luo1;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ro1 extends u28 {
    public final m68 b;
    public final w06 c;
    public final boolean d;
    public final boolean e;
    public final String f;
    public final vkb g;
    public final m45 h;

    public ro1(m68 m68Var, w06 w06Var, boolean z, boolean z2, String str, vkb vkbVar, m45 m45Var) {
        this.b = m68Var;
        this.c = w06Var;
        this.d = z;
        this.e = z2;
        this.f = str;
        this.g = vkbVar;
        this.h = m45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || ro1.class != obj.getClass()) {
            return false;
        }
        ro1 ro1Var = (ro1) obj;
        return g76.L(this.b, ro1Var.b) && g76.L(this.c, ro1Var.c) && this.d == ro1Var.d && this.e == ro1Var.e && g76.L(this.f, ro1Var.f) && g76.L(this.g, ro1Var.g) && this.h == ro1Var.h;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new uo1(this.b, this.c, this.d, this.e, this.f, this.g, this.h);
    }

    public final int hashCode() {
        m68 m68Var = this.b;
        int iHashCode = (m68Var != null ? m68Var.hashCode() : 0) * 31;
        w06 w06Var = this.c;
        int iHashCode2 = (((((iHashCode + (w06Var != null ? w06Var.hashCode() : 0)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31;
        String str = this.f;
        int iHashCode3 = (iHashCode2 + (str != null ? str.hashCode() : 0)) * 31;
        vkb vkbVar = this.g;
        return this.h.hashCode() + ((iHashCode3 + (vkbVar != null ? vkbVar.a : 0)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((uo1) q28Var).X0(this.b, this.c, this.d, this.e, this.f, this.g, this.h);
    }
}
