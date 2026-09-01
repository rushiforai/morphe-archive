package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wh7 implements ae6 {
    public Object a;
    public boolean b;
    public final ArrayList c = new ArrayList();

    public static Object f(Object obj, Object obj2) {
        if (obj == null) {
            return obj2;
        }
        if (obj2 != null) {
            if (obj instanceof List) {
                if (!(obj2 instanceof List)) {
                    mm.g("Cannot merge ", obj, " with ", obj2);
                    return null;
                }
                List list = (List) obj;
                List list2 = (List) obj2;
                if (list.size() != list2.size()) {
                    mm.g("Cannot merge ", obj, " with ", obj2);
                    return null;
                }
                n46 n46VarJ = d46.J((Collection) obj);
                ArrayList arrayList = new ArrayList(cu1.k0(n46VarJ, 10));
                Iterator it2 = n46VarJ.iterator();
                while (((m46) it2).c) {
                    int iNextInt = ((g46) it2).nextInt();
                    arrayList.add(f(list.get(iNextInt), list2.get(iNextInt)));
                }
                return arrayList;
            }
            if (obj instanceof Map) {
                if (!(obj2 instanceof Map)) {
                    mm.g("Cannot merge ", obj, " with ", obj2);
                    return null;
                }
                Map map = (Map) obj;
                Map map2 = (Map) obj2;
                LinkedHashSet<String> linkedHashSetV = qo7.v(map.keySet(), map2.keySet());
                ArrayList arrayList2 = new ArrayList(cu1.k0(linkedHashSetV, 10));
                for (String str : linkedHashSetV) {
                    arrayList2.add(new f09(str, f(map.get(str), map2.get(str))));
                }
                return ei7.V(arrayList2);
            }
            if (!obj.equals(obj2)) {
                throw new IllegalStateException(("Cannot merge " + obj + " with " + obj2).toString());
            }
        }
        return obj;
    }

    @Override // defpackage.ae6
    public final ae6 E(String str) {
        str.getClass();
        p(str);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 V(boolean z) {
        p(Boolean.valueOf(z));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 e() {
        vh7 vh7Var = (vh7) this.c.remove(r0.size() - 1);
        if (vh7Var instanceof uh7) {
            p(((uh7) vh7Var).a);
            return this;
        }
        ygf.f("Check failed.");
        return null;
    }

    @Override // defpackage.ae6
    public final ae6 i() {
        this.c.add(new uh7(new LinkedHashMap()));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 k() {
        vh7 vh7Var = (vh7) this.c.remove(r0.size() - 1);
        if (vh7Var instanceof th7) {
            p(((th7) vh7Var).a);
            return this;
        }
        ygf.f("Check failed.");
        return null;
    }

    public final Object m() {
        if (this.b) {
            return this.a;
        }
        ygf.f("Check failed.");
        return null;
    }

    @Override // defpackage.ae6
    public final ae6 n() {
        this.c.add(new th7(new ArrayList()));
        return this;
    }

    public final void p(Object obj) {
        vh7 vh7Var = (vh7) bu1.I0(this.c);
        if (!(vh7Var instanceof uh7)) {
            if (vh7Var instanceof th7) {
                ((th7) vh7Var).a.add(obj);
                return;
            } else {
                this.a = obj;
                this.b = true;
                return;
            }
        }
        uh7 uh7Var = (uh7) vh7Var;
        LinkedHashMap linkedHashMap = uh7Var.a;
        String str = uh7Var.b;
        if (str == null) {
            ygf.f("Check failed.");
            return;
        }
        if (linkedHashMap.containsKey(str)) {
            linkedHashMap.put(str, f(linkedHashMap.get(str), obj));
        } else {
            linkedHashMap.put(str, obj);
        }
        uh7Var.b = null;
    }

    @Override // defpackage.ae6
    public final ae6 s0() {
        p(null);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t(long j) {
        p(Long.valueOf(j));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 t0(String str) {
        vh7 vh7Var = (vh7) bu1.H0(this.c);
        if (!(vh7Var instanceof uh7)) {
            ygf.f("Check failed.");
            return null;
        }
        uh7 uh7Var = (uh7) vh7Var;
        if (uh7Var.b == null) {
            uh7Var.b = str;
            return this;
        }
        ygf.f("Check failed.");
        return null;
    }

    @Override // defpackage.ae6
    public final ae6 u(int i) {
        p(Integer.valueOf(i));
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 x(rc6 rc6Var) {
        p(rc6Var);
        return this;
    }

    @Override // defpackage.ae6
    public final ae6 z(double d) {
        p(Double.valueOf(d));
        return this;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
    }
}
