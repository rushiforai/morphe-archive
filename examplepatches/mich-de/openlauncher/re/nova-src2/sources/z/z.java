package z;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.function.BiFunction;
import java.util.function.Function;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class z implements Map, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final y0 f97871a;

    /* renamed from: b, reason: collision with root package name */
    public g f97872b;

    /* renamed from: c, reason: collision with root package name */
    public g f97873c;

    /* renamed from: d, reason: collision with root package name */
    public g1 f97874d;

    public z(y0 parent) {
        Intrinsics.g(parent, "parent");
        this.f97871a = parent;
    }

    @Override // java.util.Map
    public final void clear() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object compute(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object computeIfAbsent(Object obj, Function function) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object computeIfPresent(Object obj, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final boolean containsKey(Object obj) {
        return this.f97871a.b(obj);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object obj) {
        return this.f97871a.c(obj);
    }

    @Override // java.util.Map
    public final Set entrySet() {
        g gVar = this.f97872b;
        if (gVar != null) {
            return gVar;
        }
        g gVar2 = new g(this.f97871a, 0);
        this.f97872b = gVar2;
        return gVar2;
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || z.class != obj.getClass()) {
            return false;
        }
        return Intrinsics.b(this.f97871a, ((z) obj).f97871a);
    }

    @Override // java.util.Map
    public final Object get(Object obj) {
        return this.f97871a.d(obj);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return this.f97871a.hashCode();
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.f97871a.e();
    }

    @Override // java.util.Map
    public final Set keySet() {
        g gVar = this.f97873c;
        if (gVar != null) {
            return gVar;
        }
        g gVar2 = new g(this.f97871a, 1);
        this.f97873c = gVar2;
        return gVar2;
    }

    @Override // java.util.Map
    public final Object merge(Object obj, Object obj2, BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object put(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final void putAll(Map map) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object putIfAbsent(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final Object replace(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final void replaceAll(BiFunction biFunction) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final int size() {
        return this.f97871a.f97870e;
    }

    public final String toString() {
        return this.f97871a.toString();
    }

    @Override // java.util.Map
    public final Collection values() {
        g1 g1Var = this.f97874d;
        if (g1Var != null) {
            return g1Var;
        }
        g1 g1Var2 = new g1(this.f97871a);
        this.f97874d = g1Var2;
        return g1Var2;
    }

    @Override // java.util.Map
    public final boolean remove(Object obj, Object obj2) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Map
    public final boolean replace(Object obj, Object obj2, Object obj3) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }
}
