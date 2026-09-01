package defpackage;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class puf extends AbstractList implements RandomAccess, duf {
    public static final Object[] d;
    public static final puf e;
    public boolean a;
    public Object[] b;
    public int c;

    static {
        Object[] objArr = new Object[0];
        d = objArr;
        e = new puf(objArr, 0, false);
    }

    public puf(Object[] objArr, int i, boolean z) {
        this.a = z;
        this.b = objArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        f();
        if (i < 0 || i > (i2 = this.c)) {
            z10.i(ev6.v("Index:", i, this.c, ", Size:"));
            return;
        }
        Object[] objArr = this.b;
        if (i2 < objArr.length) {
            System.arraycopy(objArr, i, objArr, i + 1, i2 - i);
        } else {
            Object[] objArr2 = new Object[wgd.n(objArr.length, 3, 2, 1, 10)];
            System.arraycopy(this.b, 0, objArr2, 0, i);
            System.arraycopy(this.b, i, objArr2, i + 1, this.c - i);
            this.b = objArr2;
        }
        this.b[i] = obj;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        f();
        return super.addAll(collection);
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final void clear() {
        f();
        super.clear();
    }

    public final boolean d(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof List)) {
            return false;
        }
        if (!(obj instanceof RandomAccess)) {
            return super.equals(obj);
        }
        List list = (List) obj;
        int size = size();
        if (size != list.size()) {
            return false;
        }
        for (int i = 0; i < size; i++) {
            if (!get(i).equals(list.get(i))) {
                return false;
            }
        }
        return true;
    }

    public final /* synthetic */ puf e(int i) {
        if (i >= this.c) {
            return new puf(i == 0 ? d : Arrays.copyOf(this.b, i), this.c, true);
        }
        lg8.r();
        return null;
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof List) {
            if (!(obj instanceof RandomAccess)) {
                return d(obj);
            }
            List list = (List) obj;
            int i = this.c;
            if (i == list.size()) {
                if (!(obj instanceof puf)) {
                    for (int i2 = 0; i2 < i; i2++) {
                        if (this.b[i2].equals(list.get(i2))) {
                        }
                    }
                    return true;
                }
                puf pufVar = (puf) obj;
                for (int i3 = 0; i3 < i; i3++) {
                    if (this.b[i3].equals(pufVar.b[i3])) {
                    }
                }
                return true;
            }
        }
        return false;
    }

    public final void f() {
        if (this.a) {
            return;
        }
        rd6.b();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        m(i);
        return this.b[i];
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i = this.c;
        int iHashCode = 1;
        for (int i2 = 0; i2 < i; i2++) {
            iHashCode = (iHashCode * 31) + this.b[i2].hashCode();
        }
        return iHashCode;
    }

    public final void m(int i) {
        if (i < 0 || i >= this.c) {
            z10.i(ev6.v("Index:", i, this.c, ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        f();
        m(i);
        Object[] objArr = this.b;
        Object obj = objArr[i];
        if (i < this.c - 1) {
            System.arraycopy(objArr, i + 1, objArr, i, (r2 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean removeAll(Collection collection) {
        f();
        return super.removeAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean retainAll(Collection collection) {
        f();
        return super.retainAll(collection);
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        f();
        m(i);
        Object[] objArr = this.b;
        Object obj2 = objArr[i];
        objArr[i] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final boolean addAll(int i, Collection collection) {
        f();
        return super.addAll(i, collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean remove(Object obj) {
        f();
        int iIndexOf = indexOf(obj);
        if (iIndexOf == -1) {
            return false;
        }
        remove(iIndexOf);
        return true;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        f();
        int i = this.c;
        Object[] objArrCopyOf = this.b;
        if (i == objArrCopyOf.length) {
            objArrCopyOf = Arrays.copyOf(this.b, wgd.n(objArrCopyOf.length, 3, 2, 1, 10));
            this.b = objArrCopyOf;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        objArrCopyOf[i2] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
