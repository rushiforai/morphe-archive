package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Lgo1;", "Lu28;", "Lpa2;", "Lvxb;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class go1 extends u28 implements vxb {
    public final x45 b;

    public go1(x45 x45Var) {
        this.b = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof go1) {
            return this.b == ((go1) obj).b;
        }
        return false;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new pa2(false, true, this.b);
    }

    public final int hashCode() {
        return this.b.hashCode();
    }

    @Override // defpackage.vxb
    public final txb j() {
        txb txbVar = new txb();
        txbVar.c = false;
        txbVar.d = true;
        this.b.invoke(txbVar);
        return txbVar;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        ((pa2) q28Var).q = this.b;
    }
}
