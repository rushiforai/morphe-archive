package defpackage;

import android.content.Context;
import android.content.res.Resources;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class s9d implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ String b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ Object j;

    public /* synthetic */ s9d(Object obj, String str, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8, int i) {
        this.a = i;
        this.c = obj;
        this.b = str;
        this.d = obj2;
        this.e = obj3;
        this.f = obj4;
        this.g = obj5;
        this.h = obj6;
        this.i = obj7;
        this.j = obj8;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj4 = this.j;
        Object obj5 = this.i;
        Object obj6 = this.h;
        Object obj7 = this.g;
        Object obj8 = this.f;
        Object obj9 = this.e;
        Object obj10 = this.d;
        Object obj11 = this.c;
        int i2 = 1;
        switch (i) {
            case 0:
                uod uodVar = (uod) obj11;
                o9d o9dVar = (o9d) obj10;
                upc upcVar = (upc) obj9;
                nhc nhcVar = (nhc) obj8;
                kv6 kv6Var = (kv6) obj7;
                cad cadVar = (cad) obj6;
                t9d t9dVar = (t9d) obj5;
                sh9 sh9Var = (sh9) obj4;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                ((hy0) obj).getClass();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 17) != 16)) {
                    p65Var.S();
                } else {
                    pr7.b(rv8.J(jfc.c, uodVar.a(), null), pxf.E(-1586869132, new g9b(this.b, o9dVar, uodVar, upcVar, 13), p65Var), null, pxf.E(886338678, new eyc(nhcVar, i2), p65Var), null, 0, 0L, 0L, null, pxf.E(1646832959, new fd3(kv6Var, (Object) cadVar, (Object) t9dVar, (Object) sh9Var, 8), p65Var), p65Var, 805309488, 500);
                }
                break;
            default:
                mda mdaVar = (mda) obj11;
                String str = (String) obj10;
                fha fhaVar = (fha) obj9;
                wea weaVar = (wea) obj8;
                lma lmaVar = (lma) obj7;
                db8 db8Var = (db8) obj6;
                String str2 = (String) obj5;
                cqb cqbVar = (cqb) obj4;
                hy8 hy8Var = (hy8) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                hy8Var.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(hy8Var) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    r28 r28VarB = w2g.B(o28.b, hy8Var);
                    boolean zF = p65Var2.f(mdaVar);
                    Object objM = p65Var2.M();
                    uob uobVar = w12.a;
                    if (zF || objM == uobVar) {
                        g98 g98Var = new g98(1, mdaVar, mda.class, "openUnsupportedCountryHelp", "openUnsupportedCountryHelp(Ljava/lang/String;)V", 0, 26);
                        p65Var2.j0(g98Var);
                        objM = g98Var;
                    }
                    x45 x45Var = (x45) ((qh6) objM);
                    boolean zH = p65Var2.h(fhaVar) | p65Var2.f(mdaVar);
                    Object objM2 = p65Var2.M();
                    if (zH || objM2 == uobVar) {
                        objM2 = new ui9(fhaVar, 13, mdaVar);
                        p65Var2.j0(objM2);
                    }
                    jq7.c(this.b, str, fhaVar, weaVar, lmaVar, db8Var, r28VarB, x45Var, str2, (m45) objM2, p65Var2, 0);
                    Resources resources = ((Context) p65Var2.j(eo.b)).getResources();
                    Object objM3 = p65Var2.M();
                    if (objM3 == uobVar) {
                        objM3 = kyd.M(p65Var2);
                        p65Var2.j0(objM3);
                    }
                    sb2 sb2Var = (sb2) objM3;
                    boolean zH2 = p65Var2.h(fhaVar) | p65Var2.f(cqbVar) | p65Var2.h(sb2Var) | p65Var2.h(resources) | p65Var2.f(mdaVar);
                    Object objM4 = p65Var2.M();
                    if (zH2 || objM4 == uobVar) {
                        uk8 uk8Var = new uk8(fhaVar, cqbVar, sb2Var, resources, mdaVar, (n92) null, 11);
                        p65Var2.j0(uk8Var);
                        objM4 = uk8Var;
                    }
                    kyd.k(p65Var2, (b55) objM4, c1eVar);
                }
                break;
        }
        return c1eVar;
    }
}
