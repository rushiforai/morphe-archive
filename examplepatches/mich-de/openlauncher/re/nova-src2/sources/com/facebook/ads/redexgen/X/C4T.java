package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.4T, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C4T<E> extends AbstractC07539k<E> {
    public final transient Object[] A00;
    public final transient Object[] A01;
    public final transient int A02;
    public final transient int A03;
    public final transient int A04;
    public static final Object[] A06 = new Object[0];
    public static final C4T<Object> A05 = new C4T<>(A06, 0, A06, 0, 0);

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    public C4T(Object[] elements, int hashCode, Object[] table, int mask, int size) {
        this.A00 = elements;
        this.A02 = hashCode;
        this.A01 = table;
        this.A03 = mask;
        this.A04 = size;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0G() {
        return this.A04;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0H() {
        return 0;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final int A0I(Object[] dst, int offset) {
        System.arraycopy(this.A00, 0, dst, offset, this.A04);
        return this.A04 + offset;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final boolean A0K() {
        return false;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt
    public final Object[] A0L() {
        return this.A00;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07539k
    public final AbstractC07549l<E> A0M() {
        return AbstractC07549l.A09(this.A00, this.A04);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    /* renamed from: A0N */
    public final VV<E> iterator() {
        return A0J().iterator();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07539k
    public final boolean A0O() {
        return true;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC1310Vt, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(@CheckForNull Object target) {
        Object[] objArr = this.A01;
        if (target == null || objArr.length == 0) {
            return false;
        }
        int iA02 = AbstractC1312Vv.A02(target);
        while (true) {
            int i5 = iA02 & this.A03;
            Object obj = objArr[i5];
            if (obj == null) {
                return false;
            }
            if (obj.equals(target)) {
                return true;
            }
            iA02 = i5 + 1;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // com.facebook.ads.redexgen.X.AbstractC07539k, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.A02;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.4T != com.google.common.collect.RegularImmutableSet<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.A04;
    }
}
