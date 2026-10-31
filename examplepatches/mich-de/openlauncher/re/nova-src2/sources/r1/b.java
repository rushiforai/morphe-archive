package r1;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableList;

/* loaded from: classes.dex */
public final class b implements List, KMutableList {

    /* renamed from: a, reason: collision with root package name */
    public final e f85069a;

    public b(e eVar) {
        this.f85069a = eVar;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean add(Object obj) {
        this.f85069a.b(obj);
        return true;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean addAll(Collection collection) {
        e eVar = this.f85069a;
        return eVar.e(eVar.f85079c, collection);
    }

    @Override // java.util.List, java.util.Collection
    public final void clear() {
        this.f85069a.g();
    }

    @Override // java.util.List, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f85069a.h(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        e eVar = this.f85069a;
        eVar.getClass();
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            if (!eVar.h(it.next())) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        f.a(i5, this);
        return this.f85069a.f85077a[i5];
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        return this.f85069a.i(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.f85069a.f85079c == 0;
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return new d(0, 0, this);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        e eVar = this.f85069a;
        Object[] objArr = eVar.f85077a;
        for (int i5 = eVar.f85079c - 1; i5 >= 0; i5--) {
            if (Intrinsics.b(obj, objArr[i5])) {
                return i5;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return new d(0, 0, this);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean remove(Object obj) {
        return this.f85069a.j(obj);
    }

    @Override // java.util.List, java.util.Collection
    public final boolean removeAll(Collection collection) {
        e eVar = this.f85069a;
        eVar.getClass();
        if (collection.isEmpty()) {
            return false;
        }
        int i5 = eVar.f85079c;
        Iterator it = collection.iterator();
        while (it.hasNext()) {
            eVar.j(it.next());
        }
        return i5 != eVar.f85079c;
    }

    @Override // java.util.List, java.util.Collection
    public final boolean retainAll(Collection collection) {
        e eVar = this.f85069a;
        int i5 = eVar.f85079c;
        for (int i11 = i5 - 1; -1 < i11; i11--) {
            if (!collection.contains(eVar.f85077a[i11])) {
                eVar.k(i11);
            }
        }
        return i5 != eVar.f85079c;
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        f.a(i5, this);
        Object[] objArr = this.f85069a.f85077a;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        return obj2;
    }

    @Override // java.util.List, java.util.Collection
    public final int size() {
        return this.f85069a.f85079c;
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        f.b(i5, i11, this);
        return new c(i5, i11, 0, this);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        this.f85069a.a(i5, obj);
    }

    @Override // java.util.List
    public final ListIterator listIterator(int i5) {
        return new d(i5, 0, this);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        f.a(i5, this);
        return this.f85069a.k(i5);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        return CollectionToArray.b(this, objArr);
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        return this.f85069a.e(i5, collection);
    }
}
