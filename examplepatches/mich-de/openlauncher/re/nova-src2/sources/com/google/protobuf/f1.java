package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class f1 extends d implements y0, RandomAccess, w1 {

    /* renamed from: d, reason: collision with root package name */
    public static final f1 f34857d = new f1(new long[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public long[] f34858b;

    /* renamed from: c, reason: collision with root package name */
    public int f34859c;

    public f1() {
        this(new long[10], 0, true);
    }

    public static f1 e() {
        return f34857d;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        long jLongValue = ((Long) obj).longValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f34859c)) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34859c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        long[] jArr = this.f34858b;
        if (i11 < jArr.length) {
            System.arraycopy(jArr, i5, jArr, i5 + 1, i11 - i5);
        } else {
            long[] jArr2 = new long[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            System.arraycopy(this.f34858b, i5, jArr2, i5 + 1, this.f34859c - i5);
            this.f34858b = jArr2;
        }
        this.f34858b[i5] = jLongValue;
        this.f34859c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.d, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = a1.f34808a;
        collection.getClass();
        if (!(collection instanceof f1)) {
            return super.addAll(collection);
        }
        f1 f1Var = (f1) collection;
        int i5 = f1Var.f34859c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f34859c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        long[] jArr = this.f34858b;
        if (i12 > jArr.length) {
            this.f34858b = Arrays.copyOf(jArr, i12);
        }
        System.arraycopy(f1Var.f34858b, 0, this.f34858b, this.f34859c, f1Var.f34859c);
        this.f34859c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(long j11) {
        c();
        int i5 = this.f34859c;
        long[] jArr = this.f34858b;
        if (i5 == jArr.length) {
            long[] jArr2 = new long[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            this.f34858b = jArr2;
        }
        long[] jArr3 = this.f34858b;
        int i11 = this.f34859c;
        this.f34859c = i11 + 1;
        jArr3[i11] = j11;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f1)) {
            return super.equals(obj);
        }
        f1 f1Var = (f1) obj;
        if (this.f34859c != f1Var.f34859c) {
            return false;
        }
        long[] jArr = f1Var.f34858b;
        for (int i5 = 0; i5 < this.f34859c; i5++) {
            if (this.f34858b[i5] != jArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f34859c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34859c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    public final long g(int i5) {
        f(i5);
        return this.f34858b[i5];
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return Long.valueOf(g(i5));
    }

    @Override // com.google.protobuf.z0
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public final f1 m(int i5) {
        if (i5 >= this.f34859c) {
            return new f1(Arrays.copyOf(this.f34858b, i5), this.f34859c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iB = 1;
        for (int i5 = 0; i5 < this.f34859c; i5++) {
            iB = (iB * 31) + a1.b(this.f34858b[i5]);
        }
        return iB;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i5 = this.f34859c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f34858b[i11] == jLongValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        f(i5);
        long[] jArr = this.f34858b;
        long j11 = jArr[i5];
        if (i5 < this.f34859c - 1) {
            System.arraycopy(jArr, i5 + 1, jArr, i5, (r3 - i5) - 1);
        }
        this.f34859c--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        long[] jArr = this.f34858b;
        System.arraycopy(jArr, i11, jArr, i5, this.f34859c - i11);
        this.f34859c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        c();
        f(i5);
        long[] jArr = this.f34858b;
        long j11 = jArr[i5];
        jArr[i5] = jLongValue;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34859c;
    }

    public f1(long[] jArr, int i5, boolean z11) {
        super(z11);
        this.f34858b = jArr;
        this.f34859c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d(((Long) obj).longValue());
        return true;
    }
}
