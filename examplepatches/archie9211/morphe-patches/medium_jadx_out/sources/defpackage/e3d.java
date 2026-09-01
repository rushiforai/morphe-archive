package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e3d implements b55 {
    public final /* synthetic */ r28 a;
    public final /* synthetic */ m3c b;
    public final /* synthetic */ long c;
    public final /* synthetic */ float d;
    public final /* synthetic */ cu0 e;
    public final /* synthetic */ float f;
    public final /* synthetic */ mz1 g;

    public e3d(r28 r28Var, m3c m3cVar, long j, float f, cu0 cu0Var, float f2, mz1 mz1Var) {
        this.a = r28Var;
        this.b = m3cVar;
        this.c = j;
        this.d = f;
        this.e = cu0Var;
        this.f = f2;
        this.g = mz1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        x12 x12Var = (x12) obj;
        int iIntValue = ((Number) obj2).intValue();
        p65 p65Var = (p65) x12Var;
        boolean zP = p65Var.P(iIntValue & 1, (iIntValue & 3) != 2);
        c1e c1eVar = c1e.a;
        if (!zP) {
            p65Var.S();
            return c1eVar;
        }
        r28 r28VarC = g3d.c(this.a, this.b, g3d.d(this.c, this.d, p65Var), this.e, ((m73) p65Var.j(z22.h)).Z(this.f));
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        if (objM == uobVar) {
            objM = new d3d(0);
            p65Var.j0(objM);
        }
        r28 r28VarA = wxb.a(r28VarC, false, (x45) objM);
        Object objM2 = p65Var.M();
        if (objM2 == uobVar) {
            objM2 = y13.e;
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
        km4.H(0, this.g, p65Var, true);
        return c1eVar;
    }
}
