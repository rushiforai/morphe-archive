package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u0000*\u0004\b\u0001\u0010\u00012\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00010\u00030\u0002¨\u0006\u0004"}, d2 = {"Lkv;", "S", "Lu28;", "Lnv;", "animation"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class kv<S> extends u28 {
    public final xrd b;
    public final l78 c;
    public final ov d;

    public kv(xrd xrdVar, l78 l78Var, ov ovVar) {
        this.b = xrdVar;
        this.c = l78Var;
        this.d = ovVar;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof kv)) {
            return false;
        }
        kv kvVar = (kv) obj;
        return g76.L(kvVar.b, this.b) && kvVar.c.equals(this.c);
    }

    @Override // defpackage.u28
    public final q28 f() {
        nv nvVar = new nv(1);
        nvVar.p = this.b;
        nvVar.q = this.c;
        nvVar.r = this.d;
        nvVar.s = -9223372034707292160L;
        return nvVar;
    }

    public final int hashCode() {
        int iHashCode = this.d.hashCode() * 31;
        xrd xrdVar = this.b;
        return this.c.hashCode() + ((iHashCode + (xrdVar != null ? xrdVar.hashCode() : 0)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        nv nvVar = (nv) q28Var;
        nvVar.p = this.b;
        nvVar.q = this.c;
        nvVar.r = this.d;
    }
}
