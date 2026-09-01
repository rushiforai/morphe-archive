package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\f\u0012\b\u0012\u00060\u0002R\u00020\u00000\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lnl0;", "Lu28;", "Lml0;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class nl0 extends u28 {
    public ml0 b;
    public vx1 c;

    public final boolean equals(Object obj) {
        return obj == this;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new ml0(this);
    }

    public final int hashCode() {
        return 234;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
    }

    public final Object m(p92 p92Var) throws Throwable {
        vx1 vx1Var = this.c;
        if (vx1Var == null) {
            vx1Var = new vx1();
            this.c = vx1Var;
            ml0 ml0Var = this.b;
            if (ml0Var != null && ml0Var.n) {
                ml0Var.I0();
            }
        }
        Object objI = vx1Var.i(p92Var);
        return objI == tb2.COROUTINE_SUSPENDED ? objI : c1e.a;
    }
}
