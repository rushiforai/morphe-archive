package com.google.android.gms.internal.consent_sdk;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class t0 extends q0 {

    /* renamed from: e, reason: collision with root package name */
    public static final t0 f32242e = new t0(new Object[0], 0);

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f32243c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f32244d;

    public t0(Object[] objArr, int i5) {
        this.f32243c = objArr;
        this.f32244d = i5;
    }

    @Override // com.google.android.gms.internal.consent_sdk.q0, com.google.android.gms.internal.consent_sdk.n0
    public final int b(Object[] objArr) {
        Object[] objArr2 = this.f32243c;
        int i5 = this.f32244d;
        System.arraycopy(objArr2, 0, objArr, 0, i5);
        return i5;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int c() {
        return this.f32244d;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final int d() {
        return 0;
    }

    @Override // com.google.android.gms.internal.consent_sdk.n0
    public final Object[] e() {
        return this.f32243c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        io.sentry.config.a.c0(i5, this.f32244d);
        Object obj = this.f32243c[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f32244d;
    }
}
