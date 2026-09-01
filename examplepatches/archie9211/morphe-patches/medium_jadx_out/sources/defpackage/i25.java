package defpackage;

import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class i25 extends que {
    public static final i33 h = new i33(1);
    public final boolean e;
    public final HashMap b = new HashMap();
    public final HashMap c = new HashMap();
    public final HashMap d = new HashMap();
    public boolean f = false;
    public boolean g = false;

    public i25(boolean z) {
        this.e = z;
    }

    @Override // defpackage.que
    public final void d() {
        if (f25.I(3)) {
            Log.d("FragmentManager", "onCleared called for " + this);
        }
        this.f = true;
    }

    public final void e(j15 j15Var) {
        if (this.g) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "Ignoring addRetainedFragment as the state is already saved");
                return;
            }
            return;
        }
        String str = j15Var.e;
        HashMap map = this.b;
        if (map.containsKey(str)) {
            return;
        }
        map.put(j15Var.e, j15Var);
        if (f25.I(2)) {
            Log.v("FragmentManager", "Updating retained Fragments: Added " + j15Var);
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || i25.class != obj.getClass()) {
            return false;
        }
        i25 i25Var = (i25) obj;
        return this.b.equals(i25Var.b) && this.c.equals(i25Var.c) && this.d.equals(i25Var.d);
    }

    public final void f(j15 j15Var, boolean z) {
        if (f25.I(3)) {
            Log.d("FragmentManager", "Clearing non-config state for " + j15Var);
        }
        h(j15Var.e, z);
    }

    public final void g(String str, boolean z) {
        if (f25.I(3)) {
            Log.d("FragmentManager", "Clearing non-config state for saved state of Fragment " + str);
        }
        h(str, z);
    }

    public final void h(String str, boolean z) {
        HashMap map = this.c;
        i25 i25Var = (i25) map.get(str);
        if (i25Var != null) {
            if (z) {
                ArrayList arrayList = new ArrayList();
                arrayList.addAll(i25Var.c.keySet());
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    i25Var.g((String) it2.next(), true);
                }
            }
            i25Var.d();
            map.remove(str);
        }
        HashMap map2 = this.d;
        vue vueVar = (vue) map2.get(str);
        if (vueVar != null) {
            vueVar.a();
            map2.remove(str);
        }
    }

    public final int hashCode() {
        return this.d.hashCode() + ((this.c.hashCode() + (this.b.hashCode() * 31)) * 31);
    }

    public final void i(j15 j15Var) {
        if (this.g) {
            if (f25.I(2)) {
                Log.v("FragmentManager", "Ignoring removeRetainedFragment as the state is already saved");
            }
        } else {
            if (this.b.remove(j15Var.e) == null || !f25.I(2)) {
                return;
            }
            Log.v("FragmentManager", "Updating retained Fragments: Removed " + j15Var);
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FragmentManagerViewModel{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(dpBiLjNeNsiASg.TGD);
        Iterator it2 = this.b.values().iterator();
        while (it2.hasNext()) {
            sb.append(it2.next());
            if (it2.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append(") Child Non Config (");
        Iterator it3 = this.c.keySet().iterator();
        while (it3.hasNext()) {
            sb.append((String) it3.next());
            if (it3.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append(") ViewModelStores (");
        Iterator it4 = this.d.keySet().iterator();
        while (it4.hasNext()) {
            sb.append((String) it4.next());
            if (it4.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append(')');
        return sb.toString();
    }
}
