package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lnu6;", "Lu28;", "Lru6;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class nu6 extends u28 {
    public final m45 b;
    public final ku6 c;
    public final hw8 d;
    public final boolean e;

    public nu6(m45 m45Var, ku6 ku6Var, hw8 hw8Var, boolean z) {
        this.b = m45Var;
        this.c = ku6Var;
        this.d = hw8Var;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof nu6)) {
            return false;
        }
        nu6 nu6Var = (nu6) obj;
        return this.b == nu6Var.b && g76.L(this.c, nu6Var.c) && this.d == nu6Var.d && this.e == nu6Var.e;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new ru6(this.b, this.c, this.d, this.e);
    }

    public final int hashCode() {
        return ((((this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31)) * 31) + (this.e ? 1231 : 1237)) * 31) + 1237;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ru6 ru6Var = (ru6) q28Var;
        ru6Var.o = this.b;
        ru6Var.p = this.c;
        hw8 hw8Var = ru6Var.q;
        hw8 hw8Var2 = this.d;
        if (hw8Var != hw8Var2) {
            ru6Var.q = hw8Var2;
            dl7.u(ru6Var);
        }
        boolean z = ru6Var.r;
        boolean z2 = this.e;
        if (z == z2) {
            return;
        }
        ru6Var.r = z2;
        ru6Var.I0();
        dl7.u(ru6Var);
    }
}
