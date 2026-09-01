package defpackage;

import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class bs1 extends u0 {
    public final pj6 a;

    public bs1(pj6 pj6Var) {
        this.a = pj6Var;
    }

    @Override // defpackage.pj6
    public void b(xtc xtcVar, Object obj) {
        int iH = h(obj);
        xzb xzbVarA = a();
        xzbVarA.getClass();
        xtc xtcVarA = xtcVar.a(xzbVarA);
        Iterator itG = g(obj);
        for (int i = 0; i < iH; i++) {
            xtcVarA.o(a(), i, this.a, itG.next());
        }
        xtcVarA.s(xzbVarA);
    }

    @Override // defpackage.u0
    public void j(f22 f22Var, int i, Object obj) {
        m(obj, i, f22Var.p(a(), i, this.a, null));
    }

    public abstract void m(Object obj, int i, Object obj2);
}
