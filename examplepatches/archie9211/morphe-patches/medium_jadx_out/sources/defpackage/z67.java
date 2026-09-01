package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class z67 {
    public static final /* synthetic */ long a = m80.a.objectFieldOffset(z67.class.getDeclaredField("_cur$volatile"));
    private volatile /* synthetic */ Object _cur$volatile = new b77(8, false);

    public final boolean a(Runnable runnable) {
        z67 z67Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = a;
            b77 b77Var = (b77) unsafe.getObjectVolatile(this, j);
            int iA = b77Var.a(runnable);
            if (iA == 0) {
                return true;
            }
            if (iA == 1) {
                b77 b77VarC = b77Var.c();
                while (true) {
                    Unsafe unsafe2 = m80.a;
                    z67Var = this;
                    if (!unsafe2.compareAndSwapObject(z67Var, a, b77Var, b77VarC) && unsafe2.getObjectVolatile(z67Var, j) == b77Var) {
                        this = z67Var;
                    }
                }
            } else {
                if (iA == 2) {
                    return false;
                }
                z67Var = this;
            }
            this = z67Var;
        }
    }

    public final void b() {
        z67 z67Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = a;
            b77 b77Var = (b77) unsafe.getObjectVolatile(this, j);
            if (b77Var.b()) {
                return;
            }
            b77 b77VarC = b77Var.c();
            while (true) {
                z67Var = this;
                if (!m80.a.compareAndSwapObject(z67Var, a, b77Var, b77VarC) && m80.a.getObjectVolatile(z67Var, j) == b77Var) {
                    this = z67Var;
                }
            }
            this = z67Var;
        }
    }

    public final int c() {
        b77 b77Var = (b77) m80.a.getObjectVolatile(this, a);
        b77Var.getClass();
        long longVolatile = m80.a.getLongVolatile(b77Var, b77.g);
        return 1073741823 & (((int) ((longVolatile & 1152921503533105152L) >> 30)) - ((int) (1073741823 & longVolatile)));
    }

    public final Object d() {
        z67 z67Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = a;
            b77 b77Var = (b77) unsafe.getObjectVolatile(this, j);
            Object objD = b77Var.d();
            if (objD != b77.e) {
                return objD;
            }
            b77 b77VarC = b77Var.c();
            while (true) {
                z67Var = this;
                if (!m80.a.compareAndSwapObject(z67Var, a, b77Var, b77VarC) && m80.a.getObjectVolatile(z67Var, j) == b77Var) {
                    this = z67Var;
                }
            }
            this = z67Var;
        }
    }
}
