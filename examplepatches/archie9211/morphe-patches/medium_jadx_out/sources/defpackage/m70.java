package defpackage;

import java.lang.reflect.Array;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m70 extends s1 {
    public static final Object[] d = new Object[0];
    public int a;
    public Object[] b;
    public int c;

    public m70(int i) {
        Object[] objArr;
        if (i == 0) {
            objArr = d;
        } else {
            if (i <= 0) {
                ay0.e(b09.w(i, "Illegal Capacity: "));
                throw null;
            }
            objArr = new Object[i];
        }
        this.b = objArr;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.c(i, i2);
        if (i == this.c) {
            addLast(obj);
            return;
        }
        if (i == 0) {
            addFirst(obj);
            return;
        }
        u();
        f(this.c + 1);
        int iT = t(this.a + i);
        int i3 = this.c;
        if (i < ((i3 + 1) >> 1)) {
            int length = iT == 0 ? this.b.length - 1 : iT - 1;
            int i4 = this.a;
            int length2 = i4 == 0 ? this.b.length - 1 : i4 - 1;
            Object[] objArr = this.b;
            if (length >= i4) {
                objArr[length2] = objArr[i4];
                k80.g0(i4, i4 + 1, length + 1, objArr, objArr);
            } else {
                k80.g0(i4 - 1, i4, objArr.length, objArr, objArr);
                Object[] objArr2 = this.b;
                objArr2[objArr2.length - 1] = objArr2[0];
                k80.g0(0, 1, length + 1, objArr2, objArr2);
            }
            this.b[length] = obj;
            this.a = length2;
        } else {
            int iT2 = t(i3 + this.a);
            Object[] objArr3 = this.b;
            if (iT < iT2) {
                k80.g0(iT + 1, iT, iT2, objArr3, objArr3);
            } else {
                k80.g0(1, 0, iT2, objArr3, objArr3);
                Object[] objArr4 = this.b;
                objArr4[0] = objArr4[objArr4.length - 1];
                k80.g0(iT + 1, iT, objArr4.length - 1, objArr4, objArr4);
            }
            this.b[iT] = obj;
        }
        this.c++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        collection.getClass();
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.c(i, i2);
        if (collection.isEmpty()) {
            return false;
        }
        if (i == this.c) {
            return addAll(collection);
        }
        u();
        f(collection.size() + this.c);
        int iT = t(this.c + this.a);
        int iT2 = t(this.a + i);
        int size = collection.size();
        if (i >= ((this.c + 1) >> 1)) {
            int i3 = iT2 + size;
            Object[] objArr = this.b;
            if (iT2 < iT) {
                int i4 = size + iT;
                if (i4 <= objArr.length) {
                    k80.g0(i3, iT2, iT, objArr, objArr);
                } else if (i3 >= objArr.length) {
                    k80.g0(i3 - objArr.length, iT2, iT, objArr, objArr);
                } else {
                    int length = iT - (i4 - objArr.length);
                    k80.g0(0, length, iT, objArr, objArr);
                    Object[] objArr2 = this.b;
                    k80.g0(i3, iT2, length, objArr2, objArr2);
                }
            } else {
                k80.g0(size, 0, iT, objArr, objArr);
                Object[] objArr3 = this.b;
                if (i3 >= objArr3.length) {
                    k80.g0(i3 - objArr3.length, iT2, objArr3.length, objArr3, objArr3);
                } else {
                    k80.g0(0, objArr3.length - size, objArr3.length, objArr3, objArr3);
                    Object[] objArr4 = this.b;
                    k80.g0(i3, iT2, objArr4.length - size, objArr4, objArr4);
                }
            }
            d(iT2, collection);
            return true;
        }
        int i5 = this.a;
        int length2 = i5 - size;
        Object[] objArr5 = this.b;
        if (iT2 < i5) {
            k80.g0(length2, i5, objArr5.length, objArr5, objArr5);
            Object[] objArr6 = this.b;
            if (size >= iT2) {
                k80.g0(objArr6.length - size, 0, iT2, objArr6, objArr6);
            } else {
                k80.g0(objArr6.length - size, 0, size, objArr6, objArr6);
                Object[] objArr7 = this.b;
                k80.g0(0, size, iT2, objArr7, objArr7);
            }
        } else if (length2 >= 0) {
            k80.g0(length2, i5, iT2, objArr5, objArr5);
        } else {
            length2 += objArr5.length;
            int i6 = iT2 - i5;
            int length3 = objArr5.length - length2;
            if (length3 >= i6) {
                k80.g0(length2, i5, iT2, objArr5, objArr5);
            } else {
                k80.g0(length2, i5, i5 + length3, objArr5, objArr5);
                Object[] objArr8 = this.b;
                k80.g0(0, this.a + length3, iT2, objArr8, objArr8);
            }
        }
        this.a = length2;
        d(r(iT2 - size), collection);
        return true;
    }

    public final void addFirst(Object obj) {
        u();
        f(this.c + 1);
        int length = this.a;
        if (length == 0) {
            length = this.b.length;
        }
        int i = length - 1;
        this.a = i;
        this.b[i] = obj;
        this.c++;
    }

    public final void addLast(Object obj) {
        u();
        f(this.c + 1);
        this.b[t(this.c + this.a)] = obj;
        this.c++;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        if (!isEmpty()) {
            u();
            s(this.a, t(this.c + this.a));
        }
        this.a = 0;
        this.c = 0;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(int i, Collection collection) {
        Iterator it2 = collection.iterator();
        int length = this.b.length;
        while (i < length && it2.hasNext()) {
            this.b[i] = it2.next();
            i++;
        }
        int i2 = this.a;
        for (int i3 = 0; i3 < i2 && it2.hasNext(); i3++) {
            this.b[i3] = it2.next();
        }
        this.c = collection.size() + this.c;
    }

    public final void f(int i) {
        if (i < 0) {
            ygf.f("Deque is too big.");
            return;
        }
        Object[] objArr = this.b;
        if (i <= objArr.length) {
            return;
        }
        if (objArr == d) {
            if (i < 10) {
                i = 10;
            }
            this.b = new Object[i];
            return;
        }
        g1 g1Var = k1.Companion;
        int length = objArr.length;
        g1Var.getClass();
        Object[] objArr2 = new Object[g1.e(length, i)];
        Object[] objArr3 = this.b;
        k80.g0(0, this.a, objArr3.length, objArr3, objArr2);
        Object[] objArr4 = this.b;
        int length2 = objArr4.length;
        int i2 = this.a;
        k80.g0(length2 - i2, 0, i2, objArr4, objArr2);
        this.a = 0;
        this.b = objArr2;
    }

    public final Object first() {
        if (!isEmpty()) {
            return this.b[this.a];
        }
        ywb.h("ArrayDeque is empty.");
        return null;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        return this.b[t(this.a + i)];
    }

    @Override // defpackage.s1
    public final int getSize() {
        return this.c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        int i;
        int iT = t(this.c + this.a);
        int length = this.a;
        if (length < iT) {
            while (length < iT) {
                if (g76.L(obj, this.b[length])) {
                    i = this.a;
                } else {
                    length++;
                }
            }
            return -1;
        }
        if (length < iT) {
            return -1;
        }
        int length2 = this.b.length;
        while (true) {
            if (length >= length2) {
                for (int i2 = 0; i2 < iT; i2++) {
                    if (g76.L(obj, this.b[i2])) {
                        length = i2 + this.b.length;
                        i = this.a;
                    }
                }
                return -1;
            }
            if (g76.L(obj, this.b[length])) {
                i = this.a;
                break;
            }
            length++;
        }
        return length - i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean isEmpty() {
        return getSize() == 0;
    }

    public final Object last() {
        if (isEmpty()) {
            ywb.h("ArrayDeque is empty.");
            return null;
        }
        return this.b[t((getSize() - 1) + this.a)];
    }

    @Override // java.util.AbstractList, java.util.List
    public final int lastIndexOf(Object obj) {
        int length;
        int i;
        int iT = t(this.c + this.a);
        int i2 = this.a;
        if (i2 < iT) {
            length = iT - 1;
            if (i2 <= length) {
                while (!g76.L(obj, this.b[length])) {
                    if (length != i2) {
                        length--;
                    }
                }
                i = this.a;
                return length - i;
            }
            return -1;
        }
        if (i2 > iT) {
            while (true) {
                iT--;
                Object[] objArr = this.b;
                if (-1 >= iT) {
                    length = objArr.length - 1;
                    int i3 = this.a;
                    if (i3 <= length) {
                        while (!g76.L(obj, this.b[length])) {
                            if (length != i3) {
                                length--;
                            }
                        }
                        i = this.a;
                    }
                } else if (g76.L(obj, objArr[iT])) {
                    length = iT + this.b.length;
                    i = this.a;
                    break;
                }
            }
            return length - i;
        }
        return -1;
    }

    public final Object m() {
        if (isEmpty()) {
            return null;
        }
        return this.b[this.a];
    }

    public final int p(int i) {
        if (i == this.b.length - 1) {
            return 0;
        }
        return i + 1;
    }

    public final Object q() {
        if (isEmpty()) {
            return null;
        }
        return this.b[t((getSize() - 1) + this.a)];
    }

    public final int r(int i) {
        return i < 0 ? i + this.b.length : i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        int iIndexOf = indexOf(obj);
        if (iIndexOf == -1) {
            return false;
        }
        removeAt(iIndexOf);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        int iT;
        Object[] objArr;
        collection.getClass();
        boolean z = false;
        z = false;
        z = false;
        if (!isEmpty() && this.b.length != 0) {
            int iT2 = t(this.c + this.a);
            int i = this.a;
            if (i < iT2) {
                iT = i;
                while (true) {
                    objArr = this.b;
                    if (i >= iT2) {
                        break;
                    }
                    Object obj = objArr[i];
                    if (collection.contains(obj)) {
                        z = true;
                    } else {
                        this.b[iT] = obj;
                        iT++;
                    }
                    i++;
                }
                Arrays.fill(objArr, iT, iT2, (Object) null);
            } else {
                int length = this.b.length;
                boolean z2 = false;
                int i2 = i;
                while (i < length) {
                    Object[] objArr2 = this.b;
                    Object obj2 = objArr2[i];
                    objArr2[i] = null;
                    if (collection.contains(obj2)) {
                        z2 = true;
                    } else {
                        this.b[i2] = obj2;
                        i2++;
                    }
                    i++;
                }
                iT = t(i2);
                for (int i3 = 0; i3 < iT2; i3++) {
                    Object[] objArr3 = this.b;
                    Object obj3 = objArr3[i3];
                    objArr3[i3] = null;
                    if (collection.contains(obj3)) {
                        z2 = true;
                    } else {
                        this.b[iT] = obj3;
                        iT = p(iT);
                    }
                }
                z = z2;
            }
            if (z) {
                u();
                this.c = r(iT - this.a);
            }
        }
        return z;
    }

    @Override // defpackage.s1
    public final Object removeAt(int i) {
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        if (i == getSize() - 1) {
            return removeLast();
        }
        if (i == 0) {
            return removeFirst();
        }
        u();
        int iT = t(this.a + i);
        Object[] objArr = this.b;
        Object obj = objArr[iT];
        int i3 = this.c >> 1;
        int i4 = this.a;
        if (i < i3) {
            if (iT >= i4) {
                k80.g0(i4 + 1, i4, iT, objArr, objArr);
            } else {
                k80.g0(1, 0, iT, objArr, objArr);
                Object[] objArr2 = this.b;
                objArr2[0] = objArr2[objArr2.length - 1];
                int i5 = this.a;
                k80.g0(i5 + 1, i5, objArr2.length - 1, objArr2, objArr2);
            }
            Object[] objArr3 = this.b;
            int i6 = this.a;
            objArr3[i6] = null;
            this.a = p(i6);
        } else {
            int iT2 = t((getSize() - 1) + i4);
            Object[] objArr4 = this.b;
            if (iT <= iT2) {
                k80.g0(iT, iT + 1, iT2 + 1, objArr4, objArr4);
            } else {
                k80.g0(iT, iT + 1, objArr4.length, objArr4, objArr4);
                Object[] objArr5 = this.b;
                objArr5[objArr5.length - 1] = objArr5[0];
                k80.g0(0, 1, iT2 + 1, objArr5, objArr5);
            }
            this.b[iT2] = null;
        }
        this.c--;
        return obj;
    }

    public final Object removeFirst() {
        if (isEmpty()) {
            ywb.h("ArrayDeque is empty.");
            return null;
        }
        u();
        Object[] objArr = this.b;
        int i = this.a;
        Object obj = objArr[i];
        objArr[i] = null;
        this.a = p(i);
        this.c--;
        return obj;
    }

    public final Object removeLast() {
        if (isEmpty()) {
            ywb.h("ArrayDeque is empty.");
            return null;
        }
        u();
        int iT = t((getSize() - 1) + this.a);
        Object[] objArr = this.b;
        Object obj = objArr[iT];
        objArr[iT] = null;
        this.c--;
        return obj;
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        g1 g1Var = k1.Companion;
        int i3 = this.c;
        g1Var.getClass();
        g1.d(i, i2, i3);
        int i4 = i2 - i;
        if (i4 == 0) {
            return;
        }
        if (i4 == this.c) {
            clear();
            return;
        }
        if (i4 == 1) {
            removeAt(i);
            return;
        }
        u();
        int i5 = this.c - i2;
        int i6 = this.a;
        int i7 = this.a;
        if (i < i5) {
            int iT = t((i - 1) + i6);
            int iT2 = t((i2 - 1) + i7);
            while (i > 0) {
                int i8 = iT + 1;
                int iMin = Math.min(i, Math.min(i8, iT2 + 1));
                Object[] objArr = this.b;
                int i9 = iT2 - iMin;
                int i10 = iT - iMin;
                k80.g0(i9 + 1, i10 + 1, i8, objArr, objArr);
                iT = r(i10);
                iT2 = r(i9);
                i -= iMin;
            }
            int iT3 = t(this.a + i4);
            s(this.a, iT3);
            this.a = iT3;
        } else {
            int iT4 = t(i6 + i2);
            int iT5 = t(i7 + i);
            int i11 = this.c;
            while (true) {
                i11 -= i2;
                if (i11 <= 0) {
                    break;
                }
                Object[] objArr2 = this.b;
                i2 = Math.min(i11, Math.min(objArr2.length - iT4, objArr2.length - iT5));
                Object[] objArr3 = this.b;
                int i12 = iT4 + i2;
                k80.g0(iT5, iT4, i12, objArr3, objArr3);
                iT4 = t(i12);
                iT5 = t(iT5 + i2);
            }
            int iT6 = t(this.c + this.a);
            s(r(iT6 - i4), iT6);
        }
        this.c -= i4;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection collection) {
        int iT;
        Object[] objArr;
        collection.getClass();
        boolean z = false;
        z = false;
        z = false;
        if (!isEmpty() && this.b.length != 0) {
            int iT2 = t(this.c + this.a);
            int i = this.a;
            if (i < iT2) {
                iT = i;
                while (true) {
                    objArr = this.b;
                    if (i >= iT2) {
                        break;
                    }
                    Object obj = objArr[i];
                    if (collection.contains(obj)) {
                        this.b[iT] = obj;
                        iT++;
                    } else {
                        z = true;
                    }
                    i++;
                }
                Arrays.fill(objArr, iT, iT2, (Object) null);
            } else {
                int length = this.b.length;
                boolean z2 = false;
                int i2 = i;
                while (i < length) {
                    Object[] objArr2 = this.b;
                    Object obj2 = objArr2[i];
                    objArr2[i] = null;
                    if (collection.contains(obj2)) {
                        this.b[i2] = obj2;
                        i2++;
                    } else {
                        z2 = true;
                    }
                    i++;
                }
                iT = t(i2);
                for (int i3 = 0; i3 < iT2; i3++) {
                    Object[] objArr3 = this.b;
                    Object obj3 = objArr3[i3];
                    objArr3[i3] = null;
                    if (collection.contains(obj3)) {
                        this.b[iT] = obj3;
                        iT = p(iT);
                    } else {
                        z2 = true;
                    }
                }
                z = z2;
            }
            if (z) {
                u();
                this.c = r(iT - this.a);
            }
        }
        return z;
    }

    public final void s(int i, int i2) {
        Object[] objArr = this.b;
        if (i < i2) {
            Arrays.fill(objArr, i, i2, (Object) null);
        } else {
            Arrays.fill(objArr, i, objArr.length, (Object) null);
            Arrays.fill(this.b, 0, i2, (Object) null);
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        g1 g1Var = k1.Companion;
        int i2 = this.c;
        g1Var.getClass();
        g1.b(i, i2);
        int iT = t(this.a + i);
        Object[] objArr = this.b;
        Object obj2 = objArr[iT];
        objArr[iT] = obj;
        return obj2;
    }

    public final int t(int i) {
        Object[] objArr = this.b;
        return i >= objArr.length ? i - objArr.length : i;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        int length = objArr.length;
        int i = this.c;
        if (length < i) {
            Object objNewInstance = Array.newInstance(objArr.getClass().getComponentType(), i);
            objNewInstance.getClass();
            objArr = (Object[]) objNewInstance;
        }
        int iT = t(this.c + this.a);
        int i2 = this.a;
        if (i2 < iT) {
            k80.j0(i2, iT, 2, this.b, objArr);
        } else if (!isEmpty()) {
            Object[] objArr2 = this.b;
            k80.g0(0, this.a, objArr2.length, objArr2, objArr);
            Object[] objArr3 = this.b;
            k80.g0(objArr3.length - this.a, 0, iT, objArr3, objArr);
        }
        int i3 = this.c;
        if (i3 < objArr.length) {
            objArr[i3] = null;
        }
        return objArr;
    }

    public final void u() {
        ((AbstractList) this).modCount++;
    }

    public m70() {
        this.b = d;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final Object[] toArray() {
        return toArray(new Object[getSize()]);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        addLast(obj);
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        collection.getClass();
        if (collection.isEmpty()) {
            return false;
        }
        u();
        f(collection.size() + this.c);
        d(t(this.c + this.a), collection);
        return true;
    }
}
