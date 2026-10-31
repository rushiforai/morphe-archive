package u50;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes4.dex */
public final class a implements Map, KMutableMap {

    /* renamed from: a, reason: collision with root package name */
    public final ConcurrentHashMap f90639a = new ConcurrentHashMap(32);

    @Override // java.util.Map
    public final void clear() {
        this.f90639a.clear();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return this.f90639a.containsKey(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return this.f90639a.containsValue(obj);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        Set setEntrySet = this.f90639a.entrySet();
        Intrinsics.f(setEntrySet, "<get-entries>(...)");
        return setEntrySet;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (obj instanceof Map) {
            return obj.equals(this.f90639a);
        }
        return false;
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        return this.f90639a.get(obj);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return this.f90639a.hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.f90639a.isEmpty();
    }

    @Override // java.util.Map
    public final Set keySet() {
        Set setKeySet = this.f90639a.keySet();
        Intrinsics.f(setKeySet, "<get-keys>(...)");
        return setKeySet;
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        return this.f90639a.put(obj, obj2);
    }

    @Override // java.util.Map
    public final void putAll(Map from) {
        Intrinsics.g(from, "from");
        this.f90639a.putAll(from);
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        return this.f90639a.remove(obj);
    }

    @Override // java.util.Map
    public final int size() {
        return this.f90639a.size();
    }

    public final String toString() {
        return "ConcurrentMapJvm by " + this.f90639a;
    }

    @Override // java.util.Map
    public final Collection values() {
        Collection collectionValues = this.f90639a.values();
        Intrinsics.f(collectionValues, "<get-values>(...)");
        return collectionValues;
    }

    @Override // java.util.Map
    public final boolean remove(Object obj, Object obj2) {
        return this.f90639a.remove(obj, obj2);
    }
}
