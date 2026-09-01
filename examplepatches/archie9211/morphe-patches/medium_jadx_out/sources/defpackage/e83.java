package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Le83;", "Lu28;", "Lf83;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class e83 extends u28 {
    public final y3f b;

    public e83(y3f y3fVar) {
        this.b = y3fVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof e83) {
            return g76.L(this.b, ((e83) obj).b);
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ywb ywbVar = f49.r;
        f83 f83Var = new f83();
        f83Var.q = this.b;
        f83Var.r = ywbVar;
        f83Var.s = qb8.p;
        return f83Var;
    }

    public final int hashCode() {
        return f49.r.hashCode() + (this.b.hashCode() * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        f83 f83Var = (f83) q28Var;
        ywb ywbVar = f49.r;
        y3f y3fVar = f83Var.q;
        y3f y3fVar2 = this.b;
        if (g76.L(y3fVar, y3fVar2) && ywbVar == f83Var.r) {
            return;
        }
        f83Var.q = y3fVar2;
        f83Var.r = ywbVar;
        f83Var.s = new f44(y3fVar2, f83Var.o);
        gx1.M(f83Var);
    }
}
