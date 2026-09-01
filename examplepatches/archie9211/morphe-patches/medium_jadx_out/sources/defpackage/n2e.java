package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class n2e extends q2e {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n2e(Unsafe unsafe, int i) {
        super(unsafe, 1);
        this.c = i;
    }

    @Override // defpackage.q2e
    public final boolean b(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (s2e.g) {
                    break;
                } else if (((byte) ((s2e.f((-4) & j, obj) >>> ((int) ((j & 3) << 3))) & 255)) != 0) {
                }
                break;
            default:
                if (s2e.g) {
                    break;
                } else if (((byte) ((s2e.f((-4) & j, obj) >>> ((int) ((j & 3) << 3))) & 255)) != 0) {
                }
                break;
        }
        return s2e.e(j, obj);
    }

    @Override // defpackage.q2e
    public final double e(long j, Object obj) {
        switch (this.c) {
        }
        return Double.longBitsToDouble(this.b.getLong(obj, j));
    }

    @Override // defpackage.q2e
    public final float f(long j, Object obj) {
        switch (this.c) {
        }
        return Float.intBitsToFloat(this.b.getInt(obj, j));
    }

    @Override // defpackage.q2e
    public final void g(Object obj, long j, boolean z) {
        switch (this.c) {
            case 0:
                if (!s2e.g) {
                    s2e.l(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    s2e.k(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
            default:
                if (!s2e.g) {
                    s2e.l(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    s2e.k(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final void h(Object obj, long j, byte b) {
        switch (this.c) {
            case 0:
                if (!s2e.g) {
                    s2e.l(obj, j, b);
                } else {
                    s2e.k(obj, j, b);
                }
                break;
            default:
                if (!s2e.g) {
                    s2e.l(obj, j, b);
                } else {
                    s2e.k(obj, j, b);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final void i(Object obj, long j, double d) {
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
    public final void j(Object obj, long j, float f) {
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
    public final boolean l() {
        switch (this.c) {
        }
        return false;
    }
}
