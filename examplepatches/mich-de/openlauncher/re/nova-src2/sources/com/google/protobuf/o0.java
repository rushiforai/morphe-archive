package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class o0 extends d implements v0, RandomAccess, w1 {

    /* renamed from: d, reason: collision with root package name */
    public static final o0 f34933d = new o0(new int[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public int[] f34934b;

    /* renamed from: c, reason: collision with root package name */
    public int f34935c;

    public o0() {
        this(new int[10], 0, true);
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f34935c)) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34935c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        int[] iArr = this.f34934b;
        if (i11 < iArr.length) {
            System.arraycopy(iArr, i5, iArr, i5 + 1, i11 - i5);
        } else {
            int[] iArr2 = new int[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i5);
            System.arraycopy(this.f34934b, i5, iArr2, i5 + 1, this.f34935c - i5);
            this.f34934b = iArr2;
        }
        this.f34934b[i5] = iIntValue;
        this.f34935c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.d, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = a1.f34808a;
        collection.getClass();
        if (!(collection instanceof o0)) {
            return super.addAll(collection);
        }
        o0 o0Var = (o0) collection;
        int i5 = o0Var.f34935c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f34935c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f34934b;
        if (i12 > iArr.length) {
            this.f34934b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(o0Var.f34934b, 0, this.f34934b, this.f34935c, o0Var.f34935c);
        this.f34935c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(int i5) {
        c();
        int i11 = this.f34935c;
        int[] iArr = this.f34934b;
        if (i11 == iArr.length) {
            int[] iArr2 = new int[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i11);
            this.f34934b = iArr2;
        }
        int[] iArr3 = this.f34934b;
        int i12 = this.f34935c;
        this.f34935c = i12 + 1;
        iArr3[i12] = i5;
    }

    public final void e(int i5) {
        if (i5 < 0 || i5 >= this.f34935c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34935c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o0)) {
            return super.equals(obj);
        }
        o0 o0Var = (o0) obj;
        if (this.f34935c != o0Var.f34935c) {
            return false;
        }
        int[] iArr = o0Var.f34934b;
        for (int i5 = 0; i5 < this.f34935c; i5++) {
            if (this.f34934b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public final int f(int i5) {
        e(i5);
        return this.f34934b[i5];
    }

    public final int g(int i5, int i11) {
        c();
        e(i5);
        int[] iArr = this.f34934b;
        int i12 = iArr[i5];
        iArr[i5] = i11;
        return i12;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return Integer.valueOf(f(i5));
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f34935c; i11++) {
            i5 = (i5 * 31) + this.f34934b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f34935c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f34934b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.protobuf.z0
    public final z0 m(int i5) {
        if (i5 >= this.f34935c) {
            return new o0(Arrays.copyOf(this.f34934b, i5), this.f34935c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        e(i5);
        int[] iArr = this.f34934b;
        int i11 = iArr[i5];
        if (i5 < this.f34935c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f34935c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f34934b;
        System.arraycopy(iArr, i11, iArr, i5, this.f34935c - i11);
        this.f34935c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        return Integer.valueOf(g(i5, ((Integer) obj).intValue()));
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34935c;
    }

    public o0(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.f34934b = iArr;
        this.f34935c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d(((Integer) obj).intValue());
        return true;
    }
}
