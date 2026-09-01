package j$.util;

import j$.util.Map;
import java.io.Serializable;
import java.util.function.BiConsumer;
import java.util.function.BiFunction;
import java.util.function.Function;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes3.dex */
public final class r implements java.util.Map, Serializable, Map {
    private static final long serialVersionUID = -1034234728574286014L;
    public final java.util.Map a;
    public transient java.util.Set b;
    public transient q c;
    public transient java.util.Collection d;

    public r(java.util.Map map) {
        map.getClass();
        this.a = map;
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final Object compute(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final Object computeIfAbsent(Object obj, Function function) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final Object computeIfPresent(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return this.a.containsKey(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return this.a.containsValue(obj);
    }

    @Override // java.util.Map
    public final java.util.Set entrySet() {
        q qVar = this.c;
        if (qVar != null) {
            return qVar;
        }
        q qVar2 = new q(this.a.entrySet());
        this.c = qVar2;
        return qVar2;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        return obj == this || this.a.equals(obj);
    }

    @Override // java.util.Map, j$.util.Map
    public final void forEach(BiConsumer biConsumer) {
        Map.EL.a(this.a, biConsumer);
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        return this.a.get(obj);
    }

    @Override // java.util.Map, j$.util.Map
    public final Object getOrDefault(Object obj, Object obj2) {
        return Map.EL.getOrDefault(this.a, obj, obj2);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return this.a.hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.a.isEmpty();
    }

    @Override // java.util.Map
    public final java.util.Set keySet() {
        java.util.Set set = this.b;
        if (set != null) {
            return set;
        }
        java.util.Set setUnmodifiableSet = DesugarCollections.unmodifiableSet(this.a.keySet());
        this.b = setUnmodifiableSet;
        return setUnmodifiableSet;
    }

    @Override // java.util.Map, j$.util.Map
    public final Object merge(Object obj, Object obj2, BiFunction biFunction) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final void putAll(java.util.Map map) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final Object putIfAbsent(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean replace(Object obj, Object obj2, Object obj3) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final void replaceAll(BiFunction biFunction) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public final int size() {
        return this.a.size();
    }

    public final String toString() {
        return this.a.toString();
    }

    @Override // java.util.Map
    public final java.util.Collection values() {
        java.util.Collection collection = this.d;
        if (collection != null) {
            return collection;
        }
        java.util.Collection collectionUnmodifiableCollection = DesugarCollections.unmodifiableCollection(this.a.values());
        this.d = collectionUnmodifiableCollection;
        return collectionUnmodifiableCollection;
    }

    @Override // java.util.Map, j$.util.Map
    public final boolean remove(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map, j$.util.Map
    public final Object replace(Object obj, Object obj2) {
        throw new UnsupportedOperationException();
    }
}
