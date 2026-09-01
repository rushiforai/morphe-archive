package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lz0e;", "Lu28;", "La1e;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class z0e extends u28 {
    public final hl4 b;

    public z0e(hl4 hl4Var) {
        this.b = hl4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof z0e) {
            return ((z0e) obj).b.equals(this.b);
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        a1e a1eVar = new a1e();
        a1eVar.q = this.b;
        return a1eVar;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        a1e a1eVar = (a1e) q28Var;
        hl4 hl4Var = a1eVar.q;
        hl4 hl4Var2 = this.b;
        if (hl4Var2.equals(hl4Var)) {
            return;
        }
        a1eVar.q = hl4Var2;
        a1eVar.J0();
    }
}
