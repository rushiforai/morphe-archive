package com.facebook.ads.redexgen.X;

import java.util.AbstractSet;
import java.util.Collection;

/* loaded from: assets/audience_network/classes.dex */
public abstract class VZ<E> extends AbstractSet<E> {
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VZ != com.google.common.collect.Sets$ImprovedAbstractSet<E> */
    @Override // java.util.AbstractSet, java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean removeAll(Collection<?> c11) {
        return VX.A0A(this, c11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VZ != com.google.common.collect.Sets$ImprovedAbstractSet<E> */
    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public boolean retainAll(Collection<?> c11) {
        return super.retainAll((Collection) AbstractC1335Wu.A04(c11));
    }
}
