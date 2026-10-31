package com.google.android.gms.internal.play_billing;

import java.util.Objects;

/* loaded from: classes3.dex */
public final class o0 extends k0 {

    /* renamed from: e, reason: collision with root package name */
    public static final o0 f33465e = new o0(new Object[0], 0);

    /* renamed from: c, reason: collision with root package name */
    public final transient Object[] f33466c;

    /* renamed from: d, reason: collision with root package name */
    public final transient int f33467d;

    public o0(Object[] objArr, int i5) {
        this.f33466c = objArr;
        this.f33467d = i5;
    }

    @Override // com.google.android.gms.internal.play_billing.k0, com.google.android.gms.internal.play_billing.h0
    public final int b(Object[] objArr) {
        Object[] objArr2 = this.f33466c;
        int i5 = this.f33467d;
        System.arraycopy(objArr2, 0, objArr, 0, i5);
        return i5;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final int c() {
        return this.f33467d;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final int d() {
        return 0;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final boolean f() {
        return false;
    }

    @Override // com.google.android.gms.internal.play_billing.h0
    public final Object[] g() {
        return this.f33466c;
    }

    @Override // java.util.List
    public final Object get(int i5) {
        t2.c.U(i5, this.f33467d);
        Object obj = this.f33466c[i5];
        Objects.requireNonNull(obj);
        return obj;
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.util.List
    public final int size() {
        return this.f33467d;
    }
}
