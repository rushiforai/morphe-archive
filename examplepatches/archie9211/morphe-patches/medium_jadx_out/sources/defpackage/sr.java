package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sr extends co6 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ dd9 b;
    public final /* synthetic */ l78 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sr(dd9 dd9Var, l78 l78Var, int i) {
        super(2);
        this.a = i;
        this.b = dd9Var;
        this.c = l78Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        l78 l78Var = this.c;
        dd9 dd9Var = this.b;
        int i2 = 0;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = fn.i;
                        p65Var.j0(objM);
                    }
                    l60 l60Var = new l60((x45) objM, false);
                    boolean zH = p65Var.h(dd9Var);
                    Object objM2 = p65Var.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new pr(dd9Var, 1);
                        p65Var.j0(objM2);
                    }
                    r28 r28VarI = w2g.i(o7f.E(l60Var, (x45) objM2), dd9Var.getCanCalculatePosition() ? 1.0f : 0.0f);
                    sn3 sn3Var = tr.a;
                    b55 b55Var = (b55) l78Var.getValue();
                    Object objM3 = p65Var.M();
                    if (objM3 == uobVar) {
                        objM3 = id.d;
                        p65Var.j0(objM3);
                    }
                    zk7 zk7Var = (zk7) objM3;
                    long j = p65Var.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarI);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7Var);
                    tp7.B(p65Var, q12.e, i89VarL);
                    tp7.B(p65Var, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    b55Var.invoke(p65Var, 0);
                    p65Var.p(true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    k40.c(tr.b.a(Boolean.TRUE), pxf.E(1022273628, new sr(dd9Var, l78Var, i2), p65Var2), p65Var2, 56);
                }
                break;
        }
        return c1eVar;
    }
}
