package defpackage;

import androidx.compose.ui.input.pointer.PointerInputEventHandler;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z13 {
    public static final z13 a = new z13();

    public final void a(sec secVar, x12 x12Var, int i) {
        float f = secVar.h;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(2137486921);
        int i2 = 2;
        int i3 = i | (p65Var.f(secVar) ? 4 : 2);
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            qod qodVar = secVar.j;
            if (Float.isNaN(f) || (Float.floatToRawIntBits(f) & Integer.MAX_VALUE) >= 2139095040) {
                ay0.e("The expandedHeight is expected to be specified and finite");
                return;
            }
            boolean zF = p65Var.f(qodVar) | p65Var.f(null);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zF || objM == uobVar) {
                objM = bjc.b(new v2(6, secVar));
                p65Var.j0(objM);
            }
            upc upcVarA = wec.a(((uu1) ((upc) objM).getValue()).a, ek7.N(i48.DefaultEffects, p65Var), null, p65Var, 0, 12);
            mz1 mz1VarE = pxf.E(-1658896622, new fx2(i2, secVar), p65Var);
            p65Var.Y(690108113);
            p65Var.p(false);
            r28 r28Var = secVar.a;
            o28 o28Var = o28.b;
            r28 r28VarB = r28Var.b(o28Var);
            boolean zF2 = p65Var.f(upcVarA);
            Object objM2 = p65Var.M();
            if (zF2 || objM2 == uobVar) {
                objM2 = new w13(upcVarA, 0);
                p65Var.j0(objM2);
            }
            r28 r28VarA = guc.A(r28VarB, (x45) objM2);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = new iz2(3);
                p65Var.j0(objM3);
            }
            r28 r28VarA2 = wxb.a(r28VarA, false, (x45) objM3);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = y13.b;
                p65Var.j0(objM4);
            }
            r28 r28VarA3 = r4d.a(r28VarA2, c1e.a, (PointerInputEventHandler) objM4);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarA3);
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
            r28 r28VarZ = r40.z(op8.p0(o28Var, secVar.i));
            sn3 sn3Var = a10.a;
            boolean z = (i3 & 14) == 4;
            Object objM5 = p65Var.M();
            if (z || objM5 == uobVar) {
                objM5 = new x13(secVar);
                p65Var.j0(objM5);
            }
            mn4 mn4Var = (mn4) objM5;
            long j = qodVar.c;
            long j2 = qodVar.d;
            long j3 = qodVar.e;
            long j4 = qodVar.f;
            mz1 mz1Var = secVar.b;
            mkd mkdVar = secVar.c;
            mkd mkdVar2 = secVar.d;
            zi5 zi5Var = qb8.e;
            yq0 yq0Var = secVar.e;
            mz1 mz1Var2 = secVar.f;
            float f2 = secVar.h;
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = new n7(27);
                p65Var.j0(objM6);
            }
            a10.f(r28VarZ, mn4Var, j, j2, j4, j3, mz1Var, mkdVar, mkdVar2, (m45) objM6, zi5Var, yq0Var, 0, false, mz1Var2, mz1VarE, f2, p65Var, 0, 1600566);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ag1(this, secVar, i, 10);
        }
    }
}
