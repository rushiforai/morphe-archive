package com.google.android.gms.internal.measurement;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class b3 extends c3 {
    @Override // com.google.android.gms.internal.measurement.c3
    public final void b(Object obj, long j11, byte b11) {
        if (d3.f32457f) {
            d3.b(obj, j11, b11);
        } else {
            d3.c(obj, j11, b11);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final boolean d(long j11, Object obj) {
        return d3.f32457f ? d3.n(obj, j11) : d3.o(obj, j11);
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void g(Object obj, long j11, boolean z11) {
        if (d3.f32457f) {
            d3.b(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            d3.c(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final float h(long j11, Object obj) {
        return Float.intBitsToFloat(((Unsafe) this.f32423a).getInt(obj, j11));
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void j(Object obj, long j11, float f11) {
        ((Unsafe) this.f32423a).putInt(obj, j11, Float.floatToIntBits(f11));
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final double k(long j11, Object obj) {
        return Double.longBitsToDouble(((Unsafe) this.f32423a).getLong(obj, j11));
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void l(Object obj, long j11, double d5) {
        ((Unsafe) this.f32423a).putLong(obj, j11, Double.doubleToLongBits(d5));
    }
}
