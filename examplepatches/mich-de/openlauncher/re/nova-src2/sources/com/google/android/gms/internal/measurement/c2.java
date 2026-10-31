package com.google.android.gms.internal.measurement;

import androidx.compose.ui.node.LayoutNode;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class c2 extends o0 implements RandomAccess, x1, p2 {

    /* renamed from: d, reason: collision with root package name */
    public static final long[] f32419d;

    /* renamed from: e, reason: collision with root package name */
    public static final c2 f32420e;

    /* renamed from: b, reason: collision with root package name */
    public long[] f32421b;

    /* renamed from: c, reason: collision with root package name */
    public int f32422c;

    static {
        long[] jArr = new long[0];
        f32419d = jArr;
        f32420e = new c2(jArr, 0, false);
    }

    public c2(long[] jArr, int i5, boolean z11) {
        super(z11);
        this.f32421b = jArr;
        this.f32422c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        long jLongValue = ((Long) obj).longValue();
        d();
        if (i5 < 0 || i5 > (i11 = this.f32422c)) {
            throw new IndexOutOfBoundsException(q0.c(this.f32422c, i5, (byte) 13, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        long[] jArr = this.f32421b;
        int length = jArr.length;
        if (i11 < length) {
            System.arraycopy(jArr, i5, jArr, i12, i11 - i5);
        } else {
            long[] jArr2 = new long[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32421b, 0, jArr2, 0, i5);
            System.arraycopy(this.f32421b, i5, jArr2, i12, this.f32422c - i5);
            this.f32421b = jArr2;
        }
        this.f32421b[i5] = jLongValue;
        this.f32422c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        d();
        collection.getClass();
        if (!(collection instanceof c2)) {
            return super.addAll(collection);
        }
        c2 c2Var = (c2) collection;
        int i5 = c2Var.f32422c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f32422c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        long[] jArr = this.f32421b;
        if (i12 > jArr.length) {
            this.f32421b = Arrays.copyOf(jArr, i12);
        }
        System.arraycopy(c2Var.f32421b, 0, this.f32421b, this.f32422c, c2Var.f32422c);
        this.f32422c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final long e(int i5) {
        h(i5);
        return this.f32421b[i5];
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c2)) {
            return super.equals(obj);
        }
        c2 c2Var = (c2) obj;
        if (this.f32422c != c2Var.f32422c) {
            return false;
        }
        long[] jArr = c2Var.f32421b;
        for (int i5 = 0; i5 < this.f32422c; i5++) {
            if (this.f32421b[i5] != jArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // com.google.android.gms.internal.measurement.y1
    /* renamed from: f, reason: merged with bridge method [inline-methods] */
    public final c2 zzg(int i5) {
        if (i5 >= this.f32422c) {
            return new c2(i5 == 0 ? f32419d : Arrays.copyOf(this.f32421b, i5), this.f32422c, true);
        }
        throw new IllegalArgumentException();
    }

    public final void g(long j11) {
        d();
        int i5 = this.f32422c;
        int length = this.f32421b.length;
        if (i5 == length) {
            long[] jArr = new long[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32421b, 0, jArr, 0, this.f32422c);
            this.f32421b = jArr;
        }
        long[] jArr2 = this.f32421b;
        int i11 = this.f32422c;
        this.f32422c = i11 + 1;
        jArr2[i11] = j11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* synthetic */ Object get(int i5) {
        h(i5);
        return Long.valueOf(this.f32421b[i5]);
    }

    public final void h(int i5) {
        if (i5 < 0 || i5 >= this.f32422c) {
            throw new IndexOutOfBoundsException(q0.c(this.f32422c, i5, (byte) 13, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f32422c; i11++) {
            long j11 = this.f32421b[i11];
            byte[] bArr = w1.f33176a;
            i5 = (i5 * 31) + ((int) (j11 ^ (j11 >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i5 = this.f32422c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f32421b[i11] == jLongValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object remove(int i5) {
        d();
        h(i5);
        long[] jArr = this.f32421b;
        long j11 = jArr[i5];
        if (i5 < this.f32422c - 1) {
            System.arraycopy(jArr, i5 + 1, jArr, i5, (r3 - i5) - 1);
        }
        this.f32422c--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        d();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        long[] jArr = this.f32421b;
        System.arraycopy(jArr, i11, jArr, i5, this.f32422c - i11);
        this.f32422c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final /* bridge */ /* synthetic */ Object set(int i5, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        d();
        h(i5);
        long[] jArr = this.f32421b;
        long j11 = jArr[i5];
        jArr[i5] = jLongValue;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f32422c;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final /* bridge */ /* synthetic */ boolean add(Object obj) {
        g(((Long) obj).longValue());
        return true;
    }
}
