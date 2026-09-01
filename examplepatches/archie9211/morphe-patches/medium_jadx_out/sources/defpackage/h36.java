package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lh36;", "Lu28;", "Li36;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class h36 extends u28 {
    public final y3f b;

    public h36(y3f y3fVar) {
        this.b = y3fVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof h36) {
            return g76.L(((h36) obj).b, this.b);
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new i36(this.b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        i36 i36Var = (i36) q28Var;
        y3f y3fVar = i36Var.q;
        y3f y3fVar2 = this.b;
        if (g76.L(y3fVar2, y3fVar)) {
            return;
        }
        i36Var.q = y3fVar2;
        i36Var.J0();
    }
}
