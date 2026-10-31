package androidx.datastore.preferences.protobuf;

import sun.misc.Unsafe;

/* loaded from: classes2.dex */
public final class j1 extends m1 {
    public j1(Unsafe unsafe) {
        super(unsafe);
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final boolean c(long j11, Object obj) {
        return n1.f14369g ? n1.b(j11, obj) : n1.c(j11, obj);
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final double d(long j11, Object obj) {
        return Double.longBitsToDouble(g(j11, obj));
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final float e(long j11, Object obj) {
        return Float.intBitsToFloat(f(j11, obj));
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final void j(Object obj, long j11, boolean z11) {
        if (n1.f14369g) {
            n1.k(obj, j11, z11 ? (byte) 1 : (byte) 0);
        } else {
            n1.l(obj, j11, z11 ? (byte) 1 : (byte) 0);
        }
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final void k(Object obj, long j11, byte b11) {
        if (n1.f14369g) {
            n1.k(obj, j11, b11);
        } else {
            n1.l(obj, j11, b11);
        }
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final void l(Object obj, long j11, double d5) {
        o(obj, j11, Double.doubleToLongBits(d5));
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final void m(Object obj, long j11, float f11) {
        n(j11, obj, Float.floatToIntBits(f11));
    }

    @Override // androidx.datastore.preferences.protobuf.m1
    public final boolean r() {
        return false;
    }
}
