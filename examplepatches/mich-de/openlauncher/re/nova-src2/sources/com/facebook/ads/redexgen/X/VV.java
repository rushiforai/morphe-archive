package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.Iterator;

@ElementTypesAreNonnullByDefault
/* loaded from: assets/audience_network/classes.dex */
public abstract class VV<E> implements Iterator<E> {
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VV != com.google.common.collect.UnmodifiableIterator<E> */
    @Override // java.util.Iterator
    @Deprecated
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
