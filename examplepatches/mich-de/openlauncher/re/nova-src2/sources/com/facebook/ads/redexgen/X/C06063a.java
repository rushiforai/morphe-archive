package com.facebook.ads.redexgen.X;

import com.google.common.collect.ParametricNullness;
import java.util.NoSuchElementException;

/* renamed from: com.facebook.ads.redexgen.X.3a, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C06063a<E> extends AbstractC06404k<E> {
    public final AbstractC07549l<E> A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3a != com.google.common.collect.ImmutableList$Itr<E> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<E> */
    /* JADX WARN: Illegal instructions before constructor call */
    public C06063a(AbstractC07549l<E> list, final int index) {
        final int size = list.size();
        new C9R<E>(size, index) { // from class: com.facebook.ads.redexgen.X.4k
            public int A00;
            public final int A01;

            @ParametricNullness
            public abstract E A00(int index2);

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            {
                AbstractC1335Wu.A01(index, size);
                this.A01 = size;
                this.A00 = index;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.Iterator, java.util.ListIterator
            public final boolean hasNext() {
                return this.A00 < this.A01;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.ListIterator
            public final boolean hasPrevious() {
                return this.A00 > 0;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.Iterator, java.util.ListIterator
            @ParametricNullness
            public final E next() {
                if (hasNext()) {
                    int i5 = this.A00;
                    this.A00 = i5 + 1;
                    return A00(i5);
                }
                throw new NoSuchElementException();
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.ListIterator
            public final int nextIndex() {
                return this.A00;
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.ListIterator
            @ParametricNullness
            public final E previous() {
                if (hasPrevious()) {
                    int i5 = this.A00 - 1;
                    this.A00 = i5;
                    return A00(i5);
                }
                throw new NoSuchElementException();
            }

            /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4k != com.google.common.collect.AbstractIndexedListIterator<E> */
            @Override // java.util.ListIterator
            public final int previousIndex() {
                return this.A00 - 1;
            }
        };
        this.A00 = list;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.3a != com.google.common.collect.ImmutableList$Itr<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC06404k
    public final E A00(int index) {
        return this.A00.get(index);
    }
}
