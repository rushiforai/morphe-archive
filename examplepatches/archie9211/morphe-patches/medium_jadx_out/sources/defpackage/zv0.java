package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zv0 {
    public static final zv0 a = new zv0();
    public static final float b;
    public static final float c;

    static {
        gv1 gv1Var = n7c.a;
        float f = n7c.d;
        b = 56.0f;
        c = 125.0f;
    }

    public final void a(r28 r28Var, float f, float f2, m3c m3cVar, long j, x12 x12Var, int i) {
        p65 p65Var;
        r28 r28Var2;
        float f3;
        float f4;
        m3c m3cVar2;
        long j2;
        m3c m3cVar3;
        long jD;
        float f5;
        float f6;
        r28 r28Var3;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1364277227);
        int i2 = i | 9654;
        if (p65Var2.P(i2 & 1, (i2 & 9363) != 9362)) {
            p65Var2.U();
            if ((i & 1) == 0 || p65Var2.z()) {
                float f7 = n7c.c;
                float f8 = n7c.b;
                m3cVar3 = ((w4c) p65Var2.j(z4c.a)).e;
                jD = iv1.d(n7c.a, p65Var2);
                f5 = f8;
                f6 = f7;
                r28Var3 = o28.b;
            } else {
                p65Var2.S();
                r28Var3 = r28Var;
                f6 = f;
                f5 = f2;
                m3cVar3 = m3cVar;
                jD = j;
            }
            p65Var2.q();
            String strV = ep7.v(p65Var2, R.string.m3c_bottom_sheet_drag_handle_description);
            cud cudVar = s7c.a;
            r28 r28VarE = w2g.E(r28Var3, 0.0f, 22.0f, 1);
            boolean zF = p65Var2.f(strV);
            Object objM = p65Var2.M();
            if (zF || objM == w12.a) {
                objM = new mb(strV, 8);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            g3d.a(wxb.a(r28VarE, false, (x45) objM), m3cVar3, jD, 0L, 0.0f, 0.0f, null, pxf.E(-1039573072, new yv0(f6, f5), p65Var2), p65Var, 12582912, 120);
            f4 = f5;
            m3cVar2 = m3cVar3;
            j2 = jD;
            f3 = f6;
            r28Var2 = r28Var3;
        } else {
            p65Var = p65Var2;
            p65Var.S();
            r28Var2 = r28Var;
            f3 = f;
            f4 = f2;
            m3cVar2 = m3cVar;
            j2 = j;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new xv0(this, r28Var2, f3, f4, m3cVar2, j2, i);
        }
    }
}
