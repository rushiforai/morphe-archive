package defpackage;

import android.content.SharedPreferences;
import android.os.Looper;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class dm4 {
    public final SharedPreferences a;
    public final qn7 b;
    public final Map c;
    public final kb2 d;
    public final w5d e;
    public final w5d f;
    public final AtomicReference g;
    public final Object h;

    public dm4(SharedPreferences sharedPreferences, kb2 kb2Var, qn7 qn7Var) {
        sharedPreferences.getClass();
        qn7Var.getClass();
        nl4.Companion.getClass();
        Map map = nl4.d;
        map.getClass();
        this.a = sharedPreferences;
        this.b = qn7Var;
        this.c = map;
        this.d = kb2Var;
        final int i = 0;
        this.e = new w5d(new m45(this) { // from class: wl4
            public final /* synthetic */ dm4 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                dm4 dm4Var = this.b;
                switch (i2) {
                    case 0:
                        return new am4(dm4Var.b);
                    default:
                        Collection collectionValues = dm4Var.c.values();
                        int iP = ei7.P(cu1.k0(collectionValues, 10));
                        if (iP < 16) {
                            iP = 16;
                        }
                        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                        for (Object obj : collectionValues) {
                            linkedHashMap.put(((nl4) obj).getSharedPreferencesKey(), obj);
                        }
                        return linkedHashMap;
                }
            }
        });
        final int i2 = 1;
        this.f = new w5d(new m45(this) { // from class: wl4
            public final /* synthetic */ dm4 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                dm4 dm4Var = this.b;
                switch (i22) {
                    case 0:
                        return new am4(dm4Var.b);
                    default:
                        Collection collectionValues = dm4Var.c.values();
                        int iP = ei7.P(cu1.k0(collectionValues, 10));
                        if (iP < 16) {
                            iP = 16;
                        }
                        LinkedHashMap linkedHashMap = new LinkedHashMap(iP);
                        for (Object obj : collectionValues) {
                            linkedHashMap.put(((nl4) obj).getSharedPreferencesKey(), obj);
                        }
                        return linkedHashMap;
                }
            }
        });
        this.g = new AtomicReference(fy3.a);
        this.h = new Object();
    }

    public final am4 a() {
        return (am4) this.e.getValue();
    }

    public final boolean b(nl4 nl4Var) {
        nl4Var.getClass();
        am4 am4VarA = a();
        am4VarA.getClass();
        Object obj = ((Map) am4VarA.b.get()).get(nl4Var);
        if (obj != null && (obj instanceof Boolean)) {
            return ((Boolean) obj).booleanValue();
        }
        Object obj2 = ((Map) this.g.get()).get(nl4Var.getSharedPreferencesKey());
        if (obj2 instanceof Boolean) {
            return ((Boolean) obj2).booleanValue();
        }
        return false;
    }

    public final Object c(nl4 nl4Var, Object obj, p4d p4dVar) throws Throwable {
        Object objM0 = vx0.m0(this.d, new lm1(this, nl4Var, obj, null, 2), p4dVar);
        return objM0 == tb2.COROUTINE_SUSPENDED ? objM0 : c1e.a;
    }

    public final void d() {
        if (g76.L(Looper.myLooper(), Looper.getMainLooper())) {
            ygf.f("refreshPersistedFlagsSnapshot must run on a background thread");
            return;
        }
        Map<String, ?> all = this.a.getAll();
        dh7 dh7Var = new dh7();
        Iterator it2 = ((Map) this.f.getValue()).entrySet().iterator();
        while (it2.hasNext()) {
            String str = (String) ((Map.Entry) it2.next()).getKey();
            Object obj = all.get(str);
            if (obj instanceof Boolean) {
                dh7Var.put(str, obj);
            } else if (obj instanceof String) {
                dh7Var.put(str, obj);
            } else if (obj instanceof Number) {
                dh7Var.put(str, Integer.valueOf(((Number) obj).intValue()));
            }
        }
        this.g.set(dh7Var.b());
    }
}
