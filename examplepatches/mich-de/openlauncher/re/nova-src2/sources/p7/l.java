package p7;

import androidx.work.impl.WorkDatabase;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public abstract class l {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int f82353a = 0;

    static {
        o7.r.e("Schedulers");
    }

    public static void a(x7.s sVar, br.a aVar, ArrayList arrayList) {
        if (arrayList.size() > 0) {
            aVar.getClass();
            long jR = br.a.r();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                sVar.n(jR, ((x7.q) it.next()).f95171a);
            }
        }
    }

    public static void b(o7.c cVar, WorkDatabase workDatabase, List list) {
        if (list == null || list.size() == 0) {
            return;
        }
        x7.s sVarI = workDatabase.i();
        workDatabase.beginTransaction();
        try {
            ArrayList arrayListF = sVarI.f();
            a(sVarI, cVar.f79624c, arrayListF);
            ArrayList arrayListE = sVarI.e(cVar.f79631j);
            a(sVarI, cVar.f79624c, arrayListE);
            arrayListE.addAll(arrayListF);
            ArrayList arrayListD = sVarI.d();
            workDatabase.setTransactionSuccessful();
            workDatabase.endTransaction();
            if (arrayListE.size() > 0) {
                x7.q[] qVarArr = (x7.q[]) arrayListE.toArray(new x7.q[arrayListE.size()]);
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    j jVar = (j) it.next();
                    if (jVar.d()) {
                        jVar.e(qVarArr);
                    }
                }
            }
            if (arrayListD.size() > 0) {
                x7.q[] qVarArr2 = (x7.q[]) arrayListD.toArray(new x7.q[arrayListD.size()]);
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    j jVar2 = (j) it2.next();
                    if (!jVar2.d()) {
                        jVar2.e(qVarArr2);
                    }
                }
            }
        } catch (Throwable th2) {
            workDatabase.endTransaction();
            throw th2;
        }
    }
}
