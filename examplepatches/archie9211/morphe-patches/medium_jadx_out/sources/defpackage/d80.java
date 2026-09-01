package defpackage;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d80 implements Collection, Set, uh6, ii6 {
    public int[] a;
    public Object[] b;
    public int c;

    public d80(int i) {
        this.a = vc2.f;
        this.b = vc2.h;
        if (i > 0) {
            this.a = new int[i];
            this.b = new Object[i];
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean add(Object obj) {
        int i;
        int iO;
        int i2 = this.c;
        if (obj == null) {
            iO = sgg.O(this, null, 0);
            i = 0;
        } else {
            int iHashCode = obj.hashCode();
            i = iHashCode;
            iO = sgg.O(this, obj, iHashCode);
        }
        if (iO >= 0) {
            return false;
        }
        int i3 = ~iO;
        int[] iArr = this.a;
        if (i2 >= iArr.length) {
            int i4 = 8;
            if (i2 >= 8) {
                i4 = (i2 >> 1) + i2;
            } else if (i2 < 4) {
                i4 = 4;
            }
            Object[] objArr = this.b;
            int[] iArr2 = new int[i4];
            this.a = iArr2;
            this.b = new Object[i4];
            if (i2 != this.c) {
                z10.g();
                return false;
            }
            if (iArr2.length != 0) {
                k80.k0(0, iArr.length, iArr, iArr2, 6);
                k80.j0(0, objArr.length, 6, objArr, this.b);
            }
        }
        if (i3 < i2) {
            int[] iArr3 = this.a;
            int i5 = i3 + 1;
            k80.h0(i5, i3, iArr3, iArr3, i2);
            Object[] objArr2 = this.b;
            k80.g0(i5, i3, i2, objArr2, objArr2);
        }
        int i6 = this.c;
        if (i2 == i6) {
            int[] iArr4 = this.a;
            if (i3 < iArr4.length) {
                iArr4[i3] = i;
                this.b[i3] = obj;
                this.c = i6 + 1;
                return true;
            }
        }
        z10.g();
        return false;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean addAll(Collection collection) {
        collection.getClass();
        int size = collection.size() + this.c;
        int i = this.c;
        int[] iArr = this.a;
        boolean zAdd = false;
        if (iArr.length < size) {
            Object[] objArr = this.b;
            int[] iArr2 = new int[size];
            this.a = iArr2;
            this.b = new Object[size];
            if (i > 0) {
                k80.k0(0, i, iArr, iArr2, 6);
                k80.j0(0, this.c, 6, objArr, this.b);
            }
        }
        if (this.c != i) {
            z10.g();
            return false;
        }
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            zAdd |= add(it2.next());
        }
        return zAdd;
    }

    @Override // java.util.Collection, java.util.Set
    public final void clear() {
        int i = this.c;
        if (i != 0) {
            this.a = vc2.f;
            this.b = vc2.h;
            i = 0;
            this.c = 0;
        }
        if (i == 0) {
            return;
        }
        z10.g();
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return (obj == null ? sgg.O(this, null, 0) : sgg.O(this, obj, obj.hashCode())) >= 0;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean containsAll(Collection collection) {
        collection.getClass();
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (!contains(it2.next())) {
                return false;
            }
        }
        return true;
    }

    public final Object d(int i) {
        int i2 = this.c;
        Object[] objArr = this.b;
        Object obj = objArr[i];
        if (i2 <= 1) {
            clear();
            return obj;
        }
        int i3 = i2 - 1;
        int[] iArr = this.a;
        if (iArr.length <= 8 || i2 >= iArr.length / 3) {
            if (i < i3) {
                int i4 = i + 1;
                k80.h0(i, i4, iArr, iArr, i2);
                Object[] objArr2 = this.b;
                k80.g0(i, i4, i2, objArr2, objArr2);
            }
            this.b[i3] = null;
        } else {
            int i5 = i2 > 8 ? i2 + (i2 >> 1) : 8;
            int[] iArr2 = new int[i5];
            this.a = iArr2;
            this.b = new Object[i5];
            if (i > 0) {
                k80.k0(0, i, iArr, iArr2, 6);
                k80.j0(0, i, 6, objArr, this.b);
            }
            if (i < i3) {
                int i6 = i + 1;
                k80.h0(i, i6, iArr, this.a, i2);
                k80.g0(i, i6, i2, objArr, this.b);
            }
        }
        if (i2 == this.c) {
            this.c = i3;
            return obj;
        }
        z10.g();
        return null;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Set) || this.c != ((Set) obj).size()) {
            return false;
        }
        try {
            int i = this.c;
            for (int i2 = 0; i2 < i; i2++) {
                if (!((Set) obj).contains(this.b[i2])) {
                    return false;
                }
            }
            return true;
        } catch (ClassCastException | NullPointerException unused) {
            return false;
        }
    }

    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        int[] iArr = this.a;
        int i = this.c;
        int i2 = 0;
        for (int i3 = 0; i3 < i; i3++) {
            i2 += iArr[i3];
        }
        return i2;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return this.c <= 0;
    }

    @Override // java.util.Collection, java.lang.Iterable, java.util.Set
    public final Iterator iterator() {
        return new t70(this);
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean remove(Object obj) {
        int iO = obj == null ? sgg.O(this, null, 0) : sgg.O(this, obj, obj.hashCode());
        if (iO < 0) {
            return false;
        }
        d(iO);
        return true;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean removeAll(Collection collection) {
        collection.getClass();
        Iterator it2 = collection.iterator();
        boolean zRemove = false;
        while (it2.hasNext()) {
            zRemove |= remove(it2.next());
        }
        return zRemove;
    }

    @Override // java.util.Collection, java.util.Set
    public final boolean retainAll(Collection collection) {
        collection.getClass();
        boolean z = false;
        for (int i = this.c - 1; -1 < i; i--) {
            if (!bu1.p0(collection, this.b[i])) {
                d(i);
                z = true;
            }
        }
        return z;
    }

    @Override // java.util.Collection, java.util.Set
    public final int size() {
        return this.c;
    }

    @Override // java.util.Collection, java.util.Set
    public final Object[] toArray(Object[] objArr) {
        objArr.getClass();
        int i = this.c;
        if (objArr.length < i) {
            objArr = (Object[]) Array.newInstance(objArr.getClass().getComponentType(), i);
        } else if (objArr.length > i) {
            objArr[i] = null;
        }
        k80.g0(0, 0, this.c, this.b, objArr);
        return objArr;
    }

    public final String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.c * 14);
        sb.append('{');
        int i = this.c;
        for (int i2 = 0; i2 < i; i2++) {
            if (i2 > 0) {
                sb.append(", ");
            }
            Object obj = this.b[i2];
            if (obj != this) {
                sb.append(obj);
            } else {
                sb.append("(this Set)");
            }
        }
        sb.append('}');
        return sb.toString();
    }

    @Override // java.util.Collection, java.util.Set
    public final Object[] toArray() {
        return k80.m0(0, this.c, this.b);
    }
}
