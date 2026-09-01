package defpackage;

import kotlinx.serialization.json.internal.JsonDecodingException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qc6 implements pj6 {
    public static final qc6 a = new qc6();
    public static final a0c b = fo7.D("kotlinx.serialization.json.JsonNull", b0c.f, new xzb[0]);

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        ((oc6) obj).getClass();
        k40.L(xtcVar);
        xtcVar.m();
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        k40.K(kw2Var);
        if (kw2Var.u()) {
            throw new JsonDecodingException("Expected 'null' literal");
        }
        return oc6.INSTANCE;
    }
}
