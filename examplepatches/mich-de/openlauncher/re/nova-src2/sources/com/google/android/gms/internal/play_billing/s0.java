package com.google.android.gms.internal.play_billing;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class s0 extends k0 {

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f33514c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f33515d;

    /* renamed from: e, reason: collision with root package name */
    public final transient int f33516e;

    public s0(Object[] objArr, int i5, int i11) {
        this.f33514c = objArr;
        this.f33515d = i5;
        this.f33516e = i11;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final boolean f() {
        return true;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        t2.c.U(i5, this.f33516e);
        Object obj = this.f33514c[i5 + i5 + this.f33515d];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33516e;
    }
}
