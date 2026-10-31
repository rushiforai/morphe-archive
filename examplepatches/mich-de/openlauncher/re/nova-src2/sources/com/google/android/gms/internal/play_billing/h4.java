package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class h4 extends i4 {
    @Override // com.google.android.gms.internal.play_billing.i4
    public final double a(Object obj, long j11) {
        return Double.longBitsToDouble(this.f33422a.getLong(obj, j11));
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final float b(Object obj, long j11) {
        return Float.intBitsToFloat(this.f33422a.getInt(obj, j11));
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final void c(Object obj, long j11, boolean z11) {
        if (j4.f33432g) {
            j4.c(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            j4.d(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final void d(Object obj, long j11, byte b11) {
        if (j4.f33432g) {
            j4.c(obj, j11, b11);
        } else {
            j4.d(obj, j11, b11);
        }
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final void e(Object obj, long j11, double d5) {
        this.f33422a.putLong(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final void f(Object obj, long j11, float f11) {
        this.f33422a.putInt(obj, j11, Float.floatToIntBits(f11));
    }

    @Override // com.google.android.gms.internal.play_billing.i4
    public final boolean g(Object obj, long j11) {
        return j4.f33432g ? j4.m(obj, j11) : j4.n(obj, j11);
    }
}
