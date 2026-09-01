package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0082\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lot6;", "Lu28;", "Lpt6;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final /* data */ class ot6 extends u28 {
    public final st6 b;

    public ot6(st6 st6Var) {
        this.b = st6Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ot6) && this.b == ((ot6) obj).b;
    }

    @Override // defpackage.u28
    public final q28 f() {
        pt6 pt6Var = new pt6();
        pt6Var.o = this.b;
        return pt6Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        pt6 pt6Var = (pt6) q28Var;
        st6 st6Var = pt6Var.o;
        st6 st6Var2 = this.b;
        if (g76.L(st6Var, st6Var2) || !pt6Var.a.n) {
            return;
        }
        st6 st6Var3 = pt6Var.o;
        st6Var3.e();
        st6Var3.b = null;
        st6Var3.c = -1;
        st6Var2.j = pt6Var;
        pt6Var.o = st6Var2;
    }

    public final String toString() {
        return "DisplayingDisappearingItemsElement(animator=" + this.b + ')';
    }
}
