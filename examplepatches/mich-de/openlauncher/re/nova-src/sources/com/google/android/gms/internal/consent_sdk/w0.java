package com.google.android.gms.internal.consent_sdk;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class w0 extends r0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient Object f32280c;

    public w0(Object obj) {
        this.f32280c = obj;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int b(Object[] objArr) {
        objArr[0] = this.f32280c;
        return 1;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0, java.util.AbstractCollection, java.util.Collection
    public final boolean contains(Object obj) {
        return this.f32280c.equals(obj);
    }

    @Override // com.google.android.gms.internal.consent_sdk.r0, java.util.Collection, java.util.Set
    public final int hashCode() {
        return this.f32280c.hashCode();
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return new s0(this.f32280c);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return 1;
    }

    @Override // java.util.AbstractCollection
    public final String toString() {
        return b.c0.l("[", this.f32280c.toString(), "]");
    }
}
