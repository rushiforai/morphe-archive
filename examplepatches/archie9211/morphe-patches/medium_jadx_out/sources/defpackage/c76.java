package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lc76;", "Lu28;", "Le76;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class c76 extends u28 {
    public final a76 b;

    public c76(a76 a76Var) {
        this.b = a76Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        c76 c76Var = obj instanceof c76 ? (c76) obj : null;
        return c76Var != null && this.b == c76Var.b;
    }

    @Override // defpackage.u28
    public final q28 f() {
        e76 e76Var = new e76(0);
        e76Var.p = this.b;
        e76Var.q = true;
        return e76Var;
    }

    public final int hashCode() {
        return (this.b.hashCode() * 31) + 1231;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        e76 e76Var = (e76) q28Var;
        e76Var.p = this.b;
        e76Var.q = true;
    }
}
