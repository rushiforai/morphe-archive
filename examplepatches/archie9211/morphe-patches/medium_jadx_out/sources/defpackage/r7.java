package defpackage;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class r7 {
    public final LinkedHashMap a = new LinkedHashMap();
    public final LinkedHashMap b = new LinkedHashMap();
    public final LinkedHashMap c = new LinkedHashMap();
    public final ArrayList d = new ArrayList();
    public final transient LinkedHashMap e = new LinkedHashMap();
    public final LinkedHashMap f = new LinkedHashMap();
    public final Bundle g = new Bundle();

    public final boolean a(int i, int i2, Intent intent) {
        String str = (String) this.a.get(Integer.valueOf(i));
        if (str == null) {
            return false;
        }
        o7 o7Var = (o7) this.e.get(str);
        if ((o7Var != null ? o7Var.a : null) != null) {
            ArrayList arrayList = this.d;
            if (arrayList.contains(str)) {
                o7Var.a.onActivityResult(o7Var.b.c(i2, intent));
                arrayList.remove(str);
                return true;
            }
        }
        this.f.remove(str);
        this.g.putParcelable(str, new c7(i2, intent));
        return true;
    }

    public abstract void b(int i, f7 f7Var, Object obj, z6 z6Var);

    public final q7 c(String str, f7 f7Var, d7 d7Var) {
        str.getClass();
        e(str);
        this.e.put(str, new o7(f7Var, d7Var));
        LinkedHashMap linkedHashMap = this.f;
        if (linkedHashMap.containsKey(str)) {
            Object obj = linkedHashMap.get(str);
            linkedHashMap.remove(str);
            d7Var.onActivityResult(obj);
        }
        Bundle bundle = this.g;
        c7 c7Var = (c7) ht2.r0(bundle, str, c7.class);
        if (c7Var != null) {
            bundle.remove(str);
            d7Var.onActivityResult(f7Var.c(c7Var.a, c7Var.b));
        }
        return new q7(this, str, f7Var, 1);
    }

    public final q7 d(final String str, iy6 iy6Var, final f7 f7Var, final d7 d7Var) {
        wx6 lifecycle = iy6Var.getLifecycle();
        if (((ky6) lifecycle).d.isAtLeast(vx6.STARTED)) {
            StringBuilder sb = new StringBuilder("LifecycleOwner ");
            sb.append(iy6Var);
            vx6 vx6Var = ((ky6) lifecycle).d;
            sb.append(" is attempting to register while current state is ");
            sb.append(vx6Var);
            sb.append(". LifecycleOwners must call register before they are STARTED.");
            throw new IllegalStateException(sb.toString().toString());
        }
        e(str);
        LinkedHashMap linkedHashMap = this.c;
        p7 p7Var = (p7) linkedHashMap.get(str);
        if (p7Var == null) {
            p7Var = new p7(lifecycle);
        }
        cy6 cy6Var = new cy6() { // from class: m7
            @Override // defpackage.cy6
            public final void f(iy6 iy6Var2, ux6 ux6Var) {
                r7 r7Var = this.a;
                LinkedHashMap linkedHashMap2 = r7Var.e;
                ux6 ux6Var2 = ux6.ON_START;
                String str2 = str;
                if (ux6Var2 != ux6Var) {
                    if (ux6.ON_STOP == ux6Var) {
                        linkedHashMap2.remove(str2);
                        return;
                    } else {
                        if (ux6.ON_DESTROY == ux6Var) {
                            r7Var.f(str2);
                            return;
                        }
                        return;
                    }
                }
                Bundle bundle = r7Var.g;
                LinkedHashMap linkedHashMap3 = r7Var.f;
                f7 f7Var2 = f7Var;
                d7 d7Var2 = d7Var;
                linkedHashMap2.put(str2, new o7(f7Var2, d7Var2));
                if (linkedHashMap3.containsKey(str2)) {
                    Object obj = linkedHashMap3.get(str2);
                    linkedHashMap3.remove(str2);
                    d7Var2.onActivityResult(obj);
                }
                c7 c7Var = (c7) ht2.r0(bundle, str2, c7.class);
                if (c7Var != null) {
                    bundle.remove(str2);
                    d7Var2.onActivityResult(f7Var2.c(c7Var.a, c7Var.b));
                }
            }
        };
        p7Var.a.a(cy6Var);
        p7Var.b.add(cy6Var);
        linkedHashMap.put(str, p7Var);
        return new q7(this, str, f7Var, 0);
    }

    public final void e(String str) {
        LinkedHashMap linkedHashMap = this.b;
        if (((Integer) linkedHashMap.get(str)) != null) {
            return;
        }
        for (Number number : (j52) szb.J0(new n7(0))) {
            Integer numValueOf = Integer.valueOf(number.intValue());
            LinkedHashMap linkedHashMap2 = this.a;
            if (!linkedHashMap2.containsKey(numValueOf)) {
                int iIntValue = number.intValue();
                linkedHashMap2.put(Integer.valueOf(iIntValue), str);
                linkedHashMap.put(str, Integer.valueOf(iIntValue));
                return;
            }
        }
        ywb.h("Sequence contains no element matching the predicate.");
    }

    public final void f(String str) {
        Integer num;
        str.getClass();
        if (!this.d.contains(str) && (num = (Integer) this.b.remove(str)) != null) {
            this.a.remove(num);
        }
        this.e.remove(str);
        LinkedHashMap linkedHashMap = this.f;
        boolean zContainsKey = linkedHashMap.containsKey(str);
        String str2 = HrUBqHumRuLe.OCSXOocPPLXghm;
        if (zContainsKey) {
            StringBuilder sbU = lv8.u(str2, str, ": ");
            sbU.append(linkedHashMap.get(str));
            Log.w("ActivityResultRegistry", sbU.toString());
            linkedHashMap.remove(str);
        }
        Bundle bundle = this.g;
        if (bundle.containsKey(str)) {
            Log.w("ActivityResultRegistry", str2 + str + ": " + ((c7) ht2.r0(bundle, str, c7.class)));
            bundle.remove(str);
        }
        LinkedHashMap linkedHashMap2 = this.c;
        p7 p7Var = (p7) linkedHashMap2.get(str);
        if (p7Var != null) {
            ArrayList arrayList = p7Var.b;
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                p7Var.a.b((cy6) it2.next());
            }
            arrayList.clear();
            linkedHashMap2.remove(str);
        }
    }
}
