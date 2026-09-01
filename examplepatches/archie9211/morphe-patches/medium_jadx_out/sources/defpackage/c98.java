package defpackage;

import com.medium.refinerecommendations.RefineRecommendationsFilter;
import com.medium.refinerecommendations.RefineRecommendationsTab;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class c98 implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    public /* synthetic */ c98(kv6 kv6Var, tce tceVar, b98 b98Var, az5 az5Var, ye1 ye1Var, oe1 oe1Var, az5 az5Var2) {
        this.a = 0;
        this.b = kv6Var;
        this.c = tceVar;
        this.d = b98Var;
        this.e = az5Var;
        this.g = ye1Var;
        this.h = oe1Var;
        this.f = az5Var2;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        o28 o28Var = o28.b;
        int i2 = 4;
        c1e c1eVar = c1e.a;
        Object obj4 = this.h;
        Object obj5 = this.g;
        Object obj6 = this.f;
        Object obj7 = this.e;
        Object obj8 = this.d;
        Object obj9 = this.c;
        Object obj10 = this.b;
        switch (i) {
            case 0:
                kv6 kv6Var = (kv6) obj10;
                tce tceVar = (tce) obj9;
                b98 b98Var = (b98) obj8;
                az5 az5Var = (az5) obj7;
                ye1 ye1Var = (ye1) obj5;
                oe1 oe1Var = (oe1) obj4;
                az5 az5Var2 = (az5) obj6;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    h70 h70Var = new h70(24.0f, true, new z10(21));
                    jy8 jy8VarG = w2g.g(1, 0.0f);
                    rh4 rh4Var = jfc.c;
                    boolean zF = p65Var.f(tceVar) | p65Var.f(b98Var) | p65Var.f(az5Var) | p65Var.f(ye1Var) | p65Var.d(oe1Var.ordinal()) | p65Var.f(az5Var2);
                    Object objM = p65Var.M();
                    if (zF || objM == w12.a) {
                        objM = new fy0(tceVar, az5Var, ye1Var, oe1Var, az5Var2, b98Var, 1);
                        p65Var.j0(objM);
                    }
                    k40.t(rh4Var, kv6Var, jy8VarG, h70Var, null, null, false, null, (x45) objM, p65Var, 24966, 488);
                } else {
                    p65Var.S();
                }
                return c1eVar;
            case 1:
                uod uodVar = (uod) obj10;
                xbf xbfVar = (xbf) obj9;
                d2f d2fVar = (d2f) obj8;
                nhc nhcVar = (nhc) obj7;
                bo4 bo4Var = (bo4) obj6;
                j78 j78Var = (j78) obj5;
                j78 j78Var2 = (j78) obj4;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var2 = (p65) x12Var2;
                if (p65Var2.P(iIntValue2 & 1, (iIntValue2 & 17) != 16)) {
                    pr7.b(rv8.J(jfc.c, uodVar.a(), null), pxf.E(-616342271, new n2f(uodVar, xbfVar, d2fVar, 3), p65Var2), null, pxf.E(1742703167, new eyc(nhcVar, 15), p65Var2), pxf.E(774742238, new xre(xbfVar, i2, d2fVar), p65Var2), 0, 0L, 0L, null, pxf.E(-1688057578, new g91(xbfVar, bo4Var, j78Var, j78Var2, d2fVar, 23), p65Var2), p65Var2, 805334064, 484);
                } else {
                    p65Var2.S();
                }
                return c1eVar;
            case 2:
                String str = (String) obj10;
                RefineRecommendationsTab refineRecommendationsTab = (RefineRecommendationsTab) obj9;
                RefineRecommendationsFilter refineRecommendationsFilter = (RefineRecommendationsFilter) obj8;
                zza zzaVar = (zza) obj7;
                uza uzaVar = (uza) obj6;
                x45 x45Var = (x45) obj5;
                nhc nhcVar2 = (nhc) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var3 = (x12) obj2;
                int iIntValue3 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue3 & 6) == 0) {
                    iIntValue3 |= ((p65) x12Var3).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var3 = (p65) x12Var3;
                if (p65Var3.P(iIntValue3 & 1, (iIntValue3 & 19) != 18)) {
                    f49.n(str, refineRecommendationsTab, refineRecommendationsFilter, zzaVar, uzaVar, x45Var, nhcVar2, w2g.B(o28Var, hy8Var), p65Var3, 0);
                } else {
                    p65Var3.S();
                }
                return c1eVar;
            default:
                avb avbVar = (avb) obj10;
                hub hubVar = (hub) obj9;
                fub fubVar = (fub) obj8;
                gub gubVar = (gub) obj7;
                fub fubVar2 = (fub) obj6;
                gub gubVar2 = (gub) obj5;
                fub fubVar3 = (fub) obj4;
                hy8 hy8Var2 = (hy8) obj;
                x12 x12Var4 = (x12) obj2;
                int iIntValue4 = ((Integer) obj3).intValue();
                hy8Var2.getClass();
                if ((iIntValue4 & 6) == 0) {
                    iIntValue4 |= ((p65) x12Var4).f(hy8Var2) ? 4 : 2;
                }
                p65 p65Var4 = (p65) x12Var4;
                if (p65Var4.P(iIntValue4 & 1, (iIntValue4 & 19) != 18)) {
                    r28 r28VarB = w2g.B(o28Var, hy8Var2);
                    zub zubVar = avbVar.b;
                    if (zubVar instanceof xub) {
                        p65Var4.Y(2045031515);
                        bgf.l((xub) zubVar, hubVar, r28VarB, p65Var4, 0);
                        p65Var4.p(false);
                    } else {
                        if (!(zubVar instanceof yub)) {
                            throw ho2.L(p65Var4, 620155887, false);
                        }
                        p65Var4.Y(2045347405);
                        qq7.e((yub) zubVar, hubVar, fubVar, gubVar, fubVar2, gubVar2, fubVar3, r28VarB, p65Var4, 0);
                        p65Var4.p(false);
                    }
                } else {
                    p65Var4.S();
                }
                return c1eVar;
        }
    }

    public /* synthetic */ c98(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
        this.g = obj6;
        this.h = obj7;
    }
}
