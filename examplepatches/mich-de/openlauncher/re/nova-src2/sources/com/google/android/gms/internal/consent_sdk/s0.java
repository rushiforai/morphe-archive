package com.google.android.gms.internal.consent_sdk;

import java.util.NoSuchElementException;

/* loaded from: classes3.dex */
public final class s0 extends x0 {

    /* renamed from: b, reason: collision with root package name */
    public final Object f32232b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f32233c;

    public s0(Object obj) {
        super(0);
        this.f32232b = obj;
    }

    @Override // java.util.Iterator
    public final boolean hasNext() {
        return !this.f32233c;
    }

    @Override // java.util.Iterator
    public final Object next() {
        if (this.f32233c) {
            throw new NoSuchElementException();
        }
        this.f32233c = true;
        return this.f32232b;
    }
}
