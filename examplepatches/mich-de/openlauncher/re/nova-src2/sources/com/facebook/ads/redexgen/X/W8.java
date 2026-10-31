package com.facebook.ads.redexgen.X;

import java.util.AbstractCollection;
import java.util.Iterator;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [V] */
/* loaded from: assets/audience_network/classes.dex */
public class W8<V> extends AbstractCollection<V> {
    public final /* synthetic */ AbstractC07669x A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W8 != com.google.common.collect.AbstractMultimap<K, V>$Values */
    public W8(final AbstractC07669x this$0) {
        this.A00 = this$0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W8 != com.google.common.collect.AbstractMultimap<K, V>$Values */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final void clear() {
        this.A00.clear();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W8 != com.google.common.collect.AbstractMultimap<K, V>$Values */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final boolean contains(@CheckForNull Object o) {
        return this.A00.A03(o);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W8 != com.google.common.collect.AbstractMultimap<K, V>$Values */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public final Iterator<V> iterator() {
        return this.A00.A0C();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.W8 != com.google.common.collect.AbstractMultimap<K, V>$Values */
    @Override // java.util.AbstractCollection, java.util.Collection
    public final int size() {
        return this.A00.size();
    }
}
