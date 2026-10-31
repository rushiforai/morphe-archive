package com.fyber.inneractive.sdk.protobuf;

import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class l implements Iterator {

    /* renamed from: a, reason: collision with root package name */
    public int f30844a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final int f30845b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ s f30846c;

    public l(s sVar) {
        this.f30846c = sVar;
        this.f30845b = sVar.size();
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return this.f30844a < this.f30845b;
    }

    @Override // java.util.Iterator
    public final Object next() {
        int i5 = this.f30844a;
        if (i5 >= this.f30845b) {
            throw new NoSuchElementException();
        }
        this.f30844a = i5 + 1;
        return Byte.valueOf(this.f30846c.d(i5));
    }

    @Override // java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }
}
