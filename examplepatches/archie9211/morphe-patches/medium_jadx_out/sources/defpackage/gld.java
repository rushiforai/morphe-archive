package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gld extends xa6 {
    public static final /* synthetic */ long g = m80.a.objectFieldOffset(gld.class.getDeclaredField("_state$volatile"));
    private volatile /* synthetic */ int _state$volatile;
    public final Thread e = Thread.currentThread();
    public yh3 f;

    public static void o(int i) {
        throw new IllegalStateException(("Illegal state " + i).toString());
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return true;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) {
        while (true) {
            Unsafe unsafe = m80.a;
            long j = g;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if (intVolatile != 0) {
                if (intVolatile == 1 || intVolatile == 2 || intVolatile == 3) {
                    return;
                }
                o(intVolatile);
                throw null;
            }
            gld gldVar = this;
            if (unsafe.compareAndSwapInt(gldVar, g, intVolatile, 2)) {
                gldVar.e.interrupt();
                unsafe.putIntVolatile(gldVar, j, 3);
                return;
            }
            this = gldVar;
        }
    }

    public final void n() {
        gld gldVar;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = g;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if (intVolatile == 0) {
                gldVar = this;
                if (unsafe.compareAndSwapInt(gldVar, j, intVolatile, 1)) {
                    yh3 yh3Var = gldVar.f;
                    if (yh3Var != null) {
                        yh3Var.dispose();
                        return;
                    }
                    return;
                }
            } else {
                if (intVolatile != 2) {
                    if (intVolatile == 3) {
                        Thread.interrupted();
                        return;
                    } else {
                        o(intVolatile);
                        throw null;
                    }
                }
                gldVar = this;
            }
            this = gldVar;
        }
    }
}
