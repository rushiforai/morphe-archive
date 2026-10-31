package com.facebook.ads.redexgen.X;

import java.util.Iterator;
import java.util.Set;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [E] */
/* renamed from: com.facebook.ads.redexgen.X.9U, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C9U<E> extends VY<E> {
    public final /* synthetic */ Set A00;
    public final /* synthetic */ Set A01;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C9U(final Set val$set1, final Set val$set2) {
        super(null);
        this.A00 = val$set1;
        this.A01 = val$set2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final VV<E> iterator() {
        return new A2<E>() { // from class: com.facebook.ads.redexgen.X.4S
            public static String[] A03 = {"FSOmyklUFzaVC7xQeTjgmsDLg0Wa2djw", "9DrbO6PK2QrWKu6SMrev9ehpZiSi6Gyp", "px5GZ9QyI7wiAQvvBGHrLXVVR", "u8im9YcQsr2F5ECSzEvv89hDw18EfLoB", "9Sab1Za9aUHadY4", "st7nw1WmrXLuVswANuFTvQLD4", "Ze1xLXuve8mZjjBl8rZSCrUWt1nJJNXH", "MN8RZUed2G2kBKaqghVLJ1WnfOfOVvbP"};
            public final Iterator<? extends E> A00;
            public final Iterator<? extends E> A01;

            {
                this.A00 = this.A02.A00.iterator();
                this.A01 = this.A02.A01.iterator();
            }

            @Override // com.facebook.ads.redexgen.X.A2
            @CheckForNull
            public final E A02() {
                E next;
                if (this.A00.hasNext()) {
                    return this.A00.next();
                }
                do {
                    boolean zHasNext = this.A01.hasNext();
                    if (A03[7].charAt(1) == 'm') {
                        throw new RuntimeException();
                    }
                    String[] strArr = A03;
                    strArr[4] = "xbo8KN7mzq5u4Y8";
                    strArr[0] = "NtJkMvseN2BIapvvPtYvIs9SDbhJaD5Q";
                    if (zHasNext) {
                        next = this.A01.next();
                    } else {
                        E e3 = A01();
                        return e3;
                    }
                } while (this.A02.A00.contains(next));
                return next;
            }
        };
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(@CheckForNull Object object) {
        return this.A00.contains(object) || this.A01.contains(object);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return this.A00.isEmpty() && this.A01.isEmpty();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int size = this.A00.size();
        Iterator<E> it = this.A01.iterator();
        while (it.hasNext()) {
            if (!this.A00.contains(it.next())) {
                size++;
            }
        }
        return size;
    }
}
