package com.fyber.inneractive.sdk.protobuf;

import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class p extends s {
    @Override // java.lang.Iterable
    public final Iterator iterator() {
        return new l(this);
    }
}
