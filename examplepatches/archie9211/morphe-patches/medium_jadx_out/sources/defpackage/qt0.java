package defpackage;

import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qt0 extends a2 implements m56, RandomAccess, s0a {
    public static final qt0 d;
    public boolean[] b;
    public int c;

    static {
        qt0 qt0Var = new qt0(new boolean[0], 0);
        d = qt0Var;
        qt0Var.a = false;
    }

    public qt0(boolean[] zArr, int i) {
        this.b = zArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        d();
        if (i < 0 || i > (i2 = this.c)) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
            return;
        }
        boolean[] zArr = this.b;
        if (i2 < zArr.length) {
            System.arraycopy(zArr, i, zArr, i + 1, i2 - i);
        } else {
            boolean[] zArr2 = new boolean[((i2 * 3) / 2) + 1];
            System.arraycopy(zArr, 0, zArr2, 0, i);
            System.arraycopy(this.b, i, zArr2, i + 1, this.c - i);
            this.b = zArr2;
        }
        this.b[i] = zBooleanValue;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.a2, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        Charset charset = v56.a;
        collection.getClass();
        if (!(collection instanceof qt0)) {
            return super.addAll(collection);
        }
        qt0 qt0Var = (qt0) collection;
        int i = qt0Var.c;
        if (i == 0) {
            return false;
        }
        int i2 = this.c;
        if (Integer.MAX_VALUE - i2 < i) {
            throw new OutOfMemoryError();
        }
        int i3 = i2 + i;
        boolean[] zArrCopyOf = this.b;
        if (i3 > zArrCopyOf.length) {
            zArrCopyOf = Arrays.copyOf(zArrCopyOf, i3);
            this.b = zArrCopyOf;
        }
        System.arraycopy(qt0Var.b, 0, zArrCopyOf, this.c, qt0Var.c);
        this.c = i3;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void e(boolean z) {
        d();
        int i = this.c;
        boolean[] zArr = this.b;
        if (i == zArr.length) {
            boolean[] zArr2 = new boolean[((i * 3) / 2) + 1];
            System.arraycopy(zArr, 0, zArr2, 0, i);
            this.b = zArr2;
            zArr = zArr2;
        }
        int i2 = this.c;
        this.c = i2 + 1;
        zArr[i2] = z;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qt0)) {
            return super.equals(obj);
        }
        qt0 qt0Var = (qt0) obj;
        if (this.c != qt0Var.c) {
            return false;
        }
        boolean[] zArr = qt0Var.b;
        for (int i = 0; i < this.c; i++) {
            if (this.b[i] != zArr[i]) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i) {
        if (i < 0 || i >= this.c) {
            ik4.e(this.c, ev6.C("Index:", i, ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i) {
        f(i);
        return Boolean.valueOf(this.b[i]);
    }

    @Override // defpackage.t56
    public final t56 h(int i) {
        if (i >= this.c) {
            return new qt0(Arrays.copyOf(this.b, i), this.c);
        }
        lg8.r();
        return null;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.c; i2++) {
            int i3 = i * 31;
            boolean z = this.b[i2];
            Charset charset = v56.a;
            i = i3 + (z ? 1231 : 1237);
        }
        return i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Boolean)) {
            return -1;
        }
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        int i = this.c;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.b[i2] == zBooleanValue) {
                return i2;
            }
        }
        return -1;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.List
    public final Object remove(int i) {
        d();
        f(i);
        boolean[] zArr = this.b;
        boolean z = zArr[i];
        if (i < this.c - 1) {
            System.arraycopy(zArr, i + 1, zArr, i, (r2 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return Boolean.valueOf(z);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        d();
        if (i2 < i) {
            z10.i("toIndex < fromIndex");
            return;
        }
        boolean[] zArr = this.b;
        System.arraycopy(zArr, i2, zArr, i, this.c - i2);
        this.c -= i2 - i;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i, Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        d();
        f(i);
        boolean[] zArr = this.b;
        boolean z = zArr[i];
        zArr[i] = zBooleanValue;
        return Boolean.valueOf(z);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // defpackage.a2, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        e(((Boolean) obj).booleanValue());
        return true;
    }
}
