package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class eq7 {
    public static final ArrayList a;

    static {
        ArrayList arrayList = new ArrayList(4);
        int i = 0;
        while (i < 4) {
            arrayList.add(new cq7(b09.w(i, "Item "), i % 2 == 0 ? b09.w(i, "Secondary text ") : null, i == 0));
            i++;
        }
        a = arrayList;
    }

    public static final void a(x12 x12Var, int i) {
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-2030676254);
        if (p65Var2.P(i & 1, i != 0)) {
            yq0 yq0Var = z46.q;
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(qb8.c, yq0Var, p65Var2, 48);
            long j = p65Var2.T;
            int i2 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var2.l();
            r28 r28VarR = gx1.R(p65Var2, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var2, cuVar, wv1VarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var2, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i2);
            cu cuVar3 = q12.g;
            tp7.B(p65Var2, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var2, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var2, cuVar4, r28VarR);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC = dy0.c(ar0Var, false);
            long j2 = p65Var2.T;
            int i3 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var2.l();
            r28 r28VarR2 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC);
            tp7.B(p65Var2, cuVar2, i89VarL2);
            ka1.z(i3, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR2);
            Object objM = p65Var2.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM);
            }
            l78 l78Var = (l78) objM;
            Object objM2 = p65Var2.M();
            if (objM2 == uobVar) {
                objM2 = new ei4(l78Var, 28);
                p65Var2.j0(objM2);
            }
            mo7.t((m45) objM2, "ShowMenu", yn7.M, null, false, p65Var2, 438, 24);
            boolean zBooleanValue = ((Boolean) l78Var.getValue()).booleanValue();
            Object objM3 = p65Var2.M();
            if (objM3 == uobVar) {
                objM3 = new ei4(l78Var, 29);
                p65Var2.j0(objM3);
            }
            b(zBooleanValue, (m45) objM3, null, 0L, null, pxf.E(1677349541, new wb4(l78Var, 4), p65Var2), p65Var2, 196656, 28);
            p65Var2.p(true);
            Object objM4 = p65Var2.M();
            if (objM4 == uobVar) {
                objM4 = qo7.u(Boolean.FALSE);
                p65Var2.j0(objM4);
            }
            l78 l78Var2 = (l78) objM4;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j3 = p65Var2.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL3 = p65Var2.l();
            r28 r28VarR3 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC2);
            tp7.B(p65Var2, cuVar2, i89VarL3);
            ka1.z(i4, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR3);
            Object objM5 = p65Var2.M();
            if (objM5 == uobVar) {
                objM5 = new dq7(l78Var2, 0);
                p65Var2.j0(objM5);
            }
            f49.k((m45) objM5, o28Var, false, vc2.d, p65Var2, 24630, 12);
            boolean zBooleanValue2 = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM6 = p65Var2.M();
            if (objM6 == uobVar) {
                objM6 = new dq7(l78Var2, 1);
                p65Var2.j0(objM6);
            }
            b(zBooleanValue2, (m45) objM6, null, 0L, null, pxf.E(55522076, new wb4(l78Var2, 5), p65Var2), p65Var2, 196656, 28);
            p65Var2.p(true);
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j4 = p65Var2.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL4 = p65Var2.l();
            r28 r28VarR4 = gx1.R(p65Var2, o28Var);
            p65Var2.c0();
            if (p65Var2.S) {
                p65Var2.k(ot2Var);
            } else {
                p65Var2.m0();
            }
            tp7.B(p65Var2, cuVar, zk7VarC3);
            tp7.B(p65Var2, cuVar2, i89VarL4);
            ka1.z(i5, p65Var2, cuVar3, p65Var2, fnVar);
            tp7.B(p65Var2, cuVar4, r28VarR4);
            Object objM7 = p65Var2.M();
            if (objM7 == uobVar) {
                objM7 = qo7.u(Boolean.TRUE);
                p65Var2.j0(objM7);
            }
            l78 l78Var3 = (l78) objM7;
            owb owbVar = new owb();
            Object objM8 = p65Var2.M();
            if (objM8 == uobVar) {
                objM8 = new dq7(l78Var3, 4);
                p65Var2.j0(objM8);
            }
            ur7.u(owbVar, (m45) objM8, jfc.p(o28Var, 200.0f), 0L, p65Var2, 438);
            boolean zBooleanValue3 = ((Boolean) l78Var3.getValue()).booleanValue();
            Object objM9 = p65Var2.M();
            if (objM9 == uobVar) {
                objM9 = new dq7(l78Var3, 5);
                p65Var2.j0(objM9);
            }
            b(zBooleanValue3, (m45) objM9, o28Var, 0L, null, pxf.E(1021084893, new wb4(l78Var3, 6), p65Var2), p65Var2, 197040, 24);
            p65Var = p65Var2;
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wn7(i, 14);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:19:0x0042  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x0044  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x004d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00c9  */
    /* JADX WARN: Removed duplicated region for block: B:39:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void b(boolean r19, defpackage.m45 r20, defpackage.r28 r21, long r22, defpackage.yrb r24, defpackage.mz1 r25, defpackage.x12 r26, int r27, int r28) {
        /*
            Method dump skipped, instruction units count: 215
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.eq7.b(boolean, m45, r28, long, yrb, mz1, x12, int, int):void");
    }

    public static final void c(m45 m45Var, r28 r28Var, cq7 cq7Var, x12 x12Var, int i) {
        m45 m45Var2;
        m45Var.getClass();
        cq7Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(972406748);
        int i2 = i | 48 | (p65Var.f(cq7Var) ? 256 : 128);
        if (p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            o28 o28Var = o28.b;
            m45Var2 = m45Var;
            pq.b(m45Var2, jfc.d(jfc.b(o28Var, 200.0f, 0.0f, 2), 1.0f), false, new jy8(24.0f, 0.0f, 24.0f, 0.0f), pxf.E(37089727, new so1(19, cq7Var), p65Var), p65Var, 199686);
            r28Var = o28Var;
        } else {
            m45Var2 = m45Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(m45Var2, r28Var, cq7Var, i);
        }
    }
}
