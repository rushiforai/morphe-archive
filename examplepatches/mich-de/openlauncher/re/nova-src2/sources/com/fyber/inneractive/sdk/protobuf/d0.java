package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class d0 extends c implements c1, RandomAccess, n2 {

    /* renamed from: d, reason: collision with root package name */
    public static final d0 f30782d;

    /* renamed from: b, reason: collision with root package name */
    public double[] f30783b;

    /* renamed from: c, reason: collision with root package name */
    public int f30784c;

    static {
        d0 d0Var = new d0(new double[0], 0);
        f30782d = d0Var;
        d0Var.f30774a = false;
    }

    public d0() {
        this.f30783b = new double[10];
        this.f30784c = 0;
    }

    public final void a(double d5) {
        c();
        int i5 = this.f30784c;
        double[] dArr = this.f30783b;
        if (i5 == dArr.length) {
            double[] dArr2 = new double[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            this.f30783b = dArr2;
        }
        double[] dArr3 = this.f30783b;
        int i11 = this.f30784c;
        this.f30784c = i11 + 1;
        dArr3[i11] = d5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        double dDoubleValue = ((Double) obj).doubleValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f30784c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30784c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        double[] dArr = this.f30783b;
        if (i11 < dArr.length) {
            System.arraycopy(dArr, i5, dArr, i5 + 1, i11 - i5);
        } else {
            double[] dArr2 = new double[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(dArr, 0, dArr2, 0, i5);
            System.arraycopy(this.f30783b, i5, dArr2, i5 + 1, this.f30784c - i5);
            this.f30783b = dArr2;
        }
        this.f30783b[i5] = dDoubleValue;
        this.f30784c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = l1.f30847a;
        collection.getClass();
        if (!(collection instanceof d0)) {
            return super.addAll(collection);
        }
        d0 d0Var = (d0) collection;
        int i5 = d0Var.f30784c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f30784c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        double[] dArr = this.f30783b;
        if (i12 > dArr.length) {
            this.f30783b = Arrays.copyOf(dArr, i12);
        }
        System.arraycopy(d0Var.f30783b, 0, this.f30783b, this.f30784c, d0Var.f30784c);
        this.f30784c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final d0 b(int i5) {
        if (i5 >= this.f30784c) {
            return new d0(Arrays.copyOf(this.f30783b, i5), this.f30784c);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return super.equals(obj);
        }
        d0 d0Var = (d0) obj;
        if (this.f30784c != d0Var.f30784c) {
            return false;
        }
        double[] dArr = d0Var.f30783b;
        for (int i5 = 0; i5 < this.f30784c; i5++) {
            if (Double.doubleToLongBits(this.f30783b[i5]) != Double.doubleToLongBits(dArr[i5])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        if (i5 >= 0 && i5 < this.f30784c) {
            return Double.valueOf(this.f30783b[i5]);
        }
        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
        sbA.append(this.f30784c);
        throw new IndexOutOfBoundsException(sbA.toString());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f30784c; i11++) {
            long jDoubleToLongBits = Double.doubleToLongBits(this.f30783b[i11]);
            Charset charset = l1.f30847a;
            i5 = (i5 * 31) + ((int) (jDoubleToLongBits ^ (jDoubleToLongBits >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Double)) {
            return -1;
        }
        double dDoubleValue = ((Double) obj).doubleValue();
        int i5 = this.f30784c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f30783b[i11] == dDoubleValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        int i11;
        c();
        if (i5 < 0 || i5 >= (i11 = this.f30784c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30784c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        double[] dArr = this.f30783b;
        double d5 = dArr[i5];
        if (i5 < i11 - 1) {
            System.arraycopy(dArr, i5 + 1, dArr, i5, (i11 - i5) - 1);
        }
        this.f30784c--;
        ((AbstractList) this).modCount++;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        double[] dArr = this.f30783b;
        System.arraycopy(dArr, i11, dArr, i5, this.f30784c - i11);
        this.f30784c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        double dDoubleValue = ((Double) obj).doubleValue();
        c();
        if (i5 < 0 || i5 >= this.f30784c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30784c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        double[] dArr = this.f30783b;
        double d5 = dArr[i5];
        dArr[i5] = dDoubleValue;
        return Double.valueOf(d5);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30784c;
    }

    public d0(double[] dArr, int i5) {
        this.f30783b = dArr;
        this.f30784c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a(((Double) obj).doubleValue());
        return true;
    }
}
