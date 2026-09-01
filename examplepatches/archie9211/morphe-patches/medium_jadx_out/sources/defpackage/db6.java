package defpackage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.CancellationException;
import kotlinx.coroutines.CompletionHandlerException;
import kotlinx.coroutines.JobCancellationException;
import kotlinx.coroutines.TimeoutCancellationException;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class db6 implements va6 {
    public static final /* synthetic */ long a;
    public static final /* synthetic */ long b;
    private volatile /* synthetic */ Object _parentHandle$volatile;
    private volatile /* synthetic */ Object _state$volatile;

    static {
        Unsafe unsafe = m80.a;
        b = unsafe.objectFieldOffset(db6.class.getDeclaredField("_state$volatile"));
        a = unsafe.objectFieldOffset(db6.class.getDeclaredField("_parentHandle$volatile"));
    }

    public db6(boolean z) {
        this._state$volatile = z ? o7f.o : o7f.n;
    }

    public static hl1 Y(y67 y67Var) {
        while (y67Var.j()) {
            y67Var = y67Var.i();
        }
        while (true) {
            y67Var = y67Var.h();
            if (!y67Var.j()) {
                if (y67Var instanceof hl1) {
                    return (hl1) y67Var;
                }
                if (y67Var instanceof gh8) {
                    return null;
                }
            }
        }
    }

    public static String f0(Object obj) {
        if (!(obj instanceof bb6)) {
            return obj instanceof m06 ? ((m06) obj).f() ? "Active" : "New" : obj instanceof cy1 ? "Cancelled" : "Completed";
        }
        bb6 bb6Var = (bb6) obj;
        return bb6Var.c() ? "Cancelling" : bb6Var.d() ? "Completing" : "Active";
    }

    public final Object A() throws Throwable {
        Object objH = H();
        if (objH instanceof m06) {
            ygf.f("This job has not completed yet");
            return null;
        }
        if (objH instanceof cy1) {
            throw ((cy1) objH).a;
        }
        return o7f.K(objH);
    }

    @Override // defpackage.va6
    public final yh3 A0(boolean z, boolean z2, k0 k0Var) {
        return O(z2, z ? new x76(k0Var) : new y76(k0Var));
    }

    @Override // defpackage.va6
    public final mzb B() {
        return new j80(2, new cb6(null, this));
    }

    public final Throwable C(bb6 bb6Var, ArrayList arrayList) {
        Object next;
        Object obj = null;
        if (arrayList.isEmpty()) {
            if (bb6Var.c()) {
                return new JobCancellationException(v(), null, this);
            }
            return null;
        }
        Iterator it2 = arrayList.iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (!(((Throwable) next) instanceof CancellationException)) {
                break;
            }
        }
        Throwable th = (Throwable) next;
        if (th != null) {
            return th;
        }
        Throwable th2 = (Throwable) arrayList.get(0);
        if (th2 instanceof TimeoutCancellationException) {
            Iterator it3 = arrayList.iterator();
            while (true) {
                if (!it3.hasNext()) {
                    break;
                }
                Object next2 = it3.next();
                Throwable th3 = (Throwable) next2;
                if (th3 != th2 && (th3 instanceof TimeoutCancellationException)) {
                    obj = next2;
                    break;
                }
            }
            Throwable th4 = (Throwable) obj;
            if (th4 != null) {
                return th4;
            }
        }
        return th2;
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x0075, code lost:
    
        return r5;
     */
    @Override // defpackage.va6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.gl1 D(defpackage.db6 r7) {
        /*
            r6 = this;
            hl1 r5 = new hl1
            r5.<init>(r7)
            r5.d = r6
        L7:
            java.lang.Object r4 = r6.H()
            boolean r7 = r4 instanceof defpackage.sx3
            if (r7 == 0) goto L30
            r7 = r4
            sx3 r7 = (defpackage.sx3) r7
            boolean r0 = r7.a
            if (r0 == 0) goto L2b
        L16:
            sun.misc.Unsafe r0 = defpackage.m80.a
            long r2 = defpackage.db6.b
            r1 = r6
            boolean r6 = r0.compareAndSwapObject(r1, r2, r4, r5)
            if (r6 == 0) goto L22
            goto L75
        L22:
            java.lang.Object r6 = r0.getObjectVolatile(r1, r2)
            if (r6 == r4) goto L29
            goto L46
        L29:
            r6 = r1
            goto L16
        L2b:
            r1 = r6
            r1.c0(r7)
            goto L46
        L30:
            r1 = r6
            boolean r6 = r4 instanceof defpackage.m06
            lh8 r7 = defpackage.lh8.a
            r0 = 0
            if (r6 == 0) goto L77
            r6 = r4
            m06 r6 = (defpackage.m06) r6
            gh8 r6 = r6.g()
            if (r6 != 0) goto L48
            xa6 r4 = (defpackage.xa6) r4
            r1.d0(r4)
        L46:
            r6 = r1
            goto L7
        L48:
            r2 = 7
            boolean r2 = r6.b(r5, r2)
            if (r2 == 0) goto L50
            goto L75
        L50:
            r2 = 3
            boolean r6 = r6.b(r5, r2)
            java.lang.Object r1 = r1.H()
            boolean r2 = r1 instanceof defpackage.bb6
            if (r2 == 0) goto L64
            bb6 r1 = (defpackage.bb6) r1
            java.lang.Throwable r0 = r1.b()
            goto L70
        L64:
            boolean r2 = r1 instanceof defpackage.cy1
            if (r2 == 0) goto L6b
            cy1 r1 = (defpackage.cy1) r1
            goto L6c
        L6b:
            r1 = r0
        L6c:
            if (r1 == 0) goto L70
            java.lang.Throwable r0 = r1.a
        L70:
            r5.m(r0)
            if (r6 == 0) goto L76
        L75:
            return r5
        L76:
            return r7
        L77:
            java.lang.Object r6 = r1.H()
            boolean r1 = r6 instanceof defpackage.cy1
            if (r1 == 0) goto L82
            cy1 r6 = (defpackage.cy1) r6
            goto L83
        L82:
            r6 = r0
        L83:
            if (r6 == 0) goto L87
            java.lang.Throwable r0 = r6.a
        L87:
            r5.m(r0)
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.db6.D(db6):gl1");
    }

    public boolean E() {
        return true;
    }

    public boolean F() {
        return this instanceof vx1;
    }

    public final gh8 G(m06 m06Var) {
        gh8 gh8VarG = m06Var.g();
        if (gh8VarG != null) {
            return gh8VarG;
        }
        if (m06Var instanceof sx3) {
            return new gh8();
        }
        if (m06Var instanceof xa6) {
            d0((xa6) m06Var);
            return null;
        }
        ik4.m("State should have list: ", m06Var);
        return null;
    }

    public final Object H() {
        return m80.a.getObjectVolatile(this, b);
    }

    public boolean J(Throwable th) {
        return false;
    }

    @Override // defpackage.va6
    public final CancellationException L() {
        CancellationException cancellationException;
        Object objH = H();
        if (objH instanceof bb6) {
            Throwable thB = ((bb6) objH).b();
            if (thB == null) {
                ik4.m("Job is still new or active: ", this);
                return null;
            }
            String strConcat = getClass().getSimpleName().concat(" is cancelling");
            cancellationException = thB instanceof CancellationException ? (CancellationException) thB : null;
            return cancellationException == null ? new JobCancellationException(strConcat, thB, this) : cancellationException;
        }
        if (objH instanceof m06) {
            ik4.m("Job is still new or active: ", this);
            return null;
        }
        if (!(objH instanceof cy1)) {
            return new JobCancellationException(getClass().getSimpleName().concat(" has completed normally"), null, this);
        }
        Throwable th = ((cy1) objH).a;
        cancellationException = th instanceof CancellationException ? (CancellationException) th : null;
        return cancellationException == null ? new JobCancellationException(v(), th, this) : cancellationException;
    }

    public final void M(va6 va6Var) {
        long j = a;
        lh8 lh8Var = lh8.a;
        if (va6Var == null) {
            m80.a.putObjectVolatile(this, j, lh8Var);
            return;
        }
        va6Var.start();
        gl1 gl1VarD = va6Var.D(this);
        Unsafe unsafe = m80.a;
        unsafe.putObjectVolatile(this, j, gl1VarD);
        if (P()) {
            gl1VarD.dispose();
            unsafe.putObjectVolatile(this, j, lh8Var);
        }
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    /* JADX WARN: Code restructure failed: missing block: B:45:0x0088, code lost:
    
        return r8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.yh3 O(boolean r7, defpackage.xa6 r8) {
        /*
            r6 = this;
            r8.d = r6
        L2:
            java.lang.Object r4 = r6.H()
            boolean r0 = r4 instanceof defpackage.sx3
            if (r0 == 0) goto L2e
            r0 = r4
            sx3 r0 = (defpackage.sx3) r0
            boolean r1 = r0.a
            if (r1 == 0) goto L28
        L11:
            sun.misc.Unsafe r0 = defpackage.m80.a
            long r2 = defpackage.db6.b
            r1 = r6
            r5 = r8
            boolean r6 = r0.compareAndSwapObject(r1, r2, r4, r5)
            if (r6 == 0) goto L1e
            goto L6f
        L1e:
            java.lang.Object r6 = r0.getObjectVolatile(r1, r2)
            if (r6 == r4) goto L25
            goto L70
        L25:
            r6 = r1
            r8 = r5
            goto L11
        L28:
            r1 = r6
            r5 = r8
            r1.c0(r0)
            goto L70
        L2e:
            r1 = r6
            r5 = r8
            boolean r6 = r4 instanceof defpackage.m06
            lh8 r8 = defpackage.lh8.a
            r0 = 0
            if (r6 == 0) goto L73
            r6 = r4
            m06 r6 = (defpackage.m06) r6
            gh8 r2 = r6.g()
            if (r2 != 0) goto L46
            xa6 r4 = (defpackage.xa6) r4
            r1.d0(r4)
            goto L70
        L46:
            boolean r3 = r5.l()
            if (r3 == 0) goto L68
            boolean r3 = r6 instanceof defpackage.bb6
            if (r3 == 0) goto L53
            bb6 r6 = (defpackage.bb6) r6
            goto L54
        L53:
            r6 = r0
        L54:
            if (r6 == 0) goto L5a
            java.lang.Throwable r0 = r6.b()
        L5a:
            if (r0 != 0) goto L62
            r6 = 5
            boolean r6 = r2.b(r5, r6)
            goto L6d
        L62:
            if (r7 == 0) goto L88
            r5.m(r0)
            return r8
        L68:
            r6 = 1
            boolean r6 = r2.b(r5, r6)
        L6d:
            if (r6 == 0) goto L70
        L6f:
            return r5
        L70:
            r6 = r1
            r8 = r5
            goto L2
        L73:
            if (r7 == 0) goto L88
            java.lang.Object r6 = r1.H()
            boolean r7 = r6 instanceof defpackage.cy1
            if (r7 == 0) goto L80
            cy1 r6 = (defpackage.cy1) r6
            goto L81
        L80:
            r6 = r0
        L81:
            if (r6 == 0) goto L85
            java.lang.Throwable r0 = r6.a
        L85:
            r5.m(r0)
        L88:
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.db6.O(boolean, xa6):yh3");
    }

    public final boolean P() {
        return !(H() instanceof m06);
    }

    @Override // defpackage.va6
    public final yh3 R(x45 x45Var) {
        return O(true, new y76(x45Var));
    }

    public boolean S() {
        return this instanceof qs0;
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    public final boolean V(Object obj) {
        Object objG0;
        do {
            objG0 = g0(H(), obj);
            if (objG0 == o7f.i) {
                return false;
            }
            if (objG0 == o7f.j) {
                return true;
            }
        } while (objG0 == o7f.k);
        g(objG0);
        return true;
    }

    public final Object W(Object obj) {
        Object objG0;
        do {
            objG0 = g0(H(), obj);
            if (objG0 == o7f.i) {
                String str = "Job " + this + " is already complete or completing, but is being completed with " + obj;
                cy1 cy1Var = obj instanceof cy1 ? (cy1) obj : null;
                throw new IllegalStateException(str, cy1Var != null ? cy1Var.a : null);
            }
        } while (objG0 == o7f.k);
        return objG0;
    }

    public String X() {
        return getClass().getSimpleName();
    }

    public final void Z(gh8 gh8Var, Throwable th) {
        gh8Var.b(new k17(4), 4);
        Object objE = gh8Var.e();
        objE.getClass();
        CompletionHandlerException completionHandlerException = null;
        for (y67 y67VarH = (y67) objE; !y67VarH.equals(gh8Var); y67VarH = y67VarH.h()) {
            if ((y67VarH instanceof xa6) && ((xa6) y67VarH).l()) {
                try {
                    ((xa6) y67VarH).m(th);
                } catch (Throwable th2) {
                    if (completionHandlerException != null) {
                        kyd.D(completionHandlerException, th2);
                    } else {
                        completionHandlerException = new CompletionHandlerException("Exception in completion handler " + y67VarH + " for " + this, th2);
                    }
                }
            }
        }
        if (completionHandlerException != null) {
            K(completionHandlerException);
        }
        u(th);
    }

    public final void c0(sx3 sx3Var) {
        gh8 gh8Var = new gh8();
        Object k06Var = sx3Var.a ? gh8Var : new k06(gh8Var);
        while (true) {
            Unsafe unsafe = m80.a;
            long j = b;
            db6 db6Var = this;
            sx3 sx3Var2 = sx3Var;
            if (unsafe.compareAndSwapObject(db6Var, j, sx3Var2, k06Var) || unsafe.getObjectVolatile(db6Var, j) != sx3Var2) {
                return;
            }
            this = db6Var;
            sx3Var = sx3Var2;
        }
    }

    public final void d0(xa6 xa6Var) {
        xa6 xa6Var2;
        db6 db6Var;
        gh8 gh8Var = new gh8();
        Unsafe unsafe = m80.a;
        unsafe.putObjectVolatile(gh8Var, y67.b, xa6Var);
        long j = y67.a;
        unsafe.putObjectVolatile(gh8Var, j, xa6Var);
        loop0: while (true) {
            if (xa6Var.e() != xa6Var) {
                xa6Var2 = xa6Var;
                break;
            }
            while (true) {
                Unsafe unsafe2 = m80.a;
                xa6Var2 = xa6Var;
                if (unsafe2.compareAndSwapObject(xa6Var2, y67.a, xa6Var, gh8Var)) {
                    gh8Var.d(xa6Var2);
                    break loop0;
                }
                db6Var = this;
                xa6Var = xa6Var2;
                if (unsafe2.getObjectVolatile(xa6Var2, j) != xa6Var2) {
                    break;
                } else {
                    this = db6Var;
                }
            }
            this = db6Var;
        }
        y67 y67VarH = xa6Var2.h();
        while (true) {
            Unsafe unsafe3 = m80.a;
            long j2 = b;
            db6 db6Var2 = this;
            if (unsafe3.compareAndSwapObject(db6Var2, j2, xa6Var2, y67VarH) || unsafe3.getObjectVolatile(db6Var2, j2) != xa6Var2) {
                return;
            } else {
                this = db6Var2;
            }
        }
    }

    public final int e0(Object obj) {
        Unsafe unsafe;
        Unsafe unsafe2;
        boolean z = obj instanceof sx3;
        long j = b;
        if (z) {
            if (((sx3) obj).a) {
                return 0;
            }
            sx3 sx3Var = o7f.o;
            do {
                unsafe2 = m80.a;
                if (unsafe2.compareAndSwapObject(this, b, obj, sx3Var)) {
                    b0();
                    return 1;
                }
            } while (unsafe2.getObjectVolatile(this, j) == obj);
            return -1;
        }
        if (!(obj instanceof k06)) {
            return 0;
        }
        gh8 gh8Var = ((k06) obj).a;
        do {
            unsafe = m80.a;
            if (unsafe.compareAndSwapObject(this, b, obj, gh8Var)) {
                b0();
                return 1;
            }
        } while (unsafe.getObjectVolatile(this, j) == obj);
        return -1;
    }

    @Override // defpackage.va6
    public boolean f() {
        Object objH = H();
        return (objH instanceof m06) && ((m06) objH).f();
    }

    public final Object g0(Object obj, Object obj2) {
        Unsafe unsafe;
        long j;
        if (!(obj instanceof m06)) {
            return o7f.i;
        }
        if ((!(obj instanceof sx3) && !(obj instanceof xa6)) || (obj instanceof hl1) || (obj2 instanceof cy1)) {
            db6 db6Var = this;
            m06 m06Var = (m06) obj;
            gh8 gh8VarG = db6Var.G(m06Var);
            if (gh8VarG == null) {
                return o7f.k;
            }
            bb6 bb6Var = m06Var instanceof bb6 ? (bb6) m06Var : null;
            if (bb6Var == null) {
                bb6Var = new bb6(gh8VarG, null);
            }
            bb6 bb6Var2 = bb6Var;
            synchronized (bb6Var2) {
                if (bb6Var2.d()) {
                    return o7f.i;
                }
                m80.a.putIntVolatile(bb6Var2, bb6.c, 1);
                if (bb6Var2 != m06Var) {
                    do {
                        unsafe = m80.a;
                        j = b;
                        db6 db6Var2 = db6Var;
                        db6Var = db6Var2;
                        if (unsafe.compareAndSwapObject(db6Var2, j, m06Var, bb6Var2)) {
                        }
                    } while (unsafe.getObjectVolatile(db6Var, j) == m06Var);
                    return o7f.k;
                }
                boolean zC = bb6Var2.c();
                cy1 cy1Var = obj2 instanceof cy1 ? (cy1) obj2 : null;
                if (cy1Var != null) {
                    bb6Var2.a(cy1Var.a);
                }
                Throwable thB = zC ? null : bb6Var2.b();
                if (thB != null) {
                    db6Var.Z(gh8VarG, thB);
                }
                hl1 hl1VarY = Y(gh8VarG);
                if (hl1VarY != null && db6Var.h0(bb6Var2, hl1VarY, obj2)) {
                    return o7f.j;
                }
                gh8VarG.b(new k17(2), 2);
                hl1 hl1VarY2 = Y(gh8VarG);
                return (hl1VarY2 == null || !db6Var.h0(bb6Var2, hl1VarY2, obj2)) ? db6Var.z(bb6Var2, obj2) : o7f.j;
            }
        }
        m06 m06Var2 = (m06) obj;
        Object n06Var = obj2 instanceof m06 ? new n06((m06) obj2) : obj2;
        while (true) {
            Unsafe unsafe2 = m80.a;
            long j2 = b;
            db6 db6Var3 = this;
            if (unsafe2.compareAndSwapObject(db6Var3, j2, m06Var2, n06Var)) {
                db6Var3.a0(obj2);
                db6Var3.x(m06Var2, obj2);
                return obj2;
            }
            if (unsafe2.getObjectVolatile(db6Var3, j2) != m06Var2) {
                return o7f.k;
            }
            this = db6Var3;
        }
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return cd7.g;
    }

    public void h(Object obj) {
        g(obj);
    }

    public final boolean h0(bb6 bb6Var, hl1 hl1Var, Object obj) {
        while (bo.U(hl1Var.e, false, new ab6(this, bb6Var, hl1Var, obj)) == lh8.a) {
            hl1Var = Y(hl1Var);
            if (hl1Var == null) {
                return false;
            }
        }
        return true;
    }

    public final Object i(n92 n92Var) throws Throwable {
        Object objH;
        do {
            objH = H();
            if (!(objH instanceof m06)) {
                if (objH instanceof cy1) {
                    throw ((cy1) objH).a;
                }
                return o7f.K(objH);
            }
        } while (e0(objH) < 0);
        za6 za6Var = new za6(pwd.Q(n92Var), this);
        za6Var.s();
        za6Var.w(new p51(2, bo.U(this, true, new fjb(za6Var))));
        return za6Var.q();
    }

    @Override // defpackage.va6
    public final boolean isCancelled() {
        Object objH = H();
        if (objH instanceof cy1) {
            return true;
        }
        return (objH instanceof bb6) && ((bb6) objH).c();
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    /* JADX WARN: Code restructure failed: missing block: B:56:0x00be, code lost:
    
        r0 = r12;
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x003a A[PHI: r0
      0x003a: PHI (r0v1 java.lang.Object) = (r0v0 java.lang.Object), (r0v10 java.lang.Object) binds: [B:3:0x0008, B:16:0x0036] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean k(java.lang.Object r13) {
        /*
            Method dump skipped, instruction units count: 253
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.db6.k(java.lang.Object):boolean");
    }

    @Override // defpackage.va6
    public void m(CancellationException cancellationException) {
        if (cancellationException == null) {
            cancellationException = new JobCancellationException(v(), null, this);
        }
        s(cancellationException);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }

    public Object p() {
        return A();
    }

    public void s(CancellationException cancellationException) {
        k(cancellationException);
    }

    @Override // defpackage.va6
    public final boolean start() {
        int iE0;
        do {
            iE0 = e0(H());
            if (iE0 == 0) {
                return false;
            }
        } while (iE0 != 1);
        return true;
    }

    public final String toString() {
        return (X() + '{' + f0(H()) + '}') + '@' + vv2.I(this);
    }

    public final boolean u(Throwable th) {
        if (S()) {
            return true;
        }
        boolean z = th instanceof CancellationException;
        gl1 gl1Var = (gl1) m80.a.getObjectVolatile(this, a);
        return (gl1Var == null || gl1Var == lh8.a) ? z : gl1Var.a(th) || z;
    }

    public String v() {
        return "Job was cancelled";
    }

    public boolean w(Throwable th) {
        if (th instanceof CancellationException) {
            return true;
        }
        return k(th) && E();
    }

    public final void x(m06 m06Var, Object obj) {
        Unsafe unsafe = m80.a;
        long j = a;
        gl1 gl1Var = (gl1) unsafe.getObjectVolatile(this, j);
        if (gl1Var != null) {
            gl1Var.dispose();
            unsafe.putObjectVolatile(this, j, lh8.a);
        }
        CompletionHandlerException completionHandlerException = null;
        cy1 cy1Var = obj instanceof cy1 ? (cy1) obj : null;
        Throwable th = cy1Var != null ? cy1Var.a : null;
        if (m06Var instanceof xa6) {
            try {
                ((xa6) m06Var).m(th);
                return;
            } catch (Throwable th2) {
                K(new CompletionHandlerException("Exception in completion handler " + m06Var + " for " + this, th2));
                return;
            }
        }
        gh8 gh8VarG = m06Var.g();
        if (gh8VarG != null) {
            gh8VarG.b(new k17(1), 1);
            Object objE = gh8VarG.e();
            objE.getClass();
            for (y67 y67VarH = (y67) objE; !y67VarH.equals(gh8VarG); y67VarH = y67VarH.h()) {
                if (y67VarH instanceof xa6) {
                    try {
                        ((xa6) y67VarH).m(th);
                    } catch (Throwable th3) {
                        if (completionHandlerException != null) {
                            kyd.D(completionHandlerException, th3);
                        } else {
                            completionHandlerException = new CompletionHandlerException("Exception in completion handler " + y67VarH + " for " + this, th3);
                        }
                    }
                }
            }
            if (completionHandlerException != null) {
                K(completionHandlerException);
            }
        }
    }

    public final Throwable y(Object obj) {
        Throwable thB;
        if (obj instanceof Throwable) {
            return (Throwable) obj;
        }
        db6 db6Var = (db6) obj;
        Object objH = db6Var.H();
        if (objH instanceof bb6) {
            thB = ((bb6) objH).b();
        } else if (objH instanceof cy1) {
            thB = ((cy1) objH).a;
        } else {
            if (objH instanceof m06) {
                ik4.m("Cannot be cancelling child in this state: ", objH);
                return null;
            }
            thB = null;
        }
        CancellationException cancellationException = thB instanceof CancellationException ? (CancellationException) thB : null;
        return cancellationException == null ? new JobCancellationException("Parent job is ".concat(f0(objH)), thB, db6Var) : cancellationException;
    }

    public final Object z(bb6 bb6Var, Object obj) throws Throwable {
        bb6 bb6Var2;
        Throwable th;
        Throwable thC;
        db6 db6Var;
        bb6 bb6Var3;
        cy1 cy1Var = obj instanceof cy1 ? (cy1) obj : null;
        Throwable th2 = cy1Var != null ? cy1Var.a : null;
        synchronized (bb6Var) {
            try {
                bb6Var.c();
                ArrayList<Throwable> arrayListE = bb6Var.e(th2);
                thC = C(bb6Var, arrayListE);
                if (thC != null) {
                    try {
                        if (arrayListE.size() > 1) {
                            Set setNewSetFromMap = Collections.newSetFromMap(new IdentityHashMap(arrayListE.size()));
                            for (Throwable th3 : arrayListE) {
                                if (th3 != thC && th3 != thC && !(th3 instanceof CancellationException) && setNewSetFromMap.add(th3)) {
                                    kyd.D(thC, th3);
                                }
                            }
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        bb6Var2 = bb6Var;
                        throw th;
                    }
                }
            } catch (Throwable th5) {
                bb6Var2 = bb6Var;
                th = th5;
            }
        }
        if (thC != null && thC != th2) {
            obj = new cy1(thC, false);
        }
        if (thC != null && (u(thC) || J(thC))) {
            obj.getClass();
            m80.a.compareAndSwapInt((cy1) obj, cy1.b, 0, 1);
        }
        a0(obj);
        Object n06Var = obj instanceof m06 ? new n06((m06) obj) : obj;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = b;
            db6Var = this;
            bb6Var3 = bb6Var;
            if (unsafe.compareAndSwapObject(db6Var, j, bb6Var3, n06Var) || unsafe.getObjectVolatile(db6Var, j) != bb6Var3) {
                break;
            }
            this = db6Var;
            bb6Var = bb6Var3;
        }
        db6Var.x(bb6Var3, obj);
        return obj;
    }

    @Override // defpackage.va6
    public final Object z0(p92 p92Var) {
        Object objH;
        c1e c1eVar;
        do {
            objH = H();
            boolean z = objH instanceof m06;
            c1eVar = c1e.a;
            if (!z) {
                bo.N(p92Var.getContext());
                return c1eVar;
            }
        } while (e0(objH) < 0);
        x51 x51Var = new x51(1, pwd.Q(p92Var));
        x51Var.s();
        x51Var.w(new p51(2, bo.U(this, true, new gjb(x51Var))));
        Object objQ = x51Var.q();
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        if (objQ != tb2Var) {
            objQ = c1eVar;
        }
        return objQ == tb2Var ? objQ : c1eVar;
    }

    public void b0() {
    }

    public void K(CompletionHandlerException completionHandlerException) {
        throw completionHandlerException;
    }

    public void a0(Object obj) {
    }

    public void g(Object obj) {
    }
}
