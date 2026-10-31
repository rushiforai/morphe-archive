package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class j extends c implements b1, RandomAccess, n2 {

    /* renamed from: d, reason: collision with root package name */
    public static final j f30834d;

    /* renamed from: b, reason: collision with root package name */
    public boolean[] f30835b;

    /* renamed from: c, reason: collision with root package name */
    public int f30836c;

    static {
        j jVar = new j(new boolean[0], 0);
        f30834d = jVar;
        jVar.f30774a = false;
    }

    public j() {
        this.f30835b = new boolean[10];
        this.f30836c = 0;
    }

    public final void a(boolean z11) {
        c();
        int i5 = this.f30836c;
        boolean[] zArr = this.f30835b;
        if (i5 == zArr.length) {
            boolean[] zArr2 = new boolean[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            this.f30835b = zArr2;
        }
        boolean[] zArr3 = this.f30835b;
        int i11 = this.f30836c;
        this.f30836c = i11 + 1;
        zArr3[i11] = z11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f30836c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30836c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        boolean[] zArr = this.f30835b;
        if (i11 < zArr.length) {
            System.arraycopy(zArr, i5, zArr, i5 + 1, i11 - i5);
        } else {
            boolean[] zArr2 = new boolean[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(zArr, 0, zArr2, 0, i5);
            System.arraycopy(this.f30835b, i5, zArr2, i5 + 1, this.f30836c - i5);
            this.f30835b = zArr2;
        }
        this.f30835b[i5] = zBooleanValue;
        this.f30836c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = l1.f30847a;
        collection.getClass();
        if (!(collection instanceof j)) {
            return super.addAll(collection);
        }
        j jVar = (j) collection;
        int i5 = jVar.f30836c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f30836c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        boolean[] zArr = this.f30835b;
        if (i12 > zArr.length) {
            this.f30835b = Arrays.copyOf(zArr, i12);
        }
        System.arraycopy(jVar.f30835b, 0, this.f30835b, this.f30836c, jVar.f30836c);
        this.f30836c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public final j b(int i5) {
        if (i5 >= this.f30836c) {
            return new j(Arrays.copyOf(this.f30835b, i5), this.f30836c);
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
        if (!(obj instanceof j)) {
            return super.equals(obj);
        }
        j jVar = (j) obj;
        if (this.f30836c != jVar.f30836c) {
            return false;
        }
        boolean[] zArr = jVar.f30835b;
        for (int i5 = 0; i5 < this.f30836c; i5++) {
            if (this.f30835b[i5] != zArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        if (i5 >= 0 && i5 < this.f30836c) {
            return Boolean.valueOf(this.f30835b[i5]);
        }
        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
        sbA.append(this.f30836c);
        throw new IndexOutOfBoundsException(sbA.toString());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f30836c; i11++) {
            int i12 = i5 * 31;
            boolean z11 = this.f30835b[i11];
            Charset charset = l1.f30847a;
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
        int i5 = this.f30836c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f30835b[i11] == zBooleanValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        int i11;
        c();
        if (i5 < 0 || i5 >= (i11 = this.f30836c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30836c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        boolean[] zArr = this.f30835b;
        boolean z11 = zArr[i5];
        if (i5 < i11 - 1) {
            System.arraycopy(zArr, i5 + 1, zArr, i5, (i11 - i5) - 1);
        }
        this.f30836c--;
        ((AbstractList) this).modCount++;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        boolean[] zArr = this.f30835b;
        System.arraycopy(zArr, i11, zArr, i5, this.f30836c - i11);
        this.f30836c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        c();
        if (i5 < 0 || i5 >= this.f30836c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30836c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        boolean[] zArr = this.f30835b;
        boolean z11 = zArr[i5];
        zArr[i5] = zBooleanValue;
        return Boolean.valueOf(z11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30836c;
    }

    public j(boolean[] zArr, int i5) {
        this.f30835b = zArr;
        this.f30836c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a(((Boolean) obj).booleanValue());
        return true;
    }
}
