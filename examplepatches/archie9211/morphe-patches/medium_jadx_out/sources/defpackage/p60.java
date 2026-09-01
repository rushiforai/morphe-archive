package defpackage;

import android.net.Uri;
import com.medium.android.susi.ui.apple.a;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class p60 implements c55 {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ l78 c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;

    public /* synthetic */ p60(l78 l78Var, l78 l78Var2, l78 l78Var3, l78 l78Var4, l78 l78Var5, g49 g49Var, Uri uri, a aVar, boolean z) {
        this.d = uri;
        this.e = aVar;
        this.b = z;
        this.c = l78Var;
        this.f = l78Var2;
        this.g = l78Var3;
        this.h = l78Var4;
        this.j = g49Var;
        this.i = l78Var5;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        l78 l78Var;
        l78 l78Var2;
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        String str;
        boolean z6;
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        uob uobVar = w12.a;
        Object obj4 = this.j;
        Object obj5 = this.i;
        Object obj6 = this.h;
        Object obj7 = this.g;
        Object obj8 = this.f;
        Object obj9 = this.e;
        Object obj10 = this.d;
        switch (i) {
            case 0:
                Uri uri = (Uri) obj10;
                a aVar = (a) obj9;
                l78 l78Var3 = (l78) obj8;
                l78 l78Var4 = (l78) obj7;
                l78 l78Var5 = (l78) obj6;
                g49 g49Var = (g49) obj4;
                l78 l78Var6 = (l78) obj5;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var, hy8Var);
                    rh4 rh4Var = jfc.c;
                    r28 r28VarB2 = r28VarB.b(rh4Var);
                    zk7 zk7VarC = dy0.c(z46.d, false);
                    long j = p65Var.T;
                    int i2 = (int) (j ^ (j >>> 32));
                    i89 i89VarL = p65Var.l();
                    r28 r28VarR = gx1.R(p65Var, r28VarB2);
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
                    r28 r28VarB3 = bgf.N(o28Var, "content").b(rh4Var);
                    boolean zH = p65Var.h(uri) | p65Var.f(aVar);
                    boolean z7 = this.b;
                    boolean zG = zH | p65Var.g(z7);
                    Object objM = p65Var.M();
                    if (zG || objM == uobVar) {
                        objM = new r60(this.c, l78Var3, l78Var4, l78Var5, l78Var6, g49Var, uri, aVar, z7);
                        l78Var = l78Var4;
                        l78Var2 = l78Var5;
                        z = z7;
                        p65Var.j0(objM);
                    } else {
                        z = z7;
                        l78Var = l78Var4;
                        l78Var2 = l78Var5;
                    }
                    x45 x45Var = (x45) objM;
                    boolean zG2 = p65Var.g(z);
                    Object objM2 = p65Var.M();
                    if (zG2 || objM2 == uobVar) {
                        objM2 = new rb(l78Var2, l78Var, z, 1);
                        p65Var.j0(objM2);
                    }
                    vc2.a(x45Var, r28VarB3, (x45) objM2, p65Var, 48, 0);
                    if (g49Var.g() < 1.0f) {
                        p65Var.Y(403550680);
                        xz5.p(jfc.d(o28Var, 1.0f), Float.valueOf(g49Var.g()), ((zo7) p65Var.j(kt7.b)).e, 0L, 0, 0.0f, null, p65Var, 6, 120);
                        z2 = false;
                    } else {
                        z2 = false;
                        p65Var.Y(396010891);
                    }
                    p65Var.p(z2);
                    p65Var.p(true);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            default:
                j4a j4aVar = (j4a) obj10;
                x45 x45Var2 = (x45) obj9;
                m45 m45Var = (m45) obj8;
                String str2 = (String) obj7;
                Integer num = (Integer) obj6;
                sr4 sr4Var = (sr4) obj5;
                x45 x45Var3 = (x45) obj4;
                gq4 gq4Var = (gq4) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                gq4Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(gq4Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                    return c1eVar;
                }
                p65Var2.Y(-1713955685);
                List list = j4aVar.a;
                Iterator it2 = list.iterator();
                int i3 = 0;
                while (true) {
                    boolean zHasNext = it2.hasNext();
                    c1e c1eVar2 = c1eVar;
                    boolean z8 = this.b;
                    List list2 = list;
                    if (!zHasNext) {
                        p65 p65Var3 = p65Var2;
                        x45 x45Var4 = x45Var3;
                        sr4 sr4Var2 = sr4Var;
                        Integer num2 = num;
                        String str3 = str2;
                        p65Var3.p(false);
                        if (list2.isEmpty()) {
                            p65Var3.Y(-1596604761);
                        } else {
                            km4.F(12.0f, -1591091349, p65Var3, p65Var3, o28Var);
                        }
                        p65Var3.p(false);
                        r28 r28VarA = gq4Var.a(1.0f, jfc.q(gq4Var.b(o28Var, z46.n), 80.0f, 0.0f, 2), true);
                        zk7 zk7VarC2 = dy0.c(z46.g, false);
                        long j2 = p65Var3.T;
                        int i4 = (int) (j2 ^ (j2 >>> 32));
                        i89 i89VarL2 = p65Var3.l();
                        r28 r28VarR2 = gx1.R(p65Var3, r28VarA);
                        r12.W.getClass();
                        ot2 ot2Var2 = q12.b;
                        p65Var3.c0();
                        if (p65Var3.S) {
                            p65Var3.k(ot2Var2);
                        } else {
                            p65Var3.m0();
                        }
                        tp7.B(p65Var3, q12.f, zk7VarC2);
                        tp7.B(p65Var3, q12.e, i89VarL2);
                        tp7.B(p65Var3, q12.g, Integer.valueOf(i4));
                        tp7.y(p65Var3, q12.h);
                        tp7.B(p65Var3, q12.d, r28VarR2);
                        if (j4aVar.b.length() != 0 || str3 == null) {
                            z3 = false;
                            p65Var3.Y(1613543245);
                        } else {
                            p65Var3.Y(1619446234);
                            jjd.b(str3, w2g.E(o28Var, 0.0f, 4.0f, 1), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var3.j(jt7.c)).m, ((zo7) p65Var3.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var3, 48, 0, 131068);
                            z3 = false;
                        }
                        p65Var3.p(z3);
                        if (num2 == null || list2.size() >= num2.intValue()) {
                            z4 = false;
                            p65Var3.Y(1613543245);
                        } else {
                            p65Var3.Y(1619859805);
                            akc akcVar = (akc) p65Var3.j(z22.r);
                            r28 r28VarE = w2g.E(o28Var, 0.0f, 4.0f, 1);
                            Object objM3 = p65Var3.M();
                            if (objM3 == uobVar) {
                                objM3 = new ws(this.c, 19);
                                p65Var3.j0(objM3);
                            }
                            r28 r28VarJ = r40.J(r28VarE, (x45) objM3);
                            if (z8) {
                                r28VarJ = jfc.d(r28VarJ, 1.0f);
                            }
                            if (sr4Var2 != null) {
                                r28VarJ = t40.F(r28VarJ, sr4Var2);
                            }
                            r28 r28Var = r28VarJ;
                            String str4 = j4aVar.b;
                            mkd mkdVar = ((bu7) p65Var3.j(jt7.c)).m;
                            dkc dkcVar = new dkc(((zo7) p65Var3.j(kt7.b)).n);
                            sk6 sk6Var = sk6.f;
                            sk6 sk6VarA = sk6.a(0, 0, 7, 117);
                            boolean zF = p65Var3.f(akcVar);
                            Object objM4 = p65Var3.M();
                            if (zF || objM4 == uobVar) {
                                objM4 = new ba(akcVar, 3);
                                p65Var3.j0(objM4);
                            }
                            x45 x45Var5 = (x45) objM4;
                            pk6 pk6Var = new pk6(x45Var5, x45Var5, x45Var5, x45Var5, x45Var5, x45Var5);
                            boolean zF2 = p65Var3.f(x45Var4);
                            Object objM5 = p65Var3.M();
                            if (zF2 || objM5 == uobVar) {
                                objM5 = new ju0(3, x45Var4);
                                p65Var3.j0(objM5);
                            }
                            yo0.b(str4, (x45) objM5, r28Var, z8, mkdVar, sk6VarA, pk6Var, 0, 0, null, null, dkcVar, null, p65Var3, 0, 0, 48912);
                            z4 = false;
                        }
                        p65Var3.p(z4);
                        p65Var3.p(true);
                        return c1eVar2;
                    }
                    Object next = it2.next();
                    int i5 = i3 + 1;
                    if (i3 < 0) {
                        d46.i0();
                        throw null;
                    }
                    Iterator it3 = it2;
                    String str5 = (String) next;
                    x45 x45Var6 = x45Var3;
                    Integer num3 = num;
                    String str6 = str2;
                    r28 r28VarE2 = jfc.e(w2g.E(o28Var, 0.0f, 4.0f, 1), 24.0f);
                    omb ombVarA = nmb.a(qb8.a, z46.m, p65Var2, 0);
                    long j3 = p65Var2.T;
                    int i6 = (int) (j3 ^ (j3 >>> 32));
                    i89 i89VarL3 = p65Var2.l();
                    r28 r28VarR3 = gx1.R(p65Var2, r28VarE2);
                    r12.W.getClass();
                    ot2 ot2Var3 = q12.b;
                    p65Var2.c0();
                    sr4 sr4Var3 = sr4Var;
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var3);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, ombVarA);
                    tp7.B(p65Var2, q12.e, i89VarL3);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR3);
                    r28 r28VarF = jfc.f(o28Var, 24.0f, 0.0f, 2);
                    boolean zG3 = p65Var2.g(z8) | p65Var2.f(x45Var2) | p65Var2.f(str5) | p65Var2.f(m45Var);
                    Object objM6 = p65Var2.M();
                    if (zG3 || objM6 == uobVar) {
                        objM6 = new gp3(z8, x45Var2, str5, m45Var, 1);
                        z5 = z8;
                        str = str5;
                        p65Var2.j0(objM6);
                    } else {
                        z5 = z8;
                        str = str5;
                    }
                    r28 r28VarR4 = hlg.r(r28VarF, false, null, null, (m45) objM6, 15);
                    amb ambVarA = bmb.a(4.0f);
                    sn3 sn3Var = kt7.b;
                    p65 p65Var4 = p65Var2;
                    g3d.a(r28VarR4, ambVarA, ((zo7) p65Var2.j(sn3Var)).a, 0L, 0.0f, 0.0f, k40.b(1.0f, ((zo7) p65Var2.j(sn3Var)).z), pxf.E(-1111346154, new z91(1, str, z5), p65Var2), p65Var4, 12582912, 56);
                    if (i3 < list2.size() - 1) {
                        km4.F(6.0f, -2049407738, p65Var4, p65Var4, o28Var);
                        z6 = false;
                    } else {
                        z6 = false;
                        p65Var4.Y(-2054765871);
                    }
                    p65Var4.p(z6);
                    p65Var4.p(true);
                    it2 = it3;
                    p65Var2 = p65Var4;
                    i3 = i5;
                    str2 = str6;
                    list = list2;
                    num = num3;
                    c1eVar = c1eVar2;
                    x45Var3 = x45Var6;
                    sr4Var = sr4Var3;
                }
                break;
        }
    }

    public /* synthetic */ p60(j4a j4aVar, boolean z, x45 x45Var, m45 m45Var, String str, Integer num, sr4 sr4Var, x45 x45Var2, l78 l78Var) {
        this.d = j4aVar;
        this.b = z;
        this.e = x45Var;
        this.f = m45Var;
        this.g = str;
        this.h = num;
        this.i = sr4Var;
        this.j = x45Var2;
        this.c = l78Var;
    }
}
