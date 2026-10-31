package com.google.android.gms.internal.measurement;

import androidx.compose.ui.node.LayoutNode;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class p1 extends o0 implements RandomAccess, t1, p2 {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f32945d;

    /* renamed from: e, reason: collision with root package name */
    public static final p1 f32946e;

    /* renamed from: b, reason: collision with root package name */
    public int[] f32947b;

    /* renamed from: c, reason: collision with root package name */
    public int f32948c;

    static {
        int[] iArr = new int[0];
        f32945d = iArr;
        f32946e = new p1(iArr, 0, false);
    }

    public p1(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.f32947b = iArr;
        this.f32948c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        d();
        if (i5 < 0 || i5 > (i11 = this.f32948c)) {
            throw new IndexOutOfBoundsException(q0.c(this.f32948c, i5, (byte) 13, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        int[] iArr = this.f32947b;
        int length = iArr.length;
        if (i11 < length) {
            System.arraycopy(iArr, i5, iArr, i12, i11 - i5);
        } else {
            int[] iArr2 = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32947b, 0, iArr2, 0, i5);
            System.arraycopy(this.f32947b, i5, iArr2, i12, this.f32948c - i5);
            this.f32947b = iArr2;
        }
        this.f32947b[i5] = iIntValue;
        this.f32948c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        collection.getClass();
        if (!(collection instanceof p1)) {
            return super.addAll(collection);
        }
        p1 p1Var = (p1) collection;
        int i5 = p1Var.f32948c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f32948c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f32947b;
        if (i12 > iArr.length) {
            this.f32947b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(p1Var.f32947b, 0, this.f32947b, this.f32948c, p1Var.f32948c);
        this.f32948c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // com.google.android.gms.internal.measurement.y1
    /* renamed from: e, reason: merged with bridge method [inline-methods] */
    public final p1 zzg(int i5) {
        if (i5 >= this.f32948c) {
            return new p1(i5 == 0 ? f32945d : Arrays.copyOf(this.f32947b, i5), this.f32948c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p1)) {
            return super.equals(obj);
        }
        p1 p1Var = (p1) obj;
        if (this.f32948c != p1Var.f32948c) {
            return false;
        }
        int[] iArr = p1Var.f32947b;
        for (int i5 = 0; i5 < this.f32948c; i5++) {
            if (this.f32947b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public final int f(int i5) {
        g(i5);
        return this.f32947b[i5];
    }

    public final void g(int i5) {
        if (i5 < 0 || i5 >= this.f32948c) {
            throw new IndexOutOfBoundsException(q0.c(this.f32948c, i5, (byte) 13, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        g(i5);
        return Integer.valueOf(this.f32947b[i5]);
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f32948c; i11++) {
            i5 = (i5 * 31) + this.f32947b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f32948c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f32947b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        d();
        g(i5);
        int[] iArr = this.f32947b;
        int i11 = iArr[i5];
        if (i5 < this.f32948c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f32948c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        d();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f32947b;
        System.arraycopy(iArr, i11, iArr, i5, this.f32948c - i11);
        this.f32948c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        d();
        g(i5);
        int[] iArr = this.f32947b;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f32948c;
    }

    public final void zzh(int i5) {
        d();
        int i11 = this.f32948c;
        int length = this.f32947b.length;
        if (i11 == length) {
            int[] iArr = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32947b, 0, iArr, 0, this.f32948c);
            this.f32947b = iArr;
        }
        int[] iArr2 = this.f32947b;
        int i12 = this.f32948c;
        this.f32948c = i12 + 1;
        iArr2[i12] = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        zzh(((Integer) obj).intValue());
        return true;
    }
}
