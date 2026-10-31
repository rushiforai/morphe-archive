package z2;

import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public interface z0 {
    default int a(t tVar, List list, int i5) {
        ArrayList arrayList = (ArrayList) list;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            List list2 = (List) arrayList.get(i11);
            ArrayList arrayList3 = new ArrayList(list2.size());
            int size2 = list2.size();
            for (int i12 = 0; i12 < size2; i12++) {
                arrayList3.add(new b3.v1((s) list2.get(i12), u.f98149a, v.f98157a, 1));
            }
            arrayList2.add(arrayList3);
        }
        return e(new x(tVar, tVar.getLayoutDirection()), arrayList2, y3.b.b(0, i5, 7)).getWidth();
    }

    default int b(t tVar, List list, int i5) {
        ArrayList arrayList = (ArrayList) list;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            List list2 = (List) arrayList.get(i11);
            ArrayList arrayList3 = new ArrayList(list2.size());
            int size2 = list2.size();
            for (int i12 = 0; i12 < size2; i12++) {
                arrayList3.add(new b3.v1((s) list2.get(i12), u.f98150b, v.f98157a, 1));
            }
            arrayList2.add(arrayList3);
        }
        return e(new x(tVar, tVar.getLayoutDirection()), arrayList2, y3.b.b(0, i5, 7)).getWidth();
    }

    default int c(t tVar, List list, int i5) {
        ArrayList arrayList = (ArrayList) list;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            List list2 = (List) arrayList.get(i11);
            ArrayList arrayList3 = new ArrayList(list2.size());
            int size2 = list2.size();
            for (int i12 = 0; i12 < size2; i12++) {
                arrayList3.add(new b3.v1((s) list2.get(i12), u.f98149a, v.f98158b, 1));
            }
            arrayList2.add(arrayList3);
        }
        return e(new x(tVar, tVar.getLayoutDirection()), arrayList2, y3.b.b(i5, 0, 13)).getHeight();
    }

    default int d(t tVar, List list, int i5) {
        ArrayList arrayList = (ArrayList) list;
        ArrayList arrayList2 = new ArrayList(arrayList.size());
        int size = list.size();
        for (int i11 = 0; i11 < size; i11++) {
            List list2 = (List) arrayList.get(i11);
            ArrayList arrayList3 = new ArrayList(list2.size());
            int size2 = list2.size();
            for (int i12 = 0; i12 < size2; i12++) {
                arrayList3.add(new b3.v1((s) list2.get(i12), u.f98150b, v.f98158b, 1));
            }
            arrayList2.add(arrayList3);
        }
        return e(new x(tVar, tVar.getLayoutDirection()), arrayList2, y3.b.b(i5, 0, 13)).getHeight();
    }

    s0 e(t0 t0Var, List list, long j11);
}
