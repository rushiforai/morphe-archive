package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Loy0;", "Lu28;", "Lry0;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class oy0 extends u28 {
    public final qy0 b;

    public oy0(qy0 qy0Var) {
        this.b = qy0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof oy0) {
            return g76.L(this.b, ((oy0) obj).b);
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ry0 ry0Var = new ry0();
        ry0Var.o = this.b;
        return ry0Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ry0 ry0Var = (ry0) q28Var;
        qy0 qy0Var = ry0Var.o;
        if (qy0Var != null) {
            qy0Var.a.l(ry0Var);
        }
        qy0 qy0Var2 = this.b;
        if (qy0Var2 != null) {
            qy0Var2.a.b(ry0Var);
        }
        ry0Var.o = qy0Var2;
    }
}
