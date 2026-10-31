package com.google.android.gms.internal.play_billing;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Objects;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public abstract class k0 extends h0 implements List, RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public static final i0 f33433b = new i0(o0.f33465e, 0);

    public static o0 j(int i5, Object[] objArr) {
        return i5 == 0 ? o0.f33465e : new o0(objArr, i5);
    }

    public static k0 k(Collection collection) {
        if (!(collection instanceof h0)) {
            Object[] array = collection.toArray();
            int length = array.length;
            zg.a.a0(length, array);
            return j(length, array);
        }
        k0 k0VarE = ((h0) collection).e();
        if (!k0VarE.f()) {
            return k0VarE;
        }
        Object[] array2 = k0VarE.toArray(h0.f33413a);
        return j(array2.length, array2);
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public int b(Object[] objArr) {
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            objArr[i5] = get(i5);
        }
        return size;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final k0 e() {
        return this;
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            int size = size();
            if (size == list.size()) {
                if (list instanceof RandomAccess) {
                    for (int i5 = 0; i5 < size; i5++) {
                        if (Objects.equals(get(i5), list.get(i5))) {
                        }
                    }
                    return true;
                }
                i0 i0VarListIterator = listIterator(0);
                Iterator it = list.iterator();
                while (true) {
                    if (i0VarListIterator.hasNext()) {
                        if (!it.hasNext() || !Objects.equals(i0VarListIterator.next(), it.next())) {
                            break;
                        }
                    } else if (!it.hasNext()) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override // java.util.List
    /* renamed from: h */
    public k0 subList(int i5, int i11) {
        t2.c.W(i5, i11, size());
        int i12 = i11 - i5;
        return i12 == size() ? this : i12 == 0 ? o0.f33465e : new j0(this, i5, i12);
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int size = size();
        int iHashCode = 1;
        for (int i5 = 0; i5 < size; i5++) {
            iHashCode = (iHashCode * 31) + get(i5).hashCode();
        }
        return iHashCode;
    }

    @Override // java.util.List
    public final int indexOf(Object obj) {
        if (obj == null) {
            return -1;
        }
        int size = size();
        for (int i5 = 0; i5 < size; i5++) {
            if (obj.equals(get(i5))) {
                return i5;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final /* synthetic */ Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    /* renamed from: l, reason: merged with bridge method [inline-methods] */
    public final i0 listIterator(int i5) {
        t2.c.V(i5, size());
        return isEmpty() ? f33433b : new i0(this, i5);
    }

    @Override // java.util.List
    public final int lastIndexOf(Object obj) {
        if (obj == null) {
            return -1;
        }
        for (int size = size() - 1; size >= 0; size--) {
            if (obj.equals(get(size))) {
                return size;
            }
        }
        return -1;
    }

    @Override // java.util.List
    public final /* synthetic */ ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }
}
