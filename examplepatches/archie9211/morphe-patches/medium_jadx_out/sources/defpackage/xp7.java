package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xp7 {
    public static final ArrayList a;

    static {
        ArrayList arrayList = new ArrayList(4);
        int i = 0;
        while (i < 4) {
            arrayList.add(new bq7(b09.w(i, "Item "), i == 0, null, i % 2 == 0 ? b09.w(i, "Secondary text ") : null, 20));
            i++;
        }
        a = arrayList;
    }

    public static final void a(x12 x12Var, int i) {
        l78 l78Var;
        ot2 ot2Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1542130730);
        int i2 = 1;
        if (p65Var.P(i & 1, i != 0)) {
            yq0 yq0Var = z46.q;
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var, 48);
            long j = p65Var.T;
            int i3 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var2 = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i3);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var2);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i4, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            Object objM2 = p65Var.M();
            if (objM2 == uobVar) {
                objM2 = new ei4(l78Var2, 25);
                p65Var.j0(objM2);
            }
            fo7.r((m45) objM2, "ShowMenu", xn7.M, null, false, p65Var, 438, 24);
            boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                l78Var = l78Var2;
                objM3 = new ei4(l78Var, 26);
                p65Var.j0(objM3);
            } else {
                l78Var = l78Var2;
            }
            mz1 mz1VarE = pxf.E(53810061, new wb4(l78Var, i2), p65Var);
            p65Var = p65Var;
            b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, mz1VarE, p65Var, 48, 2044);
            p65Var.p(true);
            Object objM4 = p65Var.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var.j0(objM4);
            }
            l78 l78Var3 = (l78) objM4;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                ot2Var = ot2Var2;
                p65Var.k(ot2Var);
            } else {
                ot2Var = ot2Var2;
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            Object objM5 = p65Var.M();
            if (objM5 == uobVar) {
                objM5 = new ei4(l78Var3, 19);
                p65Var.j0(objM5);
            }
            f49.l((m45) objM5, o28Var, false, null, null, s42.d, p65Var, 1572918, 60);
            boolean zBooleanValue2 = ((Boolean) l78Var3.getValue()).booleanValue();
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = new ei4(l78Var3, 20);
                p65Var.j0(objM6);
            }
            ot2 ot2Var3 = ot2Var;
            b(zBooleanValue2, (m45) objM6, null, 0L, null, null, null, 0L, 0.0f, pxf.E(674737284, new wb4(l78Var3, 2), p65Var), p65Var, 48, 2044);
            p65Var.p(true);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var3);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            Object objM7 = p65Var.M();
            if (objM7 == uobVar) {
                objM7 = qo7.u(Boolean.TRUE);
                p65Var.j0(objM7);
            }
            l78 l78Var4 = (l78) objM7;
            nwb nwbVar = new nwb("Select Field");
            Object objM8 = p65Var.M();
            if (objM8 == uobVar) {
                objM8 = new ei4(l78Var4, 23);
                p65Var.j0(objM8);
            }
            tr7.a(nwbVar, (m45) objM8, jfc.p(o28Var, 200.0f), 0L, 0, 0, 0, p65Var, 438, 120);
            boolean zBooleanValue3 = ((Boolean) l78Var4.getValue()).booleanValue();
            Object objM9 = p65Var.M();
            if (objM9 == uobVar) {
                objM9 = new ei4(l78Var4, 24);
                p65Var.j0(objM9);
            }
            b(zBooleanValue3, (m45) objM9, o28Var, 0L, null, null, null, 0L, 0.0f, pxf.E(-1139055419, new wb4(l78Var4, 3), p65Var), p65Var, 432, 2040);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 13);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0078  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0092  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x009a  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x0171  */
    /* JADX WARN: Removed duplicated region for block: B:94:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(boolean r30, defpackage.m45 r31, defpackage.r28 r32, long r33, defpackage.yrb r35, defpackage.hd9 r36, defpackage.m3c r37, long r38, float r40, defpackage.mz1 r41, defpackage.x12 r42, int r43, int r44) {
        /*
            Method dump skipped, instruction units count: 385
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.xp7.b(boolean, m45, r28, long, yrb, hd9, m3c, long, float, mz1, x12, int, int):void");
    }
}
