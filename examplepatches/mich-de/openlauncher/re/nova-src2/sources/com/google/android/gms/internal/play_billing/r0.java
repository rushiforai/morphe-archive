package com.google.android.gms.internal.play_billing;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class r0 extends n0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient t0 f33498c;

    /* renamed from: d, reason: collision with root package name */
    public final transient s0 f33499d;

    public r0(t0 t0Var, s0 s0Var) {
        this.f33498c = t0Var;
        this.f33499d = s0Var;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final int b(Object[] objArr) {
        return this.f33499d.b(objArr);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final boolean contains(Object obj) {
        return this.f33498c.get(obj) != null;
    }

    @Override // com.google.android.gms.internal.play_billing.n0, com.google.android.gms.internal.play_billing.h0
    public final k0 e() {
        return this.f33499d;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
    public final /* synthetic */ Iterator iterator() {
        return this.f33499d.listIterator(0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
    public final int size() {
        return this.f33498c.f33533f;
    }
}
