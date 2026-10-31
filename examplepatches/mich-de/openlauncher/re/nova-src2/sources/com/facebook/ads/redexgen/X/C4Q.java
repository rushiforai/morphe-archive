package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.Comparator;
import java.util.SortedSet;
import javax.annotation.CheckForNull;

/* renamed from: com.facebook.ads.redexgen.X.4Q, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C4Q<E> extends C9S<E> implements SortedSet<E> {
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super E> */
    public C4Q(SortedSet<E> unfiltered, InterfaceC1334Wt<? super E> predicate) {
        super(unfiltered, predicate);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    @CheckForNull
    public final Comparator<? super E> comparator() {
        return ((SortedSet) this.A01).comparator();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    @ParametricNullness
    public final E first() {
        return (E) AbstractC1304Vn.A05(this.A01.iterator(), this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    public final SortedSet<E> headSet(@ParametricNullness E toElement) {
        return new C4Q(((SortedSet) this.A01).headSet(toElement), this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    @ParametricNullness
    public E last() {
        SortedSet sortedSetHeadSet = (SortedSet) this.A01;
        while (true) {
            E e3 = (Object) sortedSetHeadSet.last();
            if (this.A00.A4d(e3)) {
                return e3;
            }
            sortedSetHeadSet = sortedSetHeadSet.headSet(e3);
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    public final SortedSet<E> subSet(@ParametricNullness E fromElement, @ParametricNullness E toElement) {
        return new C4Q(((SortedSet) this.A01).subSet(fromElement, toElement), this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Q != com.google.common.collect.Sets$FilteredSortedSet<E> */
    @Override // java.util.SortedSet
    public final SortedSet<E> tailSet(@ParametricNullness E fromElement) {
        return new C4Q(((SortedSet) this.A01).tailSet(fromElement), this.A00);
    }
}
