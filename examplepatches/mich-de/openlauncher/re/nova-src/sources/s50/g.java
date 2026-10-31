package s50;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableSet;

/* loaded from: classes.dex */
public final class g implements Set, KMutableSet {

    /* renamed from: a, reason: collision with root package name */
    public final Set f86684a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f86685b;

    /* renamed from: c, reason: collision with root package name */
    public final Function1 f86686c;

    /* renamed from: d, reason: collision with root package name */
    public final int f86687d;

    public g(Set delegate, Function1 function1, Function1 function12) {
        Intrinsics.g(delegate, "delegate");
        this.f86684a = delegate;
        this.f86685b = function1;
        this.f86686c = function12;
        this.f86687d = delegate.size();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean add(Object obj) {
        return this.f86684a.add(this.f86686c.invoke(obj));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f86684a.addAll(b(elements));
    }

    public final ArrayList b(Collection collection) {
        Collection collection2 = collection;
        ArrayList arrayList = new ArrayList(b70.c.u0(collection2, 10));
        Iterator it = collection2.iterator();
        while (it.hasNext()) {
            arrayList.add(this.f86686c.invoke(it.next()));
        }
        return arrayList;
    }

    public final ArrayList c(Collection collection) {
        Intrinsics.g(collection, "<this>");
        Collection collection2 = collection;
        ArrayList arrayList = new ArrayList(b70.c.u0(collection2, 10));
        Iterator it = collection2.iterator();
        while (it.hasNext()) {
            arrayList.add(this.f86685b.invoke(it.next()));
        }
        return arrayList;
    }

    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.f86684a.clear();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f86684a.contains(this.f86686c.invoke(obj));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f86684a.containsAll(b(elements));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        if (obj == null || !(obj instanceof Set)) {
            return false;
        }
        ArrayList arrayListC = c(this.f86684a);
        return ((Set) obj).containsAll(arrayListC) && arrayListC.containsAll((Collection) obj);
    }

    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        return this.f86684a.hashCode();
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.f86684a.isEmpty();
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new f(this);
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        return this.f86684a.remove(this.f86686c.invoke(obj));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f86684a.removeAll(b70.g.N1(b(elements)));
    }

    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection elements) {
        Intrinsics.g(elements, "elements");
        return this.f86684a.retainAll(b70.g.N1(b(elements)));
    }

    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.f86687d;
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    public final String toString() {
        return c(this.f86684a).toString();
    }

    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray(Object[] array) {
        Intrinsics.g(array, "array");
        return CollectionToArray.b(this, array);
    }
}
