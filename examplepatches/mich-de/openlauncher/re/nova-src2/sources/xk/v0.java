package xk;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public abstract class v0 extends q0 implements List, RandomAccess {

    /* renamed from: b, reason: collision with root package name */
    public static final l0 f96030b = new l0(r2.f96007e, 0);

    public static r2 k(int i5, Object[] objArr) {
        return i5 == 0 ? r2.f96007e : new r2(objArr, i5);
    }

    public static s0 l() {
        return new s0(4);
    }

    public static v0 n(Iterable iterable) {
        if (iterable instanceof Collection) {
            return o((Collection) iterable);
        }
        Iterator it = iterable.iterator();
        if (!it.hasNext()) {
            return r2.f96007e;
        }
        Object next = it.next();
        if (!it.hasNext()) {
            return s(next);
        }
        s0 s0Var = new s0(4);
        s0Var.a(next);
        while (it.hasNext()) {
            s0Var.a(it.next());
        }
        return s0Var.f();
    }

    public static v0 o(Collection collection) {
        if (!(collection instanceof q0)) {
            Object[] array = collection.toArray();
            w20.e.c(array.length, array);
            return k(array.length, array);
        }
        v0 v0VarC = ((q0) collection).c();
        if (!v0VarC.h()) {
            return v0VarC;
        }
        Object[] array2 = v0VarC.toArray(q0.f95992a);
        return k(array2.length, array2);
    }

    public static r2 p(Object[] objArr) {
        if (objArr.length == 0) {
            return r2.f96007e;
        }
        Object[] objArr2 = (Object[]) objArr.clone();
        w20.e.c(objArr2.length, objArr2);
        return k(objArr2.length, objArr2);
    }

    public static r2 r(Long l9, Long l11, Long l12, Long l13, Long l14) {
        Object[] objArr = {l9, l11, l12, l13, l14};
        w20.e.c(5, objArr);
        return k(5, objArr);
    }

    public static r2 s(Object obj) {
        Object[] objArr = {obj};
        w20.e.c(1, objArr);
        return k(1, objArr);
    }

    public static r2 t(Object obj, Object obj2) {
        Object[] objArr = {obj, obj2};
        w20.e.c(2, objArr);
        return k(2, objArr);
    }

    @Override // java.util.List
    public final void add(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final boolean addAll(int i5, Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // xk.q0
    public final v0 c() {
        return this;
    }

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean contains(Object obj) {
        return indexOf(obj) >= 0;
    }

    @Override // xk.q0
    public int d(Object[] objArr, int i5) {
        int size = size();
        for (int i11 = 0; i11 < size; i11++) {
            objArr[i5 + i11] = get(i11);
        }
        return i5 + size;
    }

    @Override // java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj != this) {
            if (obj instanceof List) {
                List list = (List) obj;
                int size = size();
                if (size == list.size()) {
                    if (!(list instanceof RandomAccess)) {
                        Iterator it = iterator();
                        Iterator it2 = list.iterator();
                        while (it.hasNext()) {
                            if (it2.hasNext() && ps.v.q(it.next(), it2.next())) {
                            }
                        }
                        return !it2.hasNext();
                    }
                    for (int i5 = 0; i5 < size; i5++) {
                        if (ps.v.q(get(i5), list.get(i5))) {
                        }
                    }
                }
            }
            return false;
        }
        return true;
    }

    @Override // java.util.Collection, java.util.List
    public final int hashCode() {
        int size = size();
        int i5 = 1;
        for (int i11 = 0; i11 < size; i11++) {
            i5 = ~(~(get(i11).hashCode() + (i5 * 31)));
        }
        return i5;
    }

    public int indexOf(Object obj) {
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

    @Override // xk.q0, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public Iterator iterator() {
        return listIterator(0);
    }

    @Override // xk.q0
    /* renamed from: j */
    public final lh.h iterator() {
        return listIterator(0);
    }

    public int lastIndexOf(Object obj) {
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
    /* renamed from: q, reason: merged with bridge method [inline-methods] */
    public final l0 listIterator(int i5) {
        vk.b0.h(i5, size());
        return isEmpty() ? f96030b : new l0(this, i5);
    }

    @Override // java.util.List
    public final Object remove(int i5) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.List
    public final Object set(int i5, Object obj) {
        throw new UnsupportedOperationException();
    }

    public v0 u() {
        return size() <= 1 ? this : new t0(this);
    }

    @Override // java.util.List
    /* renamed from: v, reason: merged with bridge method [inline-methods] */
    public v0 subList(int i5, int i11) {
        vk.b0.i(i5, i11, size());
        int i12 = i11 - i5;
        return i12 == size() ? this : i12 == 0 ? r2.f96007e : new u0(this, i5, i12);
    }

    public ListIterator listIterator() {
        return listIterator(0);
    }
}
