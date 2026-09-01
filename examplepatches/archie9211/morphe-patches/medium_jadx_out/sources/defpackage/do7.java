package defpackage;

import android.content.Context;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class do7 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ long d;

    public /* synthetic */ do7(int i, long j, Object obj, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = j;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        o28 o28Var = o28.b;
        c1e c1eVar = c1e.a;
        Object obj4 = this.c;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                xn7 xn7Var = (xn7) obj5;
                String str = (String) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    mkd mkdVar = (mkd) xn7Var.getTextStyle().invoke(p65Var, 0);
                    r28 r28VarF = jfc.f(o28Var, ((m73) p65Var.j(z22.h)).z(mkdVar.b.c), 0.0f, 2);
                    zk7 zk7VarC = dy0.c(z46.h, false);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarF);
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
                    tp7.B(p65Var, q12.g, Integer.valueOf(i2));
                    tp7.y(p65Var, q12.h);
                    tp7.B(p65Var, q12.d, r28VarR);
                    jjd.b(str, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(mkdVar, this.d, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110590);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                xn7 xn7Var2 = (xn7) obj5;
                String str2 = (String) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((pmb) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    mkd mkdVar2 = (mkd) xn7Var2.getTextStyle().invoke(p65Var2, 0);
                    r28 r28VarF2 = jfc.f(o28Var, ((m73) p65Var2.j(z22.h)).z(mkdVar2.b.c), 0.0f, 2);
                    zk7 zk7VarC2 = dy0.c(z46.h, false);
                    long j2 = p65Var2.T;
                    int i3 = (int) (j2 ^ (j2 >>> 32));
                    i89 i89VarL2 = p65Var2.l();
                    r28 r28VarR2 = gx1.R(p65Var2, r28VarF2);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var2);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC2);
                    tp7.B(p65Var2, q12.e, i89VarL2);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR2);
                    jjd.b(str2, null, 0L, 0L, 0L, null, null, 0L, 2, false, 1, 0, null, mkd.a(mkdVar2, this.d, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var2, 0, 24960, 110590);
                    p65Var2.p(true);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            default:
                s2f s2fVar = (s2f) obj5;
                r28 r28Var = (r28) obj4;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                ((gq4) obj).getClass();
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 17) != 16)) {
                    boolean z = s2fVar instanceof q2f;
                    long j3 = this.d;
                    uob uobVar = w12.a;
                    if (z) {
                        p65Var3.Y(356113296);
                        int i4 = 0;
                        for (Object obj6 : ((q2f) s2fVar).a) {
                            int i5 = i4 + 1;
                            if (i4 < 0) {
                                d46.i0();
                                throw null;
                            }
                            p2f p2fVar = (p2f) obj6;
                            String str3 = p2fVar.a;
                            String str4 = p2fVar.b;
                            if (((Boolean) p65Var3.j(l36.a)).booleanValue()) {
                                p65Var3.Y(-2013336226);
                                boolean zE = p65Var3.e(j3);
                                Object objM = p65Var3.M();
                                if (zE || objM == uobVar) {
                                    objM = new ro(7, j3);
                                    p65Var3.j0(objM);
                                }
                                pxf.a(r28Var, (x45) objM, p65Var3, 0);
                                p65Var3.p(false);
                            } else {
                                p65Var3.Y(-2013902844);
                                nx5 nx5Var = new nx5((Context) p65Var3.j(eo.b));
                                nx5Var.c = new ax5(str4);
                                hlg.W(nx5Var);
                                ur7.a(nx5Var.a(), str3, bgf.N(r28Var, "welcome_author_" + i4), null, null, 0.0f, null, 0, p65Var3, 0, 2040);
                                p65Var3.p(false);
                            }
                            i4 = i5;
                        }
                        p65Var3.p(false);
                    } else {
                        if (!(s2fVar instanceof r2f)) {
                            throw ho2.L(p65Var3, 427127455, false);
                        }
                        p65Var3.Y(357130747);
                        int i6 = ((r2f) s2fVar).a;
                        for (int i7 = 0; i7 < i6; i7++) {
                            boolean zE2 = p65Var3.e(j3);
                            Object objM2 = p65Var3.M();
                            if (zE2 || objM2 == uobVar) {
                                objM2 = new ro(8, j3);
                                p65Var3.j0(objM2);
                            }
                            pxf.a(r28Var, (x45) objM2, p65Var3, 0);
                        }
                        p65Var3.p(false);
                    }
                } else {
                    p65Var3.S();
                }
                return c1eVar;
        }
    }
}
