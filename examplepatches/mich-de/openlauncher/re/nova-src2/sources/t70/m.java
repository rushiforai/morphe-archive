package t70;

import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.Result;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.CoroutineStackFrame;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CompletionHandlerException;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public class m extends v0 implements l, CoroutineStackFrame, t2 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88820f = AtomicIntegerFieldUpdater.newUpdater(m.class, "_decisionAndIndex$volatile");

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88821g = AtomicReferenceFieldUpdater.newUpdater(m.class, Object.class, "_state$volatile");

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88822h = AtomicReferenceFieldUpdater.newUpdater(m.class, Object.class, "_parentHandle$volatile");
    private volatile /* synthetic */ int _decisionAndIndex$volatile;
    private volatile /* synthetic */ Object _parentHandle$volatile;
    private volatile /* synthetic */ Object _state$volatile;

    /* renamed from: d, reason: collision with root package name */
    public final Continuation f88823d;

    /* renamed from: e, reason: collision with root package name */
    public final CoroutineContext f88824e;

    public m(int i5, Continuation continuation) {
        super(i5);
        this.f88823d = continuation;
        this.f88824e = continuation.getContext();
        this._decisionAndIndex$volatile = 536870911;
        this._state$volatile = b.f88771a;
    }

    public static Object F(e2 e2Var, Object obj, int i5, Function3 function3) {
        if (obj instanceof v) {
            return obj;
        }
        if (i5 != 1 && i5 != 2) {
            return obj;
        }
        if (function3 != null || (e2Var instanceof k)) {
            return new u(obj, e2Var instanceof k ? (k) e2Var : null, function3, (Throwable) null, 16);
        }
        return obj;
    }

    public static void z(Object obj, Object obj2) {
        throw new IllegalStateException(("It's prohibited to register multiple handlers, tried to register " + obj + ", already has " + obj2).toString());
    }

    public String A() {
        return "CancellableContinuation";
    }

    public final void B() {
        Continuation continuation = this.f88823d;
        Throwable th2 = null;
        y70.f fVar = continuation instanceof y70.f ? (y70.f) continuation : null;
        if (fVar != null) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.f.f96792h;
            loop0: while (true) {
                Object obj = atomicReferenceFieldUpdater.get(fVar);
                w50.g gVar = y70.g.f96798b;
                if (obj == gVar) {
                    while (!atomicReferenceFieldUpdater.compareAndSet(fVar, gVar, this)) {
                        if (atomicReferenceFieldUpdater.get(fVar) != gVar) {
                            break;
                        }
                    }
                    break loop0;
                } else {
                    if (!(obj instanceof Throwable)) {
                        throw new IllegalStateException(("Inconsistent state " + obj).toString());
                    }
                    while (!atomicReferenceFieldUpdater.compareAndSet(fVar, obj, null)) {
                        if (atomicReferenceFieldUpdater.get(fVar) != obj) {
                            throw new IllegalArgumentException("Failed requirement.");
                        }
                    }
                    th2 = (Throwable) obj;
                }
            }
            if (th2 == null) {
                return;
            }
            p();
            a(th2);
        }
    }

    public final void C(Object obj, int i5, Function3 function3) throws DispatchException {
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88821g;
            Object obj2 = atomicReferenceFieldUpdater.get(this);
            if (obj2 instanceof e2) {
                Object objF = F((e2) obj2, obj, i5, function3);
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj2, objF)) {
                    if (atomicReferenceFieldUpdater.get(this) != obj2) {
                        break;
                    }
                }
                if (!y()) {
                    p();
                }
                q(i5);
                return;
            }
            if (obj2 instanceof n) {
                n nVar = (n) obj2;
                if (n.f88839c.compareAndSet(nVar, 0, 1)) {
                    if (function3 != null) {
                        m(function3, nVar.f88869a, obj);
                        return;
                    }
                    return;
                }
            }
            throw new IllegalStateException(("Already resumed, but proposed with update " + obj).toString());
        }
    }

    public final void E(c0 c0Var, Object obj) {
        Continuation continuation = this.f88823d;
        y70.f fVar = continuation instanceof y70.f ? (y70.f) continuation : null;
        C(obj, (fVar != null ? fVar.f96793d : null) == c0Var ? 4 : this.f88870c, null);
    }

    public final w50.g G(Object obj, Function3 function3) {
        w50.g gVar = m0.f88825a;
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88821g;
            Object obj2 = atomicReferenceFieldUpdater.get(this);
            if (!(obj2 instanceof e2)) {
                return null;
            }
            Object objF = F((e2) obj2, obj, this.f88870c, function3);
            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj2, objF)) {
                if (atomicReferenceFieldUpdater.get(this) != obj2) {
                    break;
                }
            }
            if (!y()) {
                p();
            }
            return gVar;
        }
    }

    @Override // t70.l
    public final boolean a(Throwable th2) {
        Throwable cancellationException;
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88821g;
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (!(obj instanceof e2)) {
                return false;
            }
            boolean z11 = (obj instanceof k) || (obj instanceof y70.t);
            if (th2 == null) {
                cancellationException = new CancellationException("Continuation " + this + " was cancelled normally");
            } else {
                cancellationException = th2;
            }
            n nVar = new n(z11, cancellationException);
            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, nVar)) {
                if (atomicReferenceFieldUpdater.get(this) != obj) {
                    break;
                }
            }
            e2 e2Var = (e2) obj;
            if (e2Var instanceof k) {
                l((k) obj, th2);
            } else if (e2Var instanceof y70.t) {
                n((y70.t) obj, th2);
            }
            if (!y()) {
                p();
            }
            q(this.f88870c);
            return true;
        }
    }

    @Override // t70.l
    public final boolean b() {
        return f88821g.get(this) instanceof e2;
    }

    @Override // t70.t2
    public final void c(y70.t tVar, int i5) {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int i11;
        do {
            atomicIntegerFieldUpdater = f88820f;
            i11 = atomicIntegerFieldUpdater.get(this);
            if ((i11 & 536870911) != 536870911) {
                throw new IllegalStateException("invokeOnCancellation should be called at most once");
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, i11, ((i11 >> 29) << 29) + i5));
        w(tVar);
    }

    @Override // t70.v0
    public final void d(CancellationException cancellationException) {
        CancellationException cancellationException2;
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88821g;
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (obj instanceof e2) {
                throw new IllegalStateException("Not completed");
            }
            if (obj instanceof v) {
                return;
            }
            if (obj instanceof u) {
                u uVar = (u) obj;
                if (uVar.f88865e != null) {
                    throw new IllegalStateException("Must be called at most once");
                }
                if (qm.e.m(atomicReferenceFieldUpdater, this, uVar, u.a(uVar, null, cancellationException, 15))) {
                    k kVar = uVar.f88862b;
                    if (kVar != null) {
                        l(kVar, cancellationException);
                    }
                    Function3 function3 = uVar.f88863c;
                    if (function3 != null) {
                        m(function3, cancellationException, uVar.f88861a);
                        return;
                    }
                    return;
                }
                cancellationException2 = cancellationException;
            } else {
                cancellationException2 = cancellationException;
                if (qm.e.l(atomicReferenceFieldUpdater, this, obj, new u(obj, (k) null, (Function3) null, cancellationException2, 14))) {
                    return;
                }
            }
            cancellationException = cancellationException2;
        }
    }

    @Override // t70.v0
    public final Continuation e() {
        return this.f88823d;
    }

    @Override // t70.v0
    public final Throwable f(Object obj) {
        Throwable thF = super.f(obj);
        if (thF != null) {
            return thF;
        }
        return null;
    }

    @Override // t70.l
    public final w50.g g(Object obj, Function3 function3) {
        return G(obj, function3);
    }

    @Override // kotlin.coroutines.jvm.internal.CoroutineStackFrame
    public final CoroutineStackFrame getCallerFrame() {
        Continuation continuation = this.f88823d;
        if (continuation instanceof CoroutineStackFrame) {
            return (CoroutineStackFrame) continuation;
        }
        return null;
    }

    @Override // kotlin.coroutines.Continuation
    public final CoroutineContext getContext() {
        return this.f88824e;
    }

    @Override // t70.v0
    public final Object h(Object obj) {
        return obj instanceof u ? ((u) obj).f88861a : obj;
    }

    @Override // t70.l
    public final void i(Object obj, Function1 function1) {
        C(obj, this.f88870c, function1 != null ? new c80.b(function1, 3) : null);
    }

    @Override // t70.l
    public final boolean isCancelled() {
        return f88821g.get(this) instanceof n;
    }

    @Override // t70.v0
    public final Object k() {
        return f88821g.get(this);
    }

    public final void l(k kVar, Throwable th2) {
        try {
            kVar.a(th2);
        } catch (Throwable th3) {
            g0.a(this.f88824e, new CompletionHandlerException("Exception in invokeOnCancellation handler for " + this, th3));
        }
    }

    public final void m(Function3 function3, Throwable th2, Object obj) {
        CoroutineContext coroutineContext = this.f88824e;
        try {
            function3.invoke(th2, obj, coroutineContext);
        } catch (Throwable th3) {
            g0.a(coroutineContext, new CompletionHandlerException("Exception in resume onCancellation handler for " + this, th3));
        }
    }

    public final void n(y70.t tVar, Throwable th2) {
        CoroutineContext coroutineContext = this.f88824e;
        int i5 = f88820f.get(this) & 536870911;
        if (i5 == 536870911) {
            throw new IllegalStateException("The index for Segment.onCancellation(..) is broken");
        }
        try {
            tVar.h(i5, coroutineContext);
        } catch (Throwable th3) {
            g0.a(coroutineContext, new CompletionHandlerException("Exception in invokeOnCancellation handler for " + this, th3));
        }
    }

    @Override // t70.l
    public final void o(Object obj, Function3 function3) throws DispatchException {
        C(obj, this.f88870c, function3);
    }

    public final void p() {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88822h;
        a1 a1Var = (a1) atomicReferenceFieldUpdater.get(this);
        if (a1Var == null) {
            return;
        }
        a1Var.dispose();
        atomicReferenceFieldUpdater.set(this, d2.f88784a);
    }

    public final void q(int i5) throws DispatchException {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int i11;
        do {
            atomicIntegerFieldUpdater = f88820f;
            i11 = atomicIntegerFieldUpdater.get(this);
            int i12 = i11 >> 29;
            if (i12 != 0) {
                if (i12 != 1) {
                    throw new IllegalStateException("Already resumed");
                }
                boolean z11 = i5 == 4;
                Continuation continuation = this.f88823d;
                if (!z11 && (continuation instanceof y70.f)) {
                    boolean z12 = i5 == 1 || i5 == 2;
                    int i13 = this.f88870c;
                    if (z12 == (i13 == 1 || i13 == 2)) {
                        y70.f fVar = (y70.f) continuation;
                        c0 c0Var = fVar.f96793d;
                        CoroutineContext context = fVar.f96794e.getContext();
                        if (y70.g.f(c0Var, context)) {
                            y70.g.e(c0Var, context, this);
                            return;
                        }
                        i1 i1VarA = k2.a();
                        if (i1VarA.f88806c >= 4294967296L) {
                            i1VarA.h0(this);
                            return;
                        }
                        i1VarA.j0(true);
                        try {
                            w0.a(this, continuation, true);
                            do {
                            } while (i1VarA.l0());
                        } finally {
                            try {
                                return;
                            } finally {
                            }
                        }
                        return;
                    }
                }
                w0.a(this, continuation, z11);
                return;
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, i11, 1073741824 + (536870911 & i11)));
    }

    public Throwable r(x1 x1Var) {
        return x1Var.h();
    }

    @Override // kotlin.coroutines.Continuation
    public final void resumeWith(Object obj) {
        Throwable thA = Result.a(obj);
        if (thA != null) {
            obj = new v(false, thA);
        }
        C(obj, this.f88870c, null);
    }

    public final Object s() {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        int i5;
        r1 r1Var;
        boolean zY = y();
        do {
            atomicIntegerFieldUpdater = f88820f;
            i5 = atomicIntegerFieldUpdater.get(this);
            int i11 = i5 >> 29;
            if (i11 != 0) {
                if (i11 != 2) {
                    throw new IllegalStateException("Already suspended");
                }
                if (zY) {
                    B();
                }
                Object obj = f88821g.get(this);
                if (obj instanceof v) {
                    throw ((v) obj).f88869a;
                }
                int i12 = this.f88870c;
                if ((i12 != 1 && i12 != 2) || (r1Var = (r1) this.f88824e.get(q1.f88853a)) == null || r1Var.b()) {
                    return h(obj);
                }
                CancellationException cancellationExceptionH = r1Var.h();
                d(cancellationExceptionH);
                throw cancellationExceptionH;
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, i5, SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING + (536870911 & i5)));
        if (((a1) f88822h.get(this)) == null) {
            u();
        }
        if (zY) {
            B();
        }
        return CoroutineSingletons.f71806a;
    }

    public final void t() {
        a1 a1VarU = u();
        if (a1VarU == null || (f88821g.get(this) instanceof e2)) {
            return;
        }
        a1VarU.dispose();
        f88822h.set(this, d2.f88784a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(A());
        sb2.append('(');
        sb2.append(m0.w(this.f88823d));
        sb2.append("){");
        Object obj = f88821g.get(this);
        sb2.append(obj instanceof e2 ? "Active" : obj instanceof n ? "Cancelled" : "Completed");
        sb2.append("}@");
        sb2.append(m0.m(this));
        return sb2.toString();
    }

    public final a1 u() {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        r1 r1Var = (r1) this.f88824e.get(q1.f88853a);
        if (r1Var == null) {
            return null;
        }
        a1 a1VarP = m0.p(r1Var, new o(0, this));
        do {
            atomicReferenceFieldUpdater = f88822h;
            if (atomicReferenceFieldUpdater.compareAndSet(this, null, a1VarP)) {
                break;
            }
        } while (atomicReferenceFieldUpdater.get(this) == null);
        return a1VarP;
    }

    public final void v(Function1 function1) {
        w(new j(function1, 0));
    }

    /* JADX WARN: Code restructure failed: missing block: B:58:0x00ae, code lost:
    
        z(r8, r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00b1, code lost:
    
        throw null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void w(e2 e2Var) {
        while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88821g;
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (obj instanceof b) {
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, e2Var)) {
                    if (atomicReferenceFieldUpdater.get(this) != obj) {
                        break;
                    }
                }
                return;
            }
            if ((obj instanceof k) || (obj instanceof y70.t)) {
                break;
            }
            if (obj instanceof v) {
                v vVar = (v) obj;
                if (!v.f88868b.compareAndSet(vVar, 0, 1)) {
                    z(e2Var, obj);
                    throw null;
                }
                if (obj instanceof n) {
                    Throwable th2 = vVar.f88869a;
                    if (e2Var instanceof k) {
                        l((k) e2Var, th2);
                        return;
                    } else {
                        Intrinsics.e(e2Var, "null cannot be cast to non-null type kotlinx.coroutines.internal.Segment<*>");
                        n((y70.t) e2Var, th2);
                        return;
                    }
                }
                return;
            }
            if (!(obj instanceof u)) {
                if (e2Var instanceof y70.t) {
                    return;
                }
                Intrinsics.e(e2Var, "null cannot be cast to non-null type kotlinx.coroutines.CancelHandler");
                u uVar = new u(obj, (k) e2Var, (Function3) null, (Throwable) null, 28);
                while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, uVar)) {
                    if (atomicReferenceFieldUpdater.get(this) != obj) {
                        break;
                    }
                }
                return;
            }
            u uVar2 = (u) obj;
            if (uVar2.f88862b != null) {
                z(e2Var, obj);
                throw null;
            }
            if (e2Var instanceof y70.t) {
                return;
            }
            Intrinsics.e(e2Var, "null cannot be cast to non-null type kotlinx.coroutines.CancelHandler");
            k kVar = (k) e2Var;
            Throwable th3 = uVar2.f88865e;
            if (th3 != null) {
                l(kVar, th3);
                return;
            }
            u uVarA = u.a(uVar2, kVar, null, 29);
            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, uVarA)) {
                if (atomicReferenceFieldUpdater.get(this) != obj) {
                    break;
                }
            }
            return;
        }
    }

    @Override // t70.l
    public final void x(Object obj) throws DispatchException {
        q(this.f88870c);
    }

    public final boolean y() {
        if (this.f88870c != 2) {
            return false;
        }
        Continuation continuation = this.f88823d;
        Intrinsics.e(continuation, "null cannot be cast to non-null type kotlinx.coroutines.internal.DispatchedContinuation<*>");
        return y70.f.f96792h.get((y70.f) continuation) != null;
    }
}
