package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lu06;", "Lu28;", "Lv06;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class u06 extends u28 {
    public final d56 b;
    public final w06 c;

    public u06(d56 d56Var, w06 w06Var) {
        this.b = d56Var;
        this.c = w06Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u06)) {
            return false;
        }
        u06 u06Var = (u06) obj;
        return g76.L(this.b, u06Var.b) && g76.L(this.c, u06Var.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        a43 a43VarA = this.c.a(this.b);
        v06 v06Var = new v06();
        v06Var.q = a43VarA;
        v06Var.I0(a43VarA);
        return v06Var;
    }

    public final int hashCode() {
        return this.c.hashCode() + (this.b.hashCode() * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        v06 v06Var = (v06) q28Var;
        a43 a43VarA = this.c.a(this.b);
        v06Var.J0(v06Var.q);
        v06Var.q = a43VarA;
        v06Var.I0(a43VarA);
    }
}
