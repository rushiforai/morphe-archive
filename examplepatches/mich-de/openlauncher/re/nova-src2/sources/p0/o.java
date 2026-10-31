package p0;

import g0.d1;
import java.util.ArrayList;
import java.util.List;
import n0.f0;
import z2.q0;

/* loaded from: classes2.dex */
public abstract class o {
    public static final f a(f0 f0Var, int i5, long j11, n nVar, long j12, b2.j jVar, y3.n nVar2, int i11, z.c0 c0Var) {
        List list;
        d1 d1Var = d1.f56493a;
        Object objD = nVar.d(i5);
        List list2 = (List) c0Var.b(i5);
        if (list2 != null) {
            list = list2;
        } else {
            List listA = f0Var.a(i5);
            int size = listA.size();
            ArrayList arrayList = new ArrayList(size);
            for (int i12 = 0; i12 < size; i12++) {
                arrayList.add(((q0) listA.get(i12)).H(j11));
            }
            c0Var.h(i5, arrayList);
            list = arrayList;
        }
        return new f(i5, i11, list, j12, objD, jVar, nVar2);
    }
}
