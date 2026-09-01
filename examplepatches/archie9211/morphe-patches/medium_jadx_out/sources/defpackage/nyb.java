package defpackage;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class nyb {
    public static final /* synthetic */ AtomicLongFieldUpdater c;
    public static final /* synthetic */ AtomicLongFieldUpdater d;
    public static final /* synthetic */ AtomicIntegerFieldUpdater e;
    public static final /* synthetic */ long f;
    public static final /* synthetic */ long g;
    public static final /* synthetic */ long h;
    private volatile /* synthetic */ int _availablePermits$volatile;
    public final int a;
    public final nra b;
    private volatile /* synthetic */ long deqIdx$volatile;
    private volatile /* synthetic */ long enqIdx$volatile;
    private volatile /* synthetic */ Object head$volatile;
    private volatile /* synthetic */ Object tail$volatile;

    static {
        Unsafe unsafe = m80.a;
        g = unsafe.objectFieldOffset(nyb.class.getDeclaredField("head$volatile"));
        c = AtomicLongFieldUpdater.newUpdater(nyb.class, "deqIdx$volatile");
        h = unsafe.objectFieldOffset(nyb.class.getDeclaredField("tail$volatile"));
        d = AtomicLongFieldUpdater.newUpdater(nyb.class, "enqIdx$volatile");
        e = AtomicIntegerFieldUpdater.newUpdater(nyb.class, "_availablePermits$volatile");
        f = unsafe.objectFieldOffset(nyb.class.getDeclaredField("_availablePermits$volatile"));
    }

    public nyb(int i) {
        this.a = i;
        if (i <= 0) {
            ywb.g(b09.w(i, "Semaphore should have at least 1 permit, but had "));
            throw null;
        }
        if (i < 0) {
            ywb.g(b09.w(i, "The number of acquired permits should be in 0.."));
            throw null;
        }
        qyb qybVar = new qyb(0L, null, 2);
        this.head$volatile = qybVar;
        this.tail$volatile = qybVar;
        this._availablePermits$volatile = i;
        this.b = new nra(4, this);
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0025, code lost:
    
        r5.j(r3, r4.b);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.p92 r5) {
        /*
            r4 = this;
        L0:
            java.util.concurrent.atomic.AtomicIntegerFieldUpdater r0 = defpackage.nyb.e
            int r1 = r0.getAndDecrement(r4)
            int r2 = r4.a
            if (r1 > r2) goto L0
            c1e r3 = defpackage.c1e.a
            if (r1 <= 0) goto Lf
            goto L3e
        Lf:
            n92 r5 = defpackage.pwd.Q(r5)
            x51 r5 = defpackage.wgf.s(r5)
            boolean r1 = r4.b(r5)     // Catch: java.lang.Throwable -> L3f
            if (r1 != 0) goto L31
        L1d:
            int r1 = r0.getAndDecrement(r4)     // Catch: java.lang.Throwable -> L3f
            if (r1 > r2) goto L1d
            if (r1 <= 0) goto L2b
            nra r4 = r4.b     // Catch: java.lang.Throwable -> L3f
            r5.j(r3, r4)     // Catch: java.lang.Throwable -> L3f
            goto L31
        L2b:
            boolean r1 = r4.b(r5)     // Catch: java.lang.Throwable -> L3f
            if (r1 == 0) goto L1d
        L31:
            java.lang.Object r4 = r5.q()
            tb2 r5 = defpackage.tb2.COROUTINE_SUSPENDED
            if (r4 != r5) goto L3a
            goto L3b
        L3a:
            r4 = r3
        L3b:
            if (r4 != r5) goto L3e
            return r4
        L3e:
            return r3
        L3f:
            r4 = move-exception
            r5.B()
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.nyb.a(p92):java.lang.Object");
    }

    public final boolean b(xwe xweVar) {
        Object objQ;
        Unsafe unsafe;
        nyb nybVar = this;
        Unsafe unsafe2 = m80.a;
        long j = h;
        qyb qybVar = (qyb) unsafe2.getObjectVolatile(nybVar, j);
        long andIncrement = d.getAndIncrement(nybVar);
        lyb lybVar = lyb.a;
        long j2 = andIncrement / ((long) pyb.f);
        loop0: while (true) {
            objQ = s42.Q(qybVar, j2, lybVar);
            if (ek7.H(objQ)) {
                break;
            }
            jwb jwbVarE = ek7.E(objQ);
            while (true) {
                jwb jwbVar = (jwb) m80.a.getObjectVolatile(nybVar, j);
                if (jwbVar.d >= jwbVarE.d) {
                    nybVar = this;
                    break loop0;
                }
                if (!jwbVarE.j()) {
                    break;
                }
                do {
                    unsafe = m80.a;
                    nybVar = this;
                    if (unsafe.compareAndSwapObject(nybVar, h, jwbVar, jwbVarE)) {
                        if (jwbVar.f()) {
                            jwbVar.e();
                        }
                    }
                } while (unsafe.getObjectVolatile(nybVar, j) == jwbVar);
                if (jwbVarE.f()) {
                    jwbVarE.e();
                }
            }
            nybVar = this;
        }
        qyb qybVar2 = (qyb) ek7.E(objQ);
        AtomicReferenceArray atomicReferenceArray = qybVar2.g;
        int i = (int) (andIncrement % ((long) pyb.f));
        while (!atomicReferenceArray.compareAndSet(i, null, xweVar)) {
            if (atomicReferenceArray.get(i) != null) {
                d1g d1gVar = pyb.b;
                d1g d1gVar2 = pyb.c;
                while (!atomicReferenceArray.compareAndSet(i, d1gVar, d1gVar2)) {
                    if (atomicReferenceArray.get(i) != d1gVar) {
                        return false;
                    }
                }
                ((w51) xweVar).j(c1e.a, nybVar.b);
                return true;
            }
        }
        xweVar.a(qybVar2, i);
        return true;
    }

    public final void c() {
        Unsafe unsafe;
        long j;
        int intVolatile;
        int i;
        Object objQ;
        boolean z;
        Unsafe unsafe2;
        do {
            int andIncrement = e.getAndIncrement(this);
            int i2 = this.a;
            if (andIncrement >= i2) {
                do {
                    unsafe = m80.a;
                    j = f;
                    intVolatile = unsafe.getIntVolatile(this, j);
                    i = this.a;
                    if (intVolatile <= i) {
                        break;
                    }
                } while (!unsafe.compareAndSwapInt(this, j, intVolatile, i));
                lg8.g(i2, "The number of released permits cannot be greater than ");
                return;
            }
            if (andIncrement >= 0) {
                return;
            }
            Unsafe unsafe3 = m80.a;
            long j2 = g;
            qyb qybVar = (qyb) unsafe3.getObjectVolatile(this, j2);
            long andIncrement2 = c.getAndIncrement(this);
            long j3 = andIncrement2 / ((long) pyb.f);
            myb mybVar = myb.a;
            while (true) {
                objQ = s42.Q(qybVar, j3, mybVar);
                if (ek7.H(objQ)) {
                    break;
                }
                jwb jwbVarE = ek7.E(objQ);
                while (true) {
                    jwb jwbVar = (jwb) m80.a.getObjectVolatile(this, j2);
                    if (jwbVar.d >= jwbVarE.d) {
                        break;
                    }
                    if (!jwbVarE.j()) {
                        break;
                    }
                    do {
                        unsafe2 = m80.a;
                        if (unsafe2.compareAndSwapObject(this, g, jwbVar, jwbVarE)) {
                            if (jwbVar.f()) {
                                jwbVar.e();
                            }
                        }
                    } while (unsafe2.getObjectVolatile(this, j2) == jwbVar);
                    if (jwbVarE.f()) {
                        jwbVarE.e();
                    }
                }
            }
            qyb qybVar2 = (qyb) ek7.E(objQ);
            AtomicReferenceArray atomicReferenceArray = qybVar2.g;
            qybVar2.a();
            z = false;
            if (qybVar2.d <= j3) {
                int i3 = (int) (andIncrement2 % ((long) pyb.f));
                Object andSet = atomicReferenceArray.getAndSet(i3, pyb.b);
                if (andSet == null) {
                    int i4 = pyb.a;
                    for (int i5 = 0; i5 < i4; i5++) {
                        if (atomicReferenceArray.get(i3) == pyb.c) {
                            z = true;
                            break;
                        }
                    }
                    d1g d1gVar = pyb.b;
                    d1g d1gVar2 = pyb.d;
                    while (true) {
                        if (!atomicReferenceArray.compareAndSet(i3, d1gVar, d1gVar2)) {
                            if (atomicReferenceArray.get(i3) != d1gVar) {
                                break;
                            }
                        } else {
                            z = true;
                            break;
                        }
                    }
                    z = !z;
                } else if (andSet != pyb.e) {
                    boolean z2 = andSet instanceof w51;
                    c1e c1eVar = c1e.a;
                    if (!z2) {
                        if (andSet instanceof rwb) {
                            if (((rwb) andSet).g(this, c1eVar) == 0) {
                                z = true;
                                break;
                                break;
                            }
                        } else {
                            ik4.m("unexpected: ", andSet);
                            return;
                        }
                    } else {
                        w51 w51Var = (w51) andSet;
                        d1g d1gVarD = w51Var.d(c1eVar, this.b);
                        if (d1gVarD != null) {
                            w51Var.t(d1gVarD);
                            z = true;
                            break;
                            break;
                        }
                    }
                }
            }
        } while (!z);
    }
}
