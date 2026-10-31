package com.facebook.ads.redexgen.X;

import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;
import javax.annotation.CheckForNull;

/* JADX INFO: Add missing generic type declarations: [E] */
/* renamed from: com.facebook.ads.redexgen.X.9T, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C9T<E> extends VY<E> {
    public static String[] A02 = {"OSm0e3RL", "blR7VeAz63hNsRiDu7Y", "0JleGVqOjhuWWSJ74BTEH61vCZC3", "rVLzlt", "uHPA3vHkHSV3DEW4jngXPsouTmk8lzyw", "uEMOgZJzKPA1oXO", "qYotUWymhbO3lokEs9pDsX6bGi", "51CqHtAbrDsjwN3D"};
    public final /* synthetic */ Set A00;
    public final /* synthetic */ Set A01;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C9T(final Set val$set1, final Set val$set2) {
        super(null);
        this.A00 = val$set1;
        this.A01 = val$set2;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final VV<E> iterator() {
        return new A2<E>() { // from class: com.facebook.ads.redexgen.X.4R
            public final Iterator<E> A00;

            {
                this.A00 = this.A01.A00.iterator();
            }

            @Override // com.facebook.ads.redexgen.X.A2
            @CheckForNull
            public final E A02() {
                while (this.A00.hasNext()) {
                    E next = this.A00.next();
                    if (this.A01.A01.contains(next)) {
                        return next;
                    }
                }
                E e3 = A01();
                return e3;
            }
        };
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(@CheckForNull Object object) {
        if (this.A00.contains(object)) {
            Set set = this.A01;
            String[] strArr = A02;
            if (strArr[7].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[7] = "Rn5H4z8Ul7O0ZONy";
            strArr2[6] = "gs3sDKYfzpL2LoqYXI3iqsOw3a";
            if (set.contains(object)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean containsAll(Collection<?> collection) {
        return this.A00.containsAll(collection) && this.A01.containsAll(collection);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean isEmpty() {
        return Collections.disjoint(this.A01, this.A00);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        int i5 = 0;
        Iterator<E> it = this.A00.iterator();
        while (it.hasNext()) {
            if (this.A01.contains(it.next())) {
                i5++;
            }
        }
        return i5;
    }
}
