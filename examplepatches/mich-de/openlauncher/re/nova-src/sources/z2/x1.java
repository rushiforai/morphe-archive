package z2;

import java.util.Collection;
import java.util.Iterator;
import java.util.function.Predicate;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class x1 implements Collection, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final z.k0 f98177a;

    public x1() {
        int i5 = z.x0.f97863a;
        this.f98177a = new z.k0(6);
    }

    @Override // java.util.Collection
    public final boolean add(Object obj) {
        return this.f98177a.b(obj);
    }

    @Override // java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final void clear() {
        this.f98177a.c();
    }

    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        return this.f98177a.a(obj);
    }

    @Override // java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!this.f98177a.a(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.Collection
    public final boolean isEmpty() {
        return this.f98177a.f97856g == 0;
    }

    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        z.k0 k0Var = this.f98177a;
        k0Var.getClass();
        return new z.n0(k0Var).iterator();
    }

    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        return this.f98177a.g(obj);
    }

    @Override // java.util.Collection
    public final boolean removeAll(Collection collection) {
        return this.f98177a.g(collection);
    }

    @Override // java.util.Collection
    public final boolean removeIf(Predicate predicate) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.Collection
    public final boolean retainAll(Collection collection) {
        return this.f98177a.i(collection);
    }

    @Override // java.util.Collection
    public final int size() {
        return this.f98177a.f97856g;
    }

    @Override // java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }
}
