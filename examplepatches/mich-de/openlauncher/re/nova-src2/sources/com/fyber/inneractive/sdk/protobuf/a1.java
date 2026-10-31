package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class a1 extends c implements g1, RandomAccess, n2 {

    /* renamed from: d, reason: collision with root package name */
    public static final a1 f30761d;

    /* renamed from: b, reason: collision with root package name */
    public int[] f30762b;

    /* renamed from: c, reason: collision with root package name */
    public int f30763c;

    static {
        a1 a1Var = new a1(new int[0], 0);
        f30761d = a1Var;
        a1Var.f30774a = false;
    }

    public a1() {
        this.f30762b = new int[10];
        this.f30763c = 0;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f30763c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30763c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        int[] iArr = this.f30762b;
        if (i11 < iArr.length) {
            System.arraycopy(iArr, i5, iArr, i5 + 1, i11 - i5);
        } else {
            int[] iArr2 = new int[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i5);
            System.arraycopy(this.f30762b, i5, iArr2, i5 + 1, this.f30763c - i5);
            this.f30762b = iArr2;
        }
        this.f30762b[i5] = iIntValue;
        this.f30763c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = l1.f30847a;
        collection.getClass();
        if (!(collection instanceof a1)) {
            return super.addAll(collection);
        }
        a1 a1Var = (a1) collection;
        int i5 = a1Var.f30763c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f30763c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f30762b;
        if (i12 > iArr.length) {
            this.f30762b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(a1Var.f30762b, 0, this.f30762b, this.f30763c, a1Var.f30763c);
        this.f30763c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void c(int i5) {
        c();
        int i11 = this.f30763c;
        int[] iArr = this.f30762b;
        if (i11 == iArr.length) {
            int[] iArr2 = new int[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(iArr, 0, iArr2, 0, i11);
            this.f30762b = iArr2;
        }
        int[] iArr3 = this.f30762b;
        int i12 = this.f30763c;
        this.f30763c = i12 + 1;
        iArr3[i12] = i5;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 >= this.f30763c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30763c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public final a1 b(int i5) {
        if (i5 >= this.f30763c) {
            return new a1(Arrays.copyOf(this.f30762b, i5), this.f30763c);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a1)) {
            return super.equals(obj);
        }
        a1 a1Var = (a1) obj;
        if (this.f30763c != a1Var.f30763c) {
            return false;
        }
        int[] iArr = a1Var.f30762b;
        for (int i5 = 0; i5 < this.f30763c; i5++) {
            if (this.f30762b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        d(i5);
        return Integer.valueOf(this.f30762b[i5]);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f30763c; i11++) {
            i5 = (i5 * 31) + this.f30762b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f30763c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f30762b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        d(i5);
        int[] iArr = this.f30762b;
        int i11 = iArr[i5];
        if (i5 < this.f30763c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f30763c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f30762b;
        System.arraycopy(iArr, i11, iArr, i5, this.f30763c - i11);
        this.f30763c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        c();
        d(i5);
        int[] iArr = this.f30762b;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30763c;
    }

    public a1(int[] iArr, int i5) {
        this.f30762b = iArr;
        this.f30763c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c(((Integer) obj).intValue());
        return true;
    }
}
