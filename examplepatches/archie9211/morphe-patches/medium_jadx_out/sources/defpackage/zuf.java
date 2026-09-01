package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zuf extends q2e {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zuf(Unsafe unsafe, int i) {
        super(unsafe, 3);
        this.c = i;
    }

    @Override // defpackage.q2e
    public final double m(long j, Object obj) {
        switch (this.c) {
        }
        return Double.longBitsToDouble(this.b.getLong(obj, j));
    }

    @Override // defpackage.q2e
    public final void n(Object obj, long j, byte b) {
        switch (this.c) {
            case 0:
                if (!avf.f) {
                    avf.l(obj, j, b);
                } else {
                    avf.i(obj, j, b);
                }
                break;
            default:
                if (!avf.f) {
                    avf.l(obj, j, b);
                } else {
                    avf.i(obj, j, b);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final void o(Object obj, long j, double d) {
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
    public final void p(Object obj, long j, float f) {
        switch (this.c) {
            case 0:
                this.b.putInt(obj, j, Float.floatToIntBits(f));
                break;
            default:
                this.b.putInt(obj, j, Float.floatToIntBits(f));
                break;
        }
    }

    @Override // defpackage.q2e
    public final void q(Object obj, long j, boolean z) {
        switch (this.c) {
            case 0:
                if (!avf.f) {
                    avf.l(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    avf.i(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
            default:
                if (!avf.f) {
                    avf.l(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    avf.i(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final float s(long j, Object obj) {
        switch (this.c) {
        }
        return Float.intBitsToFloat(this.b.getInt(obj, j));
    }

    @Override // defpackage.q2e
    public final boolean w(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (avf.f) {
                    if (((byte) (avf.g((-4) & j, obj) >>> ((int) (((~j) & 3) << 3)))) == 0) {
                    }
                } else if (((byte) (avf.g((-4) & j, obj) >>> ((int) ((j & 3) << 3)))) == 0) {
                }
                break;
            default:
                if (avf.f) {
                    if (((byte) (avf.g((-4) & j, obj) >>> ((int) (((~j) & 3) << 3)))) == 0) {
                    }
                } else if (((byte) (avf.g((-4) & j, obj) >>> ((int) ((j & 3) << 3)))) == 0) {
                }
                break;
        }
        return false;
    }
}
