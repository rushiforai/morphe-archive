package com.google.protobuf;

import b.u4;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class y1 extends d implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final y1 f35007d = new y1(new Object[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public Object[] f35008b;

    /* renamed from: c, reason: collision with root package name */
    public int f35009c;

    public y1(Object[] objArr, int i5, boolean z11) {
        super(z11);
        this.f35008b = objArr;
        this.f35009c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f35009c;
        Object[] objArr = this.f35008b;
        if (i5 == objArr.length) {
            this.f35008b = Arrays.copyOf(objArr, ((i5 * 3) / 2) + 1);
        }
        Object[] objArr2 = this.f35008b;
        int i11 = this.f35009c;
        this.f35009c = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 >= this.f35009c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f35009c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        d(i5);
        return this.f35008b[i5];
    }

    @Override // com.google.protobuf.z0
    public final z0 m(int i5) {
        if (i5 >= this.f35009c) {
            return new y1(Arrays.copyOf(this.f35008b, i5), this.f35009c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        d(i5);
        Object[] objArr = this.f35008b;
        Object obj = objArr[i5];
        if (i5 < this.f35009c - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (r2 - i5) - 1);
        }
        this.f35009c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        d(i5);
        Object[] objArr = this.f35008b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f35009c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 >= 0 && i5 <= (i11 = this.f35009c)) {
            Object[] objArr = this.f35008b;
            if (i11 < objArr.length) {
                System.arraycopy(objArr, i5, objArr, i5 + 1, i11 - i5);
            } else {
                Object[] objArr2 = new Object[a2.c.A(i11, 3, 2, 1)];
                System.arraycopy(objArr, 0, objArr2, 0, i5);
                System.arraycopy(this.f35008b, i5, objArr2, i5 + 1, this.f35009c - i5);
                this.f35008b = objArr2;
            }
            this.f35008b[i5] = obj;
            this.f35009c++;
            ((AbstractList) this).modCount++;
            return;
        }
        StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
        sbJ.append(this.f35009c);
        throw new IndexOutOfBoundsException(sbJ.toString());
    }
}
