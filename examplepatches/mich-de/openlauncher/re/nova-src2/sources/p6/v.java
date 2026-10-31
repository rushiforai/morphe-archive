package p6;

import h6.f1;
import h6.n1;
import java.util.Iterator;
import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v extends f1 {

    /* renamed from: b, reason: collision with root package name */
    public static final n6.d f82278b = new n6.d(1);

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f82279a = new LinkedHashMap();

    @Override // h6.f1
    public final void onCleared() {
        LinkedHashMap linkedHashMap = this.f82279a;
        Iterator it = linkedHashMap.values().iterator();
        while (it.hasNext()) {
            ((n1) it.next()).a();
        }
        linkedHashMap.clear();
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("NavControllerViewModel{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("} ViewModelStores (");
        Iterator it = this.f82279a.keySet().iterator();
        while (it.hasNext()) {
            sb2.append((String) it.next());
            if (it.hasNext()) {
                sb2.append(", ");
            }
        }
        sb2.append(')');
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
