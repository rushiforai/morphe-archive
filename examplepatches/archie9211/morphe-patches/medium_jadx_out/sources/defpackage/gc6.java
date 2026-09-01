package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gc6 implements pj6 {
    public static final gc6 a = new gc6();
    public static final a0c b;

    static {
        xzb[] xzbVarArr = new xzb[0];
        vx5 vx5Var = new vx5(3);
        a0c a0cVar = null;
        if (muc.b0("kotlinx.serialization.json.JsonElement")) {
            ay0.e("Blank serial names are prohibited");
        } else {
            wuc wucVar = wuc.e;
            bc9 bc9Var = bc9.e;
            if (bc9Var.equals(wucVar)) {
                ay0.e("For StructureKind.CLASS please use 'buildClassSerialDescriptor' instead");
            } else {
                vn1 vn1Var = new vn1("kotlinx.serialization.json.JsonElement");
                vx5Var.invoke(vn1Var);
                a0cVar = new a0c("kotlinx.serialization.json.JsonElement", bc9Var, vn1Var.b.size(), k80.Q0(xzbVarArr), vn1Var);
            }
        }
        b = a0cVar;
    }

    @Override // defpackage.pj6
    public final xzb a() {
        return b;
    }

    @Override // defpackage.pj6
    public final void b(xtc xtcVar, Object obj) {
        cc6 cc6Var = (cc6) obj;
        cc6Var.getClass();
        k40.L(xtcVar);
        if (cc6Var instanceof yc6) {
            xtcVar.p(ad6.a, cc6Var);
            return;
        }
        if (cc6Var instanceof tc6) {
            xtcVar.p(wc6.a, cc6Var);
        } else if (cc6Var instanceof ob6) {
            xtcVar.p(rb6.a, cc6Var);
        } else {
            ygf.a();
        }
    }

    @Override // defpackage.pj6
    public final Object d(kw2 kw2Var) {
        return k40.K(kw2Var).C0();
    }
}
