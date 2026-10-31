package com.fyber.inneractive.sdk.protobuf;

import androidx.compose.ui.node.LayoutNode;
import java.nio.charset.Charset;
import java.util.AbstractList;
import java.util.Arrays;
import java.util.Collection;
import java.util.RandomAccess;

/* loaded from: classes3.dex */
public final class u1 extends c implements j1, RandomAccess, n2 {

    /* renamed from: d, reason: collision with root package name */
    public static final u1 f30913d;

    /* renamed from: b, reason: collision with root package name */
    public long[] f30914b;

    /* renamed from: c, reason: collision with root package name */
    public int f30915c;

    static {
        u1 u1Var = new u1(new long[0], 0);
        f30913d = u1Var;
        u1Var.f30774a = false;
    }

    public u1() {
        this.f30914b = new long[10];
        this.f30915c = 0;
    }

    public final void a(long j11) {
        c();
        int i5 = this.f30915c;
        long[] jArr = this.f30914b;
        if (i5 == jArr.length) {
            long[] jArr2 = new long[a2.c.A(i5, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            this.f30914b = jArr2;
        }
        long[] jArr3 = this.f30914b;
        int i11 = this.f30915c;
        this.f30915c = i11 + 1;
        jArr3[i11] = j11;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        long jLongValue = ((Long) obj).longValue();
        c();
        if (i5 < 0 || i5 > (i11 = this.f30915c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30915c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        long[] jArr = this.f30914b;
        if (i11 < jArr.length) {
            System.arraycopy(jArr, i5, jArr, i5 + 1, i11 - i5);
        } else {
            long[] jArr2 = new long[a2.c.A(i11, 3, 2, 1)];
            System.arraycopy(jArr, 0, jArr2, 0, i5);
            System.arraycopy(this.f30914b, i5, jArr2, i5 + 1, this.f30915c - i5);
            this.f30914b = jArr2;
        }
        this.f30914b[i5] = jLongValue;
        this.f30915c++;
        ((AbstractList) this).modCount++;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean addAll(Collection collection) {
        c();
        Charset charset = l1.f30847a;
        collection.getClass();
        if (!(collection instanceof u1)) {
            return super.addAll(collection);
        }
        u1 u1Var = (u1) collection;
        int i5 = u1Var.f30915c;
        if (i5 == 0) {
            return false;
        }
        int i11 = this.f30915c;
        if (LayoutNode.NotPlacedPlaceOrder - i11 < i5) {
            throw new OutOfMemoryError();
        }
        int i12 = i11 + i5;
        long[] jArr = this.f30914b;
        if (i12 > jArr.length) {
            this.f30914b = Arrays.copyOf(jArr, i12);
        }
        System.arraycopy(u1Var.f30914b, 0, this.f30914b, this.f30915c, u1Var.f30915c);
        this.f30915c = i12;
        ((AbstractList) this).modCount++;
        return true;
    }

    public final void c(int i5) {
        if (i5 < 0 || i5 >= this.f30915c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30915c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean contains(Object obj) {
        return indexOf(obj) != -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public final u1 b(int i5) {
        if (i5 >= this.f30915c) {
            return new u1(Arrays.copyOf(this.f30914b, i5), this.f30915c);
        }
        throw new IllegalArgumentException();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u1)) {
            return super.equals(obj);
        }
        u1 u1Var = (u1) obj;
        if (this.f30915c != u1Var.f30915c) {
            return false;
        }
        long[] jArr = u1Var.f30914b;
        for (int i5 = 0; i5 < this.f30915c; i5++) {
            if (this.f30914b[i5] != jArr[i5]) {
                return false;
            }
        }
        return true;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        c(i5);
        return Long.valueOf(this.f30914b[i5]);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.Collection, java.util.List
    public final int hashCode() {
        int i5 = 1;
        for (int i11 = 0; i11 < this.f30915c; i11++) {
            long j11 = this.f30914b[i11];
            Charset charset = l1.f30847a;
            i5 = (i5 * 31) + ((int) (j11 ^ (j11 >>> 32)));
        }
        return i5;
    }

    @Override // java.util.AbstractList, java.util.List
    public final int indexOf(Object obj) {
        if (!(obj instanceof Long)) {
            return -1;
        }
        long jLongValue = ((Long) obj).longValue();
        int i5 = this.f30915c;
        for (int i11 = 0; i11 < i5; i11++) {
            if (this.f30914b[i11] == jLongValue) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        c();
        c(i5);
        long[] jArr = this.f30914b;
        long j11 = jArr[i5];
        if (i5 < this.f30915c - 1) {
            System.arraycopy(jArr, i5 + 1, jArr, i5, (r3 - i5) - 1);
        }
        this.f30915c--;
        ((AbstractList) this).modCount++;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractList
    public final void removeRange(int i5, int i11) {
        c();
        if (i11 < i5) {
            throw new IndexOutOfBoundsException("toIndex < fromIndex");
        }
        long[] jArr = this.f30914b;
        System.arraycopy(jArr, i11, jArr, i5, this.f30915c - i11);
        this.f30915c -= i11 - i5;
        ((AbstractList) this).modCount++;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        long jLongValue = ((Long) obj).longValue();
        c();
        c(i5);
        long[] jArr = this.f30914b;
        long j11 = jArr[i5];
        jArr[i5] = jLongValue;
        return Long.valueOf(j11);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30915c;
    }

    public u1(long[] jArr, int i5) {
        this.f30914b = jArr;
        this.f30915c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        a(((Long) obj).longValue());
        return true;
    }
}
