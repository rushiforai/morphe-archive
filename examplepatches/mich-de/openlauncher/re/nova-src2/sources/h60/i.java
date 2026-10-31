package h60;

import b.c0;
import fc0.q;
import fc0.r;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.function.Supplier;

/* loaded from: classes4.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final Map f59487a;

    public i(Map map) {
        this.f59487a = map;
    }

    public boolean a(final fc0.e eVar, final fc0.e eVar2) {
        if (eVar.getClass().equals(eVar2.getClass())) {
            return !(eVar instanceof fc0.p) || ((fc0.p) eVar).f54639d <= ((fc0.p) eVar2).f54639d;
        }
        Class<?> cls = eVar.getClass();
        Map map = this.f59487a;
        Object obj = map.get(cls);
        final int i5 = 0;
        Objects.requireNonNull(obj, (Supplier<String>) new Supplier() { // from class: hc0.b
            @Override // java.util.function.Supplier
            public final Object get() {
                String name;
                String str;
                String str2;
                switch (i5) {
                    case 0:
                        name = eVar.getClass().getName();
                        str = "no normal-form order defined for class '";
                        str2 = "'";
                        break;
                    default:
                        name = eVar.getClass().getName();
                        str = "no normal-form order defined for class '";
                        str2 = "'";
                        break;
                }
                return c0.l(str, name, str2);
            }
        });
        Object obj2 = map.get(eVar2.getClass());
        final int i11 = 1;
        Objects.requireNonNull(obj2, (Supplier<String>) new Supplier() { // from class: hc0.b
            @Override // java.util.function.Supplier
            public final Object get() {
                String name;
                String str;
                String str2;
                switch (i11) {
                    case 0:
                        name = eVar2.getClass().getName();
                        str = "no normal-form order defined for class '";
                        str2 = "'";
                        break;
                    default:
                        name = eVar2.getClass().getName();
                        str = "no normal-form order defined for class '";
                        str2 = "'";
                        break;
                }
                return c0.l(str, name, str2);
            }
        });
        return ((Integer) obj).intValue() <= ((Integer) obj2).intValue();
    }

    public boolean b(fc0.e eVar, fc0.e eVar2) {
        if (eVar.getClass().equals(eVar2.getClass())) {
            return true;
        }
        Class<?> cls = eVar.getClass();
        Map map = this.f59487a;
        return ((Integer) map.get(cls)).intValue() <= ((Integer) map.get(eVar2.getClass())).intValue();
    }

    public i() {
        HashMap map = fc0.i.f54619e;
        synchronized (map) {
            try {
                if (map.isEmpty()) {
                    map.put(fc0.e.f54605b.getClass(), 0);
                    map.put(fc0.p.class, 1);
                    map.put(r.class, 2);
                    map.put(q.class, 3);
                    map.put(fc0.k.class, 4);
                    map.put(fc0.f.class, 5);
                    map.put(fc0.n.class, 6);
                    map.put(fc0.l.class, 7);
                    map.put(fc0.d.class, 99);
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f59487a = Collections.unmodifiableMap(map);
    }
}
