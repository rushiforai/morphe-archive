package defpackage;

import j$.util.DesugarCollections;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r17 extends t17 {
    public static final Class c = DesugarCollections.unmodifiableList(Collections.EMPTY_LIST).getClass();

    public static List d(int i, long j, Object obj) {
        List list = (List) r2e.j(j, obj);
        if (list.isEmpty()) {
            List tw6Var = list instanceof uw6 ? new tw6(i) : ((list instanceof s0a) && (list instanceof t56)) ? ((t56) list).h(i) : new ArrayList(i);
            r2e.q(j, obj, tw6Var);
            return tw6Var;
        }
        if (c.isAssignableFrom(list.getClass())) {
            ArrayList arrayList = new ArrayList(list.size() + i);
            arrayList.addAll(list);
            r2e.q(j, obj, arrayList);
            return arrayList;
        }
        if (list instanceof l1e) {
            l1e l1eVar = (l1e) list;
            tw6 tw6Var2 = new tw6(l1eVar.a.size() + i);
            tw6Var2.addAll(l1eVar);
            r2e.q(j, obj, tw6Var2);
            return tw6Var2;
        }
        if ((list instanceof s0a) && (list instanceof t56)) {
            t56 t56Var = (t56) list;
            if (!((a2) t56Var).a) {
                t56 t56VarH = t56Var.h(list.size() + i);
                r2e.q(j, obj, t56VarH);
                return t56VarH;
            }
        }
        return list;
    }

    @Override // defpackage.t17
    public final void a(long j, Object obj) {
        Object objUnmodifiableList;
        List list = (List) r2e.j(j, obj);
        if (list instanceof uw6) {
            objUnmodifiableList = ((uw6) list).b();
        } else {
            if (c.isAssignableFrom(list.getClass())) {
                return;
            }
            if ((list instanceof s0a) && (list instanceof t56)) {
                a2 a2Var = (a2) ((t56) list);
                if (a2Var.a) {
                    a2Var.a = false;
                    return;
                }
                return;
            }
            objUnmodifiableList = DesugarCollections.unmodifiableList(list);
        }
        r2e.q(j, obj, objUnmodifiableList);
    }

    @Override // defpackage.t17
    public final void b(long j, Object obj, Object obj2) {
        List list = (List) r2e.j(j, obj2);
        List listD = d(list.size(), j, obj);
        int size = listD.size();
        int size2 = list.size();
        if (size > 0 && size2 > 0) {
            listD.addAll(list);
        }
        if (size > 0) {
            list = listD;
        }
        r2e.q(j, obj, list);
    }

    @Override // defpackage.t17
    public final List c(long j, Object obj) {
        return d(10, j, obj);
    }
}
