package defpackage;

import kotlinx.serialization.SerializationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rm8 implements pj6 {
    public final vq6 a = vx0.d0(yw6.PUBLICATION, new oo7(this));

    @Override // defpackage.pj6
    public final xzb a() {
        return (xzb) this.a.getValue();
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        obj.getClass();
        xtcVar.a(a()).s(a());
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        xzb xzbVarA = a();
        f22 f22VarS = kw2Var.s(xzbVarA);
        int iE = f22VarS.e(a());
        if (iE != -1) {
            throw new SerializationException(b09.w(iE, "Unexpected index "));
        }
        f22VarS.m(xzbVarA);
        return c1e.a;
    }
}
