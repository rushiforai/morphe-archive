package defpackage;

import android.view.MotionEvent;
import com.medium.reader.R;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fx2 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ fx2(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        uob uobVar = w12.a;
        qmb qmbVar = qmb.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                n0c n0cVar = (n0c) obj3;
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    String strV = ep7.v(p65Var, R.string.m3c_dialog);
                    r28 r28Var = (r28) n0cVar.c;
                    jy8 jy8Var = qd.a;
                    r28 r28VarO = jfc.o(r28Var, 280.0f, 0.0f, 560.0f, 0.0f, 10);
                    boolean zF = p65Var.f(strV);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new mb(strV, 10);
                        p65Var.j0(objM);
                    }
                    r28 r28VarB = r28VarO.b(new l60((x45) objM, false));
                    zk7 zk7VarC = dy0.c(z46.d, true);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarB);
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
                    km4.H(0, (mz1) n0cVar.e, p65Var, true);
                }
                break;
            case 1:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                gc8 gc8Var = (gc8) obj3;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    r28 r28VarA = wxb.a(jfc.b(op8.p0(jfc.d(o28Var, 1.0f), gc8Var.d), 0.0f, fc8.a, 1), false, new dsb(3));
                    h70 h70Var = new h70(fc8.b, true, new z10(21));
                    zq0 zq0Var = z46.n;
                    mz1 mz1Var = gc8Var.e;
                    omb ombVarA = nmb.a(h70Var, zq0Var, p65Var2, 54);
                    int iS2 = w2g.s(p65Var2);
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarA);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, ombVarA);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    cu cuVar2 = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS2))) {
                        lv8.w(iS2, p65Var2, iS2, cuVar2);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    mz1Var.f(qmbVar, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
            case 2:
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Number) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    xsa xsaVar = qb8.b;
                    zq0 zq0Var2 = z46.n;
                    c55 c55Var = ((sec) obj3).g;
                    omb ombVarA2 = nmb.a(xsaVar, zq0Var2, p65Var3, 54);
                    int iS3 = w2g.s(p65Var3);
                    i89 i89VarL3 = p65Var3.l();
                    r28 r28VarR3 = gx1.R(p65Var3, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var3);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, ombVarA2);
                    tp7.B(p65Var3, q12.e, i89VarL3);
                    cu cuVar3 = q12.g;
                    if (p65Var3.S || !g76.L(p65Var3.M(), Integer.valueOf(iS3))) {
                        lv8.w(iS3, p65Var3, iS3, cuVar3);
                    }
                    tp7.B(p65Var3, q12.d, r28VarR3);
                    c55Var.f(qmbVar, p65Var3, 6);
                    p65Var3.p(true);
                }
                break;
            case 3:
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Number) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    xsa xsaVar2 = qb8.b;
                    zq0 zq0Var3 = z46.n;
                    c55 c55Var2 = ((gud) obj3).j;
                    omb ombVarA3 = nmb.a(xsaVar2, zq0Var3, p65Var4, 54);
                    int iS4 = w2g.s(p65Var4);
                    i89 i89VarL4 = p65Var4.l();
                    r28 r28VarR4 = gx1.R(p65Var4, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var4 = q12.b;
                    p65Var4.c0();
                    if (p65Var4.S) {
                        p65Var4.k(ot2Var4);
                    } else {
                        p65Var4.m0();
                    }
                    tp7.B(p65Var4, q12.f, ombVarA3);
                    tp7.B(p65Var4, q12.e, i89VarL4);
                    cu cuVar4 = q12.g;
                    if (p65Var4.S || !g76.L(p65Var4.M(), Integer.valueOf(iS4))) {
                        lv8.w(iS4, p65Var4, iS4, cuVar4);
                    }
                    tp7.B(p65Var4, q12.d, r28VarR4);
                    c55Var2.f(qmbVar, p65Var4, 6);
                    p65Var4.p(true);
                }
                break;
            case 4:
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Number) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    Object objM2 = p65Var5.M();
                    if (objM2 == uobVar) {
                        objM2 = new ss7(12);
                        p65Var5.j0(objM2);
                    }
                    l60 l60Var = new l60((x45) objM2, false);
                    l78 l78Var = (l78) obj3;
                    zk7 zk7VarC2 = dy0.c(z46.d, false);
                    int iS5 = w2g.s(p65Var5);
                    i89 i89VarL5 = p65Var5.l();
                    r28 r28VarR5 = gx1.R(p65Var5, l60Var);
                    r12.W.getClass();
                    ot2 ot2Var5 = q12.b;
                    p65Var5.c0();
                    if (p65Var5.S) {
                        p65Var5.k(ot2Var5);
                    } else {
                        p65Var5.m0();
                    }
                    tp7.B(p65Var5, q12.f, zk7VarC2);
                    tp7.B(p65Var5, q12.e, i89VarL5);
                    cu cuVar5 = q12.g;
                    if (p65Var5.S || !g76.L(p65Var5.M(), Integer.valueOf(iS5))) {
                        lv8.w(iS5, p65Var5, iS5, cuVar5);
                    }
                    tp7.B(p65Var5, q12.d, r28VarR5);
                    ((b55) l78Var.getValue()).invoke(p65Var5, 0);
                    p65Var5.p(true);
                }
                break;
            case 5:
                x12 x12Var6 = (x12) obj;
                int iIntValue6 = ((Number) obj2).intValue();
                p65 p65Var6 = (p65) x12Var6;
                if (!p65Var6.P(iIntValue6 & 1, (iIntValue6 & 3) != 2)) {
                    p65Var6.S();
                } else {
                    dy0.a(s06.a(r40.y(kng.J(o28Var, "indicatorRipple"), z4c.a(hc8.c, p65Var6)), (ai7) obj3, qkb.a(0.0f, 7, 0L, false)), p65Var6, 0);
                }
                break;
            case 6:
                x12 x12Var7 = (x12) obj;
                int iIntValue7 = ((Number) obj2).intValue();
                p65 p65Var7 = (p65) x12Var7;
                if (!p65Var7.P(iIntValue7 & 1, (iIntValue7 & 3) != 2)) {
                    p65Var7.S();
                } else {
                    jjd.b((String) obj3, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, null, p65Var7, 0, 0, 262142);
                }
                break;
            case 7:
                String str = (String) obj;
                str.getClass();
                ((SourceParameter) obj2).getClass();
                odd oddVar = ((lbd) obj3).a;
                oddVar.c = oddVar.e();
                xpc xpcVar = oddVar.G;
                xpcVar.getClass();
                xpcVar.m(null, str);
                break;
            default:
                ms msVar = (ms) obj3;
                vx0.c0((k92) msVar.c, null, null, new lm1(msVar, (String) obj, MotionEvent.obtain((MotionEvent) obj2), null, 14), 3);
                break;
        }
        return c1eVar;
    }
}
