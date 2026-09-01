package defpackage;

import java.util.Iterator;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class la8 extends que {
    public final LinkedHashMap b = new LinkedHashMap();

    @Override // defpackage.que
    public final void d() {
        LinkedHashMap linkedHashMap = this.b;
        Iterator it2 = linkedHashMap.values().iterator();
        while (it2.hasNext()) {
            ((vue) it2.next()).a();
        }
        linkedHashMap.clear();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavControllerViewModel{");
        int iIdentityHashCode = System.identityHashCode(this);
        kyd.I(16);
        sb.append(wo7.y(16, ((long) iIdentityHashCode) & 4294967295L));
        sb.append("} ViewModelStores (");
        Iterator it2 = this.b.keySet().iterator();
        while (it2.hasNext()) {
            sb.append((String) it2.next());
            if (it2.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append(')');
        return sb.toString();
    }
}
