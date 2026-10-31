package vf;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import xk.e3;

/* loaded from: classes3.dex */
public final class s extends xk.w implements Map {

    /* renamed from: d, reason: collision with root package name */
    public final Map f92740d;

    public s(Map map) {
        this.f92740d = map;
    }

    @Override // java.util.Map
    public final void clear() {
        this.f92740d.clear();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return obj != null && this.f92740d.containsKey(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        Iterator it = ((e3) entrySet()).iterator();
        it.getClass();
        Iterator it2 = it;
        if (obj == null) {
            while (it2.hasNext()) {
                if (((Map.Entry) it2.next()).getValue() == null) {
                    return true;
                }
            }
            return false;
        }
        while (it2.hasNext()) {
            if (obj.equals(((Map.Entry) it2.next()).getValue())) {
                return true;
            }
        }
        return false;
    }

    @Override // xk.w
    public final Object delegate() {
        return this.f92740d;
    }

    @Override // java.util.Map
    public final Set entrySet() {
        return xk.w.j(this.f92740d.entrySet(), new r(1));
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        return obj != null && vm.d.f(obj, this);
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        if (obj == null) {
            return null;
        }
        return (List) this.f92740d.get(obj);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return xk.w.l(entrySet());
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        Map map = this.f92740d;
        return map.isEmpty() || (map.size() == 1 && map.containsKey(null));
    }

    @Override // java.util.Map
    public final Set keySet() {
        return xk.w.j(this.f92740d.keySet(), new r(0));
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        return this.f92740d.put(obj, obj2);
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        this.f92740d.putAll(map);
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        return this.f92740d.remove(obj);
    }

    @Override // java.util.Map
    public final int size() {
        Map map = this.f92740d;
        return map.size() - (map.containsKey(null) ? 1 : 0);
    }

    @Override // java.util.Map
    public final Collection values() {
        return this.f92740d.values();
    }
}
