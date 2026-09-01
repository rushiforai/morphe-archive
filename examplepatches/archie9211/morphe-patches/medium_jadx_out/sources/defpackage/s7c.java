package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class s7c {
    public static final cud a = f76.Q(300, 0, ao3.a, 2);

    public static final void a(mz1 mz1Var, x12 x12Var, int i) {
        mz1 mz1Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1033612924);
        int i2 = 0;
        if (p65Var.P(i & 1, (i & 19) != 18)) {
            String strV = ep7.v(p65Var, R.string.m3c_bottom_sheet_drag_handle_description);
            dr5 dr5Var = new dr5(z46.q);
            zk7 zk7VarC = dy0.c(z46.d, false);
            int iS = w2g.s(p65Var);
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, dr5Var);
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
            mz1Var2 = mz1Var;
            kod.b(hod.a(390, 2, p65Var), pxf.E(2059851063, new r7c(strV, i2), p65Var), kod.d(0, 7, p65Var), null, false, mz1Var2, p65Var, 100663344, 248);
            p65Var.p(true);
        } else {
            mz1Var2 = mz1Var;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var2, i, 13);
        }
    }

    public static final v7c b(boolean z, final x45 x45Var, final w7c w7cVar, boolean z2, x12 x12Var, int i, int i2) {
        final boolean z3 = (i2 & 1) != 0 ? false : z;
        final boolean z4 = (i2 & 8) != 0 ? false : z2;
        float f = zv0.b;
        float f2 = zv0.c;
        p65 p65Var = (p65) x12Var;
        m73 m73Var = (m73) p65Var.j(z22.h);
        boolean zF = p65Var.f(m73Var) | p65Var.c(f);
        Object objM = p65Var.M();
        uob uobVar = w12.a;
        Object obj = objM;
        if (zF || objM == uobVar) {
            o7c o7cVar = new o7c(m73Var, f, 0);
            p65Var.j0(o7cVar);
            obj = o7cVar;
        }
        final m45 m45Var = (m45) obj;
        boolean zF2 = p65Var.f(m73Var) | p65Var.c(f2);
        Object objM2 = p65Var.M();
        int i3 = 1;
        Object obj2 = objM2;
        if (zF2 || objM2 == uobVar) {
            o7c o7cVar2 = new o7c(m73Var, f2, 1);
            p65Var.j0(o7cVar2);
            obj2 = o7cVar2;
        }
        final m45 m45Var2 = (m45) obj2;
        Object[] objArr = {Boolean.valueOf(z3), x45Var, Boolean.valueOf(z4)};
        mya myaVar = new mya(new n2c(i3), 3, new x45() { // from class: t7c
            @Override // defpackage.x45
            public final Object invoke(Object obj3) {
                return new v7c(z3, m45Var, m45Var2, (w7c) obj3, x45Var, z4);
            }
        });
        int i4 = (((((i & 14) ^ 6) <= 4 || !p65Var.g(z3)) && (i & 6) != 4) ? 0 : 1) | (p65Var.f(m45Var) ? 1 : 0) | (p65Var.f(m45Var2) ? 1 : 0) | (((((i & 896) ^ 384) <= 256 || !p65Var.d(w7cVar.ordinal())) && (i & 384) != 256) ? 0 : 1) | (((((i & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) ^ 48) <= 32 || !p65Var.f(x45Var)) && (i & 48) != 32) ? 0 : 1);
        if ((((i & 7168) ^ 3072) <= 2048 || !p65Var.g(z4)) && (i & 3072) != 2048) {
            i3 = 0;
        }
        int i5 = i4 | i3;
        Object objM3 = p65Var.M();
        Object obj3 = objM3;
        if (i5 != 0 || objM3 == uobVar) {
            final boolean z5 = z4;
            m45 m45Var3 = new m45() { // from class: p7c
                @Override // defpackage.m45
                public final Object invoke() {
                    return new v7c(z3, m45Var, m45Var2, w7cVar, x45Var, z5);
                }
            };
            p65Var.j0(m45Var3);
            obj3 = m45Var3;
        }
        return (v7c) hp7.F(objArr, myaVar, (m45) obj3, p65Var, 0);
    }
}
