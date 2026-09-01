package defpackage;

import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.imaging.riff.pvS.uuLAxLN;
import java.util.concurrent.CancellationException;
import kotlinx.coroutines.CompletionHandlerException;
import kotlinx.coroutines.DispatchException;
import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class x51 extends tg3 implements w51, ub2, xwe {
    public static final /* synthetic */ long f;
    public static final /* synthetic */ long g;
    public static final /* synthetic */ long h;
    private volatile /* synthetic */ int _decisionAndIndex$volatile;
    private volatile /* synthetic */ Object _parentHandle$volatile;
    private volatile /* synthetic */ Object _state$volatile;
    public final n92 d;
    public final ib2 e;

    static {
        Unsafe unsafe = m80.a;
        f = unsafe.objectFieldOffset(x51.class.getDeclaredField("_decisionAndIndex$volatile"));
        h = unsafe.objectFieldOffset(x51.class.getDeclaredField("_state$volatile"));
        g = unsafe.objectFieldOffset(x51.class.getDeclaredField("_parentHandle$volatile"));
    }

    public x51(int i, n92 n92Var) {
        super(i);
        this.d = n92Var;
        this.e = n92Var.getContext();
        this._decisionAndIndex$volatile = 536870911;
        this._state$volatile = m6.a;
    }

    public static Object E(ai8 ai8Var, Object obj, int i, c55 c55Var) {
        if (obj instanceof cy1) {
            return obj;
        }
        if (i != 1 && i != 2) {
            return obj;
        }
        if (c55Var != null || (ai8Var instanceof q51)) {
            return new ay1(obj, ai8Var instanceof q51 ? (q51) ai8Var : null, c55Var, (Throwable) null, 16);
        }
        return obj;
    }

    public static void z(ai8 ai8Var, Object obj) {
        throw new IllegalStateException(("It's prohibited to register multiple handlers, tried to register " + ai8Var + ", already has " + obj).toString());
    }

    public String A() {
        return "CancellableContinuation";
    }

    public final void B() {
        x51 x51Var;
        Unsafe unsafe;
        n92 n92Var = this.d;
        Throwable th = null;
        rg3 rg3Var = n92Var instanceof rg3 ? (rg3) n92Var : null;
        if (rg3Var != null) {
            long j = rg3.h;
            loop0: while (true) {
                Object objectVolatile = m80.a.getObjectVolatile(rg3Var, j);
                d1g d1gVar = op8.f;
                if (objectVolatile != d1gVar) {
                    x51Var = this;
                    if (!(objectVolatile instanceof Throwable)) {
                        ik4.m("Inconsistent state ", objectVolatile);
                        return;
                    }
                    do {
                        unsafe = m80.a;
                        if (unsafe.compareAndSwapObject(rg3Var, rg3.h, objectVolatile, (Object) null)) {
                            th = (Throwable) objectVolatile;
                        }
                    } while (unsafe.getObjectVolatile(rg3Var, j) == objectVolatile);
                    ay0.e("Failed requirement.");
                    return;
                }
                while (true) {
                    Unsafe unsafe2 = m80.a;
                    x51 x51Var2 = this;
                    x51Var = x51Var2;
                    if (unsafe2.compareAndSwapObject(rg3Var, rg3.h, d1gVar, x51Var2)) {
                        break loop0;
                    } else if (unsafe2.getObjectVolatile(rg3Var, j) != d1gVar) {
                        break;
                    } else {
                        this = x51Var;
                    }
                }
                this = x51Var;
            }
            if (th == null) {
                return;
            }
            x51Var.n();
            x51Var.l(th);
        }
    }

    public final void D(kb2 kb2Var) {
        n92 n92Var = this.d;
        rg3 rg3Var = n92Var instanceof rg3 ? (rg3) n92Var : null;
        C(c1e.a, (rg3Var != null ? rg3Var.d : null) == kb2Var ? 4 : this.c, null);
    }

    public final d1g F(Object obj, c55 c55Var) {
        x51 x51Var;
        d1g d1gVar = w2g.a;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = h;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (!(objectVolatile instanceof ai8)) {
                return null;
            }
            Object objE = E((ai8) objectVolatile, obj, this.c, c55Var);
            while (true) {
                Unsafe unsafe2 = m80.a;
                x51Var = this;
                if (unsafe2.compareAndSwapObject(x51Var, h, objectVolatile, objE)) {
                    if (!x51Var.y()) {
                        x51Var.n();
                    }
                    return d1gVar;
                }
                if (unsafe2.getObjectVolatile(x51Var, j) != objectVolatile) {
                    break;
                }
                this = x51Var;
            }
            this = x51Var;
        }
    }

    @Override // defpackage.xwe
    public final void a(jwb jwbVar, int i) {
        while (true) {
            Unsafe unsafe = m80.a;
            long j = f;
            int intVolatile = unsafe.getIntVolatile(this, j);
            if ((intVolatile & 536870911) != 536870911) {
                ygf.f("invokeOnCancellation should be called at most once");
                return;
            }
            x51 x51Var = this;
            if (unsafe.compareAndSwapInt(x51Var, j, intVolatile, ((intVolatile >> 29) << 29) + i)) {
                x51Var.w(jwbVar);
                return;
            }
            this = x51Var;
        }
    }

    @Override // defpackage.tg3
    public final void b(CancellationException cancellationException) {
        CancellationException cancellationException2;
        x51 x51Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = h;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (objectVolatile instanceof ai8) {
                ygf.f("Not completed");
                return;
            }
            if (objectVolatile instanceof cy1) {
                return;
            }
            if (objectVolatile instanceof ay1) {
                ay1 ay1Var = (ay1) objectVolatile;
                if (ay1Var.e != null) {
                    ygf.f("Must be called at most once");
                    return;
                }
                ay1 ay1VarA = ay1.a(ay1Var, null, cancellationException, 15);
                while (true) {
                    Unsafe unsafe2 = m80.a;
                    x51 x51Var2 = this;
                    if (unsafe2.compareAndSwapObject(x51Var2, h, objectVolatile, ay1VarA)) {
                        q51 q51Var = ay1Var.b;
                        if (q51Var != null) {
                            x51Var2.i(q51Var, cancellationException);
                        }
                        c55 c55Var = ay1Var.c;
                        if (c55Var != null) {
                            x51Var2.k(c55Var, cancellationException, ay1Var.a);
                            return;
                        }
                        return;
                    }
                    if (unsafe2.getObjectVolatile(x51Var2, j) != objectVolatile) {
                        cancellationException2 = cancellationException;
                        x51Var = x51Var2;
                        break;
                    }
                    this = x51Var2;
                }
            } else {
                x51 x51Var3 = this;
                CancellationException cancellationException3 = cancellationException;
                ay1 ay1Var2 = new ay1(objectVolatile, (q51) null, (c55) null, cancellationException3, 14);
                cancellationException2 = cancellationException3;
                while (true) {
                    ay1 ay1Var3 = ay1Var2;
                    Unsafe unsafe3 = m80.a;
                    x51Var = x51Var3;
                    boolean zCompareAndSwapObject = unsafe3.compareAndSwapObject(x51Var, h, objectVolatile, ay1Var3);
                    ay1Var2 = ay1Var3;
                    if (zCompareAndSwapObject) {
                        return;
                    }
                    if (unsafe3.getObjectVolatile(x51Var, j) != objectVolatile) {
                        break;
                    } else {
                        x51Var3 = x51Var;
                    }
                }
            }
            cancellationException = cancellationException2;
            this = x51Var;
        }
    }

    @Override // defpackage.tg3
    public final n92 c() {
        return this.d;
    }

    @Override // defpackage.w51
    public final d1g d(Object obj, c55 c55Var) {
        return F(obj, c55Var);
    }

    @Override // defpackage.tg3
    public final Throwable e(Object obj) {
        Throwable thE = super.e(obj);
        if (thE != null) {
            return thE;
        }
        return null;
    }

    @Override // defpackage.tg3
    public final Object f(Object obj) {
        return obj instanceof ay1 ? ((ay1) obj).a : obj;
    }

    @Override // defpackage.ub2
    public final ub2 getCallerFrame() {
        n92 n92Var = this.d;
        if (n92Var instanceof ub2) {
            return (ub2) n92Var;
        }
        return null;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.e;
    }

    @Override // defpackage.tg3
    public final Object h() {
        return r();
    }

    public final void i(q51 q51Var, Throwable th) {
        try {
            q51Var.b(th);
        } catch (Throwable th2) {
            kyd.Y(this.e, new CompletionHandlerException("Exception in invokeOnCancellation handler for " + this, th2));
        }
    }

    @Override // defpackage.w51
    public final void j(Object obj, c55 c55Var) throws DispatchException {
        C(obj, this.c, c55Var);
    }

    public final void k(c55 c55Var, Throwable th, Object obj) {
        ib2 ib2Var = this.e;
        try {
            c55Var.f(th, obj, ib2Var);
        } catch (Throwable th2) {
            kyd.Y(ib2Var, new CompletionHandlerException("Exception in resume onCancellation handler for " + this, th2));
        }
    }

    @Override // defpackage.w51
    public final boolean l(Throwable th) {
        Throwable cancellationException;
        x51 x51Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = h;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (!(objectVolatile instanceof ai8)) {
                return false;
            }
            boolean z = (objectVolatile instanceof q51) || (objectVolatile instanceof jwb);
            if (th == null) {
                cancellationException = new CancellationException("Continuation " + this + " was cancelled normally");
            } else {
                cancellationException = th;
            }
            c61 c61Var = new c61(cancellationException, z);
            while (true) {
                Unsafe unsafe2 = m80.a;
                x51Var = this;
                if (unsafe2.compareAndSwapObject(x51Var, h, objectVolatile, c61Var)) {
                    ai8 ai8Var = (ai8) objectVolatile;
                    if (ai8Var instanceof q51) {
                        x51Var.i((q51) objectVolatile, th);
                    } else if (ai8Var instanceof jwb) {
                        x51Var.m((jwb) objectVolatile, th);
                    }
                    if (!x51Var.y()) {
                        x51Var.n();
                    }
                    x51Var.o(x51Var.c);
                    return true;
                }
                if (unsafe2.getObjectVolatile(x51Var, j) != objectVolatile) {
                    break;
                }
                this = x51Var;
            }
            this = x51Var;
        }
    }

    public final void m(jwb jwbVar, Throwable th) {
        ib2 ib2Var = this.e;
        int intVolatile = m80.a.getIntVolatile(this, f) & 536870911;
        if (intVolatile == 536870911) {
            ygf.f("The index for Segment.onCancellation(..) is broken");
            return;
        }
        try {
            jwbVar.h(intVolatile, ib2Var);
        } catch (Throwable th2) {
            kyd.Y(ib2Var, new CompletionHandlerException("Exception in invokeOnCancellation handler for " + this, th2));
        }
    }

    public final void n() {
        Unsafe unsafe = m80.a;
        long j = g;
        yh3 yh3Var = (yh3) unsafe.getObjectVolatile(this, j);
        if (yh3Var == null) {
            return;
        }
        yh3Var.dispose();
        unsafe.putObjectVolatile(this, j, lh8.a);
    }

    public final void o(int i) throws DispatchException {
        while (true) {
            Unsafe unsafe = m80.a;
            long j = f;
            int intVolatile = unsafe.getIntVolatile(this, j);
            int i2 = intVolatile >> 29;
            if (i2 != 0) {
                if (i2 != 1) {
                    ygf.f("Already resumed");
                    return;
                }
                boolean z = i == 4;
                n92 n92Var = this.d;
                if (!z && (n92Var instanceof rg3)) {
                    boolean z2 = i == 1 || i == 2;
                    int i3 = this.c;
                    if (z2 == (i3 == 1 || i3 == 2)) {
                        rg3 rg3Var = (rg3) n92Var;
                        kb2 kb2Var = rg3Var.d;
                        ib2 context = rg3Var.e.getContext();
                        if (op8.m0(kb2Var, context)) {
                            op8.l0(kb2Var, context, this);
                            return;
                        }
                        k34 k34VarA = ald.a();
                        if (k34VarA.c >= 4294967296L) {
                            k34VarA.J0(this);
                            return;
                        }
                        k34VarA.K0(true);
                        try {
                            g76.b0(this, n92Var, true);
                            do {
                            } while (k34VarA.M0());
                        } finally {
                            try {
                            } finally {
                            }
                        }
                        return;
                    }
                }
                g76.b0(this, n92Var, z);
                return;
            }
            x51 x51Var = this;
            if (unsafe.compareAndSwapInt(x51Var, j, intVolatile, 1073741824 + (536870911 & intVolatile))) {
                return;
            } else {
                this = x51Var;
            }
        }
    }

    public Throwable p(db6 db6Var) {
        return db6Var.L();
    }

    public final Object q() {
        va6 va6Var;
        boolean zY = y();
        while (true) {
            Unsafe unsafe = m80.a;
            long j = f;
            int intVolatile = unsafe.getIntVolatile(this, j);
            int i = intVolatile >> 29;
            if (i != 0) {
                if (i != 2) {
                    ygf.f("Already suspended");
                    return null;
                }
                if (zY) {
                    this.B();
                }
                Object objR = this.r();
                if (objR instanceof cy1) {
                    throw ((cy1) objR).a;
                }
                int i2 = this.c;
                if ((i2 != 1 && i2 != 2) || (va6Var = (va6) this.e.o0(cd7.g)) == null || va6Var.f()) {
                    return this.f(objR);
                }
                CancellationException cancellationExceptionL = va6Var.L();
                this.b(cancellationExceptionL);
                throw cancellationExceptionL;
            }
            x51 x51Var = this;
            if (unsafe.compareAndSwapInt(x51Var, j, intVolatile, 536870912 + (536870911 & intVolatile))) {
                if (((yh3) unsafe.getObjectVolatile(x51Var, g)) == null) {
                    x51Var.u();
                }
                if (zY) {
                    x51Var.B();
                }
                return tb2.COROUTINE_SUSPENDED;
            }
            this = x51Var;
        }
    }

    public final Object r() {
        return m80.a.getObjectVolatile(this, h);
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            obj = new cy1(thB, false);
        }
        C(obj, this.c, null);
    }

    public final void s() {
        yh3 yh3VarU = u();
        if (yh3VarU != null && x()) {
            yh3VarU.dispose();
            m80.a.putObjectVolatile(this, g, lh8.a);
        }
    }

    @Override // defpackage.w51
    public final void t(Object obj) throws DispatchException {
        o(this.c);
    }

    public final yh3 u() {
        va6 va6Var = (va6) this.e.o0(cd7.g);
        if (va6Var == null) {
            return null;
        }
        yh3 yh3VarU = bo.U(va6Var, true, new fl1(this));
        while (true) {
            Unsafe unsafe = m80.a;
            long j = g;
            x51 x51Var = this;
            if (unsafe.compareAndSwapObject(x51Var, j, (Object) null, yh3VarU) || unsafe.getObjectVolatile(x51Var, j) != null) {
                break;
            }
            this = x51Var;
        }
        return yh3VarU;
    }

    public final void v(x45 x45Var) {
        w(new p51(1, x45Var));
    }

    /* JADX WARN: Code restructure failed: missing block: B:60:0x00c6, code lost:
    
        z(r9, r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:61:0x00c9, code lost:
    
        throw null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void w(defpackage.ai8 r11) {
        /*
            Method dump skipped, instruction units count: 202
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x51.w(ai8):void");
    }

    public final boolean x() {
        return !(r() instanceof ai8);
    }

    public final boolean y() {
        if (this.c == 2) {
            return m80.a.getObjectVolatile((rg3) this.d, rg3.h) != null;
        }
        return false;
    }

    public final void C(Object obj, int i, c55 c55Var) throws DispatchException {
        x51 x51Var;
        while (true) {
            Unsafe unsafe = m80.a;
            long j = h;
            Object objectVolatile = unsafe.getObjectVolatile(this, j);
            if (!(objectVolatile instanceof ai8)) {
                x51 x51Var2 = this;
                if (objectVolatile instanceof c61) {
                    c61 c61Var = (c61) objectVolatile;
                    if (unsafe.compareAndSwapInt(c61Var, c61.c, 0, 1)) {
                        if (c55Var != null) {
                            x51Var2.k(c55Var, c61Var.a, obj);
                            return;
                        }
                        return;
                    }
                }
                ik4.m(PdtluglzAX.AJwaOesBKoIb, obj);
                return;
            }
            Object objE = E((ai8) objectVolatile, obj, i, c55Var);
            while (true) {
                Unsafe unsafe2 = m80.a;
                x51Var = this;
                if (unsafe2.compareAndSwapObject(x51Var, h, objectVolatile, objE)) {
                    if (!x51Var.y()) {
                        x51Var.n();
                    }
                    x51Var.o(i);
                    return;
                } else if (unsafe2.getObjectVolatile(x51Var, j) != objectVolatile) {
                    break;
                } else {
                    this = x51Var;
                }
            }
            this = x51Var;
        }
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(A());
        sb.append('(');
        sb.append(vv2.Z(this.d));
        sb.append("){");
        Object objR = r();
        sb.append(objR instanceof ai8 ? uuLAxLN.cjQXBD : objR instanceof c61 ? "Cancelled" : "Completed");
        sb.append("}@");
        sb.append(vv2.I(this));
        return sb.toString();
    }
}
