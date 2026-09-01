package defpackage;

import android.os.Build;
import androidx.work.impl.WorkDatabase;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zqb {
    public static final String a = d87.k("Schedulers");

    public static void a(g8f g8fVar, rz5 rz5Var, List list) {
        if (list.size() > 0) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                g8fVar.g(jCurrentTimeMillis, ((c8f) it2.next()).a);
            }
        }
    }

    public static void b(r32 r32Var, WorkDatabase workDatabase, List list) {
        List list2;
        if (list == null || list.size() == 0) {
            return;
        }
        g8f g8fVarX = workDatabase.x();
        workDatabase.b();
        try {
            int i = 1;
            if (Build.VERSION.SDK_INT >= 24) {
                list2 = (List) n01.c0(g8fVarX.a, true, false, new sqe(28));
                a(g8fVarX, r32Var.d, list2);
            } else {
                list2 = null;
            }
            List list3 = (List) n01.c0(g8fVarX.a, true, false, new ux5(r32Var.g, i));
            a(g8fVarX, r32Var.d, list3);
            if (list2 != null) {
                list3.addAll(list2);
            }
            List list4 = (List) n01.c0(g8fVarX.a, true, false, new f8f(i));
            workDatabase.q();
            workDatabase.m();
            if (list3.size() > 0) {
                c8f[] c8fVarArr = (c8f[]) list3.toArray(new c8f[list3.size()]);
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    pqb pqbVar = (pqb) it2.next();
                    if (pqbVar.c()) {
                        pqbVar.e(c8fVarArr);
                    }
                }
            }
            if (list4.size() > 0) {
                c8f[] c8fVarArr2 = (c8f[]) list4.toArray(new c8f[list4.size()]);
                Iterator it3 = list.iterator();
                while (it3.hasNext()) {
                    pqb pqbVar2 = (pqb) it3.next();
                    if (!pqbVar2.c()) {
                        pqbVar2.e(c8fVarArr2);
                    }
                }
            }
        } catch (Throwable th) {
            workDatabase.m();
            throw th;
        }
    }
}
