package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class h extends d implements p0, RandomAccess, w1 {

    /* renamed from: d, reason: collision with root package name */
    public static final h f34867d = new h(new boolean[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public boolean[] f34868b;

    /* renamed from: c, reason: collision with root package name */
    public int f34869c;

    public h() {
        this(new boolean[10], 0, true);
    }

    public static h e() {
        return f34867d;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f34869c)) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34869c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        boolean[] zArr = this.f34868b;
        if (i11 < zArr.length) {
            System.arraycopy(zArr, i5, zArr, i5 + 1, i11 - i5);
        } else {
            boolean[] zArr2 = new boolean[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            System.arraycopy(this.f34868b, i5, zArr2, i5 + 1, this.f34869c - i5);
            this.f34868b = zArr2;
        }
        this.f34868b[i5] = zBooleanValue;
        this.f34869c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.d, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = a1.f34808a;
        collection.getClass();
        if (!(collection instanceof h)) {
            return super.addAll(collection);
        }
        h hVar = (h) collection;
        int i5 = hVar.f34869c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f34869c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        boolean[] zArr = this.f34868b;
        if (i12 > zArr.length) {
            this.f34868b = Arrays.copyOf(zArr, i12);
        }
        System.arraycopy(hVar.f34868b, 0, this.f34868b, this.f34869c, hVar.f34869c);
        this.f34869c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(boolean z11) {
        c();
        int i5 = this.f34869c;
        boolean[] zArr = this.f34868b;
        if (i5 == zArr.length) {
            boolean[] zArr2 = new boolean[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            this.f34868b = zArr2;
        }
        boolean[] zArr3 = this.f34868b;
        int i11 = this.f34869c;
        this.f34869c = i11 + 1;
        zArr3[i11] = z11;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return super.equals(obj);
        }
        h hVar = (h) obj;
        if (this.f34869c != hVar.f34869c) {
            return false;
        }
        boolean[] zArr = hVar.f34868b;
        for (int i5 = 0; i5 < this.f34869c; i5++) {
            if (this.f34868b[i5] != zArr[i5]) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f34869c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34869c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    public final boolean g(int i5) {
        f(i5);
        return this.f34868b[i5];
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return Boolean.valueOf(g(i5));
    }

    @Override // com.google.protobuf.z0
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public final h m(int i5) {
        if (i5 >= this.f34869c) {
            return new h(Arrays.copyOf(this.f34868b, i5), this.f34869c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f34869c; i11++) {
            int i12 = i5 * 31;
            boolean z11 = this.f34868b[i11];
            Charset charset = a1.f34808a;
            i5 = i12 + (z11 ? 1231 : 1237);
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Boolean)) {
            return -1;
        }
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        int i5 = this.f34869c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f34868b[i11] == zBooleanValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        f(i5);
        boolean[] zArr = this.f34868b;
        boolean z11 = zArr[i5];
        if (i5 < this.f34869c - 1) {
            System.arraycopy(zArr, i5 + 1, zArr, i5, (r2 - i5) - 1);
        }
        this.f34869c--;
        ((AbstractList) this).modCount++;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        boolean[] zArr = this.f34868b;
        System.arraycopy(zArr, i11, zArr, i5, this.f34869c - i11);
        this.f34869c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        c();
        f(i5);
        boolean[] zArr = this.f34868b;
        boolean z11 = zArr[i5];
        zArr[i5] = zBooleanValue;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34869c;
    }

    public h(boolean[] zArr, int i5, boolean z11) {
        super(z11);
        this.f34868b = zArr;
        this.f34869c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d(((Boolean) obj).booleanValue());
        return true;
    }
}
