package androidx.fragment.app;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.dex */
public final class k1 extends h6.f1 {

    /* renamed from: g, reason: collision with root package name */
    public static final j1 f14602g = new j1();

    /* renamed from: d, reason: collision with root package name */
    public final boolean f14606d;

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f14603a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f14604b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final HashMap f14605c = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    public boolean f14607e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f14608f = false;

    public k1(boolean z11) {
        this.f14606d = z11;
    }

    public final void e(h0 h0Var) {
        if (this.f14608f) {
            return;
        }
        String str = h0Var.mWho;
        HashMap map = this.f14603a;
        if (map.containsKey(str)) {
            return;
        }
        map.put(h0Var.mWho, h0Var);
        if (h1.K(2)) {
            h0Var.toString();
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && k1.class == obj.getClass()) {
            k1 k1Var = (k1) obj;
            if (this.f14603a.equals(k1Var.f14603a) && this.f14604b.equals(k1Var.f14604b) && this.f14605c.equals(k1Var.f14605c)) {
                return true;
            }
        }
        return false;
    }

    public final void f(String str, boolean z11) {
        HashMap map = this.f14604b;
        k1 k1Var = (k1) map.get(str);
        if (k1Var != null) {
            if (z11) {
                ArrayList arrayList = new ArrayList();
                arrayList.addAll(k1Var.f14604b.keySet());
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    k1Var.f((String) it.next(), true);
                }
            }
            k1Var.onCleared();
            map.remove(str);
        }
        HashMap map2 = this.f14605c;
        h6.n1 n1Var = (h6.n1) map2.get(str);
        if (n1Var != null) {
            n1Var.a();
            map2.remove(str);
        }
    }

    public final void g(h0 h0Var) {
        if (this.f14608f || this.f14603a.remove(h0Var.mWho) == null || !h1.K(2)) {
            return;
        }
        h0Var.toString();
    }

    public final int hashCode() {
        return this.f14605c.hashCode() + ((this.f14604b.hashCode() + (this.f14603a.hashCode() * 31)) * 31);
    }

    @Override // h6.f1
    public final void onCleared() {
        if (h1.K(3)) {
            toString();
        }
        this.f14607e = true;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FragmentManagerViewModel{");
        sb2.append(Integer.toHexString(System.identityHashCode(this)));
        sb2.append("} Fragments (");
        Iterator it = this.f14603a.values().iterator();
        while (it.hasNext()) {
            sb2.append(it.next());
            if (it.hasNext()) {
                sb2.append(", ");
            }
        }
        sb2.append(") Child Non Config (");
        Iterator it2 = this.f14604b.keySet().iterator();
        while (it2.hasNext()) {
            sb2.append((String) it2.next());
            if (it2.hasNext()) {
                sb2.append(", ");
            }
        }
        sb2.append(") ViewModelStores (");
        Iterator it3 = this.f14605c.keySet().iterator();
        while (it3.hasNext()) {
            sb2.append((String) it3.next());
            if (it3.hasNext()) {
                sb2.append(", ");
            }
        }
        sb2.append(')');
        return sb2.toString();
    }
}
