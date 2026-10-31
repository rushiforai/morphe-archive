package z2;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.dex */
public interface r0 {
    default int a(t tVar, List list, int i5) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(new b3.v1((s) list.get(i11), u.f98149a, v.f98157a, 1));
        }
        return e(new x(tVar, ((b3.t1) tVar).o.getLayoutDirection()), arrayList, y3.b.b(0, i5, 7)).getWidth();
    }

    default int b(t tVar, List list, int i5) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(new b3.v1((s) list.get(i11), u.f98150b, v.f98157a, 1));
        }
        return e(new x(tVar, ((b3.t1) tVar).o.getLayoutDirection()), arrayList, y3.b.b(0, i5, 7)).getWidth();
    }

    default int c(t tVar, List list, int i5) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(new b3.v1((s) list.get(i11), u.f98149a, v.f98158b, 1));
        }
        return e(new x(tVar, ((b3.t1) tVar).o.getLayoutDirection()), arrayList, y3.b.b(i5, 0, 13)).getHeight();
    }

    default int d(t tVar, List list, int i5) {
        ArrayList arrayList = new ArrayList(list.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            arrayList.add(new b3.v1((s) list.get(i11), u.f98150b, v.f98158b, 1));
        }
        return e(new x(tVar, ((b3.t1) tVar).o.getLayoutDirection()), arrayList, y3.b.b(i5, 0, 13)).getHeight();
    }

    s0 e(t0 t0Var, List list, long j11);
}
