package com.google.android.gms.internal.play_billing;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class y2 extends h2 implements RandomAccess, b3 {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f33659d;

    /* renamed from: e, reason: collision with root package name */
    public static final y2 f33660e;

    /* renamed from: b, reason: collision with root package name */
    public int[] f33661b;

    /* renamed from: c, reason: collision with root package name */
    public int f33662c;

    static {
        int[] iArr = new int[0];
        f33659d = iArr;
        f33660e = new y2(iArr, 0, false);
    }

    public y2(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.f33661b = iArr;
        this.f33662c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f33662c)) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f33662c, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        int[] iArr = this.f33661b;
        int length = iArr.length;
        if (i11 < length) {
            System.arraycopy(iArr, i5, iArr, i12, i11 - i5);
        } else {
            int[] iArr2 = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f33661b, 0, iArr2, 0, i5);
            System.arraycopy(this.f33661b, i5, iArr2, i12, this.f33662c - i5);
            this.f33661b = iArr2;
        }
        this.f33661b[i5] = iIntValue;
        this.f33662c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.gms.internal.play_billing.h2, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = e3.f33385a;
        collection.getClass();
        if (!(collection instanceof y2)) {
            return super.addAll(collection);
        }
        y2 y2Var = (y2) collection;
        int i5 = y2Var.f33662c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f33662c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f33661b;
        if (i12 > iArr.length) {
            this.f33661b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(y2Var.f33661b, 0, this.f33661b, this.f33662c, y2Var.f33662c);
        this.f33662c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final int d(int i5) {
        f(i5);
        return this.f33661b[i5];
    }

    public final void e(int i5) {
        c();
        int i11 = this.f33662c;
        int length = this.f33661b.length;
        if (i11 == length) {
            int[] iArr = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f33661b, 0, iArr, 0, this.f33662c);
            this.f33661b = iArr;
        }
        int[] iArr2 = this.f33661b;
        int i12 = this.f33662c;
        this.f33662c = i12 + 1;
        iArr2[i12] = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.h2, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y2)) {
            return super.equals(obj);
        }
        y2 y2Var = (y2) obj;
        if (this.f33662c != y2Var.f33662c) {
            return false;
        }
        int[] iArr = y2Var.f33661b;
        for (int i5 = 0; i5 < this.f33662c; i5++) {
            if (this.f33661b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f33662c) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f33662c, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        f(i5);
        return Integer.valueOf(this.f33661b[i5]);
    }

    @Override // com.google.android.gms.internal.play_billing.h2, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f33662c; i11++) {
            i5 = (i5 * 31) + this.f33661b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f33662c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f33661b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.play_billing.h2, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        c();
        f(i5);
        int[] iArr = this.f33661b;
        int i11 = iArr[i5];
        if (i5 < this.f33662c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f33662c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f33661b;
        System.arraycopy(iArr, i11, iArr, i5, this.f33662c - i11);
        this.f33662c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        c();
        f(i5);
        int[] iArr = this.f33661b;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33662c;
    }

    @Override // com.google.android.gms.internal.play_billing.c3
    public final /* bridge */ /* synthetic */ c3 zzd(int i5) {
        if (i5 >= this.f33662c) {
            return new y2(i5 == 0 ? f33659d : Arrays.copyOf(this.f33661b, i5), this.f33662c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        e(((Integer) obj).intValue());
        return true;
    }
}
