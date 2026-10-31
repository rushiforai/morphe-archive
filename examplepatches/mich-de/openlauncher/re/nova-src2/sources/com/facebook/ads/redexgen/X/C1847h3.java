package com.facebook.ads.redexgen.X;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

/* JADX INFO: Add missing generic type declarations: [K] */
/* renamed from: com.facebook.ads.redexgen.X.h3, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1847h3<K> implements Set<K> {
    public final /* synthetic */ AbstractC1850h6 A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    public C1847h3(AbstractC1850h6 abstractC1850h6) {
        this.A00 = abstractC1850h6;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean add(@Nullable K object) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean addAll(Collection<? extends K> collection) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final void clear() {
        this.A00.A0D();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean contains(@Nullable Object obj) {
        return this.A00.A05(obj) >= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean containsAll(Collection<?> collection) {
        return AbstractC1850h6.A00(this.A00.A07(), collection);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean equals(Object obj) {
        return AbstractC1850h6.A03(this, obj);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final int hashCode() {
        int i5 = 0;
        int result = this.A00.A04();
        for (int i11 = result - 1; i11 >= 0; i11--) {
            int i12 = 0;
            Object objA0B = this.A00.A0B(i11, 0);
            if (objA0B != null) {
                i12 = objA0B.hashCode();
            }
            i5 += i12;
        }
        return i5;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean isEmpty() {
        return this.A00.A04() == 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public final Iterator<K> iterator() {
        return new C1845h1(this.A00, 0);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean remove(Object obj) {
        int iA05 = this.A00.A05(obj);
        if (iA05 >= 0) {
            this.A00.A0E(iA05);
            return true;
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean removeAll(Collection<?> collection) {
        return AbstractC1850h6.A01(this.A00.A07(), collection);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final boolean retainAll(Collection<?> collection) {
        return AbstractC1850h6.A02(this.A00.A07(), collection);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final int size() {
        return this.A00.A04();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final Object[] toArray() {
        return this.A00.A0G(0);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h3 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$KeySet */
    @Override // java.util.Set, java.util.Collection
    public final <T> T[] toArray(T[] tArr) {
        return (T[]) this.A00.A0H(tArr, 0);
    }
}
