package com.fyber.inneractive.sdk.protobuf;

import java.util.ListIterator;

/* loaded from: classes3.dex */
public final class p3 implements ListIterator {

    /* renamed from: a, reason: collision with root package name */
    public final ListIterator f30873a;

    public p3(r3 r3Var, int i5) {
        this.f30873a = r3Var.f30888a.listIterator(i5);
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final boolean hasNext() {
        return this.f30873a.hasNext();
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f30873a.hasPrevious();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final Object next() {
        return (String) this.f30873a.next();
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f30873a.nextIndex();
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        return (String) this.f30873a.previous();
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f30873a.previousIndex();
    }

    @Override // java.util.ListIterator, java.util.Iterator
    public final void remove() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
