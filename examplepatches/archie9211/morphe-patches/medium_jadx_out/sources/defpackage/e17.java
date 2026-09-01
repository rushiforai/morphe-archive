package defpackage;

import java.io.InvalidObjectException;
import java.io.NotSerializableException;
import java.io.ObjectInputStream;
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
public final class e17 extends s1 implements RandomAccess, Serializable {
    public Object[] a;
    public final int b;
    public int c;
    public final e17 d;
    public final f17 e;

    public e17(Object[] objArr, int i, int i2, e17 e17Var, f17 f17Var) {
        objArr.getClass();
        this.a = objArr;
        this.b = i;
        this.c = i2;
        this.d = e17Var;
        this.e = f17Var;
        ((AbstractList) this).modCount = ((AbstractList) f17Var).modCount;
    }

    private final void readObject(ObjectInputStream objectInputStream) throws InvalidObjectException {
        throw new InvalidObjectException("Deserialization is supported via proxy only");
    }

    private final Object writeReplace() throws NotSerializableException {
        if (this.e.c) {
            return new e0c(this, 0);
        }
        throw new NotSerializableException("The list cannot be serialized while it is being built.");
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        q();
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.c(i, i2);
        m(this.b + i, obj);
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        collection.getClass();
        q();
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.c(i, i2);
        int size = collection.size();
        f(this.b + i, collection, size);
        return size > 0;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        q();
        p();
        s(this.b, this.c);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        p();
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            List list = (List) obj;
            Object[] objArr = this.a;
            int i = this.c;
            if (i == list.size()) {
                for (int i2 = 0; i2 < i; i2++) {
                    if (g76.L(objArr[this.b + i2], list.get(i2))) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final void f(int i, Collection collection, int i2) {
        ((AbstractList) this).modCount++;
        f17 f17Var = this.e;
        e17 e17Var = this.d;
        if (e17Var != null) {
            e17Var.f(i, collection, i2);
        } else {
            f17 f17Var2 = f17.d;
            f17Var.f(i, collection, i2);
        }
        this.a = f17Var.a;
        this.c += i2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        return this.a[this.b + i];
    }

    @Override // defpackage.s1
    public final int getSize() {
        p();
        return this.c;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        p();
        Object[] objArr = this.a;
        int i = this.c;
        int iHashCode = 1;
        for (int i2 = 0; i2 < i; i2++) {
            Object obj = objArr[this.b + i2];
            iHashCode = (iHashCode * 31) + (obj != null ? obj.hashCode() : 0);
        }
        return iHashCode;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        p();
        for (int i = 0; i < this.c; i++) {
            if (g76.L(this.a[this.b + i], obj)) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        p();
        return this.c == 0;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.List
    public final Iterator iterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        p();
        for (int i = this.c - 1; i >= 0; i--) {
            if (g76.L(this.a[this.b + i], obj)) {
                return i;
            }
        }
        return -1;
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator(int i) {
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.c(i, i2);
        return new wn5(this, i);
    }

    public final void m(int i, Object obj) {
        ((AbstractList) this).modCount++;
        f17 f17Var = this.e;
        e17 e17Var = this.d;
        if (e17Var != null) {
            e17Var.m(i, obj);
        } else {
            f17 f17Var2 = f17.d;
            f17Var.m(i, obj);
        }
        this.a = f17Var.a;
        this.c++;
    }

    public final void p() {
        if (((AbstractList) this.e).modCount == ((AbstractList) this).modCount) {
            return;
        }
        z10.g();
    }

    public final void q() {
        if (this.e.c) {
            rd6.b();
        }
    }

    public final Object r(int i) {
        Object objR;
        ((AbstractList) this).modCount++;
        e17 e17Var = this.d;
        if (e17Var != null) {
            objR = e17Var.r(i);
        } else {
            f17 f17Var = f17.d;
            objR = this.e.r(i);
        }
        this.c--;
        return objR;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        q();
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
        q();
        p();
        return t(this.b, this.c, collection, false) > 0;
    }

    @Override // defpackage.s1
    public final Object removeAt(int i) {
        q();
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        return r(this.b + i);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        q();
        p();
        return t(this.b, this.c, collection, true) > 0;
    }

    public final void s(int i, int i2) {
        if (i2 > 0) {
            ((AbstractList) this).modCount++;
        }
        e17 e17Var = this.d;
        if (e17Var != null) {
            e17Var.s(i, i2);
        } else {
            f17 f17Var = f17.d;
            this.e.s(i, i2);
        }
        this.c -= i2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        q();
        p();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        Object[] objArr = this.a;
        int i3 = this.b + i;
        Object obj2 = objArr[i3];
        objArr[i3] = obj;
        return obj2;
    }

    @Override // java.util.AbstractList, java.util.List
    public final List subList(int i, int i2) {
        g1 g1Var = k1.Companion;
        int i3 = this.c;
        g1Var.getClass();
        g1.d(i, i2, i3);
        return new e17(this.a, this.b + i, i2 - i, this, this.e);
    }

    public final int t(int i, int i2, Collection collection, boolean z) {
        int iT;
        e17 e17Var = this.d;
        if (e17Var != null) {
            iT = e17Var.t(i, i2, collection, z);
        } else {
            f17 f17Var = f17.d;
            iT = this.e.t(i, i2, collection, z);
        }
        if (iT > 0) {
            ((AbstractList) this).modCount++;
        }
        this.c -= iT;
        return iT;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        p();
        int length = objArr.length;
        int i = this.c;
        Object[] objArr2 = this.a;
        int i2 = this.b;
        if (length < i) {
            Object[] objArrCopyOfRange = Arrays.copyOfRange(objArr2, i2, i + i2, objArr.getClass());
            objArrCopyOfRange.getClass();
            return objArrCopyOfRange;
        }
        k80.g0(0, i2, i + i2, objArr2, objArr);
        int i3 = this.c;
        if (i3 < objArr.length) {
            objArr[i3] = null;
        }
        return objArr;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        p();
        return w2g.M(this.a, this.b, this.c, this);
    }

    @Override // java.util.AbstractList, java.util.List
    public final ListIterator listIterator() {
        return listIterator(0);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        q();
        p();
        m(this.b + this.c, obj);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        collection.getClass();
        q();
        p();
        int size = collection.size();
        f(this.b + this.c, collection, size);
        return size > 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray() {
        p();
        Object[] objArr = this.a;
        int i = this.c;
        int i2 = this.b;
        return k80.m0(i2, i + i2, objArr);
    }
}
