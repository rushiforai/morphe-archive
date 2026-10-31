package xk;

import java.io.Serializable;
import java.util.AbstractCollection;
import java.util.Collection;

/* loaded from: classes.dex */
public abstract class q0 extends AbstractCollection implements Serializable {

    /* renamed from: a, reason: collision with root package name */
    public static final Object[] f95992a = new Object[0];

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean addAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    public v0 c() {
        if (isEmpty()) {
            l0 l0Var = v0.f96030b;
            return r2.f96007e;
        }
        Object[] array = toArray(f95992a);
        l0 l0Var2 = v0.f96030b;
        return v0.k(array.length, array);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public abstract boolean contains(Object obj);

    public int d(Object[] objArr, int i5) {
        lh.h it = iterator();
        while (it.hasNext()) {
            objArr[i5] = it.next();
            i5++;
        }
        return i5;
    }

    public Object[] e() {
        return null;
    }

    public int f() {
        throw new UnsupportedOperationException();
    }

    public int g() {
        throw new UnsupportedOperationException();
    }

    public abstract boolean h();

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    /* renamed from: j, reason: merged with bridge method [inline-methods] */
    public abstract lh.h iterator();

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean remove(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean removeAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean retainAll(Collection collection) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray() {
        return toArray(f95992a);
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        int size = size();
        if (objArr.length < size) {
            Object[] objArrE = e();
            if (objArrE != null) {
                return w.d(g(), f(), objArrE, objArr);
            }
            objArr = w.q(size, objArr);
        } else if (objArr.length > size) {
            objArr[size] = null;
        }
        d(objArr, 0);
        return objArr;
    }
}
