package com.google.protobuf;

import androidx.compose.ui.node.LayoutNode;
import b.u4;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class d0 extends d implements u0, RandomAccess, w1 {

    /* renamed from: d, reason: collision with root package name */
    public static final d0 f34835d = new d0(new float[0], 0, false);

    /* renamed from: b, reason: collision with root package name */
    public float[] f34836b;

    /* renamed from: c, reason: collision with root package name */
    public int f34837c;

    public d0() {
        this(new float[10], 0, true);
    }

    public static d0 e() {
        return f34835d;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        float fFloatValue = ((Float) obj).floatValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f34837c)) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34837c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
        float[] fArr = this.f34836b;
        if (i11 < fArr.length) {
            System.arraycopy(fArr, i5, fArr, i5 + 1, i11 - i5);
        } else {
            float[] fArr2 = new float[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            System.arraycopy(this.f34836b, i5, fArr2, i5 + 1, this.f34837c - i5);
            this.f34836b = fArr2;
        }
        this.f34836b[i5] = fFloatValue;
        this.f34837c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.google.protobuf.d, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = a1.f34808a;
        collection.getClass();
        if (!(collection instanceof d0)) {
            return super.addAll(collection);
        }
        d0 d0Var = (d0) collection;
        int i5 = d0Var.f34837c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f34837c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        float[] fArr = this.f34836b;
        if (i12 > fArr.length) {
            this.f34836b = Arrays.copyOf(fArr, i12);
        }
        System.arraycopy(d0Var.f34836b, 0, this.f34836b, this.f34837c, d0Var.f34837c);
        this.f34837c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    public final void d(float f11) {
        c();
        int i5 = this.f34837c;
        float[] fArr = this.f34836b;
        if (i5 == fArr.length) {
            float[] fArr2 = new float[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            this.f34836b = fArr2;
        }
        float[] fArr3 = this.f34836b;
        int i11 = this.f34837c;
        this.f34837c = i11 + 1;
        fArr3[i11] = f11;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d0)) {
            return super.equals(obj);
        }
        d0 d0Var = (d0) obj;
        if (this.f34837c != d0Var.f34837c) {
            return false;
        }
        float[] fArr = d0Var.f34836b;
        for (int i5 = 0; i5 < this.f34837c; i5++) {
            if (Float.floatToIntBits(this.f34836b[i5]) != Float.floatToIntBits(fArr[i5])) {
                return false;
            }
        }
        return true;
    }

    public final void f(int i5) {
        if (i5 < 0 || i5 >= this.f34837c) {
            StringBuilder sbJ = u4.j(i5, "Index:", ", Size:");
            sbJ.append(this.f34837c);
            throw new IndexOutOfBoundsException(sbJ.toString());
        }
    }

    public final float g(int i5) {
        f(i5);
        return this.f34836b[i5];
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        return Float.valueOf(g(i5));
    }

    @Override // com.google.protobuf.z0
    /* renamed from: h, reason: merged with bridge method [inline-methods] */
    public final d0 m(int i5) {
        if (i5 >= this.f34837c) {
            return new d0(Arrays.copyOf(this.f34836b, i5), this.f34837c, true);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iFloatToIntBits = 1;
        for (int i5 = 0; i5 < this.f34837c; i5++) {
            iFloatToIntBits = (iFloatToIntBits * 31) + Float.floatToIntBits(this.f34836b[i5]);
        }
        return iFloatToIntBits;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Float)) {
            return -1;
        }
        float fFloatValue = ((Float) obj).floatValue();
        int i5 = this.f34837c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f34836b[i11] == fFloatValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.google.protobuf.d, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        f(i5);
        float[] fArr = this.f34836b;
        float f11 = fArr[i5];
        if (i5 < this.f34837c - 1) {
            System.arraycopy(fArr, i5 + 1, fArr, i5, (r2 - i5) - 1);
        }
        this.f34837c--;
        ((AbstractList) this).modCount++;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        float[] fArr = this.f34836b;
        System.arraycopy(fArr, i11, fArr, i5, this.f34837c - i11);
        this.f34837c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        float fFloatValue = ((Float) obj).floatValue();
        c();
        f(i5);
        float[] fArr = this.f34836b;
        float f11 = fArr[i5];
        fArr[i5] = fFloatValue;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f34837c;
    }

    public d0(float[] fArr, int i5, boolean z11) {
        super(z11);
        this.f34836b = fArr;
        this.f34837c = i5;
    }

    @Override // java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        d(((Float) obj).floatValue());
        return true;
    }
}
