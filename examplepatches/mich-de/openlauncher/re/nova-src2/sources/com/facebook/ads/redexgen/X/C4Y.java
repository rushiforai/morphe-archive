package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.Objects;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.4Y, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4Y<E> extends AbstractC07549l<E> {
    public static final AbstractC07549l<Object> A02 = new C4Y(new Object[0], 0);
    public final transient Object[] A00;
    public final transient int A01;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    public C4Y(Object[] array, int size) {
        this.A00 = array;
        this.A01 = size;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0G() {
        return this.A01;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0H() {
        return 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07549l, com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0I(Object[] dst, int dstOff) {
        System.arraycopy(this.A00, 0, dst, dstOff, this.A01);
        return this.A01 + dstOff;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final boolean A0K() {
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final Object[] A0L() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // java.util.List
    public final E get(int i5) {
        AbstractC1335Wu.A00(i5, this.A01);
        return (E) Objects.requireNonNull(this.A00[i5]);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4Y != com.google.common.collect.RegularImmutableList<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.A01;
    }
}
