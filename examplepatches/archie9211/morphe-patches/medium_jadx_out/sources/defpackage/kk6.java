package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lkk6;", "Lu28;", "Lmk6;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class kk6 extends u28 {
    public final x45 b;
    public final x45 c;

    public kk6(x45 x45Var, x45 x45Var2) {
        this.b = x45Var;
        this.c = x45Var2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kk6)) {
            return false;
        }
        kk6 kk6Var = (kk6) obj;
        return this.b == kk6Var.b && this.c == kk6Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        mk6 mk6Var = new mk6();
        mk6Var.o = this.b;
        mk6Var.p = this.c;
        return mk6Var;
    }

    public final int hashCode() {
        x45 x45Var = this.b;
        int iHashCode = (x45Var != null ? x45Var.hashCode() : 0) * 31;
        x45 x45Var2 = this.c;
        return iHashCode + (x45Var2 != null ? x45Var2.hashCode() : 0);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        mk6 mk6Var = (mk6) q28Var;
        mk6Var.o = this.b;
        mk6Var.p = this.c;
    }
}
