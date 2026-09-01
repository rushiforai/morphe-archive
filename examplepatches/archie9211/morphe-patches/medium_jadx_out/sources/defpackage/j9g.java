package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j9g extends q2e {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j9g(Unsafe unsafe, int i) {
        super(unsafe, 4);
        this.c = i;
    }

    @Override // defpackage.q2e
    public final void A(Object obj, long j, double d) {
        switch (this.c) {
            case 0:
                this.b.putLong(obj, j, Double.doubleToLongBits(d));
                break;
            default:
                this.b.putLong(obj, j, Double.doubleToLongBits(d));
                break;
        }
    }

    @Override // defpackage.q2e
    public final void C(Object obj, long j, float f) {
        int i = this.c;
        Unsafe unsafe = this.b;
        switch (i) {
            case 0:
                unsafe.putInt(obj, j, Float.floatToIntBits(f));
                break;
            default:
                unsafe.putInt(obj, j, Float.floatToIntBits(f));
                break;
        }
    }

    @Override // defpackage.q2e
    public final boolean D(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (!o9g.f) {
                }
                break;
            default:
                if (!o9g.f) {
                }
                break;
        }
        return o9g.k(j, obj);
    }

    @Override // defpackage.q2e
    public final double m(long j, Object obj) {
        int i = this.c;
        Unsafe unsafe = this.b;
        switch (i) {
        }
        return Double.longBitsToDouble(unsafe.getLong(obj, j));
    }

    @Override // defpackage.q2e
    public final float s(long j, Object obj) {
        int i = this.c;
        Unsafe unsafe = this.b;
        switch (i) {
        }
        return Float.intBitsToFloat(unsafe.getInt(obj, j));
    }

    @Override // defpackage.q2e
    public final void v(Object obj, long j, boolean z) {
        switch (this.c) {
            case 0:
                if (!o9g.f) {
                    o9g.c(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    o9g.b(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
            default:
                if (!o9g.f) {
                    o9g.c(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    o9g.b(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final void x(Object obj, long j, byte b) {
        switch (this.c) {
            case 0:
                if (!o9g.f) {
                    o9g.c(obj, j, b);
                } else {
                    o9g.b(obj, j, b);
                }
                break;
            default:
                if (!o9g.f) {
                    o9g.c(obj, j, b);
                } else {
                    o9g.b(obj, j, b);
                }
                break;
        }
    }
}
