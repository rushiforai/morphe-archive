package com.google.android.gms.internal.play_billing;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class v3 extends h2 implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f33565d;

    /* renamed from: e, reason: collision with root package name */
    public static final v3 f33566e;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f33567b;

    /* renamed from: c, reason: collision with root package name */
    public int f33568c;

    static {
        Object[] objArr = new Object[0];
        f33565d = objArr;
        f33566e = new v3(objArr, 0, false);
    }

    public v3(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.f33567b = objArr;
        this.f33568c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 < 0 || i5 > (i11 = this.f33568c)) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f33568c, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        Object[] objArr = this.f33567b;
        int length = objArr.length;
        if (i11 < length) {
            System.arraycopy(objArr, i5, objArr, i12, i11 - i5);
        } else {
            Object[] objArr2 = new Object[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f33567b, 0, objArr2, 0, i5);
            System.arraycopy(this.f33567b, i5, objArr2, i12, this.f33568c - i5);
            this.f33567b = objArr2;
        }
        this.f33567b[i5] = obj;
        this.f33568c++;
        ((AbstractList) this).modCount++;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 >= this.f33568c) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f33568c, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        d(i5);
        return this.f33567b[i5];
    }

    @Override // com.google.android.gms.internal.play_billing.h2, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        d(i5);
        Object[] objArr = this.f33567b;
        Object obj = objArr[i5];
        if (i5 < this.f33568c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f33568c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        d(i5);
        Object[] objArr = this.f33567b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33568c;
    }

    @Override // com.google.android.gms.internal.play_billing.c3
    public final /* bridge */ /* synthetic */ c3 zzd(int i5) {
        if (i5 >= this.f33568c) {
            return new v3(i5 == 0 ? f33565d : Arrays.copyOf(this.f33567b, i5), this.f33568c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f33568c;
        int length = this.f33567b.length;
        if (i5 == length) {
            this.f33567b = Arrays.copyOf(this.f33567b, a80.m.e(length, 3, 2, 1, 10));
        }
        Object[] objArr = this.f33567b;
        int i11 = this.f33568c;
        this.f33568c = i11 + 1;
        objArr[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
