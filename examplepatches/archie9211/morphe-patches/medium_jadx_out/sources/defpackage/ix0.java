package defpackage;

import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ix0 implements b55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ b55 b;
    public final /* synthetic */ boolean c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ b55 e;
    public final /* synthetic */ Object f;

    public ix0(b55 b55Var, qx7 qx7Var, boolean z, b55 b55Var2, b55 b55Var3) {
        this.b = b55Var;
        this.d = qx7Var;
        this.c = z;
        this.e = b55Var2;
        this.f = b55Var3;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj3 = this.f;
        b55 b55Var = this.e;
        int i2 = 2;
        int i3 = 1;
        int i4 = 0;
        Object obj4 = this.d;
        switch (i) {
            case 0:
                x12 x12Var = (x12) obj;
                int iIntValue = ((Number) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarW = xz5.W(jfc.d(o28.b, 1.0f), new hw0((v7c) obj4, i4));
                    mz1 mz1Var = (mz1) b55Var;
                    v7c v7cVar = (v7c) obj4;
                    sb2 sb2Var = (sb2) obj3;
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var, 0);
                    int iS = w2g.s(p65Var);
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarW);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var.c0();
                    if (p65Var.S) {
                        p65Var.k(ot2Var);
                    } else {
                        p65Var.m0();
                    }
                    tp7.B(p65Var, q12.f, wv1VarA);
                    tp7.B(p65Var, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var.S || !g76.L(p65Var.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var, iS, cuVar);
                    }
                    tp7.B(p65Var, q12.d, r28VarR);
                    b55 b55Var2 = this.b;
                    if (b55Var2 != null) {
                        p65Var.Y(-1044068159);
                        s7c.a(pxf.E(-511691176, new hx0(v7cVar, sb2Var, this.c, ep7.v(p65Var, R.string.m3c_bottom_sheet_expand_description), ep7.v(p65Var, R.string.m3c_bottom_sheet_collapse_description), ep7.v(p65Var, R.string.m3c_bottom_sheet_dismiss_description), b55Var2), p65Var), p65Var, 54);
                        p65Var.p(false);
                    } else {
                        p65Var.Y(-1040260677);
                        p65Var.p(false);
                    }
                    mz1Var.f(xv1.a, p65Var, 6);
                    p65Var.p(true);
                }
                break;
            default:
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Number) obj2).intValue();
                qx7 qx7Var = (qx7) obj4;
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    boolean z = this.c;
                    b55 b55Var3 = this.b;
                    if (b55Var3 != null) {
                        p65Var2.Y(-864613220);
                        k40.c(b09.q(z ? qx7Var.b : qx7Var.e, c82.a), pxf.E(1241781204, new jd(i2, b55Var3), p65Var2), p65Var2, 56);
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(-864293207);
                        p65Var2.p(false);
                    }
                    sn3 sn3Var = c82.a;
                    k40.c(b09.q(z ? qx7Var.a : qx7Var.d, sn3Var), pxf.E(-893579015, new zx7(b55Var3, b55Var, (b55) obj3, i3), p65Var2), p65Var2, 56);
                    if (b55Var == null) {
                        p65Var2.Y(-863072055);
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(-863394951);
                        k40.c(b09.q(z ? qx7Var.c : qx7Var.f, sn3Var), pxf.E(-782441013, new jd(3, b55Var), p65Var2), p65Var2, 56);
                        p65Var2.p(false);
                    }
                }
                break;
        }
        return c1eVar;
    }

    public ix0(v7c v7cVar, b55 b55Var, mz1 mz1Var, sb2 sb2Var, boolean z) {
        this.d = v7cVar;
        this.b = b55Var;
        this.e = mz1Var;
        this.f = sb2Var;
        this.c = z;
    }
}
