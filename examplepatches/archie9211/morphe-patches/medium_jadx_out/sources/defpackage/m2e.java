package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m2e extends q2e {
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ m2e(Unsafe unsafe, int i) {
        super(unsafe, 0);
        this.c = i;
    }

    @Override // defpackage.q2e
    public final void a(long j, byte[] bArr, long j2) {
        switch (this.c) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // defpackage.q2e
    public final boolean b(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (r2e.h) {
                    if (r2e.f(j, obj) == 0) {
                    }
                } else if (r2e.g(j, obj) == 0) {
                }
                break;
            default:
                if (r2e.h) {
                    if (r2e.f(j, obj) == 0) {
                    }
                } else if (r2e.g(j, obj) == 0) {
                }
                break;
        }
        return false;
    }

    @Override // defpackage.q2e
    public final byte c(long j) {
        switch (this.c) {
            case 0:
                throw new UnsupportedOperationException();
            default:
                throw new UnsupportedOperationException();
        }
    }

    @Override // defpackage.q2e
    public final byte d(long j, Object obj) {
        switch (this.c) {
            case 0:
                if (!r2e.h) {
                }
                break;
            default:
                if (!r2e.h) {
                }
                break;
        }
        return r2e.g(j, obj);
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
                if (!r2e.h) {
                    r2e.n(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    r2e.m(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
            default:
                if (!r2e.h) {
                    r2e.n(obj, j, z ? (byte) 1 : (byte) 0);
                } else {
                    r2e.m(obj, j, z ? (byte) 1 : (byte) 0);
                }
                break;
        }
    }

    @Override // defpackage.q2e
    public final void h(Object obj, long j, byte b) {
        switch (this.c) {
            case 0:
                if (!r2e.h) {
                    r2e.n(obj, j, b);
                } else {
                    r2e.m(obj, j, b);
                }
                break;
            default:
                if (!r2e.h) {
                    r2e.n(obj, j, b);
                } else {
                    r2e.m(obj, j, b);
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
