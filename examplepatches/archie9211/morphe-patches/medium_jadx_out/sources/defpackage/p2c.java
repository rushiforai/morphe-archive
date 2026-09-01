package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class p2c implements b55 {
    public final /* synthetic */ boolean a;
    public final /* synthetic */ x45 b;
    public final /* synthetic */ z52 c;
    public final /* synthetic */ i52 d;

    public p2c(boolean z, x45 x45Var, z52 z52Var, i52 i52Var) {
        this.a = z;
        this.b = x45Var;
        this.c = z52Var;
        this.d = i52Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        if (p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
            r28 r28VarN = bgf.N(o28.b, "switch");
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = p79.u;
                p65Var.j0(objM);
            }
            this.c.getClass();
            hk7.b(this.a, this.b, z52.b(r28VarN, this.d, (x45) objM), false, null, null, p65Var, 0, 56);
        } else {
            p65Var.S();
        }
        return c1e.a;
    }
}
