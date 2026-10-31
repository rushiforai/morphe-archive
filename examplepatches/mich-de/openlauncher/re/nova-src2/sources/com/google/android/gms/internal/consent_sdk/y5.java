package com.google.android.gms.internal.consent_sdk;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class y5 extends j5 implements RandomAccess, z5 {

    /* renamed from: d, reason: collision with root package name */
    public static final int[] f32317d;

    /* renamed from: e, reason: collision with root package name */
    public static final y5 f32318e;

    /* renamed from: b, reason: collision with root package name */
    public int[] f32319b;

    /* renamed from: c, reason: collision with root package name */
    public int f32320c;

    static {
        int[] iArr = new int[0];
        f32317d = iArr;
        f32318e = new y5(iArr, 0, false);
    }

    public y5(int[] iArr, int i5, boolean z11) {
        super(z11);
        this.f32319b = iArr;
        this.f32320c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        int iIntValue = ((Integer) obj).intValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f32320c)) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f32320c, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        int[] iArr = this.f32319b;
        int length = iArr.length;
        if (i11 < length) {
            System.arraycopy(iArr, i5, iArr, i12, i11 - i5);
        } else {
            int[] iArr2 = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32319b, 0, iArr2, 0, i5);
            System.arraycopy(this.f32319b, i5, iArr2, i12, this.f32320c - i5);
            this.f32319b = iArr2;
        }
        this.f32319b[i5] = iIntValue;
        this.f32320c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.gms.internal.consent_sdk.j5, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = b6.f31997a;
        collection.getClass();
        if (!(collection instanceof y5)) {
            return super.addAll(collection);
        }
        y5 y5Var = (y5) collection;
        int i5 = y5Var.f32320c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f32320c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        int[] iArr = this.f32319b;
        if (i12 > iArr.length) {
            this.f32319b = Arrays.copyOf(iArr, i12);
        }
        System.arraycopy(y5Var.f32319b, 0, this.f32319b, this.f32320c, y5Var.f32320c);
        this.f32320c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final int d(int i5) {
        e(i5);
        return this.f32319b[i5];
    }

    public final void e(int i5) {
        if (i5 < 0 || i5 >= this.f32320c) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f32320c, "Index:", ", Size:"));
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.j5, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y5)) {
            return super.equals(obj);
        }
        y5 y5Var = (y5) obj;
        if (this.f32320c != y5Var.f32320c) {
            return false;
        }
        int[] iArr = y5Var.f32319b;
        for (int i5 = 0; i5 < this.f32320c; i5++) {
            if (this.f32319b[i5] != iArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        e(i5);
        return Integer.valueOf(this.f32319b[i5]);
    }

    @Override // com.google.android.gms.internal.consent_sdk.j5, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f32320c; i11++) {
            i5 = (i5 * 31) + this.f32319b[i11];
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Integer)) {
            return -1;
        }
        int iIntValue = ((Integer) obj).intValue();
        int i5 = this.f32320c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f32319b[i11] == iIntValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.consent_sdk.j5, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        c();
        e(i5);
        int[] iArr = this.f32319b;
        int i11 = iArr[i5];
        if (i5 < this.f32320c - 1) {
            System.arraycopy(iArr, i5 + 1, iArr, i5, (r2 - i5) - 1);
        }
        this.f32320c--;
        ((AbstractList) this).modCount++;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        int[] iArr = this.f32319b;
        System.arraycopy(iArr, i11, iArr, i5, this.f32320c - i11);
        this.f32320c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        c();
        e(i5);
        int[] iArr = this.f32319b;
        int i11 = iArr[i5];
        iArr[i5] = iIntValue;
        return Integer.valueOf(i11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f32320c;
    }

    @Override // com.google.android.gms.internal.consent_sdk.a6
    public final /* bridge */ /* synthetic */ a6 zzd(int i5) {
        if (i5 >= this.f32320c) {
            return new y5(i5 == 0 ? f32317d : Arrays.copyOf(this.f32319b, i5), this.f32320c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        int iIntValue = ((Integer) obj).intValue();
        c();
        int i5 = this.f32320c;
        int length = this.f32319b.length;
        if (i5 == length) {
            int[] iArr = new int[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32319b, 0, iArr, 0, this.f32320c);
            this.f32319b = iArr;
        }
        int[] iArr2 = this.f32319b;
        int i11 = this.f32320c;
        this.f32320c = i11 + 1;
        iArr2[i11] = iIntValue;
        return true;
    }
}
