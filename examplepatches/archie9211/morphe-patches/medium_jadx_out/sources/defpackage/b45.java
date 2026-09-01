package defpackage;

import com.drew.metadata.exif.ExifDirectoryBase;
import com.medium.android.susi.ui.apple.a;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class b45 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;

    public /* synthetic */ b45(int i, int i2, Object obj, Object obj2, Object obj3) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        mz1 mz1VarE;
        int i = this.a;
        o28 o28Var = o28.b;
        mz1 mz1VarE2 = null;
        uob uobVar = w12.a;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        int i2 = 1;
        c1e c1eVar = c1e.a;
        Object obj3 = this.d;
        Object obj4 = this.c;
        Object obj5 = this.b;
        switch (i) {
            case 0:
                sw5 sw5Var = (sw5) obj5;
                amb ambVar = (amb) obj4;
                l78 l78Var = (l78) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    String alt = sw5Var != null ? sw5Var.getAlt() : null;
                    r28 r28VarB = flb.a0(o28Var, xo7.c, ambVar).b(jfc.c);
                    boolean zF = p65Var.f(l78Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new ws(l78Var, 10);
                        p65Var.j0(objM);
                    }
                    x45 x45Var = (x45) objM;
                    boolean zF2 = p65Var.f(l78Var);
                    Object objM2 = p65Var.M();
                    if (zF2 || objM2 == uobVar) {
                        objM2 = new ws(l78Var, 11);
                        p65Var.j0(objM2);
                    }
                    x45 x45Var2 = (x45) objM2;
                    boolean zF3 = p65Var.f(l78Var);
                    Object objM3 = p65Var.M();
                    if (zF3 || objM3 == uobVar) {
                        objM3 = new ws(l78Var, 12);
                        p65Var.j0(objM3);
                    }
                    ur7.b(sw5Var, alt, r28VarB, null, null, null, x45Var, x45Var2, (x45) objM3, null, p65Var, 0, 6, 31288);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                qb8.a((p) obj5, (iaa) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                op8.b((List) obj5, (b55) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                m40.a((l9) obj5, (c9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                r40.b((la) obj5, (x9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                k50.d((lc) obj5, (gc) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
            case 6:
                b55 b55Var = (b55) obj5;
                b55 b55Var2 = (b55) obj4;
                mz1 mz1Var = (mz1) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var2, 0);
                    int iS = w2g.s(p65Var2);
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, o28Var);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, wv1VarA);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    cu cuVar = q12.g;
                    if (p65Var2.S || !g76.L(p65Var2.M(), Integer.valueOf(iS))) {
                        lv8.w(iS, p65Var2, iS, cuVar);
                    }
                    tp7.B(p65Var2, q12.d, r28VarR);
                    if (b55Var == null) {
                        p65Var2.Y(-97968969);
                        p65Var2.p(false);
                        mz1VarE = null;
                    } else {
                        p65Var2.Y(-97968968);
                        mz1VarE = pxf.E(1737550099, new gd(objArr == true ? 1 : 0, b55Var), p65Var2);
                        p65Var2.p(false);
                    }
                    if (b55Var2 == null) {
                        p65Var2.Y(-97547524);
                        p65Var2.p(false);
                    } else {
                        p65Var2.Y(-97547523);
                        mz1VarE2 = pxf.E(1265552690, new gd(i2, b55Var2), p65Var2);
                        p65Var2.p(false);
                    }
                    rd.a(mz1VarE, mz1VarE2, p65Var2, 6);
                    km4.H(0, mz1Var, p65Var2, true);
                }
                break;
            case 7:
                ((Integer) obj2).getClass();
                k50.q((je) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                rx0.e((ve) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                n01.b((lf) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                yi2.f((zf) obj5, (tf) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                xz5.b((og) obj5, (ig) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                g76.c((ch) obj5, (wg) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                op8.c((sh) obj5, (oh) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                ((Integer) obj2).getClass();
                gsa.p((b24) obj5, (hi) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 15:
                ((Integer) obj2).getClass();
                pwd.c((zi) obj5, (ti) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 16:
                ((Integer) obj2).getClass();
                bgf.c((lj) obj5, (fj) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                r28 r28Var = (r28) obj5;
                l78 l78Var2 = (l78) obj3;
                mz1 mz1Var2 = (mz1) obj4;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    Object objM4 = p65Var3.M();
                    if (objM4 == uobVar) {
                        objM4 = new ws(l78Var2, objArr2 == true ? 1 : 0);
                        p65Var3.j0(objM4);
                    }
                    r28 r28VarV = pwd.V(r28Var, (x45) objM4);
                    zk7 zk7VarC = dy0.c(z46.d, true);
                    long j = p65Var3.T;
                    int i3 = (int) (j ^ (j >>> 32));
                    i89 i89VarL2 = p65Var3.l();
                    r28 r28VarR2 = gx1.R(p65Var3, r28VarV);
                    r12.W.getClass();
                    ot2 ot2Var2 = q12.b;
                    p65Var3.c0();
                    if (p65Var3.S) {
                        p65Var3.k(ot2Var2);
                    } else {
                        p65Var3.m0();
                    }
                    tp7.B(p65Var3, q12.f, zk7VarC);
                    tp7.B(p65Var3, q12.e, i89VarL2);
                    tp7.B(p65Var3, q12.g, Integer.valueOf(i3));
                    tp7.y(p65Var3, q12.h);
                    tp7.B(p65Var3, q12.d, r28VarR2);
                    km4.H(0, mz1Var2, p65Var3, true);
                }
                break;
            case 18:
                a aVar = (a) obj5;
                l78 l78Var3 = (l78) obj3;
                l78 l78Var4 = (l78) obj4;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    f76.b((String) l78Var3.getValue(), (String) l78Var4.getValue(), aVar, p65Var4, 0);
                }
                break;
            case 19:
                ((Integer) obj2).getClass();
                f76.b((String) obj5, (String) obj4, (a) obj3, (x12) obj, tr7.y(1));
                break;
            case 20:
                ((Integer) obj2).getClass();
                r40.f((va0) obj5, (m45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                t40.e((za0) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 22:
                ((Integer) obj2).getClass();
                f49.a((jb0) obj5, (cb0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                f49.d((hb0) obj5, (cb0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                ((Integer) obj2).getClass();
                f49.c((gb0) obj5, (cb0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 25:
                r28 r28Var2 = (r28) obj5;
                cb0 cb0Var = (cb0) obj4;
                upc upcVar = (upc) obj3;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    Object objM5 = p65Var5.M();
                    if (objM5 == uobVar) {
                        objM5 = new nx(5);
                        p65Var5.j0(objM5);
                    }
                    pr7.b(bgf.N(wxb.a(r28Var2, false, (x45) objM5), "audience_screen"), null, null, null, null, 0, 0L, 0L, qb8.p, pxf.E(-1297055273, new ec(cb0Var, 15, upcVar), p65Var5), p65Var5, 805306368, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
                }
                break;
            case 26:
                ((Integer) obj2).getClass();
                gsa.e((ld0) obj5, (wc0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                gsa.H((ld0) obj5, (qc0) obj4, (r28) obj3, (x12) obj, tr7.y(385));
                break;
            case 28:
                ((Integer) obj2).getClass();
                gsa.f((od0) obj5, (wc0) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                yi2.k((te0) obj5, (cv9) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ b45(Object obj, l78 l78Var, Object obj2, int i) {
        this.a = i;
        this.b = obj;
        this.d = l78Var;
        this.c = obj2;
    }

    public /* synthetic */ b45(Object obj, Object obj2, Object obj3, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
    }
}
