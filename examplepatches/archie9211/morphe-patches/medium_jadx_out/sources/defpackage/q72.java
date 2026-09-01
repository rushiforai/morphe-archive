package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lq72;", "Lu28;", "Lr72;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class q72 extends u28 {
    public final x45 b;

    public q72(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof q72) && ((q72) obj).b == this.b;
    }

    @Override // defpackage.u28
    public final q28 f() {
        r72 r72Var = new r72();
        r72Var.q = this.b;
        return r72Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        r72 r72Var = (r72) q28Var;
        x45 x45Var = r72Var.q;
        x45 x45Var2 = this.b;
        if (x45Var2 != x45Var) {
            r72Var.q = x45Var2;
        }
    }
}
