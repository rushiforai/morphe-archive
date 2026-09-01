package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lks4;", "Lu28;", "Lls4;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class ks4 extends u28 {
    public final m68 b;

    public ks4(m68 m68Var) {
        this.b = m68Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ks4) {
            return g76.L(this.b, ((ks4) obj).b);
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new ls4(this.b, 1, null);
    }

    public final int hashCode() {
        m68 m68Var = this.b;
        if (m68Var != null) {
            return m68Var.hashCode();
        }
        return 0;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((ls4) q28Var).M0(this.b);
    }
}
