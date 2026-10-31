package com.google.crypto.tink.shaded.protobuf;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public final class d1 extends f1 {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f34591b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d1(Unsafe unsafe, int i5) {
        super(unsafe);
        this.f34591b = i5;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final boolean c(long j11, Object obj) {
        switch (this.f34591b) {
            case 0:
                if (g1.f34605g) {
                    if (g1.h(j11, obj) == 0) {
                    }
                } else if (g1.i(j11, obj) == 0) {
                }
                break;
            default:
                if (g1.f34605g) {
                    if (g1.h(j11, obj) == 0) {
                    }
                } else if (g1.i(j11, obj) == 0) {
                }
                break;
        }
        return false;
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final byte d(long j11, Object obj) {
        switch (this.f34591b) {
            case 0:
                if (!g1.f34605g) {
                    break;
                } else {
                    break;
                }
            default:
                if (!g1.f34605g) {
                    break;
                } else {
                    break;
                }
        }
        return g1.i(j11, obj);
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final double e(long j11, Object obj) {
        switch (this.f34591b) {
        }
        return Double.longBitsToDouble(h(j11, obj));
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final float f(long j11, Object obj) {
        switch (this.f34591b) {
        }
        return Float.intBitsToFloat(g(j11, obj));
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void k(Object obj, long j11, boolean z11) {
        switch (this.f34591b) {
            case 0:
                if (!g1.f34605g) {
                    g1.m(obj, j11, z11 ? (byte) 1 : (byte) 0);
                    break;
                } else {
                    g1.l(obj, j11, z11 ? (byte) 1 : (byte) 0);
                    break;
                }
            default:
                if (!g1.f34605g) {
                    g1.m(obj, j11, z11 ? (byte) 1 : (byte) 0);
                    break;
                } else {
                    g1.l(obj, j11, z11 ? (byte) 1 : (byte) 0);
                    break;
                }
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void l(Object obj, long j11, byte b11) {
        switch (this.f34591b) {
            case 0:
                if (!g1.f34605g) {
                    g1.m(obj, j11, b11);
                    break;
                } else {
                    g1.l(obj, j11, b11);
                    break;
                }
            default:
                if (!g1.f34605g) {
                    g1.m(obj, j11, b11);
                    break;
                } else {
                    g1.l(obj, j11, b11);
                    break;
                }
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void m(Object obj, long j11, double d5) {
        switch (this.f34591b) {
            case 0:
                p(obj, j11, Double.doubleToLongBits(d5));
                break;
            default:
                p(obj, j11, Double.doubleToLongBits(d5));
                break;
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final void n(Object obj, long j11, float f11) {
        switch (this.f34591b) {
            case 0:
                o(j11, obj, Float.floatToIntBits(f11));
                break;
            default:
                o(j11, obj, Float.floatToIntBits(f11));
                break;
        }
    }

    @Override // com.google.crypto.tink.shaded.protobuf.f1
    public final boolean s() {
        switch (this.f34591b) {
        }
        return false;
    }
}
