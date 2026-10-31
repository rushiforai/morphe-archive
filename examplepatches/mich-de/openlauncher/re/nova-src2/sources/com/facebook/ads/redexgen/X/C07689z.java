package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.ListIterator;

/* JADX INFO: Add missing generic type declarations: [V] */
/* renamed from: com.facebook.ads.redexgen.X.9z, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C07689z<V> extends AbstractC06354f<K, V>.WrappedCollection.WrappedIterator implements ListIterator<V> {
    public final /* synthetic */ C07679y A00;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    public C07689z(final C07679y this$1) {
        super(this$1);
        this.A00 = this$1;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    public C07689z(final C07679y this$1, int index) {
        super(this$1, this$1.A06().listIterator(index));
        this.A00 = this$1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    private ListIterator<V> A00() {
        return (ListIterator) A02();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    public final void add(@ParametricNullness V value) {
        boolean zIsEmpty = this.A00.isEmpty();
        A00().add(value);
        AbstractC06354f.A00(this.A00.A00);
        if (zIsEmpty) {
            this.A00.A03();
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return A00().hasPrevious();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    public final int nextIndex() {
        return A00().nextIndex();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    @ParametricNullness
    public final V previous() {
        return A00().previous();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    public final int previousIndex() {
        return A00().previousIndex();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9z != com.google.common.collect.AbstractMapBasedMultimap<K, V>$WrappedList$WrappedListIterator */
    @Override // java.util.ListIterator
    public final void set(@ParametricNullness V value) {
        A00().set(value);
    }
}
