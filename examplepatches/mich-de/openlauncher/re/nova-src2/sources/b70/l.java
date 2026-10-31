package b70;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;
import kotlin.collections.AbstractMutableList;
import kotlin.collections.ReversedList$listIterator$1;

/* loaded from: classes4.dex */
public final class l extends AbstractMutableList {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f17595a;

    public l(ArrayList arrayList) {
        this.f17595a = arrayList;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        this.f17595a.add(e.K0(i5, this), obj);
    }

    @Override // kotlin.collections.AbstractMutableList
    /* renamed from: c */
    public final int getF71724c() {
        return this.f17595a.size();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        this.f17595a.clear();
    }

    @Override // kotlin.collections.AbstractMutableList
    public final Object d(int i5) {
        return this.f17595a.remove(e.J0(i5, this));
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return this.f17595a.get(e.J0(i5, this));
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return new ReversedList$listIterator$1(this, 0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return new ReversedList$listIterator$1(this, 0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        return this.f17595a.set(e.J0(i5, this), obj);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i5) {
        return new ReversedList$listIterator$1(this, i5);
    }
}
