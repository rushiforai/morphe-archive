package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lby0;", "Lu28;", "Lcy0;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class by0 extends u28 {
    public final ar0 b;
    public final boolean c;

    public by0(ar0 ar0Var, boolean z) {
        this.b = ar0Var;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        by0 by0Var = obj instanceof by0 ? (by0) obj : null;
        return by0Var != null && this.b.equals(by0Var.b) && this.c == by0Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        cy0 cy0Var = new cy0();
        cy0Var.o = this.b;
        cy0Var.p = this.c;
        return cy0Var;
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + (this.c ? 1231 : 1237);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        cy0 cy0Var = (cy0) q28Var;
        cy0Var.o = this.b;
        cy0Var.p = this.c;
    }
}
