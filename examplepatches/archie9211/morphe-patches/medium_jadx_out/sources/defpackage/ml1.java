package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lml1;", "Lu28;", "Lll1;", "material3"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class ml1 extends u28 {
    public final nx b;

    public ml1(nx nxVar) {
        this.b = nxVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ml1) {
            return this.b == ((ml1) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        ll1 ll1Var = new ll1();
        ll1Var.o = this.b;
        return ll1Var;
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ll1 ll1Var = (ll1) q28Var;
        ll1Var.o = this.b;
        dl7.u(ll1Var);
    }
}
