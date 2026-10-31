package com.google.crypto.tink.shaded.protobuf;

import b.u4;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class v0 extends b implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final Object[] f34675d;

    /* renamed from: e, reason: collision with root package name */
    public static final v0 f34676e;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f34677b;

    /* renamed from: c, reason: collision with root package name */
    public int f34678c;

    static {
        Object[] objArr = new Object[0];
        f34675d = objArr;
        f34676e = new v0(objArr, 0, false);
    }

    public v0(Object[] objArr, int i5, boolean z11) {
        this.f34574a = z11;
        this.f34677b = objArr;
        this.f34678c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f34678c;
        Object[] objArr = this.f34677b;
        if (i5 == objArr.length) {
            this.f34677b = Arrays.copyOf(this.f34677b, a80.m.e(objArr.length, 3, 2, 1, 10));
        }
        Object[] objArr2 = this.f34677b;
        int i11 = this.f34678c;
        this.f34678c = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 >= this.f34678c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34678c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        d(i5);
        return this.f34677b[i5];
    }

    @Override // com.google.crypto.tink.shaded.protobuf.a0
    public final a0 m(int i5) {
        if (i5 >= this.f34678c) {
            return new v0(i5 == 0 ? f34675d : Arrays.copyOf(this.f34677b, i5), this.f34678c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.crypto.tink.shaded.protobuf.b, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        d(i5);
        Object[] objArr = this.f34677b;
        Object obj = objArr[i5];
        if (i5 < this.f34678c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f34678c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        d(i5);
        Object[] objArr = this.f34677b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34678c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 >= 0 && i5 <= (i11 = this.f34678c)) {
            Object[] objArr = this.f34677b;
            if (i11 < objArr.length) {
                System.arraycopy(objArr, i5, objArr, i5 + 1, i11 - i5);
            } else {
                Object[] objArr2 = new Object[a80.m.e(objArr.length, 3, 2, 1, 10)];
                System.arraycopy(this.f34677b, 0, objArr2, 0, i5);
                System.arraycopy(this.f34677b, i5, objArr2, i5 + 1, this.f34678c - i5);
                this.f34677b = objArr2;
            }
            this.f34677b[i5] = obj;
            this.f34678c++;
            ((AbstractList) this).modCount++;
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
        sbJ.append(this.f34678c);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }
}
