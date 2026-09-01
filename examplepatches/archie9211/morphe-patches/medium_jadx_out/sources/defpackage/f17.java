package defpackage;

import java.io.NotSerializableException;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class f17 extends s1 implements RandomAccess, Serializable {
    public static final f17 d;
    public Object[] a;
    public int b;
    public boolean c;

    static {
        f17 f17Var = new f17(0);
        f17Var.c = true;
        d = f17Var;
    }

    public f17(int i) {
        if (i >= 0) {
            this.a = new Object[i];
        } else {
            ay0.e("capacity must be non-negative.");
            throw null;
        }
    }

    private final Object writeReplace() throws NotSerializableException {
        if (this.c) {
            return new e0c(this, 0);
        }
        throw new NotSerializableException("The list cannot be serialized while it is being built.");
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.c(i, i2);
        ((AbstractList) this).modCount++;
        q(i, 1);
        this.a[i] = obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        collection.getClass();
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.c(i, i2);
        int size = collection.size();
        f(i, collection, size);
        return size > 0;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        p();
        s(0, this.b);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            Object[] objArr = this.a;
            int i = this.b;
            if (i == list.size()) {
                for (int i2 = 0; i2 < i; i2++) {
                    if (g76.L(objArr[i2], list.get(i2))) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final void f(int i, Collection collection, int i2) {
        ((AbstractList) this).modCount++;
        q(i, i2);
        Iterator it2 = collection.iterator();
        for (int i3 = 0; i3 < i2; i3++) {
            this.a[i + i3] = it2.next();
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.b(i, i2);
        return this.a[i];
    }

    @Override // defpackage.s1
    public final int getSize() {
        return this.b;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        Object[] objArr = this.a;
        int i = this.b;
        int iHashCode = 1;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = objArr[i2];
            iHashCode = (iHashCode * 31) + (obj != null ? obj.hashCode() : 0);
        }
        return iHashCode;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        for (int i = 0; i < this.b; i++) {
            if (g76.L(this.a[i], obj)) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return this.b == 0;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        for (int i = this.b - 1; i >= 0; i--) {
            if (g76.L(this.a[i], obj)) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.c(i, i2);
        return new wn5(this, i);
    }

    public final void m(int i, Object obj) {
        ((AbstractList) this).modCount++;
        q(i, 1);
        this.a[i] = obj;
    }

    public final void p() {
        if (this.c) {
            rd6.b();
        }
    }

    public final void q(int i, int i2) {
        int i3 = this.b + i2;
        if (i3 < 0) {
            throw new OutOfMemoryError();
        }
        Object[] objArrCopyOf = this.a;
        if (i3 > objArrCopyOf.length) {
            g1 g1Var = k1.Companion;
            int length = objArrCopyOf.length;
            g1Var.getClass();
            int iE = g1.e(length, i3);
            Object[] objArr = this.a;
            objArr.getClass();
            objArrCopyOf = Arrays.copyOf(objArr, iE);
            this.a = objArrCopyOf;
        }
        k80.g0(i + i2, i, this.b, objArrCopyOf, objArrCopyOf);
        this.b += i2;
    }

    public final Object r(int i) {
        ((AbstractList) this).modCount++;
        Object[] objArr = this.a;
        Object obj = objArr[i];
        k80.g0(i, i + 1, this.b, objArr, objArr);
        Object[] objArr2 = this.a;
        int i2 = this.b - 1;
        objArr2.getClass();
        objArr2[i2] = null;
        this.b--;
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        p();
        int iIndexOf = indexOf(obj);
        if (iIndexOf >= 0) {
            removeAt(iIndexOf);
        }
        return iIndexOf >= 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        collection.getClass();
        p();
        return t(0, this.b, collection, false) > 0;
    }

    @Override // defpackage.s1
    public final Object removeAt(int i) {
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.b(i, i2);
        return r(i);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        p();
        return t(0, this.b, collection, true) > 0;
    }

    public final void s(int i, int i2) {
        if (i2 > 0) {
            ((AbstractList) this).modCount++;
        }
        Object[] objArr = this.a;
        k80.g0(i, i + i2, this.b, objArr, objArr);
        Object[] objArr2 = this.a;
        int i3 = this.b;
        w2g.I(i3 - i2, i3, objArr2);
        this.b -= i2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.b;
        g1Var.getClass();
        g1.b(i, i2);
        Object[] objArr = this.a;
        Object obj2 = objArr[i];
        objArr[i] = obj;
        return obj2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final List subList(int i, int i2) {
        g1 g1Var = k1.Companion;
        int i3 = this.b;
        g1Var.getClass();
        g1.d(i, i2, i3);
        return new e17(this.a, i, i2 - i, null, this);
    }

    public final int t(int i, int i2, Collection collection, boolean z) {
        Object[] objArr;
        int i3 = 0;
        int i4 = 0;
        while (true) {
            objArr = this.a;
            if (i3 >= i2) {
                break;
            }
            int i5 = i + i3;
            if (collection.contains(objArr[i5]) == z) {
                Object[] objArr2 = this.a;
                i3++;
                objArr2[i4 + i] = objArr2[i5];
                i4++;
            } else {
                i3++;
            }
        }
        int i6 = i2 - i4;
        k80.g0(i + i4, i2 + i, this.b, objArr, objArr);
        Object[] objArr3 = this.a;
        int i7 = this.b;
        w2g.I(i7 - i6, i7, objArr3);
        if (i6 > 0) {
            ((AbstractList) this).modCount++;
        }
        this.b -= i6;
        return i6;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        int length = objArr.length;
        int i = this.b;
        Object[] objArr2 = this.a;
        if (length < i) {
            Object[] objArrCopyOfRange = Arrays.copyOfRange(objArr2, 0, i, objArr.getClass());
            objArrCopyOfRange.getClass();
            return objArrCopyOfRange;
        }
        k80.g0(0, 0, i, objArr2, objArr);
        int i2 = this.b;
        if (i2 < objArr.length) {
            objArr[i2] = null;
        }
        return objArr;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return w2g.M(this.a, 0, this.b, this);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        p();
        int i = this.b;
        ((AbstractList) this).modCount++;
        q(i, 1);
        this.a[i] = obj;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        collection.getClass();
        p();
        int size = collection.size();
        f(this.b, collection, size);
        return size > 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return k80.m0(0, this.b, this.a);
    }
}
