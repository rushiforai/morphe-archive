package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import com.google.common.collect.ParametricNullness;
import java.io.Serializable;
import java.util.Arrays;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.9V, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C9V<T> extends AbstractC1294Vc<T> implements Serializable {
    public static byte[] A01;
    public static final long serialVersionUID = 0;
    public final AbstractC1294Vc<? super T> A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 49);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{33, 125, 106, 121, 106, 125, 124, 106, 39, 38};
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Vc != com.google.common.collect.Ordering<? super T> */
    public C9V(AbstractC1294Vc<? super T> forwardOrder) {
        this.A00 = (AbstractC1294Vc) AbstractC1335Wu.A04(forwardOrder);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc
    public final <S extends T> AbstractC1294Vc<S> A06() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1294Vc, java.util.Comparator
    public final int compare(@ParametricNullness T a11, @ParametricNullness T b11) {
        return this.A00.compare(b11, a11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<?> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    @Override // java.util.Comparator
    public final boolean equals(@CheckForNull Object object) {
        if (object == this) {
            return true;
        }
        if (object instanceof C9V) {
            return this.A00.equals(((C9V) object).A00);
        }
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    public final int hashCode() {
        return -this.A00.hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9V != com.google.common.collect.ReverseOrdering<T> */
    public final String toString() {
        return this.A00 + A00(0, 10, 62);
    }
}
