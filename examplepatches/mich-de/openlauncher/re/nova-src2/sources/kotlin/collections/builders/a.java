package kotlin.collections.builders;

import java.util.AbstractList;
import java.util.ConcurrentModificationException;
import java.util.ListIterator;
import java.util.NoSuchElementException;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.markers.KMutableListIterator;

/* loaded from: classes4.dex */
public final class a implements ListIterator, KMutableListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final ListBuilder.BuilderSubList f71787a;

    /* renamed from: b, reason: collision with root package name */
    public int f71788b;

    /* renamed from: c, reason: collision with root package name */
    public int f71789c = -1;

    /* renamed from: d, reason: collision with root package name */
    public int f71790d;

    public a(ListBuilder.BuilderSubList builderSubList, int i5) {
        this.f71787a = builderSubList;
        this.f71788b = i5;
        this.f71790d = ((AbstractList) builderSubList).modCount;
    }

    public final void a() {
        if (((AbstractList) this.f71787a.f71760e).modCount != this.f71790d) {
            throw new ConcurrentModificationException();
        }
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        a();
        int i5 = this.f71788b;
        this.f71788b = i5 + 1;
        ListBuilder.BuilderSubList builderSubList = this.f71787a;
        builderSubList.add(i5, obj);
        this.f71789c = -1;
        this.f71790d = ((AbstractList) builderSubList).modCount;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f71788b < this.f71787a.f71758c;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f71788b > 0;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        a();
        int i5 = this.f71788b;
        ListBuilder.BuilderSubList builderSubList = this.f71787a;
        if (i5 >= builderSubList.f71758c) {
            throw new NoSuchElementException();
        }
        this.f71788b = i5 + 1;
        this.f71789c = i5;
        return builderSubList.f71756a[builderSubList.f71757b + i5];
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f71788b;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        a();
        int i5 = this.f71788b;
        if (i5 <= 0) {
            throw new NoSuchElementException();
        }
        int i11 = i5 - 1;
        this.f71788b = i11;
        this.f71789c = i11;
        ListBuilder.BuilderSubList builderSubList = this.f71787a;
        return builderSubList.f71756a[builderSubList.f71757b + i11];
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f71788b - 1;
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        a();
        int i5 = this.f71789c;
        if (i5 == -1) {
            throw new IllegalStateException("Call next() or previous() before removing element from the iterator.");
        }
        ListBuilder.BuilderSubList builderSubList = this.f71787a;
        builderSubList.d(i5);
        this.f71788b = this.f71789c;
        this.f71789c = -1;
        this.f71790d = ((AbstractList) builderSubList).modCount;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        a();
        int i5 = this.f71789c;
        if (i5 == -1) {
            throw new IllegalStateException("Call next() or previous() before replacing element from the iterator.");
        }
        this.f71787a.set(i5, obj);
    }
}
