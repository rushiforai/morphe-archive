package tz;

import b.c0;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.function.UnaryOperator;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.markers.KMappedMarker;

/* loaded from: classes.dex */
public final class o implements List, KMappedMarker {

    /* renamed from: b, reason: collision with root package name */
    public static final o f90164b = x7.f.z(-14979341);

    /* renamed from: c, reason: collision with root package name */
    public static final List f90165c = ul.b.Q("Tone 99", "Tone 95", "Tone 90", "Tone 80", "Tone 70", "Tone 60", "Tone 50", "Tone 40", "Tone 30", "Tone 20", "Tone 10", "Nove 95", "Nove 90", "Nove 80", "Nove 70", "Nove 60", "Nove 50", "Nove 40", "Nove 30", "Nove 20");

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f90166a;

    public o(ArrayList arrayList) {
        this.f90166a = arrayList;
        if (arrayList.size() != 36) {
            throw new IllegalArgumentException();
        }
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
        if (!(obj instanceof c)) {
            return false;
        }
        return this.f90166a.contains(new c(((c) obj).f90097a));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean containsAll(Collection collection) {
        return this.f90166a.containsAll(collection);
    }

    @Override // java.util.List
    public final Object get(int i5) {
        return new c(((c) this.f90166a.get(i5)).f90097a);
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof c)) {
            return -1;
        }
        return this.f90166a.indexOf(new c(((c) obj).f90097a));
    }

    @Override // java.util.List, java.util.Collection
    public final boolean isEmpty() {
        return this.f90166a.isEmpty();
    }

    @Override // java.util.List, java.util.Collection, java.lang.Iterable
    public final Iterator iterator() {
        return this.f90166a.iterator();
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        if (!(obj instanceof c)) {
            return -1;
        }
        return this.f90166a.lastIndexOf(new c(((c) obj).f90097a));
    }

    @Override // java.util.List
    public final ListIterator listIterator() {
        return this.f90166a.listIterator();
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
        return this.f90166a.size();
    }

    @Override // java.util.List
    public final void sort(Comparator comparator) {
        throw new UnsupportedOperationException("Operation is not supported for read-only collection");
    }

    @Override // java.util.List
    public final List subList(int i5, int i11) {
        return this.f90166a.subList(i5, i11);
    }

    @Override // java.util.List, java.util.Collection
    public final Object[] toArray() {
        return CollectionToArray.a(this);
    }

    public final String toString() {
        ArrayList arrayList = this.f90166a;
        return c0.n("RelativeColorPalette(", c.b(((c) arrayList.get(6)).f90097a), ", ", c.b(((c) arrayList.get(3)).f90097a), ")");
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
        return this.f90166a.listIterator(i5);
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
