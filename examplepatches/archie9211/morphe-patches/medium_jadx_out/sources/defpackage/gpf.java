package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gpf extends q2e {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gpf(Unsafe unsafe, int i) {
        super(unsafe, 2);
        this.c = i;
    }

    @Override // defpackage.q2e
    public final void B(Object obj, long j, double d) {
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
    public final boolean r(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (!ipf.e) {
                }
                break;
            default:
                if (!ipf.e) {
                }
                break;
        }
        return ipf.j(j, obj);
    }

    @Override // defpackage.q2e
    public final void t(Object obj, long j, boolean z) {
        switch (this.c) {
            case 0:
                if (!ipf.e) {
                    ipf.l(obj, j, z);
                } else {
                    ipf.k(obj, j, z);
                }
                break;
            default:
                if (!ipf.e) {
                    ipf.l(obj, j, z);
                } else {
                    ipf.k(obj, j, z);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final float u(long j, Object obj) {
        int i = this.c;
        Unsafe unsafe = this.b;
        switch (i) {
        }
        return Float.intBitsToFloat(unsafe.getInt(obj, j));
    }

    @Override // defpackage.q2e
    public final void y(Object obj, long j, float f) {
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
    public final double z(long j, Object obj) {
        int i = this.c;
        Unsafe unsafe = this.b;
        switch (i) {
        }
        return Double.longBitsToDouble(unsafe.getLong(obj, j));
    }
}
