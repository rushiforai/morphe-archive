package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lv6d;", "Lu28;", "Lw6d;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class v6d extends u28 {
    public final x45 b;

    public v6d(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof v6d) {
            return this.b == ((v6d) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        w6d w6dVar = new w6d(qb8.p);
        w6dVar.r = this.b;
        return w6dVar;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        w6d w6dVar = (w6d) q28Var;
        x45 x45Var = w6dVar.r;
        x45 x45Var2 = this.b;
        if (x45Var != x45Var2) {
            w6dVar.r = x45Var2;
            f5f f5fVar = w6dVar.s;
            if (f5fVar != null) {
                y3f y3fVar = (y3f) x45Var2.invoke(f5fVar);
                if (g76.L(y3fVar, w6dVar.q)) {
                    return;
                }
                w6dVar.q = y3fVar;
                w6dVar.J0();
            }
        }
    }
}
