package com.facebook.ads.redexgen.X;

import java.util.AbstractCollection;
import java.util.Iterator;

/* JADX INFO: Add missing generic type declarations: [V] */
/* loaded from: assets/audience_network/classes.dex */
public class W1<V> extends AbstractCollection<V> {
    public final /* synthetic */ W0 A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W1 != com.google.common.collect.CompactHashMap<K, V>$ValuesView */
    public W1(final W0 this$0) {
        this.A00 = this$0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W1 != com.google.common.collect.CompactHashMap<K, V>$ValuesView */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        this.A00.clear();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W1 != com.google.common.collect.CompactHashMap<K, V>$ValuesView */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator<V> iterator() {
        return this.A00.A0f();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W1 != com.google.common.collect.CompactHashMap<K, V>$ValuesView */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return this.A00.size();
    }
}
