package com.google.android.gms.internal.consent_sdk;

import java.util.ListIterator;
import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class o0 extends x0 implements ListIterator {

    /* renamed from: b, reason: collision with root package name */
    public final int f32174b;

    /* renamed from: c, reason: collision with root package name */
    public int f32175c;

    /* renamed from: d, reason: collision with root package name */
    public final q0 f32176d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o0(q0 q0Var, int i5) {
        super(0);
        int size = q0Var.size();
        io.sentry.config.a.d0(i5, size);
        this.f32174b = size;
        this.f32175c = i5;
        this.f32176d = q0Var;
    }

    public final Object a(int i5) {
        return this.f32176d.get(i5);
    }

    @Override // java.util.ListIterator
    public final void add(Object obj) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final boolean hasNext() {
        return this.f32175c < this.f32174b;
    }

    @Override // java.util.ListIterator
    public final boolean hasPrevious() {
        return this.f32175c > 0;
    }

    @Override // java.util.Iterator, java.util.ListIterator
    public final Object next() {
        if (!hasNext()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f32175c;
        this.f32175c = i5 + 1;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int nextIndex() {
        return this.f32175c;
    }

    @Override // java.util.ListIterator
    public final Object previous() {
        if (!hasPrevious()) {
            throw new NoSuchElementException();
        }
        int i5 = this.f32175c - 1;
        this.f32175c = i5;
        return a(i5);
    }

    @Override // java.util.ListIterator
    public final int previousIndex() {
        return this.f32175c - 1;
    }

    @Override // java.util.ListIterator
    public final void set(Object obj) {
        throw new UnsupportedOperationException();
    }
}
