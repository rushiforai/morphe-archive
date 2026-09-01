package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\u00030\u0002¨\u0006\u0004"}, d2 = {"Lhk;", "T", "Lu28;", "Lcl;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class hk<T> extends u28 {
    public final ul b;
    public final hw8 c;
    public final boolean d;
    public final iic e;

    public hk(ul ulVar, hw8 hw8Var, boolean z, iic iicVar) {
        this.b = ulVar;
        this.c = hw8Var;
        this.d = z;
        this.e = iicVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hk)) {
            return false;
        }
        hk hkVar = (hk) obj;
        return g76.L(this.b, hkVar.b) && this.c == hkVar.c && this.d == hkVar.d && g76.L(this.e, hkVar.e);
    }

    @Override // defpackage.u28
    public final q28 f() {
        b5 b5Var = vx0.a;
        boolean z = this.d;
        hw8 hw8Var = this.c;
        cl clVar = new cl(b5Var, z, null, hw8Var);
        clVar.J = this.b;
        clVar.K = hw8Var;
        clVar.L = this.e;
        return clVar;
    }

    public final int hashCode() {
        int iHashCode = (((this.c.hashCode() + (this.b.hashCode() * 31)) * 31) + (this.d ? 1231 : 1237)) * 28629151;
        iic iicVar = this.e;
        return iHashCode + (iicVar != null ? iicVar.hashCode() : 0);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        boolean z;
        boolean z2;
        cl clVar = (cl) q28Var;
        iic iicVar = this.e;
        clVar.L = iicVar;
        ul ulVar = clVar.J;
        ul ulVar2 = this.b;
        if (g76.L(ulVar, ulVar2)) {
            z = false;
        } else {
            clVar.J = ulVar2;
            clVar.f1(iicVar);
            z = true;
        }
        hw8 hw8Var = clVar.K;
        hw8 hw8Var2 = this.c;
        if (hw8Var != hw8Var2) {
            clVar.K = hw8Var2;
            z2 = true;
        } else {
            z2 = z;
        }
        clVar.c1(clVar.r, this.d, null, hw8Var2, z2);
    }
}
