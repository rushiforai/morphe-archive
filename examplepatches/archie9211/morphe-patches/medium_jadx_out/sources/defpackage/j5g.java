package defpackage;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j5g extends e3g implements RandomAccess, o5g {
    public static final int[] d;
    public static final j5g e;
    public int[] b;
    public int c;

    static {
        int[] iArr = new int[0];
        d = iArr;
        e = new j5g(iArr, 0, false);
    }

    public j5g(int[] iArr, int i, boolean z) {
        super(z);
        this.b = iArr;
        this.c = i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i, Object obj) {
        int i2;
        int iIntValue = ((Integer) obj).intValue();
        d();
        if (i < 0 || i > (i2 = this.c)) {
            z10.i(ev6.v("Index:", i, this.c, ", Size:"));
            return;
        }
        int i3 = i + 1;
        int[] iArr = this.b;
        int length = iArr.length;
        if (i2 < length) {
            System.arraycopy(iArr, i, iArr, i3, i2 - i);
        } else {
            int[] iArr2 = new int[wgd.n(length, 3, 2, 1, 10)];
            System.arraycopy(this.b, 0, iArr2, 0, i);
            System.arraycopy(this.b, i, iArr2, i3, this.c - i);
            this.b = iArr2;
        }
        this.b[i] = iIntValue;
        this.c++;
        ((AbstractList) this).modCount++;
    }

    @Override // defpackage.e3g, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        collection.getClass();
        if (!(collection instanceof j5g)) {
            return super.addAll(collection);
        }
        j5g j5gVar = (j5g) collection;
        int i = j5gVar.c;
        if (i == 0) {
            return false;
        }
        int i2 = this.c;
        if (Integer.MAX_VALUE - i2 < i) {
            throw new OutOfMemoryError();
        }
        int i3 = i2 + i;
        int[] iArrCopyOf = this.b;
        if (i3 > iArrCopyOf.length) {
            iArrCopyOf = Arrays.copyOf(iArrCopyOf, i3);
            this.b = iArrCopyOf;
        }
        System.arraycopy(j5gVar.b, 0, iArrCopyOf, this.c, j5gVar.c);
        this.c = i3;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final int e(int i) {
        p(i);
        return this.b[i];
    }

    @Override // defpackage.e3g, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j5g)) {
            return super.equals(obj);
        }
        j5g j5gVar = (j5g) obj;
        if (this.c == j5gVar.c) {
            int[] iArr = j5gVar.b;
            for (int i = 0; i < this.c; i++) {
                if (this.b[i] == iArr[i]) {
                }
            }
            return true;
        }
        return false;
    }

    @Override // defpackage.q5g
    /* JADX INFO: renamed from: f, reason: merged with bridge method [inline-methods] */
    public final j5g c(int i) {
        if (i >= this.c) {
            return new j5g(i == 0 ? d : Arrays.copyOf(this.b, i), this.c, true);
        }
        lg8.r();
        return null;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i) {
        p(i);
        return Integer.valueOf(this.b[i]);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i = 1;
        for (int i2 = 0; i2 < this.c; i2++) {
            i = (i * 31) + this.b[i2];
        }
        return i;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i = this.c;
        for (int i2 = 0; i2 < i; i2++) {
            if (this.b[i2] == iIntValue) {
                return i2;
            }
        }
        return -1;
    }

    public final void m(int i) {
        d();
        int i2 = this.c;
        int[] iArr = this.b;
        int length = iArr.length;
        if (i2 == length) {
            iArr = new int[wgd.n(length, 3, 2, 1, 10)];
            System.arraycopy(this.b, 0, iArr, 0, this.c);
            this.b = iArr;
        }
        int i3 = this.c;
        this.c = i3 + 1;
        iArr[i3] = i;
    }

    public final void p(int i) {
        if (i < 0 || i >= this.c) {
            z10.i(ev6.v("Index:", i, this.c, ", Size:"));
        }
    }

    @Override // defpackage.e3g, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i) {
        d();
        p(i);
        int[] iArr = this.b;
        int i2 = iArr[i];
        if (i < this.c - 1) {
            System.arraycopy(iArr, i + 1, iArr, i, (r2 - i) - 1);
        }
        this.c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i2);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i, int i2) {
        d();
        if (i2 < i) {
            z10.i("toIndex < fromIndex");
            return;
        }
        int[] iArr = this.b;
        System.arraycopy(iArr, i2, iArr, i, this.c - i2);
        this.c -= i2 - i;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        d();
        p(i);
        int[] iArr = this.b;
        int i2 = iArr[i];
        iArr[i] = iIntValue;
        return Integer.valueOf(i2);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        m(((Integer) obj).intValue());
        return true;
    }
}
