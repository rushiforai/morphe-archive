package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lqse;", "Lu28;", "Lrse;", "foundation-layout"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class qse extends u28 {
    public final zq0 b;

    public qse(zq0 zq0Var) {
        this.b = zq0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        qse qseVar = obj instanceof qse ? (qse) obj : null;
        if (qseVar == null) {
            return false;
        }
        return this.b.equals(qseVar.b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        rse rseVar = new rse();
        rseVar.o = this.b;
        return rseVar;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.b.a);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((rse) q28Var).o = this.b;
    }
}
