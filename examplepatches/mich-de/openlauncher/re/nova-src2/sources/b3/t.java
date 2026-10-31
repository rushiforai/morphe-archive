package b3;

import androidx.compose.ui.Modifier$Node;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.function.UnaryOperator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes2.dex */
public final class t implements List, KMappedMarker {

    /* renamed from: a, reason: collision with root package name */
    public final int f17341a;

    /* renamed from: b, reason: collision with root package name */
    public final int f17342b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u f17343c;

    public t(u uVar, int i5, int i11) {
        this.f17343c = uVar;
        this.f17341a = i5;
        this.f17342b = i11;
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ void add(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addFirst(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ void addLast(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return (obj instanceof Modifier$Node) && indexOf((Modifier$Node) obj) != -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!contains((Modifier$Node) it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        Object objB = this.f17343c.f17374a.b(i5 + this.f17341a);
        Intrinsics.e(objB, "null cannot be cast to non-null type androidx.compose.ui.Modifier.Node");
        return (Modifier$Node) objB;
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Modifier$Node)) {
            return -1;
        }
        Modifier$Node modifier$Node = (Modifier$Node) obj;
        int i5 = this.f17341a;
        int i11 = this.f17342b;
        if (i5 <= i11) {
            int i12 = i5;
            while (!Intrinsics.b(this.f17343c.f17374a.b(i12), modifier$Node)) {
                if (i12 != i11) {
                    i12++;
                }
            }
            return i12 - i5;
        }
        return -1;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return size() == 0;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        int i5 = this.f17341a;
        return new s(this.f17343c, i5, i5, this.f17342b);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof Modifier$Node)) {
            return -1;
        }
        Modifier$Node modifier$Node = (Modifier$Node) obj;
        int i5 = this.f17342b;
        int i11 = this.f17341a;
        if (i11 <= i5) {
            while (!Intrinsics.b(this.f17343c.f17374a.b(i5), modifier$Node)) {
                if (i5 != i11) {
                    i5--;
                }
            }
            return i5 - i11;
        }
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        int i5 = this.f17341a;
        return new s(this.f17343c, i5, i5, this.f17342b);
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ Object removeFirst() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    public final /* bridge */ /* synthetic */ Object removeLast() {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final void replaceAll(UnaryOperator unaryOperator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.f17342b - this.f17341a;
    }

    @Override // java.util.List
    public final void sort(Comparator comparator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        int i12 = this.f17341a;
        return new t(this.f17343c, i5 + i12, i12 + i11);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.List, java.util.Collection
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        int i11 = this.f17341a;
        int i12 = this.f17342b;
        return new s(this.f17343c, i5 + i11, i11, i12);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }
}
