package com.google.android.gms.internal.play_billing;

import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class i0 extends com.google.android.gms.internal.consent_sdk.x0 implements ListIterator {

    /* renamed from: b, reason: collision with root package name */
    public final int f33416b;

    /* renamed from: c, reason: collision with root package name */
    public int f33417c;

    /* renamed from: d, reason: collision with root package name */
    public final k0 f33418d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(k0 k0Var, int i5) {
        super(1);
        int size = k0Var.size();
        t2.c.V(i5, size);
        this.f33416b = size;
        this.f33417c = i5;
        this.f33418d = k0Var;
    }

    public final Object a(int i5) {
        return this.f33418d.get(i5);
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.f33417c < this.f33416b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f33417c > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f33417c;
        this.f33417c = i5 + 1;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f33417c;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f33417c - 1;
        this.f33417c = i5;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f33417c - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
