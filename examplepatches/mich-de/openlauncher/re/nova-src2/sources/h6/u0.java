package h6;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;
import w70.u1;

/* loaded from: classes2.dex */
public final class u0 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f59454a;

    /* renamed from: b, reason: collision with root package name */
    public final bn.s0 f59455b;

    public u0(MapBuilder mapBuilder) {
        this.f59454a = new LinkedHashMap();
        this.f59455b = new bn.s0(mapBuilder);
    }

    public final Object a(String key) {
        Object value;
        Intrinsics.g(key, "key");
        bn.s0 s0Var = this.f59455b;
        s0Var.getClass();
        LinkedHashMap linkedHashMap = (LinkedHashMap) s0Var.f18279b;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) s0Var.f18282e;
        try {
            w70.m1 m1Var = (w70.m1) linkedHashMap2.get(key);
            if (m1Var != null && (value = ((i2) m1Var).getValue()) != null) {
                return value;
            }
            return linkedHashMap.get(key);
        } catch (ClassCastException unused) {
            linkedHashMap.remove(key);
            ((LinkedHashMap) s0Var.f18281d).remove(key);
            linkedHashMap2.remove(key);
            return null;
        }
    }

    public final w70.o1 b(Object obj, String str) {
        bn.s0 s0Var = this.f59455b;
        LinkedHashMap linkedHashMap = (LinkedHashMap) s0Var.f18282e;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) s0Var.f18279b;
        if (linkedHashMap.containsKey(str)) {
            LinkedHashMap linkedHashMap3 = (LinkedHashMap) s0Var.f18282e;
            Object objC = linkedHashMap3.get(str);
            if (objC == null) {
                if (!linkedHashMap2.containsKey(str)) {
                    linkedHashMap2.put(str, obj);
                }
                objC = u1.c(linkedHashMap2.get(str));
                linkedHashMap3.put(str, objC);
            }
            return new w70.o1((w70.m1) objC);
        }
        LinkedHashMap linkedHashMap4 = (LinkedHashMap) s0Var.f18281d;
        Object objC2 = linkedHashMap4.get(str);
        if (objC2 == null) {
            if (!linkedHashMap2.containsKey(str)) {
                linkedHashMap2.put(str, obj);
            }
            objC2 = u1.c(linkedHashMap2.get(str));
            linkedHashMap4.put(str, objC2);
        }
        return new w70.o1((w70.m1) objC2);
    }

    public final j6.a c() {
        return (j6.a) this.f59455b.f18283f;
    }

    public final void d(String key, Object obj) {
        Intrinsics.g(key, "key");
        if (obj != null) {
            List list = j6.b.f69066a;
            if (!(list instanceof Collection) || !list.isEmpty()) {
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    if (((Class) it.next()).isInstance(obj)) {
                    }
                }
            }
            throw new IllegalArgumentException(("Can't put value with type " + obj.getClass() + " into saved state").toString());
        }
        List list2 = j6.b.f69066a;
        Object obj2 = this.f59454a.get(key);
        m0 m0Var = obj2 instanceof m0 ? (m0) obj2 : null;
        if (m0Var != null) {
            m0Var.j(obj);
        }
        this.f59455b.l(key, obj);
    }

    public u0() {
        this.f59454a = new LinkedHashMap();
        this.f59455b = new bn.s0(b70.h.f17594a);
    }
}
