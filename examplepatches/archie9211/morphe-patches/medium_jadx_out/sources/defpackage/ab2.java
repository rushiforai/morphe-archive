package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lab2;", "Lu28;", "Ldb2;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class ab2 extends u28 {
    public final prd b;
    public final uid c;
    public final kx6 d;
    public final boolean e;
    public final yqa f;
    public final lid g;
    public final ry5 h;
    public final sr4 i;

    public ab2(prd prdVar, uid uidVar, kx6 kx6Var, boolean z, yqa yqaVar, lid lidVar, ry5 ry5Var, sr4 sr4Var) {
        this.b = prdVar;
        this.c = uidVar;
        this.d = kx6Var;
        this.e = z;
        this.f = yqaVar;
        this.g = lidVar;
        this.h = ry5Var;
        this.i = sr4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ab2) {
            ab2 ab2Var = (ab2) obj;
            if (this.b.equals(ab2Var.b) && g76.L(this.c, ab2Var.c) && this.d == ab2Var.d && this.e == ab2Var.e && this.f.equals(ab2Var.f) && this.g == ab2Var.g && g76.L(this.h, ab2Var.h) && g76.L(this.i, ab2Var.i)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        db2 db2Var = new db2();
        db2Var.q = this.b;
        db2Var.r = this.c;
        db2Var.s = this.d;
        db2Var.t = this.e;
        db2Var.u = this.f;
        lid lidVar = this.g;
        db2Var.v = lidVar;
        db2Var.w = this.h;
        db2Var.x = this.i;
        lidVar.f = new bb2(db2Var, 4);
        return db2Var;
    }

    public final int hashCode() {
        return this.i.hashCode() + ((this.h.hashCode() + ((this.g.hashCode() + ((this.f.hashCode() + ((((((((this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31)) * 31) + 1237) * 31) + (this.e ? 1231 : 1237)) * 31) + 1237) * 31)) * 31)) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        db2 db2Var = (db2) q28Var;
        boolean z = db2Var.t;
        ry5 ry5Var = db2Var.w;
        lid lidVar = db2Var.v;
        db2Var.q = this.b;
        uid uidVar = this.c;
        db2Var.r = uidVar;
        db2Var.s = this.d;
        boolean z2 = this.e;
        db2Var.t = z2;
        db2Var.u = this.f;
        lid lidVar2 = this.g;
        db2Var.v = lidVar2;
        ry5 ry5Var2 = this.h;
        db2Var.w = ry5Var2;
        db2Var.x = this.i;
        if (z2 != z || z2 != z || !g76.L(ry5Var2, ry5Var) || !bkd.c(uidVar.b)) {
            dl7.u(db2Var);
        }
        if (lidVar2 != lidVar) {
            lidVar2.f = new bb2(db2Var, 0);
        }
    }

    public final String toString() {
        return "CoreTextFieldSemanticsModifier(transformedText=" + this.b + ", value=" + this.c + ", state=" + this.d + ", readOnly=false, enabled=" + this.e + ", isPassword=false, offsetMapping=" + this.f + ", manager=" + this.g + ", imeOptions=" + this.h + ", focusRequester=" + this.i + ')';
    }
}
