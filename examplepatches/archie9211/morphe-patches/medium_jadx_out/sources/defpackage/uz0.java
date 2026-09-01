package defpackage;

import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceArray;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlinx.coroutines.DispatchException;
import kotlinx.coroutines.channels.ClosedReceiveChannelException;
import kotlinx.coroutines.channels.ClosedSendChannelException;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class uz0 implements wj1 {
    public static final /* synthetic */ AtomicLongFieldUpdater b = AtomicLongFieldUpdater.newUpdater(uz0.class, "sendersAndCloseStatus$volatile");
    public static final /* synthetic */ AtomicLongFieldUpdater c;
    public static final /* synthetic */ AtomicLongFieldUpdater d;
    public static final /* synthetic */ AtomicLongFieldUpdater e;
    public static final /* synthetic */ AtomicReferenceFieldUpdater f;
    public static final /* synthetic */ AtomicReferenceFieldUpdater g;
    public static final /* synthetic */ long h;
    public static final /* synthetic */ long i;
    public static final /* synthetic */ long j;
    public static final /* synthetic */ long k;
    public static final /* synthetic */ long l;
    public static final /* synthetic */ long m;
    public static final /* synthetic */ long n;
    public static final /* synthetic */ long o;
    public static final /* synthetic */ long p;
    private volatile /* synthetic */ Object _closeCause$volatile;
    public final int a;
    private volatile /* synthetic */ long bufferEnd$volatile;
    private volatile /* synthetic */ Object bufferEndSegment$volatile;
    private volatile /* synthetic */ Object closeHandler$volatile;
    private volatile /* synthetic */ long completedExpandBuffersAndPauseFlag$volatile;
    private volatile /* synthetic */ Object receiveSegment$volatile;
    private volatile /* synthetic */ long receivers$volatile;
    private volatile /* synthetic */ Object sendSegment$volatile;
    private volatile /* synthetic */ long sendersAndCloseStatus$volatile;

    static {
        Unsafe unsafe = m80.a;
        p = unsafe.objectFieldOffset(uz0.class.getDeclaredField("sendersAndCloseStatus$volatile"));
        c = AtomicLongFieldUpdater.newUpdater(uz0.class, "receivers$volatile");
        n = unsafe.objectFieldOffset(uz0.class.getDeclaredField("receivers$volatile"));
        d = AtomicLongFieldUpdater.newUpdater(uz0.class, "bufferEnd$volatile");
        i = unsafe.objectFieldOffset(uz0.class.getDeclaredField("bufferEnd$volatile"));
        e = AtomicLongFieldUpdater.newUpdater(uz0.class, "completedExpandBuffersAndPauseFlag$volatile");
        l = unsafe.objectFieldOffset(uz0.class.getDeclaredField("completedExpandBuffersAndPauseFlag$volatile"));
        f = AtomicReferenceFieldUpdater.newUpdater(uz0.class, Object.class, "sendSegment$volatile");
        o = unsafe.objectFieldOffset(uz0.class.getDeclaredField("sendSegment$volatile"));
        g = AtomicReferenceFieldUpdater.newUpdater(uz0.class, Object.class, "receiveSegment$volatile");
        m = unsafe.objectFieldOffset(uz0.class.getDeclaredField("receiveSegment$volatile"));
        j = unsafe.objectFieldOffset(uz0.class.getDeclaredField("bufferEndSegment$volatile"));
        h = unsafe.objectFieldOffset(uz0.class.getDeclaredField("_closeCause$volatile"));
        k = unsafe.objectFieldOffset(uz0.class.getDeclaredField("closeHandler$volatile"));
    }

    public uz0(int i2) {
        this.a = i2;
        if (i2 < 0) {
            ywb.g(ev6.w("Invalid channel capacity: ", i2, ", should be >=0"));
            throw null;
        }
        lk1 lk1Var = wz0.a;
        this.bufferEnd$volatile = i2 != 0 ? i2 != Integer.MAX_VALUE ? i2 : Long.MAX_VALUE : 0L;
        this.completedExpandBuffersAndPauseFlag$volatile = l();
        lk1 lk1Var2 = new lk1(0L, null, this, 3);
        this.sendSegment$volatile = lk1Var2;
        this.receiveSegment$volatile = lk1Var2;
        if (C()) {
            lk1Var2 = wz0.a;
            lk1Var2.getClass();
        }
        this.bufferEndSegment$volatile = lk1Var2;
        this._closeCause$volatile = wz0.s;
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.lang.Object G(defpackage.uz0 r13, defpackage.p92 r14) {
        /*
            boolean r0 = r14 instanceof defpackage.sz0
            if (r0 == 0) goto L14
            r0 = r14
            sz0 r0 = (defpackage.sz0) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r6 = r0
            goto L1a
        L14:
            sz0 r0 = new sz0
            r0.<init>(r13, r14)
            goto L12
        L1a:
            java.lang.Object r14 = r6.b
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r6.d
            r2 = 0
            r3 = 1
            if (r1 == 0) goto L34
            if (r1 != r3) goto L2e
            defpackage.br7.v(r14)
            kk1 r14 = (defpackage.kk1) r14
            java.lang.Object r13 = r14.a
            return r13
        L2e:
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r13)
            return r2
        L34:
            defpackage.br7.v(r14)
            sun.misc.Unsafe r14 = defpackage.m80.a
            long r4 = defpackage.uz0.m
            java.lang.Object r14 = r14.getObjectVolatile(r13, r4)
            lk1 r14 = (defpackage.lk1) r14
        L41:
            boolean r1 = r13.z()
            if (r1 == 0) goto L51
            java.lang.Throwable r13 = r13.p()
            ik1 r14 = new ik1
            r14.<init>(r13)
            return r14
        L51:
            java.util.concurrent.atomic.AtomicLongFieldUpdater r1 = defpackage.uz0.c
            long r4 = r1.getAndIncrement(r13)
            int r1 = defpackage.wz0.b
            long r7 = (long) r1
            long r9 = r4 / r7
            long r7 = r4 % r7
            int r1 = (int) r7
            long r7 = r14.d
            int r7 = (r7 > r9 ? 1 : (r7 == r9 ? 0 : -1))
            if (r7 == 0) goto L6e
            lk1 r7 = r13.j(r9, r14)
            if (r7 != 0) goto L6c
            goto L41
        L6c:
            r8 = r7
            goto L6f
        L6e:
            r8 = r14
        L6f:
            r12 = 0
            r7 = r13
            r9 = r1
            r10 = r4
            java.lang.Object r13 = r7.L(r8, r9, r10, r12)
            r1 = r7
            d1g r14 = defpackage.wz0.m
            if (r13 == r14) goto La2
            d1g r14 = defpackage.wz0.o
            if (r13 != r14) goto L8e
            long r13 = r1.v()
            int r13 = (r4 > r13 ? 1 : (r4 == r13 ? 0 : -1))
            if (r13 >= 0) goto L8b
            r8.a()
        L8b:
            r13 = r1
            r14 = r8
            goto L41
        L8e:
            d1g r14 = defpackage.wz0.n
            if (r13 != r14) goto L9e
            r6.d = r3
            r2 = r8
            r3 = r9
            java.lang.Object r13 = r1.H(r2, r3, r4, r6)
            if (r13 != r0) goto L9d
            return r0
        L9d:
            return r13
        L9e:
            r8.a()
            return r13
        La2:
            java.lang.String r13 = "unexpected"
            defpackage.ygf.f(r13)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.G(uz0, p92):java.lang.Object");
    }

    public final boolean A() {
        return y(m80.a.getLongVolatile(this, p), false);
    }

    public boolean B() {
        return false;
    }

    public final boolean C() {
        long jL = l();
        return jL == 0 || jL == Long.MAX_VALUE;
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x005e, code lost:
    
        if (r5.f() == false) goto L43;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x0060, code lost:
    
        r5.e();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void D(long r7, defpackage.lk1 r9) {
        /*
            r6 = this;
        L0:
            long r0 = r9.d
            int r0 = (r0 > r7 ? 1 : (r0 == r7 ? 0 : -1))
            if (r0 >= 0) goto L11
            k32 r0 = r9.c()
            lk1 r0 = (defpackage.lk1) r0
            if (r0 != 0) goto Lf
            goto L11
        Lf:
            r9 = r0
            goto L0
        L11:
            r5 = r9
        L12:
            boolean r7 = r5.d()
            if (r7 == 0) goto L23
            k32 r7 = r5.c()
            lk1 r7 = (defpackage.lk1) r7
            if (r7 != 0) goto L21
            goto L23
        L21:
            r5 = r7
            goto L12
        L23:
            sun.misc.Unsafe r7 = defpackage.m80.a
            long r8 = defpackage.uz0.j
            java.lang.Object r7 = r7.getObjectVolatile(r6, r8)
            r4 = r7
            jwb r4 = (defpackage.jwb) r4
            long r0 = r4.d
            long r2 = r5.d
            int r7 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r7 < 0) goto L37
            goto L53
        L37:
            boolean r7 = r5.j()
            if (r7 != 0) goto L3f
            r9 = r5
            goto L11
        L3f:
            sun.misc.Unsafe r0 = defpackage.m80.a
            long r2 = defpackage.uz0.j
            r1 = r6
            boolean r6 = r0.compareAndSwapObject(r1, r2, r4, r5)
            if (r6 == 0) goto L54
            boolean r6 = r4.f()
            if (r6 == 0) goto L53
            r4.e()
        L53:
            return
        L54:
            java.lang.Object r6 = r0.getObjectVolatile(r1, r8)
            if (r6 == r4) goto L65
            boolean r6 = r5.f()
            if (r6 == 0) goto L63
            r5.e()
        L63:
            r6 = r1
            goto L23
        L65:
            r6 = r1
            goto L3f
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.D(long, lk1):void");
    }

    public final Object E(n92 n92Var, Object obj) {
        x51 x51Var = new x51(1, pwd.Q(n92Var));
        x51Var.s();
        x51Var.resumeWith(new ajb(u()));
        Object objQ = x51Var.q();
        return objQ == tb2.COROUTINE_SUSPENDED ? objQ : c1e.a;
    }

    public final void F(Object obj, x51 x51Var) {
        x51Var.resumeWith(new ajb(u()));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object H(defpackage.lk1 r11, int r12, long r13, defpackage.p92 r15) {
        /*
            Method dump skipped, instruction units count: 243
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.H(lk1, int, long, p92):java.lang.Object");
    }

    public final void I(xwe xweVar, boolean z) {
        if (xweVar instanceof w51) {
            ((n92) xweVar).resumeWith(new ajb(z ? s() : u()));
            return;
        }
        if (xweVar instanceof hwa) {
            ((hwa) xweVar).a.resumeWith(new kk1(new ik1(p())));
            return;
        }
        if (!(xweVar instanceof pz0)) {
            if (xweVar instanceof rwb) {
                ((rwb) xweVar).g(this, wz0.l);
                return;
            } else {
                ik4.m("Unexpected waiter: ", xweVar);
                return;
            }
        }
        pz0 pz0Var = (pz0) xweVar;
        x51 x51Var = pz0Var.b;
        x51Var.getClass();
        pz0Var.b = null;
        pz0Var.a = wz0.l;
        Throwable thP = pz0Var.c.p();
        if (thP == null) {
            x51Var.resumeWith(Boolean.FALSE);
        } else {
            x51Var.resumeWith(new ajb(thP));
        }
    }

    public final boolean J(Object obj, Object obj2) throws DispatchException {
        if (obj instanceof rwb) {
            return ((rwb) obj).g(this, obj2) == 0;
        }
        if (obj instanceof hwa) {
            x51 x51Var = ((hwa) obj).a;
            kk1 kk1Var = new kk1(obj2);
            lk1 lk1Var = wz0.a;
            d1g d1gVarD = x51Var.d(kk1Var, null);
            if (d1gVarD == null) {
                return false;
            }
            x51Var.t(d1gVarD);
            return true;
        }
        if (!(obj instanceof pz0)) {
            if (!(obj instanceof w51)) {
                ik4.m("Unexpected receiver type: ", obj);
                return false;
            }
            w51 w51Var = (w51) obj;
            lk1 lk1Var2 = wz0.a;
            d1g d1gVarD2 = w51Var.d(obj2, null);
            if (d1gVarD2 == null) {
                return false;
            }
            w51Var.t(d1gVarD2);
            return true;
        }
        pz0 pz0Var = (pz0) obj;
        x51 x51Var2 = pz0Var.b;
        x51Var2.getClass();
        pz0Var.b = null;
        pz0Var.a = obj2;
        Boolean bool = Boolean.TRUE;
        pz0Var.c.getClass();
        lk1 lk1Var3 = wz0.a;
        d1g d1gVarD3 = x51Var2.d(bool, null);
        if (d1gVarD3 == null) {
            return false;
        }
        x51Var2.t(d1gVarD3);
        return true;
    }

    public final boolean K(Object obj, lk1 lk1Var, int i2) {
        qtd qtdVar;
        boolean z = obj instanceof w51;
        c1e c1eVar = c1e.a;
        if (z) {
            w51 w51Var = (w51) obj;
            lk1 lk1Var2 = wz0.a;
            d1g d1gVarD = w51Var.d(c1eVar, null);
            if (d1gVarD == null) {
                return false;
            }
            w51Var.t(d1gVarD);
            return true;
        }
        if (!(obj instanceof rwb)) {
            ik4.m("Unexpected waiter: ", obj);
            return false;
        }
        int iG = ((rwb) obj).g(this, c1eVar);
        if (iG == 0) {
            qtdVar = qtd.SUCCESSFUL;
        } else if (iG == 1) {
            qtdVar = qtd.REREGISTER;
        } else if (iG == 2) {
            qtdVar = qtd.CANCELLED;
        } else {
            if (iG != 3) {
                lg8.g(iG, "Unexpected internal result: ");
                return false;
            }
            qtdVar = qtd.ALREADY_SELECTED;
        }
        if (qtdVar == qtd.REREGISTER) {
            lk1Var.n(i2, null);
        }
        return qtdVar == qtd.SUCCESSFUL;
    }

    public final Object L(lk1 lk1Var, int i2, long j2, Object obj) {
        Object objL = lk1Var.l(i2);
        AtomicReferenceArray atomicReferenceArray = lk1Var.h;
        long j3 = p;
        if (objL == null) {
            if (j2 >= (m80.a.getLongVolatile(this, j3) & 1152921504606846975L)) {
                if (obj == null) {
                    return wz0.n;
                }
                if (lk1Var.k(objL, i2, obj)) {
                    i();
                    return wz0.m;
                }
            }
        } else if (objL == wz0.d && lk1Var.k(objL, i2, wz0.i)) {
            i();
            Object obj2 = atomicReferenceArray.get(i2 * 2);
            lk1Var.n(i2, null);
            return obj2;
        }
        while (true) {
            Object objL2 = lk1Var.l(i2);
            if (objL2 == null || objL2 == wz0.e) {
                if (j2 < (m80.a.getLongVolatile(this, j3) & 1152921504606846975L)) {
                    if (lk1Var.k(objL2, i2, wz0.h)) {
                        i();
                        return wz0.o;
                    }
                } else {
                    if (obj == null) {
                        return wz0.n;
                    }
                    if (lk1Var.k(objL2, i2, obj)) {
                        i();
                        return wz0.m;
                    }
                }
            } else if (objL2 != wz0.d) {
                d1g d1gVar = wz0.j;
                if (objL2 == d1gVar) {
                    return wz0.o;
                }
                if (objL2 == wz0.h) {
                    return wz0.o;
                }
                if (objL2 == wz0.l) {
                    i();
                    return wz0.o;
                }
                if (objL2 != wz0.g && lk1Var.k(objL2, i2, wz0.f)) {
                    boolean z = objL2 instanceof ywe;
                    if (z) {
                        objL2 = ((ywe) objL2).a;
                    }
                    if (K(objL2, lk1Var, i2)) {
                        lk1Var.o(i2, wz0.i);
                        i();
                        Object obj3 = atomicReferenceArray.get(i2 * 2);
                        lk1Var.n(i2, null);
                        return obj3;
                    }
                    lk1Var.o(i2, d1gVar);
                    lk1Var.i();
                    if (z) {
                        i();
                    }
                    return wz0.o;
                }
            } else if (lk1Var.k(objL2, i2, wz0.i)) {
                i();
                Object obj4 = atomicReferenceArray.get(i2 * 2);
                lk1Var.n(i2, null);
                return obj4;
            }
        }
    }

    public final int M(lk1 lk1Var, int i2, Object obj, long j2, Object obj2, boolean z) {
        lk1Var.n(i2, obj);
        if (z) {
            return N(lk1Var, i2, obj, j2, obj2, z);
        }
        Object objL = lk1Var.l(i2);
        if (objL == null) {
            if (d(j2)) {
                if (lk1Var.k(null, i2, wz0.d)) {
                    return 1;
                }
            } else {
                if (obj2 == null) {
                    return 3;
                }
                if (lk1Var.k(null, i2, obj2)) {
                    return 2;
                }
            }
        } else if (objL instanceof xwe) {
            lk1Var.n(i2, null);
            if (J(objL, obj)) {
                lk1Var.o(i2, wz0.i);
                return 0;
            }
            d1g d1gVar = wz0.k;
            if (lk1Var.h.getAndSet((i2 * 2) + 1, d1gVar) == d1gVar) {
                return 5;
            }
            lk1Var.m(i2, true);
            return 5;
        }
        return N(lk1Var, i2, obj, j2, obj2, z);
    }

    public final int N(lk1 lk1Var, int i2, Object obj, long j2, Object obj2, boolean z) {
        while (true) {
            Object objL = lk1Var.l(i2);
            if (objL == null) {
                if (!d(j2) || z) {
                    if (z) {
                        if (lk1Var.k(null, i2, wz0.j)) {
                            lk1Var.i();
                            return 4;
                        }
                    } else {
                        if (obj2 == null) {
                            return 3;
                        }
                        if (lk1Var.k(null, i2, obj2)) {
                            return 2;
                        }
                    }
                } else if (lk1Var.k(null, i2, wz0.d)) {
                    break;
                }
            } else {
                if (objL != wz0.e) {
                    d1g d1gVar = wz0.k;
                    if (objL == d1gVar) {
                        lk1Var.n(i2, null);
                        return 5;
                    }
                    if (objL == wz0.h) {
                        lk1Var.n(i2, null);
                        return 5;
                    }
                    if (objL == wz0.l) {
                        lk1Var.n(i2, null);
                        A();
                        return 4;
                    }
                    lk1Var.n(i2, null);
                    if (objL instanceof ywe) {
                        objL = ((ywe) objL).a;
                    }
                    if (J(objL, obj)) {
                        lk1Var.o(i2, wz0.i);
                        return 0;
                    }
                    if (lk1Var.h.getAndSet((i2 * 2) + 1, d1gVar) != d1gVar) {
                        lk1Var.m(i2, true);
                    }
                    return 5;
                }
                if (lk1Var.k(objL, i2, wz0.d)) {
                    break;
                }
            }
        }
        return 1;
    }

    public final void O(long j2) {
        uz0 uz0Var = this;
        if (uz0Var.C()) {
            return;
        }
        while (uz0Var.l() <= j2) {
            uz0Var = this;
        }
        int i2 = wz0.c;
        int i3 = 0;
        while (true) {
            long j3 = l;
            if (i3 < i2) {
                long jL = uz0Var.l();
                if (jL == (m80.a.getLongVolatile(uz0Var, j3) & 4611686018427387903L) && jL == uz0Var.l()) {
                    return;
                } else {
                    i3++;
                }
            } else {
                while (true) {
                    Unsafe unsafe = m80.a;
                    long longVolatile = unsafe.getLongVolatile(uz0Var, j3);
                    if (unsafe.compareAndSwapLong(uz0Var, l, longVolatile, 4611686018427387904L + (longVolatile & 4611686018427387903L))) {
                        break;
                    } else {
                        uz0Var = this;
                    }
                }
                while (true) {
                    long jL2 = uz0Var.l();
                    Unsafe unsafe2 = m80.a;
                    long longVolatile2 = unsafe2.getLongVolatile(uz0Var, j3);
                    long j4 = longVolatile2 & 4611686018427387903L;
                    boolean z = (longVolatile2 & 4611686018427387904L) != 0;
                    if (jL2 == j4 && jL2 == uz0Var.l()) {
                        break;
                    }
                    if (z) {
                        uz0Var = this;
                    } else {
                        uz0Var = this;
                        unsafe2.compareAndSwapLong(uz0Var, l, longVolatile2, j4 + 4611686018427387904L);
                    }
                }
                while (true) {
                    Unsafe unsafe3 = m80.a;
                    long longVolatile3 = unsafe3.getLongVolatile(uz0Var, j3);
                    if (unsafe3.compareAndSwapLong(uz0Var, l, longVolatile3, longVolatile3 & 4611686018427387903L)) {
                        return;
                    } else {
                        uz0Var = this;
                    }
                }
            }
        }
    }

    @Override // defpackage.xyb
    public final void a(x45 x45Var) {
        Unsafe unsafe;
        while (true) {
            Unsafe unsafe2 = m80.a;
            uz0 uz0Var = this;
            if (unsafe2.compareAndSwapObject(uz0Var, k, (Object) null, x45Var)) {
                return;
            }
            long j2 = k;
            if (unsafe2.getObjectVolatile(uz0Var, j2) != null) {
                while (true) {
                    Object objectVolatile = m80.a.getObjectVolatile(uz0Var, j2);
                    d1g d1gVar = wz0.q;
                    if (objectVolatile != d1gVar) {
                        if (objectVolatile == wz0.r) {
                            ygf.f("Another handler was already registered and successfully invoked");
                            return;
                        } else {
                            ik4.m("Another handler is already registered: ", objectVolatile);
                            return;
                        }
                    }
                    d1g d1gVar2 = wz0.r;
                    do {
                        uz0 uz0Var2 = uz0Var;
                        unsafe = m80.a;
                        boolean zCompareAndSwapObject = unsafe.compareAndSwapObject(uz0Var2, k, d1gVar, d1gVar2);
                        uz0Var = uz0Var2;
                        if (zCompareAndSwapObject) {
                            x45Var.invoke(uz0Var.p());
                            return;
                        }
                    } while (unsafe.getObjectVolatile(uz0Var, j2) == d1gVar);
                }
            } else {
                this = uz0Var;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:99:0x0176, code lost:
    
        return r13;
     */
    /* JADX WARN: Removed duplicated region for block: B:127:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:91:0x015e A[RETURN] */
    @Override // defpackage.xyb
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object b(defpackage.n92 r23, java.lang.Object r24) {
        /*
            Method dump skipped, instruction units count: 380
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.b(n92, java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.xyb
    public final boolean c(Throwable th) {
        return f(th, false);
    }

    public final boolean d(long j2) {
        return j2 < l() || j2 < t() + ((long) this.a);
    }

    @Override // defpackage.xyb
    public Object e(Object obj) {
        uz0 uz0Var = this;
        Unsafe unsafe = m80.a;
        long j2 = 1152921504606846975L;
        boolean z = uz0Var.y(unsafe.getLongVolatile(uz0Var, p), false) ? false : !uz0Var.d(r2 & 1152921504606846975L);
        jk1 jk1Var = kk1.b;
        if (z) {
            return jk1Var;
        }
        Object obj2 = wz0.j;
        lk1 lk1Var = (lk1) unsafe.getObjectVolatile(uz0Var, o);
        while (true) {
            long andIncrement = b.getAndIncrement(uz0Var);
            long j3 = andIncrement & j2;
            boolean zY = uz0Var.y(andIncrement, false);
            int i2 = wz0.b;
            long j4 = i2;
            long j5 = j3 / j4;
            int i3 = (int) (j3 % j4);
            if (lk1Var.d != j5) {
                lk1 lk1VarK = uz0Var.k(j5, lk1Var);
                if (lk1VarK != null) {
                    lk1Var = lk1VarK;
                } else {
                    if (zY) {
                        return new ik1(uz0Var.u());
                    }
                    j2 = 1152921504606846975L;
                }
            }
            int iM = uz0Var.M(lk1Var, i3, obj, j3, obj2, zY);
            c1e c1eVar = c1e.a;
            if (iM == 0) {
                lk1Var.a();
                return c1eVar;
            }
            if (iM == 1) {
                return c1eVar;
            }
            if (iM == 2) {
                if (zY) {
                    lk1Var.i();
                    return new ik1(u());
                }
                xwe xweVar = obj2 instanceof xwe ? (xwe) obj2 : null;
                if (xweVar != null) {
                    xweVar.a(lk1Var, i3 + i2);
                }
                lk1Var.i();
                return jk1Var;
            }
            if (iM == 3) {
                ygf.f("unexpected");
                return null;
            }
            if (iM == 4) {
                if (j3 < t()) {
                    lk1Var.a();
                }
                return new ik1(u());
            }
            if (iM == 5) {
                lk1Var.a();
            }
            j2 = 1152921504606846975L;
            uz0Var = this;
        }
    }

    public final boolean f(Throwable th, boolean z) {
        boolean z2;
        Unsafe unsafe;
        long j2;
        long longVolatile;
        long j3;
        Object objectVolatile;
        Unsafe unsafe2;
        Unsafe unsafe3;
        long j4;
        long longVolatile2;
        uz0 uz0Var = this;
        if (z) {
            while (true) {
                Unsafe unsafe4 = m80.a;
                long j5 = p;
                long longVolatile3 = unsafe4.getLongVolatile(uz0Var, j5);
                if (((int) (longVolatile3 >> 60)) != 0) {
                    break;
                }
                lk1 lk1Var = wz0.a;
                if (unsafe4.compareAndSwapLong(uz0Var, j5, longVolatile3, (longVolatile3 & 1152921504606846975L) + 1152921504606846976L)) {
                    break;
                }
                uz0Var = this;
            }
        }
        d1g d1gVar = wz0.s;
        while (true) {
            Unsafe unsafe5 = m80.a;
            long j6 = h;
            if (unsafe5.compareAndSwapObject(this, j6, d1gVar, th)) {
                z2 = true;
                break;
            }
            if (unsafe5.getObjectVolatile(this, j6) != d1gVar) {
                z2 = false;
                break;
            }
        }
        if (z) {
            do {
                unsafe3 = m80.a;
                j4 = p;
                longVolatile2 = unsafe3.getLongVolatile(this, j4);
            } while (!unsafe3.compareAndSwapLong(this, j4, longVolatile2, (longVolatile2 & 1152921504606846975L) + 3458764513820540928L));
        } else {
            do {
                unsafe = m80.a;
                j2 = p;
                longVolatile = unsafe.getLongVolatile(this, j2);
                int i2 = (int) (longVolatile >> 60);
                if (i2 == 0) {
                    j3 = (longVolatile & 1152921504606846975L) + 2305843009213693952L;
                } else {
                    if (i2 != 1) {
                        break;
                    }
                    j3 = (longVolatile & 1152921504606846975L) + 3458764513820540928L;
                }
            } while (!unsafe.compareAndSwapLong(this, j2, longVolatile, j3));
        }
        A();
        if (z2) {
            loop3: while (true) {
                Unsafe unsafe6 = m80.a;
                long j7 = k;
                objectVolatile = unsafe6.getObjectVolatile(this, j7);
                d1g d1gVar2 = objectVolatile == null ? wz0.q : wz0.r;
                do {
                    unsafe2 = m80.a;
                    if (unsafe2.compareAndSwapObject(this, k, objectVolatile, d1gVar2)) {
                        break loop3;
                    }
                } while (unsafe2.getObjectVolatile(this, j7) == objectVolatile);
            }
            if (objectVolatile != null) {
                pwd.B(1, objectVolatile);
                ((x45) objectVolatile).invoke(p());
                return z2;
            }
        }
        return z2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x0097, code lost:
    
        r0 = (defpackage.lk1) ((defpackage.k32) defpackage.m80.a.getObjectVolatile(r0, defpackage.k32.b));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.lk1 g(long r12) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.g(long):lk1");
    }

    public final void h(long j2) {
        lk1 lk1Var = (lk1) m80.a.getObjectVolatile(this, m);
        while (true) {
            Unsafe unsafe = m80.a;
            long j3 = n;
            long longVolatile = unsafe.getLongVolatile(this, j3);
            if (j2 < Math.max(((long) this.a) + longVolatile, this.l())) {
                return;
            }
            uz0 uz0Var = this;
            if (unsafe.compareAndSwapLong(uz0Var, j3, longVolatile, 1 + longVolatile)) {
                long j4 = wz0.b;
                long j5 = longVolatile / j4;
                int i2 = (int) (longVolatile % j4);
                if (lk1Var.d != j5) {
                    lk1 lk1VarJ = uz0Var.j(j5, lk1Var);
                    if (lk1VarJ != null) {
                        lk1Var = lk1VarJ;
                    }
                }
                lk1 lk1Var2 = lk1Var;
                if (uz0Var.L(lk1Var2, i2, longVolatile, null) != wz0.o || longVolatile < uz0Var.v()) {
                    lk1Var2.a();
                }
                this = uz0Var;
                lk1Var = lk1Var2;
            }
            this = uz0Var;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:98:0x0176, code lost:
    
        w(1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:99:0x0179, code lost:
    
        return;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void i() {
        /*
            Method dump skipped, instruction units count: 378
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.i():void");
    }

    @Override // defpackage.wj1
    public final pz0 iterator() {
        return new pz0(this);
    }

    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c4, code lost:
    
        if (r8.f() == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00c6, code lost:
    
        r8.e();
     */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00d2  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00fb A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.lk1 j(long r16, defpackage.lk1 r18) {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.j(long, lk1):lk1");
    }

    public final lk1 k(long j2, lk1 lk1Var) {
        Object objQ;
        lk1 lk1Var2;
        long j3;
        Unsafe unsafe;
        uz0 uz0Var = this;
        lk1 lk1Var3 = wz0.a;
        vz0 vz0Var = vz0.a;
        loop0: while (true) {
            objQ = s42.Q(lk1Var, j2, vz0Var);
            if (!ek7.H(objQ)) {
                jwb jwbVarE = ek7.E(objQ);
                while (true) {
                    Unsafe unsafe2 = m80.a;
                    long j4 = o;
                    jwb jwbVar = (jwb) unsafe2.getObjectVolatile(uz0Var, j4);
                    if (jwbVar.d >= jwbVarE.d) {
                        break loop0;
                    }
                    if (!jwbVarE.j()) {
                        break;
                    }
                    do {
                        unsafe = m80.a;
                        if (unsafe.compareAndSwapObject(uz0Var, o, jwbVar, jwbVarE)) {
                            if (jwbVar.f()) {
                                jwbVar.e();
                            }
                        }
                    } while (unsafe.getObjectVolatile(uz0Var, j4) == jwbVar);
                    if (jwbVarE.f()) {
                        jwbVarE.e();
                    }
                }
            } else {
                break;
            }
        }
        lk1 lk1Var4 = null;
        if (ek7.H(objQ)) {
            uz0Var.A();
            if (lk1Var.d * ((long) wz0.b) >= uz0Var.t()) {
                return null;
            }
            lk1Var.a();
            return null;
        }
        lk1 lk1Var5 = (lk1) ek7.E(objQ);
        long j5 = lk1Var5.d;
        if (j5 <= j2) {
            return lk1Var5;
        }
        long j6 = j5 * ((long) wz0.b);
        while (true) {
            Unsafe unsafe3 = m80.a;
            long j7 = p;
            long longVolatile = unsafe3.getLongVolatile(uz0Var, j7);
            long j8 = 1152921504606846975L & longVolatile;
            if (j8 >= j6) {
                lk1Var2 = lk1Var4;
                j3 = j5;
                break;
            }
            lk1Var2 = lk1Var4;
            j3 = j5;
            if (unsafe3.compareAndSwapLong(uz0Var, j7, longVolatile, j8 + (((long) ((int) (longVolatile >> 60))) << 60))) {
                break;
            }
            uz0Var = this;
            lk1Var4 = lk1Var2;
            j5 = j3;
        }
        if (j3 * ((long) wz0.b) >= t()) {
            return lk1Var2;
        }
        lk1Var5.a();
        return lk1Var2;
    }

    public final long l() {
        return m80.a.getLongVolatile(this, i);
    }

    @Override // defpackage.wj1
    public final void m(CancellationException cancellationException) {
        if (cancellationException == null) {
            cancellationException = new CancellationException("Channel was cancelled");
        }
        f(cancellationException, true);
    }

    @Override // defpackage.wj1
    public final mya n() {
        pwd.B(3, qz0.a);
        pwd.B(3, rz0.a);
        return new mya(this, (oz0) null);
    }

    @Override // defpackage.wj1
    public final Object o() {
        lk1 lk1Var;
        Unsafe unsafe = m80.a;
        long longVolatile = unsafe.getLongVolatile(this, n);
        long longVolatile2 = unsafe.getLongVolatile(this, p);
        if (y(longVolatile2, true)) {
            return new ik1(p());
        }
        long j2 = longVolatile2 & 1152921504606846975L;
        jk1 jk1Var = kk1.b;
        if (longVolatile >= j2) {
            return jk1Var;
        }
        Object obj = wz0.k;
        lk1 lk1Var2 = (lk1) unsafe.getObjectVolatile(this, m);
        while (!this.z()) {
            long andIncrement = c.getAndIncrement(this);
            long j3 = wz0.b;
            long j4 = andIncrement / j3;
            int i2 = (int) (andIncrement % j3);
            if (lk1Var2.d != j4) {
                lk1 lk1VarJ = this.j(j4, lk1Var2);
                if (lk1VarJ == null) {
                    continue;
                } else {
                    lk1Var = lk1VarJ;
                }
            } else {
                lk1Var = lk1Var2;
            }
            uz0 uz0Var = this;
            Object objL = uz0Var.L(lk1Var, i2, andIncrement, obj);
            lk1Var2 = lk1Var;
            if (objL == wz0.m) {
                xwe xweVar = obj instanceof xwe ? (xwe) obj : null;
                if (xweVar != null) {
                    xweVar.a(lk1Var2, i2);
                }
                uz0Var.O(andIncrement);
                lk1Var2.i();
                return jk1Var;
            }
            if (objL != wz0.o) {
                if (objL != wz0.n) {
                    lk1Var2.a();
                    return objL;
                }
                ygf.f("unexpected");
                return null;
            }
            if (andIncrement < uz0Var.v()) {
                lk1Var2.a();
            }
            this = uz0Var;
        }
        return new ik1(this.p());
    }

    public final Throwable p() {
        return (Throwable) m80.a.getObjectVolatile(this, h);
    }

    @Override // defpackage.wj1
    public final Object q(n92 n92Var) throws Throwable {
        lk1 lk1Var;
        Throwable th;
        lk1 lk1Var2;
        Unsafe unsafe = m80.a;
        long j2 = m;
        lk1 lk1Var3 = (lk1) unsafe.getObjectVolatile(this, j2);
        while (!this.z()) {
            AtomicLongFieldUpdater atomicLongFieldUpdater = c;
            long andIncrement = atomicLongFieldUpdater.getAndIncrement(this);
            long j3 = wz0.b;
            long j4 = andIncrement / j3;
            int i2 = (int) (andIncrement % j3);
            if (lk1Var3.d != j4) {
                lk1 lk1VarJ = this.j(j4, lk1Var3);
                if (lk1VarJ == null) {
                    continue;
                } else {
                    lk1Var = lk1VarJ;
                }
            } else {
                lk1Var = lk1Var3;
            }
            uz0 uz0Var = this;
            Object objL = uz0Var.L(lk1Var, i2, andIncrement, null);
            d1g d1gVar = wz0.m;
            if (objL == d1gVar) {
                ygf.f("unexpected");
                return null;
            }
            d1g d1gVar2 = wz0.o;
            if (objL == d1gVar2) {
                if (andIncrement < uz0Var.v()) {
                    lk1Var.a();
                }
                this = uz0Var;
                lk1Var3 = lk1Var;
            } else {
                if (objL != wz0.n) {
                    lk1Var.a();
                    return objL;
                }
                x51 x51VarS = wgf.s(pwd.Q(n92Var));
                try {
                    Object objL2 = uz0Var.L(lk1Var, i2, andIncrement, x51VarS);
                    if (objL2 == d1gVar) {
                        x51VarS.a(lk1Var, i2);
                    } else {
                        if (objL2 == d1gVar2) {
                            if (andIncrement < uz0Var.v()) {
                                lk1Var.a();
                            }
                            lk1 lk1Var4 = (lk1) m80.a.getObjectVolatile(uz0Var, j2);
                            while (true) {
                                if (uz0Var.z()) {
                                    x51VarS.resumeWith(new ajb(uz0Var.s()));
                                    break;
                                }
                                x51 x51Var = x51VarS;
                                try {
                                    long andIncrement2 = atomicLongFieldUpdater.getAndIncrement(uz0Var);
                                    long j5 = wz0.b;
                                    long j6 = andIncrement2 / j5;
                                    int i3 = (int) (andIncrement2 % j5);
                                    if (lk1Var4.d != j6) {
                                        try {
                                            lk1 lk1VarJ2 = uz0Var.j(j6, lk1Var4);
                                            if (lk1VarJ2 == null) {
                                                x51VarS = x51Var;
                                            } else {
                                                lk1Var2 = lk1VarJ2;
                                            }
                                        } catch (Throwable th2) {
                                            th = th2;
                                            x51VarS = x51Var;
                                            x51VarS.B();
                                            throw th;
                                        }
                                    } else {
                                        lk1Var2 = lk1Var4;
                                    }
                                    uz0 uz0Var2 = uz0Var;
                                    objL2 = uz0Var2.L(lk1Var2, i3, andIncrement2, x51Var);
                                    uz0Var = uz0Var2;
                                    lk1 lk1Var5 = lk1Var2;
                                    x51VarS = x51Var;
                                    if (objL2 == wz0.m) {
                                        x51VarS.a(lk1Var5, i3);
                                        break;
                                    }
                                    if (objL2 == wz0.o) {
                                        if (andIncrement2 < uz0Var.v()) {
                                            lk1Var5.a();
                                        }
                                        lk1Var4 = lk1Var5;
                                    } else {
                                        if (objL2 == wz0.n) {
                                            throw new IllegalStateException("unexpected");
                                        }
                                        lk1Var5.a();
                                    }
                                } catch (Throwable th3) {
                                    th = th3;
                                    x51VarS = x51Var;
                                    th = th;
                                    x51VarS.B();
                                    throw th;
                                }
                            }
                        } else {
                            lk1Var.a();
                        }
                        x51VarS.j(objL2, null);
                    }
                    return x51VarS.q();
                } catch (Throwable th4) {
                    th = th4;
                }
            }
        }
        Throwable thS = this.s();
        int i4 = gmc.a;
        throw thS;
    }

    @Override // defpackage.wj1
    public final Object r(zv1 zv1Var) {
        return G(this, zv1Var);
    }

    public final Throwable s() {
        Throwable thP = p();
        return thP == null ? new ClosedReceiveChannelException("Channel was closed") : thP;
    }

    public final long t() {
        return m80.a.getLongVolatile(this, n);
    }

    /* JADX WARN: Code restructure failed: missing block: B:87:0x01b6, code lost:
    
        r3 = (defpackage.lk1) r3.c();
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x01bd, code lost:
    
        if (r3 != null) goto L94;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String toString() {
        /*
            Method dump skipped, instruction units count: 483
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.toString():java.lang.String");
    }

    public final Throwable u() {
        Throwable thP = p();
        return thP == null ? new ClosedSendChannelException("Channel was closed") : thP;
    }

    public final long v() {
        return m80.a.getLongVolatile(this, p) & 1152921504606846975L;
    }

    public final void w(long j2) {
        if ((e.addAndGet(this, j2) & 4611686018427387904L) != 0) {
            while ((m80.a.getLongVolatile(this, l) & 4611686018427387904L) != 0) {
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:53:0x00a0, code lost:
    
        r12 = (defpackage.lk1) ((defpackage.k32) defpackage.m80.a.getObjectVolatile(r12, defpackage.k32.b));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean y(long r12, boolean r14) {
        /*
            Method dump skipped, instruction units count: 366
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.uz0.y(long, boolean):boolean");
    }

    public final boolean z() {
        return y(m80.a.getLongVolatile(this, p), true);
    }
}
