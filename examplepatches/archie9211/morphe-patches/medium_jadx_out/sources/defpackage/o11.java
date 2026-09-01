package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o11 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ long b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ o11(int i, long j, Object obj, Object obj2) {
        this.a = i;
        this.b = j;
        this.c = obj;
        this.d = obj2;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        Object obj4 = this.c;
        int i2 = 1;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    fo7.v(this.b, ((lyd) p65Var.j(pyd.a)).m, pxf.E(417635459, new kd((hy8) obj4, 3, (c55) obj3), p65Var), p65Var, 384);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                ihc ihcVar = (ihc) obj4;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    jy8 jy8Var = h11.a;
                    long j = uu1.h;
                    g11 g11VarA = h11.c((fv1) p65Var2.j(iv1.a)).a(j, this.b, j, j);
                    boolean zF = p65Var2.f(ihcVar);
                    Object objM = p65Var2.M();
                    if (zF || objM == w12.a) {
                        objM = new ehc(ihcVar, 1);
                        p65Var2.j0(objM);
                    }
                    f76.w((m45) objM, null, false, null, g11VarA, null, pxf.E(521110564, new r7c((String) obj3, i2), p65Var2), p65Var2, 805306368, 494);
                }
                break;
        }
        return c1eVar;
    }
}
