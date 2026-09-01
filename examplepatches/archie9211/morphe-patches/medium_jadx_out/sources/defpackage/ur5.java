package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lur5;", "Lu28;", "Lyr5;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ur5 extends u28 {
    public final m68 b;

    public ur5(m68 m68Var) {
        this.b = m68Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ur5) && g76.L(((ur5) obj).b, this.b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        yr5 yr5Var = new yr5();
        yr5Var.o = this.b;
        return yr5Var;
    }

    public final int hashCode() {
        return this.b.hashCode() * 31;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        yr5 yr5Var = (yr5) q28Var;
        m68 m68Var = yr5Var.o;
        m68 m68Var2 = this.b;
        if (g76.L(m68Var, m68Var2)) {
            return;
        }
        yr5Var.K0();
        yr5Var.o = m68Var2;
    }
}
