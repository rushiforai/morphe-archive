package defpackage;

import j$.util.concurrent.ConcurrentHashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public final class ki6 implements m45 {
    public final /* synthetic */ int a;
    public final mi6 b;

    public /* synthetic */ ki6(mi6 mi6Var, int i) {
        this.a = i;
        this.b = mi6Var;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r7v16, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r7v5, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r7v6, types: [java.lang.Iterable] */
    @Override // defpackage.m45
    public final Object invoke() {
        ?? Q;
        int i = this.a;
        List listAsList = null;
        mi6 mi6Var = this.b;
        switch (i) {
            case 0:
                k1b k1bVar = mi6Var.c;
                fj6 fj6Var = mi6.g[0];
                h1b h1bVar = (h1b) k1bVar.invoke();
                if (h1bVar == null) {
                    return dv7.b;
                }
                k1b k1bVar2 = mi6Var.a;
                fj6 fj6Var2 = mh6.b[0];
                Object objInvoke = k1bVar2.invoke();
                objInvoke.getClass();
                ku3 ku3Var = ((vmb) objInvoke).b;
                w93 w93Var = (w93) ku3Var.b;
                ConcurrentHashMap concurrentHashMap = (ConcurrentHashMap) ku3Var.d;
                Class cls = h1bVar.a;
                mn1 mn1VarA = e0b.a(cls);
                Object obj = concurrentHashMap.get(mn1VarA);
                if (obj == null) {
                    y05 y05Var = e0b.a(cls).a;
                    ym6 ym6Var = h1bVar.b;
                    xm6 xm6Var = (xm6) ym6Var.d;
                    xm6 xm6Var2 = xm6.MULTIFILE_CLASS;
                    if (xm6Var == xm6Var2) {
                        String[] strArr = (String[]) ym6Var.f;
                        if (xm6Var != xm6Var2) {
                            strArr = null;
                        }
                        if (strArr != null) {
                            listAsList = Arrays.asList(strArr);
                            listAsList.getClass();
                        }
                        if (listAsList == null) {
                            listAsList = ey3.a;
                        }
                        Q = new ArrayList();
                        Iterator it2 = listAsList.iterator();
                        while (it2.hasNext()) {
                            y05 y05Var2 = new y05(te6.c((String) it2.next()).a.replace('/', '.'));
                            mn1 mn1Var = new mn1(y05Var2.b(), y05Var2.a.g());
                            zm7 zm7Var = (zm7) ku3Var.c;
                            w93Var.c().c.getClass();
                            h1b h1bVarH0 = flb.h0(zm7Var, mn1Var, zz7.g);
                            if (h1bVarH0 != null) {
                                Q.add(h1bVarH0);
                            }
                        }
                    } else {
                        Q = d46.Q(h1bVar);
                    }
                    gy3 gy3Var = new gy3(w93Var.c().b, y05Var, 0);
                    ArrayList arrayList = new ArrayList();
                    Iterator it3 = Q.iterator();
                    while (it3.hasNext()) {
                        ea3 ea3VarA = w93Var.a(gy3Var, (h1b) it3.next());
                        if (ea3VarA != null) {
                            arrayList.add(ea3VarA);
                        }
                    }
                    ev7 ev7VarE0 = flb.e0("package " + y05Var + " (" + h1bVar + ')', bu1.m1(arrayList));
                    Object objPutIfAbsent = concurrentHashMap.putIfAbsent(mn1VarA, ev7VarE0);
                    obj = objPutIfAbsent == null ? ev7VarE0 : objPutIfAbsent;
                }
                obj.getClass();
                return (ev7) obj;
            default:
                k1b k1bVar3 = mi6Var.c;
                fj6 fj6Var3 = mi6.g[0];
                h1b h1bVar2 = (h1b) k1bVar3.invoke();
                if (h1bVar2 == null) {
                    return null;
                }
                ym6 ym6Var2 = h1bVar2.b;
                String[] strArr2 = (String[]) ym6Var2.f;
                String[] strArr3 = (String[]) ym6Var2.h;
                if (strArr2 == null || strArr3 == null) {
                    return null;
                }
                f09 f09VarH = hg6.h(strArr2, strArr3);
                return new otd((lf6) f09VarH.a, (e6a) f09VarH.b, (zz7) ym6Var2.e);
        }
    }
}
