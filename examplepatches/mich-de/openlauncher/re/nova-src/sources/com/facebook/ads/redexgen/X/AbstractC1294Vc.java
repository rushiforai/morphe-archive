package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.util.Comparator;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1294Vc<T> implements Comparator<T> {
    @Override // java.util.Comparator
    public abstract int compare(@ParametricNullness T left, @ParametricNullness T right);

    public static <C extends Comparable> AbstractC1294Vc<C> A03() {
        return C9Y.A01;
    }

    public static <T> AbstractC1294Vc<T> A04(Comparator<T> comparator) {
        if (comparator instanceof AbstractC1294Vc) {
            return (AbstractC1294Vc) comparator;
        }
        return new C07609r(comparator);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wy != com.google.common.base.Function<F, ? extends T> */
    public final <F> AbstractC1294Vc<F> A05(InterfaceC1338Wy<F, ? extends T> function) {
        return new C07659w(function, this);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<T> */
    public <S extends T> AbstractC1294Vc<S> A06() {
        return new C9V(this);
    }
}
