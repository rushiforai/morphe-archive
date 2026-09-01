package defpackage;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dm6 {
    public int a;
    public final ArrayList b = new ArrayList();
    public final ArrayList c = new ArrayList(0);
    public final ArrayList d = new ArrayList(0);
    public final ArrayList e;

    public dm6(int i) {
        this.a = i;
        sz7.a.getClass();
        List listA = rz7.a();
        ArrayList arrayList = new ArrayList(cu1.k0(listA, 10));
        Iterator it2 = listA.iterator();
        while (it2.hasNext()) {
            ((kf6) ((sz7) it2.next())).getClass();
            arrayList.add(new ue6());
        }
        this.e = arrayList;
    }
}
