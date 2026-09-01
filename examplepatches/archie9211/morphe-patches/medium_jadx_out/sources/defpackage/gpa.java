package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lgpa;", "Lu28;", "Lmpa;", "material3"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class gpa extends u28 {
    public final boolean b;
    public final m45 c;
    public final boolean d;
    public final npa e;
    public final float f;

    public gpa(boolean z, m45 m45Var, boolean z2, npa npaVar, float f) {
        this.b = z;
        this.c = m45Var;
        this.d = z2;
        this.e = npaVar;
        this.f = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gpa)) {
            return false;
        }
        gpa gpaVar = (gpa) obj;
        return this.b == gpaVar.b && this.d == gpaVar.d && this.c == gpaVar.c && g76.L(this.e, gpaVar.e) && vj3.b(this.f, gpaVar.f);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new mpa(this.b, this.c, this.d, this.e, this.f);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.f) + ((this.e.hashCode() + ((this.c.hashCode() + ((((this.b ? 1231 : 1237) * 31) + (this.d ? 1231 : 1237)) * 31)) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        mpa mpaVar = (mpa) q28Var;
        mpaVar.r = this.c;
        mpaVar.s = this.d;
        mpaVar.t = this.e;
        mpaVar.u = this.f;
        boolean z = mpaVar.q;
        boolean z2 = this.b;
        if (z != z2) {
            mpaVar.q = z2;
            vx0.c0(mpaVar.u0(), null, null, new jpa(mpaVar, null, 2), 3);
        }
    }
}
