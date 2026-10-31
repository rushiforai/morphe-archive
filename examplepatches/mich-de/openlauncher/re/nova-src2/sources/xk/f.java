package xk;

import java.util.AbstractMap;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.NavigableMap;
import java.util.RandomAccess;
import java.util.Set;
import java.util.SortedMap;

/* loaded from: classes3.dex */
public class f extends AbstractMap {

    /* renamed from: a, reason: collision with root package name */
    public transient d f95906a;

    /* renamed from: b, reason: collision with root package name */
    public transient wk.a0 f95907b;

    /* renamed from: c, reason: collision with root package name */
    public final transient Map f95908c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d2 f95909d;

    public f(d2 d2Var, Map map) {
        this.f95909d = d2Var;
        this.f95908c = map;
    }

    public final r0 a(Map.Entry entry) {
        Object key = entry.getKey();
        List list = (List) ((Collection) entry.getValue());
        boolean z11 = list instanceof RandomAccess;
        d2 d2Var = this.f95909d;
        return new r0(key, z11 ? new j(d2Var, key, list, null) : new n(d2Var, key, list, null));
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final void clear() {
        d2 d2Var = this.f95909d;
        if (this.f95908c == d2Var.f95893d) {
            d2Var.c();
            return;
        }
        e eVar = new e(this);
        while (eVar.hasNext()) {
            eVar.next();
            eVar.remove();
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean containsKey(Object obj) {
        Map map = this.f95908c;
        map.getClass();
        try {
            return map.containsKey(obj);
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Set entrySet() {
        d dVar = this.f95906a;
        if (dVar != null) {
            return dVar;
        }
        d dVar2 = new d(this, 0);
        this.f95906a = dVar2;
        return dVar2;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final boolean equals(Object obj) {
        return this == obj || this.f95908c.equals(obj);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object get(Object obj) {
        Object obj2;
        Map map = this.f95908c;
        map.getClass();
        try {
            obj2 = map.get(obj);
        } catch (ClassCastException | NullPointerException unused) {
            obj2 = null;
        }
        Collection collection = (Collection) obj2;
        if (collection == null) {
            return null;
        }
        List list = (List) collection;
        boolean z11 = list instanceof RandomAccess;
        d2 d2Var = this.f95909d;
        return z11 ? new j(d2Var, obj, list, null) : new n(d2Var, obj, list, null);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int hashCode() {
        return this.f95908c.hashCode();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set keySet() {
        d2 d2Var = this.f95909d;
        Set set = d2Var.f34564a;
        if (set != null) {
            return set;
        }
        Map map = d2Var.f95893d;
        Set iVar = map instanceof NavigableMap ? new i(d2Var, (NavigableMap) map) : map instanceof SortedMap ? new l(d2Var, (SortedMap) map) : new g(d2Var, map);
        d2Var.f34564a = iVar;
        return iVar;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Object remove(Object obj) {
        Collection collection = (Collection) this.f95908c.remove(obj);
        if (collection == null) {
            return null;
        }
        d2 d2Var = this.f95909d;
        List list = (List) d2Var.f95895f.get();
        list.addAll(collection);
        d2Var.f95894e -= collection.size();
        collection.clear();
        return list;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final int size() {
        return this.f95908c.size();
    }

    @Override // java.util.AbstractMap
    public final String toString() {
        return this.f95908c.toString();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public final Collection values() {
        wk.a0 a0Var = this.f95907b;
        if (a0Var != null) {
            return a0Var;
        }
        wk.a0 a0Var2 = new wk.a0(this);
        this.f95907b = a0Var2;
        return a0Var2;
    }
}
