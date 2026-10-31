package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import javax.annotation.CheckForNull;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.4P, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4P<E> extends AbstractC07539k<E> {
    public final transient E A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    public C4P(E e3) {
        this.A00 = (E) AbstractC1335Wu.A04(e3);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0I(Object[] dst, int offset) {
        dst[offset] = this.A00;
        return offset + 1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07539k, com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final AbstractC07549l<E> A0J() {
        return AbstractC07549l.A04(this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final boolean A0K() {
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    /* renamed from: A0N, reason: merged with bridge method [inline-methods] */
    public final VV<E> iterator() {
        return AbstractC1304Vn.A03(this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(@CheckForNull Object target) {
        return this.A00.equals(target);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07539k, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.A00.hashCode();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4P != com.google.common.collect.SingletonImmutableSet<E> */
    @Override // java.util.AbstractCollection
    public final String toString() {
        return AbstractJsonLexerKt.BEGIN_LIST + this.A00.toString() + AbstractJsonLexerKt.END_LIST;
    }
}
