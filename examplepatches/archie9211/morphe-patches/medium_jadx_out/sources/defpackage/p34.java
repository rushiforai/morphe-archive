package defpackage;

import java.util.concurrent.locks.LockSupport;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class p34 extends k34 implements x33 {
    public static final /* synthetic */ long g;
    public static final /* synthetic */ long h;
    public static final /* synthetic */ long i;
    public static final /* synthetic */ int j = 0;
    private volatile /* synthetic */ Object _delayed$volatile;
    private volatile /* synthetic */ int _isCompleted$volatile;
    private volatile /* synthetic */ Object _queue$volatile;

    static {
        Unsafe unsafe = m80.a;
        i = unsafe.objectFieldOffset(p34.class.getDeclaredField("_queue$volatile"));
        g = unsafe.objectFieldOffset(p34.class.getDeclaredField("_delayed$volatile"));
        h = unsafe.objectFieldOffset(p34.class.getDeclaredField("_isCompleted$volatile"));
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        N0(runnable);
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x001b, code lost:
    
        r6 = r3;
        r13 = null;
     */
    @Override // defpackage.k34
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final long L0() {
        /*
            Method dump skipped, instruction units count: 218
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p34.L0():long");
    }

    public void N0(Runnable runnable) {
        O0();
        if (!P0(runnable)) {
            wy2.k.N0(runnable);
            return;
        }
        Thread threadQ0 = Q0();
        if (Thread.currentThread() != threadQ0) {
            LockSupport.unpark(threadQ0);
        }
    }

    public final void O0() {
        n34 n34VarD;
        o34 o34Var = (o34) m80.a.getObjectVolatile(this, g);
        if (o34Var == null || o34Var.b() == 0) {
            return;
        }
        long jNanoTime = System.nanoTime();
        do {
            synchronized (o34Var) {
                try {
                    n34[] n34VarArr = o34Var.a;
                    n34VarD = null;
                    n34 n34Var = n34VarArr != null ? n34VarArr[0] : null;
                    if (n34Var != null) {
                        if (jNanoTime - n34Var.a >= 0 ? P0(n34Var) : false) {
                            n34VarD = o34Var.d(0);
                        }
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        } while (n34VarD != null);
    }

    public final boolean P0(Runnable runnable) {
        Unsafe unsafe;
        Unsafe unsafe2;
        Unsafe unsafe3;
        loop0: while (true) {
            Unsafe unsafe4 = m80.a;
            long j2 = i;
            Object objectVolatile = unsafe4.getObjectVolatile(this, j2);
            if (unsafe4.getIntVolatile(this, h) == 1) {
                return false;
            }
            if (objectVolatile == null) {
                do {
                    unsafe = m80.a;
                    if (unsafe.compareAndSwapObject(this, i, (Object) null, runnable)) {
                        break loop0;
                    }
                } while (unsafe.getObjectVolatile(this, j2) == null);
            } else if (objectVolatile instanceof b77) {
                b77 b77Var = (b77) objectVolatile;
                int iA = b77Var.a(runnable);
                if (iA == 0) {
                    break;
                }
                if (iA == 1) {
                    b77 b77VarC = b77Var.c();
                    do {
                        unsafe2 = m80.a;
                        if (unsafe2.compareAndSwapObject(this, i, objectVolatile, b77VarC)) {
                            break;
                        }
                    } while (unsafe2.getObjectVolatile(this, j2) == objectVolatile);
                } else if (iA == 2) {
                    return false;
                }
            } else {
                if (objectVolatile == w2g.m) {
                    return false;
                }
                b77 b77Var2 = new b77(8, true);
                b77Var2.a((Runnable) objectVolatile);
                b77Var2.a(runnable);
                do {
                    unsafe3 = m80.a;
                    if (unsafe3.compareAndSwapObject(this, i, objectVolatile, b77Var2)) {
                        break loop0;
                    }
                } while (unsafe3.getObjectVolatile(this, j2) == objectVolatile);
            }
        }
        return true;
    }

    @Override // defpackage.x33
    public yh3 Q(long j2, Runnable runnable, ib2 ib2Var) {
        return xy2.a.Q(j2, runnable, ib2Var);
    }

    public abstract Thread Q0();

    public final boolean R0() {
        m70 m70Var = this.e;
        if (m70Var != null ? m70Var.isEmpty() : true) {
            Unsafe unsafe = m80.a;
            o34 o34Var = (o34) unsafe.getObjectVolatile(this, g);
            if (o34Var != null && o34Var.b() != 0) {
                return false;
            }
            Object objectVolatile = unsafe.getObjectVolatile(this, i);
            if (objectVolatile != null) {
                if (objectVolatile instanceof b77) {
                    long longVolatile = unsafe.getLongVolatile((b77) objectVolatile, b77.g);
                    return ((int) (1073741823 & longVolatile)) == ((int) ((longVolatile & 1152921503533105152L) >> 30));
                }
                if (objectVolatile == w2g.m) {
                }
            }
            return true;
        }
        return false;
    }

    public void S0(long j2, n34 n34Var) {
        wy2.k.T0(j2, n34Var);
    }

    public final void T0(long j2, n34 n34Var) {
        p34 p34Var;
        int iC;
        Unsafe unsafe;
        Thread threadQ0;
        long j3 = g;
        Unsafe unsafe2 = m80.a;
        if (unsafe2.getIntVolatile(this, h) == 1) {
            p34Var = this;
            iC = 1;
        } else {
            o34 o34Var = (o34) unsafe2.getObjectVolatile(this, j3);
            if (o34Var == null) {
                o34 o34Var2 = new o34();
                o34Var2.c = j2;
                while (true) {
                    unsafe = m80.a;
                    p34Var = this;
                    if (unsafe.compareAndSwapObject(p34Var, g, (Object) null, o34Var2) || unsafe.getObjectVolatile(p34Var, j3) != null) {
                        break;
                    } else {
                        this = p34Var;
                    }
                }
                Object objectVolatile = unsafe.getObjectVolatile(p34Var, j3);
                objectVolatile.getClass();
                o34Var = (o34) objectVolatile;
                unsafe2 = unsafe;
            } else {
                p34Var = this;
            }
            iC = n34Var.c(j2, o34Var, p34Var);
        }
        if (iC != 0) {
            if (iC == 1) {
                p34Var.S0(j2, n34Var);
                return;
            } else {
                if (iC == 2) {
                    return;
                }
                ygf.f("unexpected result");
                return;
            }
        }
        o34 o34Var3 = (o34) unsafe2.getObjectVolatile(p34Var, j3);
        if (o34Var3 != null) {
            synchronized (o34Var3) {
                n34[] n34VarArr = o34Var3.a;
                n34Var = n34VarArr != null ? n34VarArr[0] : null;
            }
        }
        if (n34Var != n34Var || Thread.currentThread() == (threadQ0 = p34Var.Q0())) {
            return;
        }
        LockSupport.unpark(threadQ0);
    }

    @Override // defpackage.x33
    public final void g0(long j2, x51 x51Var) {
        long j3 = j2 > 0 ? j2 >= 9223372036854L ? Long.MAX_VALUE : 1000000 * j2 : 0L;
        if (j3 < 4611686018427387903L) {
            long jNanoTime = System.nanoTime();
            l34 l34Var = new l34(this, j3 + jNanoTime, x51Var);
            T0(jNanoTime, l34Var);
            x51Var.w(new p51(2, l34Var));
        }
    }

    @Override // defpackage.k34
    public void shutdown() {
        d1g d1gVar;
        Unsafe unsafe;
        n34 n34VarD;
        ald.a.set(null);
        m80.a.putIntVolatile(this, h, 1);
        d1g d1gVar2 = w2g.m;
        long j2 = i;
        loop0: while (true) {
            Object objectVolatile = m80.a.getObjectVolatile(this, j2);
            if (objectVolatile == null) {
                while (true) {
                    Unsafe unsafe2 = m80.a;
                    d1gVar = d1gVar2;
                    if (unsafe2.compareAndSwapObject(this, i, (Object) null, d1gVar2)) {
                        break loop0;
                    } else if (unsafe2.getObjectVolatile(this, j2) != null) {
                        break;
                    } else {
                        d1gVar2 = d1gVar;
                    }
                }
                d1gVar2 = d1gVar;
            } else {
                d1gVar = d1gVar2;
                if (objectVolatile instanceof b77) {
                    ((b77) objectVolatile).b();
                    break;
                }
                if (objectVolatile == d1gVar) {
                    break;
                }
                b77 b77Var = new b77(8, true);
                b77Var.a((Runnable) objectVolatile);
                do {
                    unsafe = m80.a;
                    if (unsafe.compareAndSwapObject(this, i, objectVolatile, b77Var)) {
                        break loop0;
                    }
                } while (unsafe.getObjectVolatile(this, j2) == objectVolatile);
                d1gVar2 = d1gVar;
            }
        }
        while (L0() <= 0) {
        }
        long jNanoTime = System.nanoTime();
        while (true) {
            o34 o34Var = (o34) m80.a.getObjectVolatile(this, g);
            if (o34Var == null) {
                return;
            }
            synchronized (o34Var) {
                n34VarD = o34Var.b() > 0 ? o34Var.d(0) : null;
            }
            if (n34VarD == null) {
                return;
            } else {
                S0(jNanoTime, n34VarD);
            }
        }
    }
}
