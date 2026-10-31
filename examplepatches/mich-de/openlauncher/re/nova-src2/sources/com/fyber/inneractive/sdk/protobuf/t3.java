package com.fyber.inneractive.sdk.protobuf;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class t3 extends w3 {
    public t3(Unsafe unsafe) {
        super(unsafe);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, byte b11) {
        if (x3.f30960h) {
            x3.a(obj, j11, b11);
        } else {
            x3.b(obj, j11, b11);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final boolean b() {
        return false;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final double c(Object obj, long j11) {
        return Double.longBitsToDouble(this.f30941a.getLong(obj, j11));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final float d(Object obj, long j11) {
        return Float.intBitsToFloat(this.f30941a.getInt(obj, j11));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final byte b(Object obj, long j11) {
        return x3.f30960h ? x3.a(obj, j11) : x3.b(obj, j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final boolean a(Object obj, long j11) {
        return x3.f30960h ? x3.a(obj, j11) != 0 : x3.b(obj, j11) != 0;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, boolean z11) {
        if (x3.f30960h) {
            x3.a(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            x3.b(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, float f11) {
        this.f30941a.putInt(obj, j11, Float.floatToIntBits(f11));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(Object obj, long j11, double d5) {
        this.f30941a.putLong(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final byte a(long j11) {
        throw new UnsupportedOperationException();
    }

    @Override // com.fyber.inneractive.sdk.protobuf.w3
    public final void a(long j11, byte[] bArr, long j12) {
        throw new UnsupportedOperationException();
    }
}
