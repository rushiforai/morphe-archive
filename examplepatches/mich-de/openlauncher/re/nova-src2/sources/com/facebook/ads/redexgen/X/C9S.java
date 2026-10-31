package com.facebook.ads.redexgen.X;

import java.util.Set;
import javax.annotation.CheckForNull;

/* renamed from: com.facebook.ads.redexgen.X.9S, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C9S<E> extends W6<E> implements Set<E> {
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9S != com.google.common.collect.Sets$FilteredSet<E> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Wt != com.google.common.base.Predicate<? super E> */
    public C9S(Set<E> unfiltered, InterfaceC1334Wt<? super E> predicate) {
        super(unfiltered, predicate);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9S != com.google.common.collect.Sets$FilteredSet<E> */
    @Override // java.util.Collection, java.util.Set
    public final boolean equals(@CheckForNull Object object) {
        return VX.A09(this, object);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9S != com.google.common.collect.Sets$FilteredSet<E> */
    @Override // java.util.Collection, java.util.Set
    public final int hashCode() {
        return VX.A00(this);
    }
}
