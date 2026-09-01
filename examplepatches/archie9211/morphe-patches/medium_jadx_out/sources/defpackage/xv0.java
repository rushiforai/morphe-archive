package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class xv0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ r28 b;
    public final /* synthetic */ m3c c;
    public final /* synthetic */ long d;
    public final /* synthetic */ float e;
    public final /* synthetic */ float f;
    public final /* synthetic */ Object g;

    public /* synthetic */ xv0(zv0 zv0Var, r28 r28Var, float f, float f2, m3c m3cVar, long j, int i) {
        this.g = zv0Var;
        this.b = r28Var;
        this.e = f;
        this.f = f2;
        this.c = m3cVar;
        this.d = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                ((Integer) obj2).getClass();
                ((zv0) obj3).a(this.b, this.e, this.f, this.c, this.d, (x12) obj, tr7.y(196609));
                break;
            default:
                mz1 mz1Var = (mz1) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarT = br7.t(this.b, this.c, br7.u(this.d, (uy2) p65Var.j(nw3.a), this.e, p65Var), null, this.f);
                    Object objM = p65Var.M();
                    uob uobVar = w12.a;
                    if (objM == uobVar) {
                        objM = new dsb(29);
                        p65Var.j0(objM);
                    }
                    r28 r28VarA = wxb.a(r28VarT, false, (x45) objM);
                    Object objM2 = p65Var.M();
                    if (objM2 == uobVar) {
                        objM2 = y13.d;
                        p65Var.j0(objM2);
                    }
                    r28 r28VarA2 = r4d.a(r28VarA, c1eVar, (PointerInputEventHandler) objM2);
                    zk7 zk7VarC = dy0.c(z46.d, true);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarA2);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, zk7VarC);
                    tp7.B(p65Var, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var, iS, cuVar);
                    }
                    tp7.B(p65Var, q12.d, r28VarR);
                    km4.H(0, mz1Var, p65Var, true);
                }
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ xv0(r28 r28Var, m3c m3cVar, long j, float f, float f2, mz1 mz1Var) {
        this.b = r28Var;
        this.c = m3cVar;
        this.d = j;
        this.e = f;
        this.f = f2;
        this.g = mz1Var;
    }
}
