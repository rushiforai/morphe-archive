package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class q0 extends c implements f1, RandomAccess, n2 {

    /* renamed from: d, reason: collision with root package name */
    public static final q0 f30875d;

    /* renamed from: b, reason: collision with root package name */
    public float[] f30876b;

    /* renamed from: c, reason: collision with root package name */
    public int f30877c;

    static {
        q0 q0Var = new q0(new float[0], 0);
        f30875d = q0Var;
        q0Var.f30774a = false;
    }

    public q0() {
        this.f30876b = new float[10];
        this.f30877c = 0;
    }

    public final void a(float f11) {
        c();
        int i5 = this.f30877c;
        float[] fArr = this.f30876b;
        if (i5 == fArr.length) {
            float[] fArr2 = new float[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            this.f30876b = fArr2;
        }
        float[] fArr3 = this.f30876b;
        int i11 = this.f30877c;
        this.f30877c = i11 + 1;
        fArr3[i11] = f11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        float fFloatValue = ((Float) obj).floatValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f30877c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30877c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        float[] fArr = this.f30876b;
        if (i11 < fArr.length) {
            System.arraycopy(fArr, i5, fArr, i5 + 1, i11 - i5);
        } else {
            float[] fArr2 = new float[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(fArr, 0, fArr2, 0, i5);
            System.arraycopy(this.f30876b, i5, fArr2, i5 + 1, this.f30877c - i5);
            this.f30876b = fArr2;
        }
        this.f30876b[i5] = fFloatValue;
        this.f30877c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = l1.f30847a;
        collection.getClass();
        if (!(collection instanceof q0)) {
            return super.addAll(collection);
        }
        q0 q0Var = (q0) collection;
        int i5 = q0Var.f30877c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f30877c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        float[] fArr = this.f30876b;
        if (i12 > fArr.length) {
            this.f30876b = Arrays.copyOf(fArr, i12);
        }
        System.arraycopy(q0Var.f30876b, 0, this.f30876b, this.f30877c, q0Var.f30877c);
        this.f30877c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final q0 b(int i5) {
        if (i5 >= this.f30877c) {
            return new q0(Arrays.copyOf(this.f30876b, i5), this.f30877c);
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
        if (!(obj instanceof q0)) {
            return super.equals(obj);
        }
        q0 q0Var = (q0) obj;
        if (this.f30877c != q0Var.f30877c) {
            return false;
        }
        float[] fArr = q0Var.f30876b;
        for (int i5 = 0; i5 < this.f30877c; i5++) {
            if (Float.floatToIntBits(this.f30876b[i5]) != Float.floatToIntBits(fArr[i5])) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        if (i5 >= 0 && i5 < this.f30877c) {
            return Float.valueOf(this.f30876b[i5]);
        }
        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
        sbA.append(this.f30877c);
        throw new IndexOutOfBoundsException(sbA.toString());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int iFloatToIntBits = 1;
        for (int i5 = 0; i5 < this.f30877c; i5++) {
            iFloatToIntBits = (iFloatToIntBits * 31) + Float.floatToIntBits(this.f30876b[i5]);
        }
        return iFloatToIntBits;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Float)) {
            return -1;
        }
        float fFloatValue = ((Float) obj).floatValue();
        int i5 = this.f30877c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f30876b[i11] == fFloatValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        int i11;
        c();
        if (i5 < 0 || i5 >= (i11 = this.f30877c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30877c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        float[] fArr = this.f30876b;
        float f11 = fArr[i5];
        if (i5 < i11 - 1) {
            System.arraycopy(fArr, i5 + 1, fArr, i5, (i11 - i5) - 1);
        }
        this.f30877c--;
        ((AbstractList) this).modCount++;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        float[] fArr = this.f30876b;
        System.arraycopy(fArr, i11, fArr, i5, this.f30877c - i11);
        this.f30877c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        float fFloatValue = ((Float) obj).floatValue();
        c();
        if (i5 < 0 || i5 >= this.f30877c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30877c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        float[] fArr = this.f30876b;
        float f11 = fArr[i5];
        fArr[i5] = fFloatValue;
        return Float.valueOf(f11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30877c;
    }

    public q0(float[] fArr, int i5) {
        this.f30876b = fArr;
        this.f30877c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a(((Float) obj).floatValue());
        return true;
    }
}
