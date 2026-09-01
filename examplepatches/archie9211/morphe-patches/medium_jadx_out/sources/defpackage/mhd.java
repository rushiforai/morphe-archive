package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lmhd;", "Lu28;", "Lnhd;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class mhd extends u28 {
    public final mya b;
    public final mt2 c;
    public final gid d;
    public final ta2 e;

    public mhd(mya myaVar, mt2 mt2Var, gid gidVar, ta2 ta2Var) {
        this.b = myaVar;
        this.c = mt2Var;
        this.d = gidVar;
        this.e = ta2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mhd)) {
            return false;
        }
        mhd mhdVar = (mhd) obj;
        return this.b == mhdVar.b && this.c == mhdVar.c && this.d == mhdVar.d && this.e == mhdVar.e;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new nhd(this.b, this.c, this.d, this.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        nhd nhdVar = (nhd) q28Var;
        nhdVar.q.b = null;
        mya myaVar = this.b;
        nhdVar.q = myaVar;
        myaVar.b = nhdVar;
        myaVar.c = nhdVar.n ? ynd.Attached : ynd.Detached;
        nhdVar.r = this.c;
        nhdVar.s = this.d;
        nhdVar.t = this.e;
    }
}
