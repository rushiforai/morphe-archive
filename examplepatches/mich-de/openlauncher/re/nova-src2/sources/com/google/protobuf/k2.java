package com.google.protobuf;

/* loaded from: classes.dex */
public final class k2 extends l2 {
    @Override // com.google.protobuf.l2
    public final void c(long j11, byte[] bArr, long j12) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.protobuf.l2
    public final boolean d(long j11, Object obj) {
        return m2.f34916h ? m2.f(j11, obj) != 0 : m2.g(j11, obj) != 0;
    }

    @Override // com.google.protobuf.l2
    public final byte e(long j11) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.protobuf.l2
    public final double f(long j11, Object obj) {
        return Double.longBitsToDouble(i(j11, obj));
    }

    @Override // com.google.protobuf.l2
    public final float g(long j11, Object obj) {
        return Float.intBitsToFloat(h(j11, obj));
    }

    @Override // com.google.protobuf.l2
    public final void l(Object obj, long j11, boolean z11) {
        if (m2.f34916h) {
            m2.j(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            m2.k(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // com.google.protobuf.l2
    public final void m(Object obj, long j11, byte b11) {
        if (m2.f34916h) {
            m2.j(obj, j11, b11);
        } else {
            m2.k(obj, j11, b11);
        }
    }

    @Override // com.google.protobuf.l2
    public final void n(Object obj, long j11, double d5) {
        q(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // com.google.protobuf.l2
    public final void o(Object obj, long j11, float f11) {
        p(j11, obj, Float.floatToIntBits(f11));
    }

    @Override // com.google.protobuf.l2
    public final boolean s() {
        return false;
    }
}
