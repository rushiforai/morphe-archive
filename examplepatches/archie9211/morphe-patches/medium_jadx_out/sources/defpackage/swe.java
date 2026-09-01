package defpackage;

import com.medium.android.data.settings.Frequency;
import gen.model.SourceParameter;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class swe implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    public /* synthetic */ swe(jc1 jc1Var, y81 y81Var, kv6 kv6Var, upc upcVar) {
        this.a = 17;
        this.c = jc1Var;
        this.d = y81Var;
        this.b = kv6Var;
        this.e = upcVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        long j;
        int i = this.a;
        uob uobVar = w12.a;
        int i2 = 2;
        c1e c1eVar = c1e.a;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        Object obj6 = this.b;
        switch (i) {
            case 0:
                kv6 kv6Var = (kv6) obj6;
                m45 m45Var = (m45) obj5;
                Map map = (Map) obj4;
                b55 b55Var = (b55) obj3;
                x12 x12Var = (x12) obj;
                int iIntValue = ((Integer) obj2).intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    r28 r28VarB = rv8.J(o28.b, jq7.t(p65Var), null).b(jfc.c);
                    boolean zF = p65Var.f(m45Var) | p65Var.h(map) | p65Var.f(b55Var);
                    Object objM = p65Var.M();
                    if (zF || objM == uobVar) {
                        objM = new pi9(map, m45Var, b55Var, 26);
                        p65Var.j0(objM);
                    }
                    k40.t(r28VarB, kv6Var, null, null, null, null, false, null, (x45) objM, p65Var, 0, 508);
                }
                break;
            case 1:
                ((Integer) obj2).getClass();
                rv8.a((String) obj6, (List) obj5, (iaa) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 2:
                ((Integer) obj2).getClass();
                k50.o((lig) obj6, (String) obj5, (r28) obj4, (oc) obj3, (x12) obj, tr7.y(1));
                break;
            case 3:
                ((Integer) obj2).getClass();
                yi2.q((yf) obj6, (tf) obj5, (obe) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 4:
                ((Integer) obj2).getClass();
                xz5.f((ng) obj6, (cs1) obj5, (ig) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 5:
                ((Integer) obj2).getClass();
                g76.h((bh) obj6, (wg) obj5, (obe) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 6:
                ((Integer) obj2).getClass();
                op8.f((String) obj6, (md5) obj5, (r28) obj4, (bi) obj3, (x12) obj, tr7.y(1));
                break;
            case 7:
                ((Integer) obj2).getClass();
                op8.n((rh) obj6, (obe) obj5, (oh) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 8:
                ((Integer) obj2).getClass();
                gsa.k((li) obj6, (hi) obj5, (cs1) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 9:
                ((Integer) obj2).getClass();
                gsa.c((String) obj6, (fi) obj5, (r28) obj4, (si) obj3, (x12) obj, tr7.y(1));
                break;
            case 10:
                ((Integer) obj2).getClass();
                pwd.b((String) obj6, (olb) obj5, (r28) obj4, (ej) obj3, (x12) obj, tr7.y(1));
                break;
            case 11:
                ((Integer) obj2).getClass();
                pwd.f((yi) obj6, (ti) obj5, (e9d) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 12:
                ((Integer) obj2).getClass();
                bgf.j((kj) obj6, (obe) obj5, (fj) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 13:
                ((Integer) obj2).getClass();
                bgf.b((String) obj6, (zg7) obj5, (r28) obj4, (rj) obj3, (x12) obj, tr7.y(1));
                break;
            case 14:
                mz1 mz1Var = (mz1) obj6;
                mz1 mz1Var2 = (mz1) obj5;
                rq9 rq9Var = (rq9) obj4;
                pq9 pq9Var = (pq9) obj3;
                lvc lvcVar = (lvc) obj;
                f72 f72Var = (f72) obj2;
                lvcVar.getClass();
                long jA = f72.a(f72Var.a, 0, 0, 0, 0, 14);
                rya ryaVar = new rya();
                ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 1))).s(jA);
                rya ryaVar2 = new rya();
                t99 t99VarS = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 2))).s(jA);
                ryaVar2.a = t99VarS;
                int i3 = ((t99) ryaVar.a).a;
                int i4 = t99VarS.a;
                int i5 = i3 + i4;
                long j2 = f72Var.a;
                if (i5 > f72.h(j2)) {
                    int iH = f72.h(j2) / 2;
                    j = j2;
                    long j3 = f72Var.a;
                    if (i4 < iH) {
                        int iH2 = f72.h(j) - i4;
                        int iJ = f72.j(j3);
                        ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 3))).s(f72.a(j3, iJ > iH2 ? iH2 : iJ, iH2, 0, 0, 12));
                    } else if (i3 < f72.h(j) / 2) {
                        int iH3 = f72.h(j) - i3;
                        int iJ2 = f72.j(j3);
                        ryaVar2.a = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 4))).s(f72.a(j3, iJ2 > iH3 ? iH3 : iJ2, iH3, 0, 0, 12));
                    } else {
                        int iH4 = f72.h(j) / 2;
                        int iJ3 = f72.j(j3);
                        long jA2 = f72.a(j3, iJ3 > iH4 ? iH4 : iJ3, iH4, 0, 0, 12);
                        ryaVar.a = ((tk7) bu1.x0(lvcVar.x(mz1Var, 3))).s(jA2);
                        ryaVar2.a = ((tk7) bu1.x0(lvcVar.x(mz1Var2, 4))).s(jA2);
                    }
                } else {
                    j = j2;
                }
                break;
            case 15:
                r28 r28Var = (r28) obj6;
                l78 l78Var = (l78) obj5;
                mz1 mz1Var3 = (mz1) obj4;
                uo0 uo0Var = (uo0) obj3;
                x12 x12Var2 = (x12) obj;
                int iIntValue2 = ((Integer) obj2).intValue();
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 3) != 2)) {
                    p65Var2.S();
                } else {
                    Object objM2 = p65Var2.M();
                    if (objM2 == uobVar) {
                        objM2 = new ws(l78Var, i2);
                        p65Var2.j0(objM2);
                    }
                    r28 r28VarV = pwd.V(r28Var, (x45) objM2);
                    zk7 zk7VarC = dy0.c(z46.d, true);
                    long j4 = p65Var2.T;
                    int i6 = (int) (j4 ^ (j4 >>> 32));
                    i89 i89VarL = p65Var2.l();
                    r28 r28VarR = gx1.R(p65Var2, r28VarV);
                    r12.W.getClass();
                    ot2 ot2Var = q12.b;
                    p65Var2.c0();
                    if (p65Var2.S) {
                        p65Var2.k(ot2Var);
                    } else {
                        p65Var2.m0();
                    }
                    tp7.B(p65Var2, q12.f, zk7VarC);
                    tp7.B(p65Var2, q12.e, i89VarL);
                    tp7.B(p65Var2, q12.g, Integer.valueOf(i6));
                    tp7.y(p65Var2, q12.h);
                    tp7.B(p65Var2, q12.d, r28VarR);
                    mz1Var3.invoke(p65Var2, 0);
                    Object objM3 = p65Var2.M();
                    if (objM3 == uobVar) {
                        objM3 = new vs(l78Var, i2);
                        p65Var2.j0(objM3);
                    }
                    uo0Var.b((m45) objM3, p65Var2, 6);
                    p65Var2.p(true);
                }
                break;
            case 16:
                ((Integer) obj2).getClass();
                bo.e((String) obj6, (mkd) obj5, (String) obj4, (mkd) obj3, (x12) obj, tr7.y(1));
                break;
            case 17:
                jc1 jc1Var = (jc1) obj5;
                y81 y81Var = (y81) obj4;
                kv6 kv6Var2 = (kv6) obj6;
                upc upcVar = (upc) obj3;
                x12 x12Var3 = (x12) obj;
                int iIntValue3 = ((Integer) obj2).intValue();
                p65 p65Var3 = (p65) x12Var3;
                if (!p65Var3.P(iIntValue3 & 1, (iIntValue3 & 3) != 2)) {
                    p65Var3.S();
                } else {
                    t40.g(jc1Var instanceof gc1 ? ((gc1) jc1Var).p : null, y81Var, null, ((Boolean) upcVar.getValue()).booleanValue(), nk7.o0(kv6Var2), p65Var3, 0);
                }
                break;
            case 18:
                rg1 rg1Var = (rg1) obj6;
                ye1 ye1Var = (ye1) obj5;
                r28 r28Var2 = (r28) obj4;
                oe1 oe1Var = (oe1) obj3;
                x12 x12Var4 = (x12) obj;
                int iIntValue4 = ((Integer) obj2).intValue();
                p65 p65Var4 = (p65) x12Var4;
                if (!p65Var4.P(iIntValue4 & 1, (iIntValue4 & 3) != 2)) {
                    p65Var4.S();
                } else {
                    g01.b(rg1Var, ye1Var, r28Var2, oe1Var, p65Var4, 0, 0);
                }
                break;
            case 19:
                ((Integer) obj2).getClass();
                sgg.a((fj1) obj6, (bo4) obj5, (si1) obj4, (ye1) obj3, (x12) obj, tr7.y(1));
                break;
            case 20:
                ((Integer) obj2).getClass();
                gx1.e((mu1) obj6, (bo4) obj5, (hu1) obj4, (cs1) obj3, (x12) obj, tr7.y(1));
                break;
            case 21:
                ((Integer) obj2).getClass();
                nk7.f((r92) obj6, (SourceParameter) obj5, (rq5) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 22:
                ((Integer) obj2).getClass();
                ht2.t((se2) obj6, (akc) obj5, (xd2) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 23:
                ((Integer) obj2).getClass();
                ht2.v((vpc) obj6, (bo4) obj5, (xd2) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            case 24:
                b55 b55Var2 = (b55) obj3;
                l78 l78Var2 = (l78) obj6;
                l78 l78Var3 = (l78) obj5;
                l78 l78Var4 = (l78) obj4;
                x12 x12Var5 = (x12) obj;
                int iIntValue5 = ((Integer) obj2).intValue();
                p65 p65Var5 = (p65) x12Var5;
                if (!p65Var5.P(iIntValue5 & 1, (iIntValue5 & 3) != 2)) {
                    p65Var5.S();
                } else {
                    boolean zF2 = p65Var5.f(b55Var2);
                    Object objM4 = p65Var5.M();
                    if (zF2 || objM4 == uobVar) {
                        objM4 = new nf2(b55Var2, l78Var2, l78Var3, l78Var4);
                        p65Var5.j0(objM4);
                    }
                    f76.w((m45) ((qh6) objM4), null, false, null, null, null, f76.a, p65Var5, 805306368, 510);
                }
                break;
            case 25:
                ((Integer) obj2).getClass();
                u36.a((pl2) obj6, (jl2) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(3073));
                break;
            case 26:
                ((Integer) obj2).getClass();
                u36.c((String) obj6, (jl2) obj5, (r28) obj4, (sl2) obj3, (x12) obj, tr7.y(1));
                break;
            case 27:
                ((Integer) obj2).getClass();
                pwd.h((vpc) obj6, (bo4) obj5, (u43) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
            default:
                ((Integer) obj2).getClass();
                n01.E((Frequency) obj6, (az5) obj5, (x45) obj4, (r28) obj3, (x12) obj, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ swe(int i, int i2, Object obj, Object obj2, Object obj3, Object obj4) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    public /* synthetic */ swe(b55 b55Var, l78 l78Var, l78 l78Var2, l78 l78Var3) {
        this.a = 24;
        this.e = b55Var;
        this.b = l78Var;
        this.c = l78Var2;
        this.d = l78Var3;
    }

    public /* synthetic */ swe(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }
}
