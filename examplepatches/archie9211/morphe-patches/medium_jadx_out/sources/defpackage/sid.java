package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lsid;", "Lu28;", "Ltid;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class sid extends u28 {
    public final mkd b;

    public sid(mkd mkdVar) {
        this.b = mkdVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sid)) {
            return false;
        }
        return g76.L(this.b, ((sid) obj).b);
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new tid(this.b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        tid tidVar = (tid) q28Var;
        tidVar.getClass();
        mkd mkdVarC = il7.C(this.b, flb.v0(tidVar).z);
        tidVar.I0(mkdVarC, (yy4) bo.K(tidVar, z22.k));
        rid ridVar = tidVar.q;
        if (ridVar != null) {
            rid.a(ridVar, null, null, mkdVarC, 23);
            gx1.M(tidVar);
        } else {
            e26.b("Min size state is not set.");
            z72.b();
        }
    }
}
