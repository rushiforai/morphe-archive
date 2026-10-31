package xk;

import java.io.Serializable;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class w1 extends AbstractList implements RandomAccess, Serializable {

    /* renamed from: a, reason: collision with root package name */
    public final List f96040a;

    /* renamed from: b, reason: collision with root package name */
    public final vk.g f96041b;

    public w1(List list, vk.g gVar) {
        list.getClass();
        this.f96040a = list;
        this.f96041b = gVar;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.f96040a.clear();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return this.f96041b.apply(this.f96040a.get(i5));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return this.f96040a.isEmpty();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator();
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new v1(this, this.f96040a.listIterator(i5), 0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        return this.f96041b.apply(this.f96040a.remove(i5));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f96040a.size();
    }
}
