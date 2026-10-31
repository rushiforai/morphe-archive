package com.fyber.inneractive.sdk.protobuf;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class q3 implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public final Iterator f30881a;

    public q3(r3 r3Var) {
        this.f30881a = r3Var.f30888a.iterator();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f30881a.hasNext();
    }

    @Override // java.util.Iterator
    public final Object next() {
        return (String) this.f30881a.next();
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
