package xk;

import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* loaded from: classes3.dex */
public class u1 extends AbstractList {

    /* renamed from: a, reason: collision with root package name */
    public final List f96025a;

    public u1(List list) {
        list.getClass();
        this.f96025a = list;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        this.f96025a.add(d(i5), obj);
    }

    public final List c() {
        return this.f96025a;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.f96025a.clear();
    }

    public final int d(int i5) {
        int size = this.f96025a.size();
        vk.b0.h(i5, size);
        return size - i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        List list = this.f96025a;
        int size = list.size();
        vk.b0.e(i5, size);
        return list.get((size - 1) - i5);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator();
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new t1(this, this.f96025a.listIterator(d(i5)));
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        List list = this.f96025a;
        int size = list.size();
        vk.b0.e(i5, size);
        return list.remove((size - 1) - i5);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        subList(i5, i11).clear();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        List list = this.f96025a;
        int size = list.size();
        vk.b0.e(i5, size);
        return list.set((size - 1) - i5, obj);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96025a.size();
    }

    @Override // java.util.AbstractList, java.util.List
    public final List subList(int i5, int i11) {
        List list = this.f96025a;
        vk.b0.i(i5, i11, list.size());
        return v70.o.k(list.subList(d(i11), d(i5)));
    }
}
