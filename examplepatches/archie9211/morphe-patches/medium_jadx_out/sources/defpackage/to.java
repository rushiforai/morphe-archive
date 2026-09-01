package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class to {
    public static final float a = (25.0f * 2.0f) / 2.4142137f;

    public static final void a(lp8 lp8Var, r28 r28Var, long j, x12 x12Var, int i) {
        int i2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1776202187);
        int i3 = (p65Var.f(lp8Var) ? 4 : 2) | i | (p65Var.f(r28Var) ? 32 : 16) | 128;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            if ((i & 1) == 0 || p65Var.z()) {
                i2 = i3 & (-897);
                j = 9205357640488583168L;
            } else {
                p65Var.S();
                i2 = i3 & (-897);
            }
            p65Var.q();
            int i4 = i2 & 14;
            boolean z = i4 == 4;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                objM = new s0(4, lp8Var);
                p65Var.j0(objM);
            }
            g01.n(lp8Var, z46.e, pxf.E(-1653527038, new po(j, wxb.a(r28Var, false, (x45) objM)), p65Var), p65Var, i4 | 432);
        } else {
            p65Var.S();
        }
        long j2 = j;
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qo(lp8Var, r28Var, j2, i, 0);
        }
    }

    public static final void b(int i, int i2, x12 x12Var, r28 r28Var) {
        int i3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(694251107);
        int i4 = i2 & 1;
        if (i4 != 0) {
            i3 = i | 6;
        } else {
            i3 = (p65Var.f(r28Var) ? 4 : 2) | i;
        }
        int i5 = 0;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            if (i4 != 0) {
                r28Var = o28.b;
            }
            hp7.t(p65Var, guc.B(jfc.m(r28Var, a, 25.0f), new ro(i5, ((ekd) p65Var.j(fkd.a)).a)));
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new bc(r28Var, i, i2, 1);
        }
    }
}
