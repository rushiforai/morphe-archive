package com.facebook.ads.redexgen.X;

import java.util.Collection;
import java.util.Iterator;

/* JADX INFO: Add missing generic type declarations: [V] */
/* renamed from: com.facebook.ads.redexgen.X.h5, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1849h5<V> implements Collection<V> {
    public static String[] A01 = {"WaXEENy4Qqf0iZa9rE7K5Tc", "CdcJslr1GuWzD3hgs8KQ2mZhu", "VqX8APEjT5Wjv2WgYqLWWETF9QEoqL89", "1lDdPMX0zjCtSNVsVcyG9UOAfTksMFfY", "Q30AX00aPMLh2Hp2SxjAPSj4hvT3yuLk", "DGZ9hWDjpXQG3w", "JKstht1TU3rAhNk0s2YNIFhF9tCkCvUD", "xnB3F8eRzgUElZJXVWbAPi1tu19rGp71"};
    public final /* synthetic */ AbstractC1850h6 A00;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Collection
    public final boolean removeAll(Collection<?> collection) {
        int iA04 = this.A00.A04();
        boolean z11 = false;
        int i5 = 0;
        while (i5 < iA04) {
            if (collection.contains(this.A00.A0B(i5, 1))) {
                this.A00.A0E(i5);
                i5--;
                iA04--;
                z11 = true;
            }
            i5++;
        }
        return z11;
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    @Override // java.util.Collection
    public final boolean retainAll(Collection<?> collection) {
        int iA04 = this.A00.A04();
        boolean z11 = false;
        int i5 = 0;
        while (i5 < iA04) {
            if (!collection.contains(this.A00.A0B(i5, 1))) {
                this.A00.A0E(i5);
                i5--;
                iA04--;
                z11 = true;
            }
            i5++;
        }
        return z11;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    public C1849h5(AbstractC1850h6 abstractC1850h6) {
        this.A00 = abstractC1850h6;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean add(V object) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean addAll(Collection<? extends V> collection) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final void clear() {
        this.A00.A0D();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean contains(Object obj) {
        return this.A00.A06(obj) >= 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean containsAll(Collection<?> collection) {
        Iterator<?> it = collection.iterator();
        while (it.hasNext()) {
            if (!contains(it.next())) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean isEmpty() {
        return this.A00.A04() == 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection, java.lang.Iterable
    public final Iterator<V> iterator() {
        return new C1845h1(this.A00, 1);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final boolean remove(Object obj) {
        int iA06 = this.A00.A06(obj);
        if (iA06 >= 0) {
            this.A00.A0E(iA06);
            return true;
        }
        if (A01[6].charAt(4) == 'M') {
            throw new RuntimeException();
        }
        String[] strArr = A01;
        strArr[1] = "JaPNh4sPI8rJ5EjhCFrDgKQsA";
        strArr[5] = "wvLzjGRSTCxgOw";
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final int size() {
        return this.A00.A04();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final Object[] toArray() {
        return this.A00.A0G(1);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.h5 != com.facebook.ads.internal.androidx.support.v4.util.MapCollections<K, V>$ValuesCollection */
    @Override // java.util.Collection
    public final <T> T[] toArray(T[] tArr) {
        return (T[]) this.A00.A0H(tArr, 1);
    }
}
