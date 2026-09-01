package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Lzs6;", "Lu28;", "Lat6;", "foundation"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final /* data */ class zs6 extends u28 {
    public final wlc b;
    public final wlc c;
    public final wlc d;

    public zs6(wlc wlcVar, wlc wlcVar2, wlc wlcVar3) {
        this.b = wlcVar;
        this.c = wlcVar2;
        this.d = wlcVar3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zs6)) {
            return false;
        }
        zs6 zs6Var = (zs6) obj;
        return this.b.equals(zs6Var.b) && this.c.equals(zs6Var.c) && this.d.equals(zs6Var.d);
    }

    @Override // defpackage.u28
    public final q28 f() {
        at6 at6Var = new at6();
        at6Var.o = this.b;
        at6Var.p = this.c;
        at6Var.q = this.d;
        return at6Var;
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31);
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        at6 at6Var = (at6) q28Var;
        at6Var.o = this.b;
        at6Var.p = this.c;
        at6Var.q = this.d;
    }

    public final String toString() {
        return "LazyLayoutAnimateItemElement(fadeInSpec=" + this.b + ", placementSpec=" + this.c + ", fadeOutSpec=" + this.d + ')';
    }
}
