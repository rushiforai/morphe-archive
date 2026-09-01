package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ad6 implements pj6 {
    public static final ad6 a = new ad6();
    public static final a0c b = fo7.D("kotlinx.serialization.json.JsonPrimitive", r0a.m, new xzb[0]);

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        yc6 yc6Var = (yc6) obj;
        yc6Var.getClass();
        k40.L(xtcVar);
        if (yc6Var instanceof oc6) {
            xtcVar.p(qc6.a, oc6.INSTANCE);
        } else {
            xtcVar.p(mc6.a, (lc6) yc6Var);
        }
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        cc6 cc6VarC0 = k40.K(kw2Var).C0();
        if (cc6VarC0 instanceof yc6) {
            return (yc6) cc6VarC0;
        }
        StringBuilder sb = new StringBuilder("Unexpected JSON element, expected JsonPrimitive, had ");
        throw m40.r(-1, cc6VarC0.toString(), ka1.p(n1b.a, cc6VarC0.getClass(), sb));
    }
}
