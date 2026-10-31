package com.fyber.inneractive.sdk.protobuf;

import java.util.AbstractList;
import java.util.Arrays;
import java.util.RandomAccess;

/* loaded from: classes.dex */
public final class q2 extends c implements RandomAccess {

    /* renamed from: d, reason: collision with root package name */
    public static final q2 f30878d;

    /* renamed from: b, reason: collision with root package name */
    public Object[] f30879b;

    /* renamed from: c, reason: collision with root package name */
    public int f30880c;

    static {
        q2 q2Var = new q2(new Object[0], 0);
        f30878d = q2Var;
        q2Var.f30774a = false;
    }

    public q2(Object[] objArr, int i5) {
        this.f30879b = objArr;
        this.f30880c = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.AbstractCollection, java.util.Collection, java.util.List
    public final boolean add(Object obj) {
        c();
        int i5 = this.f30880c;
        Object[] objArr = this.f30879b;
        if (i5 == objArr.length) {
            this.f30879b = Arrays.copyOf(objArr, ((i5 * 3) / 2) + 1);
        }
        Object[] objArr2 = this.f30879b;
        int i11 = this.f30880c;
        this.f30880c = i11 + 1;
        objArr2[i11] = obj;
        ((AbstractList) this).modCount++;
        return true;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k1
    public final k1 b(int i5) {
        if (i5 >= this.f30880c) {
            return new q2(Arrays.copyOf(this.f30879b, i5), this.f30880c);
        }
        throw new IllegalArgumentException();
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object get(int i5) {
        if (i5 >= 0 && i5 < this.f30880c) {
            return this.f30879b[i5];
        }
        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
        sbA.append(this.f30880c);
        throw new IndexOutOfBoundsException(sbA.toString());
    }

    @Override // com.fyber.inneractive.sdk.protobuf.c, java.util.AbstractList, java.util.List
    public final Object remove(int i5) {
        int i11;
        c();
        if (i5 < 0 || i5 >= (i11 = this.f30880c)) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30880c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        Object[] objArr = this.f30879b;
        Object obj = objArr[i5];
        if (i5 < i11 - 1) {
            System.arraycopy(objArr, i5 + 1, objArr, i5, (i11 - i5) - 1);
        }
        this.f30880c--;
        ((AbstractList) this).modCount++;
        return obj;
    }

    @Override // java.util.AbstractList, java.util.List
    public final Object set(int i5, Object obj) {
        c();
        if (i5 < 0 || i5 >= this.f30880c) {
            StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
            sbA.append(this.f30880c);
            throw new IndexOutOfBoundsException(sbA.toString());
        }
        Object[] objArr = this.f30879b;
        Object obj2 = objArr[i5];
        objArr[i5] = obj;
        ((AbstractList) this).modCount++;
        return obj2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f30880c;
    }

    @Override // java.util.AbstractList, java.util.List
    public final void add(int i5, Object obj) {
        int i11;
        c();
        if (i5 >= 0 && i5 <= (i11 = this.f30880c)) {
            Object[] objArr = this.f30879b;
            if (i11 < objArr.length) {
                System.arraycopy(objArr, i5, objArr, i5 + 1, i11 - i5);
            } else {
                Object[] objArr2 = new Object[a2.c.A(i11, 3, 2, 1)];
                System.arraycopy(objArr, 0, objArr2, 0, i5);
                System.arraycopy(this.f30879b, i5, objArr2, i5 + 1, this.f30880c - i5);
                this.f30879b = objArr2;
            }
            this.f30879b[i5] = obj;
            this.f30880c++;
            ((AbstractList) this).modCount++;
            return;
        }
        StringBuilder sbA = com.fyber.inneractive.sdk.player.exoplayer2.extractor.hls.l.a("Index:", i5, ", Size:");
        sbA.append(this.f30880c);
        throw new IndexOutOfBoundsException(sbA.toString());
    }
}
