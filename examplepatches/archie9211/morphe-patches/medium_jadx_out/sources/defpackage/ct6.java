package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lct6;", "Lu28;", "Lgt6;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ct6 extends u28 {
    public final ht6 b;
    public final rz2 c;
    public final hw8 d;

    public ct6(ht6 ht6Var, rz2 rz2Var, hw8 hw8Var) {
        this.b = ht6Var;
        this.c = rz2Var;
        this.d = hw8Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ct6)) {
            return false;
        }
        ct6 ct6Var = (ct6) obj;
        return g76.L(this.b, ct6Var.b) && g76.L(this.c, ct6Var.c) && this.d == ct6Var.d;
    }

    @Override // defpackage.u28
    public final q28 f() {
        gt6 gt6Var = new gt6();
        gt6Var.o = this.b;
        gt6Var.p = this.c;
        gt6Var.q = this.d;
        return gt6Var;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((((this.c.hashCode() + (this.b.hashCode() * 31)) * 31) + 1237) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        gt6 gt6Var = (gt6) q28Var;
        gt6Var.o = this.b;
        gt6Var.p = this.c;
        gt6Var.q = this.d;
    }
}
