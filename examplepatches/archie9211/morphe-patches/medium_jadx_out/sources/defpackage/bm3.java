package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lbm3;", "Lu28;", "Lc31;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class bm3 extends u28 {
    public final x45 b;

    public bm3(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof bm3) {
            return this.b == ((bm3) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new c31(new d31(), this.b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        c31 c31Var = (c31) q28Var;
        c31Var.q = this.b;
        c31Var.I0();
    }
}
