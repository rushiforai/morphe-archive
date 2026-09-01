package defpackage;

import android.app.Application;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xzf extends iwf {
    public final /* synthetic */ int b;
    public final Object c;
    public Object d;
    public final Object e;

    public xzf(f17 f17Var) {
        this.b = 1;
        this.c = f17Var;
        this.e = new LinkedHashMap();
    }

    public static final vsf g(zjf zjfVar, q1g q1gVar) {
        tsf tsfVarB = vsf.B();
        tsfVarB.c();
        ((vsf) tsfVarB.b).H();
        byte[] byteArray = BigInteger.valueOf(q1gVar.a).toByteArray();
        omf omfVar = pmf.b;
        omf omfVarC = pmf.C(byteArray, 0, byteArray.length);
        tsfVarB.c();
        ((vsf) tsfVarB.b).G(omfVarC);
        if (q1gVar instanceof g1g) {
            byte[] bArrO = zjfVar.o(q1gVar.a, ((g1g) q1gVar).b.d());
            omf omfVarC2 = pmf.C(bArrO, 0, bArrO.length);
            tsfVarB.c();
            ((vsf) tsfVarB.b).E(omfVarC2);
        } else {
            if (!(q1gVar instanceof b1g)) {
                ygf.a();
                return null;
            }
            byte[] bArrO2 = zjfVar.o(q1gVar.a, ((b1g) q1gVar).b.d());
            omf omfVarC3 = pmf.C(bArrO2, 0, bArrO2.length);
            tsfVarB.c();
            ((vsf) tsfVarB.b).F(omfVarC3);
        }
        return (vsf) tsfVarB.e();
    }

    @Override // defpackage.iwf
    public final ycg a(jrf jrfVar) {
        switch (this.b) {
            case 0:
                return new ycg(new iie(this, jrfVar, null, 6));
            default:
                return new ycg(new j5d(jrfVar, this, (n92) null, 28));
        }
    }

    @Override // defpackage.iwf
    public final ycg b(String str, arf arfVar) {
        switch (this.b) {
            case 0:
                return new ycg(new j5d(this, arfVar, str, null, 27));
            default:
                return new ycg(new ezf(this, str, arfVar, null, 1));
        }
    }

    @Override // defpackage.iwf
    public final Object c(String str) {
        switch (this.b) {
            case 0:
                zrf zrfVarV = dsf.v();
                zrfVarV.h(str);
                return zrfVarV.e();
            default:
                return f(str);
        }
    }

    @Override // defpackage.iwf
    public final int d() {
        switch (this.b) {
            case 0:
                return 39;
            default:
                return 34;
        }
    }

    @Override // defpackage.iwf
    public final int e() {
        switch (this.b) {
            case 0:
                return 40;
            default:
                return 35;
        }
    }

    public dsf f(String str) {
        Map linkedHashMap;
        List<q1g> list = (List) ((LinkedHashMap) this.e).remove(str);
        pmf pmfVar = (pmf) this.d;
        if (pmfVar == null) {
            pmfVar = null;
        }
        zjf zjfVar = new zjf(pmfVar);
        if (list != null) {
            int iP = ei7.P(cu1.k0(list, 10));
            if (iP < 16) {
                iP = 16;
            }
            linkedHashMap = new LinkedHashMap(iP);
            for (q1g q1gVar : list) {
                linkedHashMap.put(Integer.valueOf(q1gVar.a), q1gVar);
            }
        } else {
            linkedHashMap = fy3.a;
        }
        wsf wsfVarY = ysf.y();
        wsfVarY.c();
        ((ysf) wsfVarY.b).z(str);
        List list2 = (List) this.c;
        ArrayList<m1g> arrayList = new ArrayList();
        for (Object obj : list2) {
            if (((m1g) obj).e()) {
                arrayList.add(obj);
            }
        }
        for (m1g m1gVar : arrayList) {
            if (!linkedHashMap.containsKey(Integer.valueOf(m1gVar.zza()))) {
                int iZza = m1gVar.zza();
                btf btfVarV = ctf.v();
                btfVarV.c();
                ((ctf) btfVarV.b).w(iZza);
                btfVarV.c();
                ((ctf) btfVarV.b).x(13);
                btfVarV.c();
                ((ctf) btfVarV.b).y(27);
                vsf vsfVarG = g(zjfVar, new b1g(iZza, (ctf) btfVarV.e()));
                wsfVarY.c();
                ((ysf) wsfVarY.b).A(vsfVarG);
            }
        }
        Collection collectionValues = linkedHashMap.values();
        ArrayList arrayList2 = new ArrayList(cu1.k0(collectionValues, 10));
        Iterator it2 = collectionValues.iterator();
        while (it2.hasNext()) {
            arrayList2.add(g(zjfVar, (q1g) it2.next()));
        }
        wsfVarY.c();
        ((ysf) wsfVarY.b).B(arrayList2);
        ysf ysfVar = (ysf) wsfVarY.e();
        zrf zrfVarV = dsf.v();
        zrfVarV.h(str);
        qrf qrfVarV = srf.v();
        qrfVarV.c();
        ((srf) qrfVarV.b).w(ysfVar);
        omf omfVarC = pmf.C((byte[]) zjfVar.c, 0, 12);
        qrfVarV.c();
        ((srf) qrfVarV.b).x(omfVarC);
        zrfVarV.c();
        ((dsf) zrfVarV.b).z((srf) qrfVarV.e());
        return (dsf) zrfVarV.e();
    }

    public xzf(Application application, l5g l5gVar) {
        this.b = 0;
        this.c = application;
        this.e = l5gVar;
    }
}
