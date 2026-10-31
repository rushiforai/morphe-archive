package com.google.android.gms.internal.consent_sdk;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class r6 extends j5 implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f32224d;

    /* renamed from: e, reason: collision with root package name */
    public static final r6 f32225e;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f32226b;

    /* renamed from: c, reason: collision with root package name */
    public int f32227c;

    static {
        Object[] objArr = new Object[0];
        f32224d = objArr;
        f32225e = new r6(objArr, 0, false);
    }

    public r6(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.f32226b = objArr;
        this.f32227c = i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 < 0 || i5 > (i11 = this.f32227c)) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f32227c, "Index:", ", Size:"));
        }
        int i12 = i5 + 1;
        Object[] objArr = this.f32226b;
        int length = objArr.length;
        if (i11 < length) {
            System.arraycopy(objArr, i5, objArr, i12, i11 - i5);
        } else {
            Object[] objArr2 = new Object[a80.m.e(length, 3, 2, 1, 10)];
            System.arraycopy(this.f32226b, 0, objArr2, 0, i5);
            System.arraycopy(this.f32226b, i5, objArr2, i12, this.f32227c - i5);
            this.f32226b = objArr2;
        }
        this.f32226b[i5] = obj;
        this.f32227c++;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        zzh(i5);
        return this.f32226b[i5];
    }

    @Override // com.google.android.gms.internal.consent_sdk.j5, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        zzh(i5);
        Object[] objArr = this.f32226b;
        Object obj = objArr[i5];
        if (i5 < this.f32227c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f32227c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        zzh(i5);
        Object[] objArr = this.f32226b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f32227c;
    }

    @Override // com.google.android.gms.internal.consent_sdk.a6
    public final /* bridge */ /* synthetic */ a6 zzd(int i5) {
        if (i5 >= this.f32227c) {
            return new r6(i5 == 0 ? f32224d : Arrays.copyOf(this.f32226b, i5), this.f32227c, true);
        }
        throw new IllegalArgumentException();
    }

    public final void zzh(int i5) {
        if (i5 < 0 || i5 >= this.f32227c) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, this.f32227c, "Index:", ", Size:"));
        }
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f32227c;
        int length = this.f32226b.length;
        if (i5 == length) {
            this.f32226b = Arrays.copyOf(this.f32226b, a80.m.e(length, 3, 2, 1, 10));
        }
        Object[] objArr = this.f32226b;
        int i11 = this.f32227c;
        this.f32227c = i11 + 1;
        objArr[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }
}
