package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Collection;
import java.util.ConcurrentModificationException;
import java.util.Iterator;

/* JADX INFO: Add missing generic type declarations: [V] */
/* loaded from: assets/audience_network/classes.dex */
public class WC<V> implements Iterator<V> {
    public final Collection<V> A00;
    public final Iterator<V> A01;
    public final /* synthetic */ WA A02;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    public WC(final WA this$1) {
        this.A02 = this$1;
        this.A00 = this.A02.A00;
        this.A01 = AbstractC06354f.A05(this$1.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    public WC(final WA this$1, Iterator<V> delegateIterator) {
        this.A02 = this$1;
        this.A00 = this.A02.A00;
        this.A01 = delegateIterator;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    private final void A01() {
        this.A02.A04();
        if (this.A02.A00 == this.A00) {
        } else {
            throw new ConcurrentModificationException();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    public final Iterator<V> A02() {
        A01();
        return this.A01;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    @Override // java.util.Iterator
    public final boolean hasNext() {
        A01();
        return this.A01.hasNext();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    @Override // java.util.Iterator
    @ParametricNullness
    public final V next() {
        A01();
        return this.A01.next();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.WC != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedCollection$WrappedIterator */
    @Override // java.util.Iterator
    public final void remove() {
        this.A01.remove();
        AbstractC06354f.A01(this.A02.A04);
        this.A02.A05();
    }
}
