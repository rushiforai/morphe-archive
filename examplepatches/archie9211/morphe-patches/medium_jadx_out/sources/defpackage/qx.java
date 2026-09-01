package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qx {
    public static final f09 a;

    static {
        ey3 ey3Var = ey3.a;
        a = new f09(ey3Var, ey3Var);
    }

    public static final void a(mx mxVar, List list, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1794596951);
        if ((i & 6) == 0) {
            i2 = (p65Var.f(mxVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        char c = ' ';
        if ((i & 48) == 0) {
            i2 |= p65Var.h(list) ? 32 : 16;
        }
        if (p65Var.P(i2 & 1, (i2 & 19) != 18)) {
            int size = list.size();
            int i3 = 0;
            while (i3 < size) {
                lx lxVar = (lx) list.get(i3);
                c55 c55Var = (c55) lxVar.a;
                int i4 = lxVar.b;
                int i5 = lxVar.c;
                Object objM = p65Var.M();
                if (objM == w12.a) {
                    objM = id.e;
                    p65Var.j0(objM);
                }
                zk7 zk7Var = (zk7) objM;
                long j = p65Var.T;
                int i6 = (int) (j ^ (j >>> c));
                i89 i89VarL = p65Var.l();
                r28 r28VarR = gx1.R(p65Var, o28.b);
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
                tp7.B(p65Var, q12.g, Integer.valueOf(i6));
                tp7.y(p65Var, q12.h);
                tp7.B(p65Var, q12.d, r28VarR);
                c55Var.f(mxVar.subSequence(i4, i5).b, p65Var, 0);
                p65Var.p(true);
                i3++;
                c = ' ';
            }
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new s(mxVar, list, i, 2);
        }
    }
}
