package com.google.android.gms.internal.consent_sdk;

/* loaded from: classes3.dex */
public final class c7 extends d7 {
    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final double a(Object obj, long j11) {
        return Double.longBitsToDouble(this.f32050a.getLong(obj, j11));
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final float b(Object obj, long j11) {
        return Float.intBitsToFloat(this.f32050a.getInt(obj, j11));
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final void c(Object obj, long j11, boolean z11) {
        if (e7.f32061g) {
            e7.c(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            e7.d(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final void d(Object obj, long j11, byte b11) {
        if (e7.f32061g) {
            e7.c(obj, j11, b11);
        } else {
            e7.d(obj, j11, b11);
        }
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final void e(Object obj, long j11, double d5) {
        this.f32050a.putLong(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final void f(Object obj, long j11, float f11) {
        this.f32050a.putInt(obj, j11, Float.floatToIntBits(f11));
    }

    @Override // com.google.android.gms.internal.consent_sdk.d7
    public final boolean g(Object obj, long j11) {
        return e7.f32061g ? e7.m(obj, j11) : e7.n(obj, j11);
    }
}
