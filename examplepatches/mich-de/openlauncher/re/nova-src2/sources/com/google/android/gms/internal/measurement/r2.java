package com.google.android.gms.internal.measurement;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.List;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class r2 extends o0 implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f33022d;

    /* renamed from: e, reason: collision with root package name */
    public static final r2 f33023e;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f33024b;

    /* renamed from: c, reason: collision with root package name */
    public int f33025c;

    static {
        Object[] objArr = new Object[0];
        f33022d = objArr;
        f33023e = new r2(objArr, 0, false);
    }

    public r2(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.f33024b = objArr;
        this.f33025c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        d();
        if (i5 < 0 || i5 > (i11 = this.f33025c)) {
            throw new IndexOutOfBoundsException(q0.c(this.f33025c, i5, (byte) 13, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        Object[] objArr = this.f33024b;
        int length = objArr.length;
        if (i11 < length) {
            System.arraycopy(objArr, i5, objArr, i12, i11 - i5);
        } else {
            Object[] objArr2 = new Object[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f33024b, 0, objArr2, 0, i5);
            System.arraycopy(this.f33024b, i5, objArr2, i12, this.f33025c - i5);
            this.f33024b = objArr2;
        }
        this.f33024b[i5] = obj;
        this.f33025c++;
        ((AbstractList) this).modCount++;
    }

    public final void e(int i5) {
        if (i5 < 0 || i5 >= this.f33025c) {
            throw new IndexOutOfBoundsException(q0.c(this.f33025c, i5, (byte) 13, "Index:", ", Size:"));
        }
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
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
        int i5 = this.f33025c;
        if (i5 != list.size()) {
            return false;
        }
        if (!(obj instanceof r2)) {
            for (int i11 = 0; i11 < i5; i11++) {
                if (!this.f33024b[i11].equals(list.get(i11))) {
                    return false;
                }
            }
            return true;
        }
        r2 r2Var = (r2) obj;
        for (int i12 = 0; i12 < i5; i12++) {
            if (!this.f33024b[i12].equals(r2Var.f33024b[i12])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        e(i5);
        return this.f33024b[i5];
    }

    @Override // java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = this.f33025c;
        int iHashCode = 1;
        for (int i11 = 0; i11 < i5; i11++) {
            iHashCode = (iHashCode * 31) + this.f33024b[i11].hashCode();
        }
        return iHashCode;
    }

    @Override // com.google.android.gms.internal.measurement.o0, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        d();
        e(i5);
        Object[] objArr = this.f33024b;
        Object obj = objArr[i5];
        if (i5 < this.f33025c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f33025c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        d();
        e(i5);
        Object[] objArr = this.f33024b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33025c;
    }

    @Override // com.google.android.gms.internal.measurement.y1
    public final /* bridge */ /* synthetic */ y1 zzg(int i5) {
        if (i5 >= this.f33025c) {
            return new r2(i5 == 0 ? f33022d : Arrays.copyOf(this.f33024b, i5), this.f33025c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d();
        int i5 = this.f33025c;
        int length = this.f33024b.length;
        if (i5 == length) {
            this.f33024b = Arrays.copyOf(this.f33024b, a80.m.e(length, 3, 2, 1, 10));
        }
        Object[] objArr = this.f33024b;
        int i11 = this.f33025c;
        this.f33025c = i11 + 1;
        objArr[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
