package t70;

import java.util.ArrayList;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import kotlin.ExceptionsKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.sequences.Sequence;
import kotlin.sequences.SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;
import kotlinx.coroutines.CompletionHandlerException;
import kotlinx.coroutines.JobCancellationException;
import kotlinx.coroutines.TimeoutCancellationException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class x1 implements r1, f2 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88882a = AtomicReferenceFieldUpdater.newUpdater(x1.class, Object.class, "_state$volatile");

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicReferenceFieldUpdater f88883b = AtomicReferenceFieldUpdater.newUpdater(x1.class, Object.class, "_parentHandle$volatile");
    private volatile /* synthetic */ Object _parentHandle$volatile;
    private volatile /* synthetic */ Object _state$volatile;

    public x1(boolean z11) {
        this._state$volatile = z11 ? m0.f88834j : m0.f88833i;
    }

    public static q a0(y70.k kVar) {
        while (kVar.h()) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.k.f96808b;
            y70.k kVarE = kVar.e();
            if (kVarE == null) {
                Object obj = atomicReferenceFieldUpdater.get(kVar);
                while (true) {
                    kVar = (y70.k) obj;
                    if (!kVar.h()) {
                        break;
                    }
                    obj = atomicReferenceFieldUpdater.get(kVar);
                }
            } else {
                kVar = kVarE;
            }
        }
        while (true) {
            kVar = kVar.g();
            if (!kVar.h()) {
                if (kVar instanceof q) {
                    return (q) kVar;
                }
                if (kVar instanceof b2) {
                    return null;
                }
            }
        }
    }

    public static String g0(Object obj) {
        if (!(obj instanceof w1)) {
            return obj instanceof n1 ? ((n1) obj).b() ? "Active" : "New" : obj instanceof v ? "Cancelled" : "Completed";
        }
        w1 w1Var = (w1) obj;
        return w1Var.e() ? "Cancelling" : w1.f88877b.get(w1Var) == 1 ? "Completing" : "Active";
    }

    public void B(CancellationException cancellationException) {
        z(cancellationException);
    }

    public final boolean C(Throwable th2) {
        if (W()) {
            return true;
        }
        boolean z11 = th2 instanceof CancellationException;
        p pVar = (p) f88883b.get(this);
        return (pVar == null || pVar == d2.f88784a) ? z11 : pVar.a(th2) || z11;
    }

    public String E() {
        return "Job was cancelled";
    }

    public boolean F(Throwable th2) {
        if (th2 instanceof CancellationException) {
            return true;
        }
        return z(th2) && N();
    }

    public final void G(n1 n1Var, Object obj) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88883b;
        p pVar = (p) atomicReferenceFieldUpdater.get(this);
        if (pVar != null) {
            pVar.dispose();
            atomicReferenceFieldUpdater.set(this, d2.f88784a);
        }
        CompletionHandlerException completionHandlerException = null;
        v vVar = obj instanceof v ? (v) obj : null;
        Throwable th2 = vVar != null ? vVar.f88869a : null;
        if (n1Var instanceof t1) {
            try {
                ((t1) n1Var).k(th2);
                return;
            } catch (Throwable th3) {
                T(new CompletionHandlerException("Exception in completion handler " + n1Var + " for " + this, th3));
                return;
            }
        }
        b2 b2VarC = n1Var.c();
        if (b2VarC != null) {
            b2VarC.d(new y70.i(1), 1);
            Object obj2 = y70.k.f96807a.get(b2VarC);
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
            for (y70.k kVarG = (y70.k) obj2; !kVarG.equals(b2VarC); kVarG = kVarG.g()) {
                if (kVarG instanceof t1) {
                    try {
                        ((t1) kVarG).k(th2);
                    } catch (Throwable th4) {
                        if (completionHandlerException != null) {
                            ExceptionsKt.a(completionHandlerException, th4);
                        } else {
                            completionHandlerException = new CompletionHandlerException("Exception in completion handler " + kVarG + " for " + this, th4);
                            Unit unit = Unit.f71706a;
                        }
                    }
                }
            }
            if (completionHandlerException != null) {
                T(completionHandlerException);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v11, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r1v7, types: [java.lang.Throwable] */
    public final Throwable H(Object obj) {
        CancellationException cancellationExceptionD;
        if (obj instanceof Throwable) {
            return (Throwable) obj;
        }
        x1 x1Var = (x1) ((f2) obj);
        Object obj2 = f88882a.get(x1Var);
        if (obj2 instanceof w1) {
            cancellationExceptionD = ((w1) obj2).d();
        } else if (obj2 instanceof v) {
            cancellationExceptionD = ((v) obj2).f88869a;
        } else {
            if (obj2 instanceof n1) {
                throw new IllegalStateException(("Cannot be cancelling child in this state: " + obj2).toString());
            }
            cancellationExceptionD = null;
        }
        CancellationException cancellationException = cancellationExceptionD instanceof CancellationException ? cancellationExceptionD : null;
        return cancellationException == null ? new JobCancellationException("Parent job is ".concat(g0(obj2)), cancellationExceptionD, x1Var) : cancellationException;
    }

    public final Object I(w1 w1Var, Object obj) {
        Throwable thL;
        v vVar = obj instanceof v ? (v) obj : null;
        Throwable th2 = vVar != null ? vVar.f88869a : null;
        synchronized (w1Var) {
            w1Var.e();
            ArrayList<Throwable> arrayListF = w1Var.f(th2);
            thL = L(w1Var, arrayListF);
            if (thL != null && arrayListF.size() > 1) {
                Set setNewSetFromMap = Collections.newSetFromMap(new IdentityHashMap(arrayListF.size()));
                for (Throwable th3 : arrayListF) {
                    if (th3 != thL && th3 != thL && !(th3 instanceof CancellationException) && setNewSetFromMap.add(th3)) {
                        ExceptionsKt.a(thL, th3);
                    }
                }
            }
        }
        if (thL != null && thL != th2) {
            obj = new v(false, thL);
        }
        if (thL != null && (C(thL) || R(thL))) {
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.CompletedExceptionally");
            v.f88868b.compareAndSet((v) obj, 0, 1);
        }
        c0(obj);
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88882a;
        Object o1Var = obj instanceof n1 ? new o1((n1) obj) : obj;
        while (!atomicReferenceFieldUpdater.compareAndSet(this, w1Var, o1Var) && atomicReferenceFieldUpdater.get(this) == w1Var) {
        }
        G(w1Var, obj);
        return obj;
    }

    public final Object J() throws Throwable {
        Object obj = f88882a.get(this);
        if (obj instanceof n1) {
            throw new IllegalStateException("This job has not completed yet");
        }
        if (obj instanceof v) {
            throw ((v) obj).f88869a;
        }
        return m0.x(obj);
    }

    @Override // t70.r1
    public final Object K(Continuation continuation) {
        Object obj;
        do {
            obj = f88882a.get(this);
            if (!(obj instanceof n1)) {
                m0.k(continuation.getContext());
                return Unit.f71706a;
            }
        } while (f0(obj) < 0);
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        mVar.w(new j(m0.p(this, new o(1, mVar)), 1));
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        if (objS != coroutineSingletons) {
            objS = Unit.f71706a;
        }
        return objS == coroutineSingletons ? objS : Unit.f71706a;
    }

    public final Throwable L(w1 w1Var, ArrayList arrayList) {
        Object next;
        Object obj = null;
        if (arrayList.isEmpty()) {
            if (w1Var.e()) {
                return new JobCancellationException(E(), null, this);
            }
            return null;
        }
        Iterator it = arrayList.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            }
            next = it.next();
            if (!(((Throwable) next) instanceof CancellationException)) {
                break;
            }
        }
        Throwable th2 = (Throwable) next;
        if (th2 != null) {
            return th2;
        }
        Throwable th3 = (Throwable) arrayList.get(0);
        if (th3 instanceof TimeoutCancellationException) {
            Iterator it2 = arrayList.iterator();
            while (true) {
                if (!it2.hasNext()) {
                    break;
                }
                Object next2 = it2.next();
                Throwable th4 = (Throwable) next2;
                if (th4 != th3 && (th4 instanceof TimeoutCancellationException)) {
                    obj = next2;
                    break;
                }
            }
            Throwable th5 = (Throwable) obj;
            if (th5 != null) {
                return th5;
            }
        }
        return th3;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [t70.m1] */
    @Override // t70.r1
    public final p M(x1 x1Var) {
        q qVar = new q(x1Var);
        qVar.f88860d = this;
        loop0: while (true) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88882a;
            Object obj = atomicReferenceFieldUpdater.get(this);
            if (obj instanceof c1) {
                c1 c1Var = (c1) obj;
                boolean z11 = c1Var.f88779a;
                if (z11) {
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, qVar)) {
                        if (atomicReferenceFieldUpdater.get(this) != obj) {
                            break;
                        }
                    }
                    break loop0;
                }
                b2 b2Var = new b2();
                if (!z11) {
                    b2Var = new m1(b2Var);
                }
                qm.e.k(atomicReferenceFieldUpdater, this, c1Var, b2Var);
            } else {
                boolean z12 = obj instanceof n1;
                d2 d2Var = d2.f88784a;
                if (!z12) {
                    Object obj2 = atomicReferenceFieldUpdater.get(this);
                    v vVar = obj2 instanceof v ? (v) obj2 : null;
                    qVar.k(vVar != null ? vVar.f88869a : null);
                    return d2Var;
                }
                b2 b2VarC = ((n1) obj).c();
                if (b2VarC == null) {
                    e0((t1) obj);
                } else if (!b2VarC.d(qVar, 7)) {
                    boolean zD = b2VarC.d(qVar, 3);
                    Object obj3 = atomicReferenceFieldUpdater.get(this);
                    if (obj3 instanceof w1) {
                        thD = ((w1) obj3).d();
                    } else {
                        v vVar2 = obj3 instanceof v ? (v) obj3 : null;
                        if (vVar2 != null) {
                            thD = vVar2.f88869a;
                        }
                    }
                    qVar.k(thD);
                    if (zD) {
                        break loop0;
                    }
                    return d2Var;
                }
            }
        }
        return qVar;
    }

    public boolean N() {
        return true;
    }

    public boolean O() {
        return this instanceof s;
    }

    @Override // t70.r1
    public final a1 P(Function1 function1, boolean z11, boolean z12) {
        return V(z12, z11 ? new p1(function1) : new b1(function1, 1));
    }

    public final b2 Q(n1 n1Var) {
        b2 b2VarC = n1Var.c();
        if (b2VarC != null) {
            return b2VarC;
        }
        if (n1Var instanceof c1) {
            return new b2();
        }
        if (n1Var instanceof t1) {
            e0((t1) n1Var);
            return null;
        }
        throw new IllegalStateException(("State should have list: " + n1Var).toString());
    }

    public boolean R(Throwable th2) {
        return false;
    }

    public void T(CompletionHandlerException completionHandlerException) {
        throw completionHandlerException;
    }

    public final void U(r1 r1Var) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88883b;
        d2 d2Var = d2.f88784a;
        if (r1Var == null) {
            atomicReferenceFieldUpdater.set(this, d2Var);
            return;
        }
        r1Var.start();
        p pVarM = r1Var.M(this);
        atomicReferenceFieldUpdater.set(this, pVarM);
        if (isCompleted()) {
            pVarM.dispose();
            atomicReferenceFieldUpdater.set(this, d2Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v1, types: [t70.m1] */
    public final a1 V(boolean z11, t1 t1Var) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        d2 d2Var;
        boolean z12;
        boolean zD;
        t1Var.f88860d = this;
        loop0: while (true) {
            atomicReferenceFieldUpdater = f88882a;
            Object obj = atomicReferenceFieldUpdater.get(this);
            boolean z13 = obj instanceof c1;
            d2Var = d2.f88784a;
            z12 = true;
            if (!z13) {
                if (!(obj instanceof n1)) {
                    z12 = false;
                    break;
                }
                n1 n1Var = (n1) obj;
                b2 b2VarC = n1Var.c();
                if (b2VarC == null) {
                    e0((t1) obj);
                } else {
                    if (t1Var.j()) {
                        w1 w1Var = n1Var instanceof w1 ? (w1) n1Var : null;
                        Throwable thD = w1Var != null ? w1Var.d() : null;
                        if (thD == null) {
                            zD = b2VarC.d(t1Var, 5);
                        } else if (z11) {
                            t1Var.k(thD);
                            return d2Var;
                        }
                    } else {
                        zD = b2VarC.d(t1Var, 1);
                    }
                    if (zD) {
                        break;
                    }
                }
            } else {
                c1 c1Var = (c1) obj;
                boolean z14 = c1Var.f88779a;
                if (z14) {
                    while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, t1Var)) {
                        if (atomicReferenceFieldUpdater.get(this) != obj) {
                            break;
                        }
                    }
                    break loop0;
                }
                b2 b2Var = new b2();
                if (!z14) {
                    b2Var = new m1(b2Var);
                }
                qm.e.k(atomicReferenceFieldUpdater, this, c1Var, b2Var);
            }
        }
        if (z12) {
            return t1Var;
        }
        if (z11) {
            Object obj2 = atomicReferenceFieldUpdater.get(this);
            v vVar = obj2 instanceof v ? (v) obj2 : null;
            t1Var.k(vVar != null ? vVar.f88869a : null);
        }
        return d2Var;
    }

    public boolean W() {
        return this instanceof g;
    }

    public final boolean X(Object obj) {
        Object objH0;
        do {
            objH0 = h0(f88882a.get(this), obj);
            if (objH0 == m0.f88828d) {
                return false;
            }
            if (objH0 == m0.f88829e) {
                return true;
            }
        } while (objH0 == m0.f88830f);
        u(objH0);
        return true;
    }

    public final Object Y(Object obj) {
        Object objH0;
        do {
            objH0 = h0(f88882a.get(this), obj);
            if (objH0 == m0.f88828d) {
                String str = "Job " + this + " is already complete or completing, but is being completed with " + obj;
                v vVar = obj instanceof v ? (v) obj : null;
                throw new IllegalStateException(str, vVar != null ? vVar.f88869a : null);
            }
        } while (objH0 == m0.f88830f);
        return objH0;
    }

    public String Z() {
        return getClass().getSimpleName();
    }

    @Override // t70.r1
    public boolean b() {
        Object obj = f88882a.get(this);
        return (obj instanceof n1) && ((n1) obj).b();
    }

    public final void b0(b2 b2Var, Throwable th2) {
        b2Var.d(new y70.i(4), 4);
        Object obj = y70.k.f96807a.get(b2Var);
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlinx.coroutines.internal.LockFreeLinkedListNode");
        CompletionHandlerException completionHandlerException = null;
        for (y70.k kVarG = (y70.k) obj; !kVarG.equals(b2Var); kVarG = kVarG.g()) {
            if ((kVarG instanceof t1) && ((t1) kVarG).j()) {
                try {
                    ((t1) kVarG).k(th2);
                } catch (Throwable th3) {
                    if (completionHandlerException != null) {
                        ExceptionsKt.a(completionHandlerException, th3);
                    } else {
                        completionHandlerException = new CompletionHandlerException("Exception in completion handler " + kVarG + " for " + this, th3);
                        Unit unit = Unit.f71706a;
                    }
                }
            }
        }
        if (completionHandlerException != null) {
            T(completionHandlerException);
        }
        C(th2);
    }

    @Override // t70.r1
    public void c(CancellationException cancellationException) {
        if (cancellationException == null) {
            cancellationException = new JobCancellationException(E(), null, this);
        }
        B(cancellationException);
    }

    public void c0(Object obj) {
    }

    public void d0() {
    }

    public Object e() {
        return J();
    }

    public final void e0(t1 t1Var) {
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater;
        b2 b2Var = new b2();
        t1Var.getClass();
        y70.k.f96808b.set(b2Var, t1Var);
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = y70.k.f96807a;
        atomicReferenceFieldUpdater2.set(b2Var, t1Var);
        loop0: while (true) {
            if (atomicReferenceFieldUpdater2.get(t1Var) == t1Var) {
                while (!atomicReferenceFieldUpdater2.compareAndSet(t1Var, t1Var, b2Var)) {
                    if (atomicReferenceFieldUpdater2.get(t1Var) != t1Var) {
                        break;
                    }
                }
                b2Var.f(t1Var);
                break loop0;
            }
            break;
        }
        y70.k kVarG = t1Var.g();
        do {
            atomicReferenceFieldUpdater = f88882a;
            if (atomicReferenceFieldUpdater.compareAndSet(this, t1Var, kVarG)) {
                return;
            }
        } while (atomicReferenceFieldUpdater.get(this) == t1Var);
    }

    @Override // t70.r1
    public final Sequence f() {
        return new SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1(new b1.a(this, null, 3));
    }

    public final int f0(Object obj) {
        boolean z11 = obj instanceof c1;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88882a;
        if (z11) {
            if (((c1) obj).f88779a) {
                return 0;
            }
            c1 c1Var = m0.f88834j;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, c1Var)) {
                if (atomicReferenceFieldUpdater.get(this) != obj) {
                    return -1;
                }
            }
            d0();
            return 1;
        }
        if (!(obj instanceof m1)) {
            return 0;
        }
        b2 b2Var = ((m1) obj).f88835a;
        while (!atomicReferenceFieldUpdater.compareAndSet(this, obj, b2Var)) {
            if (atomicReferenceFieldUpdater.get(this) != obj) {
                return -1;
            }
        }
        d0();
        return 1;
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext.Element
    public final CoroutineContext.Key getKey() {
        return q1.f88853a;
    }

    @Override // t70.r1
    public final CancellationException h() {
        CancellationException cancellationException;
        Object obj = f88882a.get(this);
        if (!(obj instanceof w1)) {
            if (obj instanceof n1) {
                throw new IllegalStateException(("Job is still new or active: " + this).toString());
            }
            if (!(obj instanceof v)) {
                return new JobCancellationException(getClass().getSimpleName().concat(" has completed normally"), null, this);
            }
            Throwable th2 = ((v) obj).f88869a;
            cancellationException = th2 instanceof CancellationException ? (CancellationException) th2 : null;
            return cancellationException == null ? new JobCancellationException(E(), th2, this) : cancellationException;
        }
        Throwable thD = ((w1) obj).d();
        if (thD == null) {
            throw new IllegalStateException(("Job is still new or active: " + this).toString());
        }
        String strConcat = getClass().getSimpleName().concat(" is cancelling");
        cancellationException = thD instanceof CancellationException ? (CancellationException) thD : null;
        if (cancellationException != null) {
            return cancellationException;
        }
        if (strConcat == null) {
            strConcat = E();
        }
        return new JobCancellationException(strConcat, thD, this);
    }

    public final Object h0(Object obj, Object obj2) {
        if (!(obj instanceof n1)) {
            return m0.f88828d;
        }
        if (((obj instanceof c1) || (obj instanceof t1)) && !(obj instanceof q) && !(obj2 instanceof v)) {
            n1 n1Var = (n1) obj;
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88882a;
            Object o1Var = obj2 instanceof n1 ? new o1((n1) obj2) : obj2;
            while (!atomicReferenceFieldUpdater.compareAndSet(this, n1Var, o1Var)) {
                if (atomicReferenceFieldUpdater.get(this) != n1Var) {
                    return m0.f88830f;
                }
            }
            c0(obj2);
            G(n1Var, obj2);
            return obj2;
        }
        n1 n1Var2 = (n1) obj;
        b2 b2VarQ = Q(n1Var2);
        if (b2VarQ == null) {
            return m0.f88830f;
        }
        w1 w1Var = n1Var2 instanceof w1 ? (w1) n1Var2 : null;
        if (w1Var == null) {
            w1Var = new w1(b2VarQ, null);
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        synchronized (w1Var) {
            AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = w1.f88877b;
            if (atomicIntegerFieldUpdater.get(w1Var) == 1) {
                return m0.f88828d;
            }
            atomicIntegerFieldUpdater.set(w1Var, 1);
            if (w1Var != n1Var2) {
                AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = f88882a;
                while (!atomicReferenceFieldUpdater2.compareAndSet(this, n1Var2, w1Var)) {
                    if (atomicReferenceFieldUpdater2.get(this) != n1Var2) {
                        return m0.f88830f;
                    }
                }
            }
            boolean zE = w1Var.e();
            v vVar = obj2 instanceof v ? (v) obj2 : null;
            if (vVar != null) {
                w1Var.a(vVar.f88869a);
            }
            Throwable thD = zE ? null : w1Var.d();
            objectRef.f71863a = thD;
            Unit unit = Unit.f71706a;
            if (thD != null) {
                b0(b2VarQ, thD);
            }
            q qVarA0 = a0(b2VarQ);
            if (qVarA0 != null && i0(w1Var, qVarA0, obj2)) {
                return m0.f88829e;
            }
            b2VarQ.d(new y70.i(2), 2);
            q qVarA02 = a0(b2VarQ);
            return (qVarA02 == null || !i0(w1Var, qVarA02, obj2)) ? I(w1Var, obj2) : m0.f88829e;
        }
    }

    public final boolean i0(w1 w1Var, q qVar, Object obj) {
        while (qVar.f88852e.V(false, new v1(this, w1Var, qVar, obj)) == d2.f88784a) {
            qVar = a0(qVar);
            if (qVar == null) {
                return false;
            }
        }
        return true;
    }

    @Override // t70.r1
    public final boolean isCancelled() {
        Object obj = f88882a.get(this);
        if (obj instanceof v) {
            return true;
        }
        return (obj instanceof w1) && ((w1) obj).e();
    }

    @Override // t70.r1
    public final boolean isCompleted() {
        return !(f88882a.get(this) instanceof n1);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }

    @Override // t70.r1
    public final boolean start() {
        int iF0;
        do {
            iF0 = f0(f88882a.get(this));
            if (iF0 == 0) {
                return false;
            }
        } while (iF0 != 1);
        return true;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(Z() + AbstractJsonLexerKt.BEGIN_OBJ + g0(f88882a.get(this)) + AbstractJsonLexerKt.END_OBJ);
        sb2.append('@');
        sb2.append(m0.m(this));
        return sb2.toString();
    }

    public void u(Object obj) {
    }

    public void v(Object obj) {
        u(obj);
    }

    @Override // t70.r1
    public final a1 w(Function1 function1) {
        return V(true, new b1(function1, 1));
    }

    public final Object y(Continuation continuation) {
        Object obj;
        do {
            obj = f88882a.get(this);
            if (!(obj instanceof n1)) {
                if (obj instanceof v) {
                    throw ((v) obj).f88869a;
                }
                return m0.x(obj);
            }
        } while (f0(obj) < 0);
        u1 u1Var = new u1(IntrinsicsKt.b(continuation), this);
        u1Var.t();
        u1Var.w(new j(m0.p(this, new b1(u1Var, 2)), 1));
        Object objS = u1Var.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0064, code lost:
    
        r0 = r10;
     */
    /* JADX WARN: Removed duplicated region for block: B:18:0x003e A[PHI: r0
      0x003e: PHI (r0v1 java.lang.Object) = (r0v0 java.lang.Object), (r0v13 java.lang.Object) binds: [B:3:0x0008, B:16:0x003a] A[DONT_GENERATE, DONT_INLINE]] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean z(Object obj) {
        w50.g gVar;
        Object objH0 = m0.f88828d;
        if (O()) {
            do {
                Object obj2 = f88882a.get(this);
                if (obj2 instanceof n1) {
                    if (obj2 instanceof w1) {
                        if (w1.f88877b.get((w1) obj2) == 1) {
                        }
                    }
                    objH0 = h0(obj2, new v(false, H(obj)));
                }
                objH0 = m0.f88828d;
                break;
            } while (objH0 == m0.f88830f);
            if (objH0 != m0.f88829e) {
                if (objH0 == m0.f88828d) {
                    Throwable thH = null;
                    loop1: while (true) {
                        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = f88882a;
                        Object obj3 = atomicReferenceFieldUpdater.get(this);
                        if (!(obj3 instanceof w1)) {
                            if (!(obj3 instanceof n1)) {
                                gVar = m0.f88831g;
                                break;
                            }
                            if (thH == null) {
                                thH = H(obj);
                            }
                            n1 n1Var = (n1) obj3;
                            if (n1Var.b()) {
                                b2 b2VarQ = Q(n1Var);
                                if (b2VarQ != null) {
                                    w1 w1Var = new w1(b2VarQ, thH);
                                    while (!atomicReferenceFieldUpdater.compareAndSet(this, n1Var, w1Var)) {
                                        if (atomicReferenceFieldUpdater.get(this) != n1Var) {
                                            break;
                                        }
                                    }
                                    b0(b2VarQ, thH);
                                    gVar = m0.f88828d;
                                    break loop1;
                                }
                                continue;
                            } else {
                                Object objH02 = h0(obj3, new v(false, thH));
                                if (objH02 == m0.f88828d) {
                                    throw new IllegalStateException(("Cannot happen in " + obj3).toString());
                                }
                                if (objH02 != m0.f88830f) {
                                    objH0 = objH02;
                                    break;
                                }
                            }
                        } else {
                            synchronized (obj3) {
                                if (w1.f88879d.get((w1) obj3) == m0.f88832h) {
                                    gVar = m0.f88831g;
                                } else {
                                    boolean zE = ((w1) obj3).e();
                                    if (thH == null) {
                                        thH = H(obj);
                                    }
                                    ((w1) obj3).a(thH);
                                    Throwable thD = zE ? null : ((w1) obj3).d();
                                    if (thD != null) {
                                        b0(((w1) obj3).f88880a, thD);
                                    }
                                    gVar = m0.f88828d;
                                }
                            }
                        }
                    }
                }
                if (objH0 != m0.f88828d && objH0 != m0.f88829e) {
                    if (objH0 == m0.f88831g) {
                        return false;
                    }
                    u(objH0);
                    return true;
                }
            }
        }
        return true;
    }
}
