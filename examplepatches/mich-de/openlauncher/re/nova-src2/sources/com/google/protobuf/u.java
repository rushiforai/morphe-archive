package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class u extends d implements q0, RandomAccess, w1 {

    /* renamed from: d, reason: collision with root package name */
    public static final u f34980d = new u(new double[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public double[] f34981b;

    /* renamed from: c, reason: collision with root package name */
    public int f34982c;

    public u() {
        this(new double[10], 0, true);
    }

    public static u e() {
        return f34980d;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        double dDoubleValue = ((Double) obj).doubleValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f34982c)) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34982c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        double[] dArr = this.f34981b;
        if (i11 < dArr.length) {
            System.arraycopy(dArr, i5, dArr, i5 + 1, i11 - i5);
        } else {
            double[] dArr2 = new double[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            System.arraycopy(this.f34981b, i5, dArr2, i5 + 1, this.f34982c - i5);
            this.f34981b = dArr2;
        }
        this.f34981b[i5] = dDoubleValue;
        this.f34982c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.d, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = a1.f34808a;
        collection.getClass();
        if (!(collection instanceof u)) {
            return super.addAll(collection);
        }
        u uVar = (u) collection;
        int i5 = uVar.f34982c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f34982c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        double[] dArr = this.f34981b;
        if (i12 > dArr.length) {
            this.f34981b = Arrays.copyOf(dArr, i12);
        }
        System.arraycopy(uVar.f34981b, 0, this.f34981b, this.f34982c, uVar.f34982c);
        this.f34982c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(double d5) {
        c();
        int i5 = this.f34982c;
        double[] dArr = this.f34981b;
        if (i5 == dArr.length) {
            double[] dArr2 = new double[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            this.f34981b = dArr2;
        }
        double[] dArr3 = this.f34981b;
        int i11 = this.f34982c;
        this.f34982c = i11 + 1;
        dArr3[i11] = d5;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return super.equals(obj);
        }
        u uVar = (u) obj;
        if (this.f34982c != uVar.f34982c) {
            return false;
        }
        double[] dArr = uVar.f34981b;
        for (int i5 = 0; i5 < this.f34982c; i5++) {
            if (Double.doubleToLongBits(this.f34981b[i5]) != Double.doubleToLongBits(dArr[i5])) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f34982c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34982c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    public final double g(int i5) {
        f(i5);
        return this.f34981b[i5];
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return Double.valueOf(g(i5));
    }

    @Override // com.google.protobuf.z0
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public final u m(int i5) {
        if (i5 >= this.f34982c) {
            return new u(Arrays.copyOf(this.f34981b, i5), this.f34982c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iB = 1;
        for (int i5 = 0; i5 < this.f34982c; i5++) {
            iB = (iB * 31) + a1.b(Double.doubleToLongBits(this.f34981b[i5]));
        }
        return iB;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Double)) {
            return -1;
        }
        double dDoubleValue = ((Double) obj).doubleValue();
        int i5 = this.f34982c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f34981b[i11] == dDoubleValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        f(i5);
        double[] dArr = this.f34981b;
        double d5 = dArr[i5];
        if (i5 < this.f34982c - 1) {
            System.arraycopy(dArr, i5 + 1, dArr, i5, (r3 - i5) - 1);
        }
        this.f34982c--;
        ((AbstractList) this).modCount++;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        double[] dArr = this.f34981b;
        System.arraycopy(dArr, i11, dArr, i5, this.f34982c - i11);
        this.f34982c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        double dDoubleValue = ((Double) obj).doubleValue();
        c();
        f(i5);
        double[] dArr = this.f34981b;
        double d5 = dArr[i5];
        dArr[i5] = dDoubleValue;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34982c;
    }

    public u(double[] dArr, int i5, boolean z11) {
        super(z11);
        this.f34981b = dArr;
        this.f34982c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d(((Double) obj).doubleValue());
        return true;
    }
}
