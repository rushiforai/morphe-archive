package defpackage;

import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u00012\u00020\u0003¨\u0006\u0004"}, d2 = {"Ll60;", "Lu28;", "Lpa2;", "Lvxb;", "ui"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class l60 extends u28 implements vxb {
    public final boolean b;
    public final x45 c;

    public l60(x45 x45Var, boolean z) {
        this.b = z;
        this.c = x45Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l60)) {
            return false;
        }
        l60 l60Var = (l60) obj;
        return this.b == l60Var.b && this.c == l60Var.c;
    }

    @Override // defpackage.u28
    public final q28 f() {
        return new pa2(this.b, false, this.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((this.b ? 1231 : 1237) * 31);
    }

    @Override // defpackage.vxb
    public final txb j() {
        txb txbVar = new txb();
        txbVar.c = this.b;
        this.c.invoke(txbVar);
        return txbVar;
    }

    @Override // defpackage.u28
    public final void l(q28 q28Var) {
        pa2 pa2Var = (pa2) q28Var;
        pa2Var.o = this.b;
        pa2Var.q = this.c;
    }
}
