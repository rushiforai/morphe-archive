package t70;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import java.util.concurrent.locks.LockSupport;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.ContinuationInterceptor;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class m0 {

    /* renamed from: a, reason: collision with root package name */
    public static final w50.g f88825a;

    /* renamed from: b, reason: collision with root package name */
    public static final w50.g f88826b;

    /* renamed from: c, reason: collision with root package name */
    public static final w50.g f88827c;

    /* renamed from: d, reason: collision with root package name */
    public static final w50.g f88828d;

    /* renamed from: e, reason: collision with root package name */
    public static final w50.g f88829e;

    /* renamed from: f, reason: collision with root package name */
    public static final w50.g f88830f;

    /* renamed from: g, reason: collision with root package name */
    public static final w50.g f88831g;

    /* renamed from: h, reason: collision with root package name */
    public static final w50.g f88832h;

    /* renamed from: i, reason: collision with root package name */
    public static final c1 f88833i = new c1(false);

    /* renamed from: j, reason: collision with root package name */
    public static final c1 f88834j = new c1(true);

    static {
        int i5 = 1;
        f88825a = new w50.g("RESUME_TOKEN", i5);
        f88826b = new w50.g("REMOVED_TASK", i5);
        f88827c = new w50.g("CLOSED_EMPTY", i5);
        f88828d = new w50.g("COMPLETING_ALREADY", i5);
        f88829e = new w50.g("COMPLETING_WAITING_CHILDREN", i5);
        f88830f = new w50.g("COMPLETING_RETRY", i5);
        f88831g = new w50.g("TOO_LATE_TO_CANCEL", i5);
        f88832h = new w50.g("SEALED", i5);
    }

    public static final s a(Object obj) {
        s sVar = new s(null);
        sVar.X(obj);
        return sVar;
    }

    public static s b() {
        return new s(null);
    }

    public static s1 c() {
        return new s1(null);
    }

    public static i2 d() {
        return new i2(null);
    }

    public static q0 e(j0 j0Var, CoroutineContext coroutineContext, Function2 function2, int i5) {
        if ((i5 & 1) != 0) {
            coroutineContext = EmptyCoroutineContext.f71803a;
        }
        l0 l0Var = l0.f88813a;
        CoroutineContext coroutineContextB = z.b(j0Var, coroutineContext);
        l0 l0Var2 = l0.f88813a;
        q0 q0Var = new q0(coroutineContextB, true);
        q0Var.l0(l0Var, q0Var, function2);
        return q0Var;
    }

    public static final Object f(Collection collection, Continuation continuation) {
        if (collection.isEmpty()) {
            return EmptyList.f71733a;
        }
        p0[] p0VarArr = (p0[]) collection.toArray(new p0[0]);
        e eVar = new e(p0VarArr);
        m mVar = new m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        int length = p0VarArr.length;
        c[] cVarArr = new c[length];
        for (int i5 = 0; i5 < length; i5++) {
            p0 p0Var = p0VarArr[i5];
            p0Var.start();
            c cVar = new c(eVar, mVar);
            cVar.f88776f = p(p0Var, cVar);
            Unit unit = Unit.f71706a;
            cVarArr[i5] = cVar;
        }
        d dVar = new d(cVarArr);
        for (int i11 = 0; i11 < length; i11++) {
            c cVar2 = cVarArr[i11];
            cVar2.getClass();
            c.f88774h.set(cVar2, dVar);
        }
        if (m.f88821g.get(mVar) instanceof e2) {
            mVar.w(dVar);
        } else {
            dVar.b();
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }

    public static final void g(CoroutineContext coroutineContext, CancellationException cancellationException) {
        r1 r1Var = (r1) coroutineContext.get(q1.f88853a);
        if (r1Var != null) {
            r1Var.c(cancellationException);
        }
    }

    public static final void h(r1 r1Var, String str, Throwable th2) {
        r1Var.c(ph.a.a(str, th2));
    }

    public static final Object i(r1 r1Var, ContinuationImpl continuationImpl) {
        r1Var.c(null);
        Object objK = r1Var.K(continuationImpl);
        return objK == CoroutineSingletons.f71806a ? objK : Unit.f71706a;
    }

    public static void j(CoroutineContext coroutineContext) {
        r1 r1Var = (r1) coroutineContext.get(q1.f88853a);
        if (r1Var != null) {
            Iterator it = r1Var.f().getF71970a();
            while (it.hasNext()) {
                ((r1) it.next()).c(null);
            }
        }
    }

    public static final void k(CoroutineContext coroutineContext) {
        r1 r1Var = (r1) coroutineContext.get(q1.f88853a);
        if (r1Var != null && !r1Var.b()) {
            throw r1Var.h();
        }
    }

    public static final c0 l(Executor executor) {
        c0 c0Var;
        x0 x0Var = executor instanceof x0 ? (x0) executor : null;
        return (x0Var == null || (c0Var = x0Var.f88881a) == null) ? new k1(executor) : c0Var;
    }

    public static final String m(Object obj) {
        return Integer.toHexString(System.identityHashCode(obj));
    }

    public static final r1 n(CoroutineContext coroutineContext) {
        r1 r1Var = (r1) coroutineContext.get(q1.f88853a);
        if (r1Var != null) {
            return r1Var;
        }
        throw new IllegalStateException(("Current context doesn't contain Job in it: " + coroutineContext).toString());
    }

    public static final m o(Continuation continuation) {
        m mVar;
        m mVar2;
        if (!(continuation instanceof y70.f)) {
            return new m(1, continuation);
        }
        y70.f fVar = (y70.f) continuation;
        AtomicReferenceFieldUpdater atomicReferenceFieldUpdater = y70.f.f96792h;
        loop0: while (true) {
            Object obj = atomicReferenceFieldUpdater.get(fVar);
            mVar = null;
            w50.g gVar = y70.g.f96798b;
            if (obj == null) {
                atomicReferenceFieldUpdater.set(fVar, gVar);
                mVar2 = null;
                break;
            }
            if (obj instanceof m) {
                while (!atomicReferenceFieldUpdater.compareAndSet(fVar, obj, gVar)) {
                    if (atomicReferenceFieldUpdater.get(fVar) != obj) {
                        break;
                    }
                }
                mVar2 = (m) obj;
                break loop0;
            }
            if (obj != gVar && !(obj instanceof Throwable)) {
                throw new IllegalStateException(("Inconsistent state " + obj).toString());
            }
        }
        if (mVar2 != null) {
            AtomicReferenceFieldUpdater atomicReferenceFieldUpdater2 = m.f88821g;
            Object obj2 = atomicReferenceFieldUpdater2.get(mVar2);
            if (!(obj2 instanceof u) || ((u) obj2).f88864d == null) {
                m.f88820f.set(mVar2, 536870911);
                atomicReferenceFieldUpdater2.set(mVar2, b.f88771a);
                mVar = mVar2;
            } else {
                mVar2.p();
            }
            if (mVar != null) {
                return mVar;
            }
        }
        return new m(2, continuation);
    }

    public static a1 p(r1 r1Var, t1 t1Var) {
        if (r1Var instanceof x1) {
            return ((x1) r1Var).V(true, t1Var);
        }
        return r1Var.P(new iv.c(t1Var), t1Var.j(), true);
    }

    public static final boolean q(CoroutineContext coroutineContext) {
        r1 r1Var = (r1) coroutineContext.get(q1.f88853a);
        if (r1Var != null) {
            return r1Var.b();
        }
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object r(List list, ContinuationImpl continuationImpl) {
        f fVar;
        Iterator it;
        if (continuationImpl instanceof f) {
            fVar = (f) continuationImpl;
            int i5 = fVar.f88791v;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                fVar.f88791v = i5 - Integer.MIN_VALUE;
            } else {
                fVar = new f(continuationImpl);
            }
        }
        Object obj = fVar.f88790u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = fVar.f88791v;
        if (i11 == 0) {
            ResultKt.b(obj);
            it = list.iterator();
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            it = fVar.f88789t;
            ResultKt.b(obj);
        }
        while (it.hasNext()) {
            r1 r1Var = (r1) it.next();
            fVar.f88789t = it;
            fVar.f88791v = 1;
            if (r1Var.K(fVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
        }
        return Unit.f71706a;
    }

    public static final g2 s(j0 j0Var, CoroutineContext coroutineContext, l0 l0Var, Function2 function2) {
        CoroutineContext coroutineContextB = z.b(j0Var, coroutineContext);
        l0Var.getClass();
        g2 z1Var = l0Var == l0.f88814b ? new z1(coroutineContextB, function2) : new g2(coroutineContextB, true);
        z1Var.l0(l0Var, z1Var, function2);
        return z1Var;
    }

    public static /* synthetic */ g2 t(j0 j0Var, CoroutineContext coroutineContext, l0 l0Var, Function2 function2, int i5) {
        if ((i5 & 1) != 0) {
            coroutineContext = EmptyCoroutineContext.f71803a;
        }
        if ((i5 & 2) != 0) {
            l0Var = l0.f88813a;
        }
        return s(j0Var, coroutineContext, l0Var, function2);
    }

    public static final Object u(CoroutineContext coroutineContext, Function2 function2) throws Throwable {
        i1 i1VarA;
        CoroutineContext coroutineContextA;
        long jK0;
        Thread threadCurrentThread = Thread.currentThread();
        CoroutineContext.Key key = ContinuationInterceptor.f71801cp;
        ContinuationInterceptor continuationInterceptor = (ContinuationInterceptor) coroutineContext.get(key);
        if (continuationInterceptor == null) {
            i1VarA = k2.a();
            coroutineContextA = z.a(EmptyCoroutineContext.f71803a, coroutineContext.plus(i1VarA), true);
            a80.e eVar = y0.f88884a;
            if (coroutineContextA != eVar && coroutineContextA.get(key) == null) {
                coroutineContextA = coroutineContextA.plus(eVar);
            }
        } else {
            if (continuationInterceptor instanceof i1) {
            }
            i1VarA = (i1) k2.f88812a.get();
            coroutineContextA = z.a(EmptyCoroutineContext.f71803a, coroutineContext, true);
            a80.e eVar2 = y0.f88884a;
            if (coroutineContextA != eVar2 && coroutineContextA.get(key) == null) {
                coroutineContextA = coroutineContextA.plus(eVar2);
            }
        }
        g gVar = new g(coroutineContextA, threadCurrentThread, i1VarA);
        gVar.l0(l0.f88813a, gVar, function2);
        i1 i1Var = gVar.f88795e;
        if (i1Var != null) {
            int i5 = i1.f88805f;
            i1Var.j0(false);
        }
        while (true) {
            if (i1Var != null) {
                try {
                    jK0 = i1Var.k0();
                } catch (Throwable th2) {
                    if (i1Var != null) {
                        int i11 = i1.f88805f;
                        i1Var.g0(false);
                    }
                    throw th2;
                }
            } else {
                jK0 = Long.MAX_VALUE;
            }
            if (gVar.isCompleted()) {
                break;
            }
            LockSupport.parkNanos(gVar, jK0);
            if (Thread.interrupted()) {
                gVar.z(new InterruptedException());
            }
        }
        if (i1Var != null) {
            int i12 = i1.f88805f;
            i1Var.g0(false);
        }
        Object objX = x(x1.f88882a.get(gVar));
        v vVar = objX instanceof v ? (v) objX : null;
        if (vVar == null) {
            return objX;
        }
        throw vVar.f88869a;
    }

    public static final String w(Continuation continuation) {
        Object objA;
        if (continuation instanceof y70.f) {
            return ((y70.f) continuation).toString();
        }
        try {
            int i5 = Result.f71687b;
            objA = continuation + '@' + m(continuation);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (Result.a(objA) != null) {
            objA = continuation.getClass().getName() + '@' + m(continuation);
        }
        return (String) objA;
    }

    public static final Object x(Object obj) {
        n1 n1Var;
        o1 o1Var = obj instanceof o1 ? (o1) obj : null;
        return (o1Var == null || (n1Var = o1Var.f88846a) == null) ? obj : n1Var;
    }

    public static final Object y(CoroutineContext coroutineContext, Function2 function2, Continuation continuation) throws Throwable {
        Object objX;
        CoroutineContext context = continuation.getContext();
        CoroutineContext coroutineContextPlus = !((Boolean) coroutineContext.fold(Boolean.FALSE, new m3.a0(12))).booleanValue() ? context.plus(coroutineContext) : z.a(context, coroutineContext, false);
        k(coroutineContextPlus);
        if (coroutineContextPlus == context) {
            y70.s sVar = new y70.s(continuation, coroutineContextPlus);
            objX = w20.e.r(sVar, true, sVar, function2);
        } else {
            ContinuationInterceptor.Key key = ContinuationInterceptor.f71801cp;
            if (Intrinsics.b(coroutineContextPlus.get(key), context.get(key))) {
                r2 r2Var = new r2(continuation, coroutineContextPlus);
                CoroutineContext coroutineContext2 = r2Var.f88769c;
                Object objC = y70.w.c(coroutineContext2, null);
                try {
                    Object objR = w20.e.r(r2Var, true, r2Var, function2);
                    y70.w.a(coroutineContext2, objC);
                    objX = objR;
                } catch (Throwable th2) {
                    y70.w.a(coroutineContext2, objC);
                    throw th2;
                }
            } else {
                u0 u0Var = new u0(continuation, coroutineContextPlus);
                z70.a.b(function2, u0Var, u0Var);
                AtomicIntegerFieldUpdater atomicIntegerFieldUpdater = u0.f88866e;
                while (true) {
                    int i5 = atomicIntegerFieldUpdater.get(u0Var);
                    if (i5 != 0) {
                        if (i5 != 2) {
                            throw new IllegalStateException("Already suspended");
                        }
                        objX = x(x1.f88882a.get(u0Var));
                        if (objX instanceof v) {
                            throw ((v) objX).f88869a;
                        }
                    } else if (atomicIntegerFieldUpdater.compareAndSet(u0Var, 0, 1)) {
                        objX = CoroutineSingletons.f71806a;
                        break;
                    }
                }
            }
        }
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objX;
    }

    public static final Object z(ContinuationImpl continuationImpl) {
        Object obj;
        CoroutineContext context = continuationImpl.getContext();
        k(context);
        Continuation continuationB = IntrinsicsKt.b(continuationImpl);
        y70.f fVar = continuationB instanceof y70.f ? (y70.f) continuationB : null;
        if (fVar == null) {
            obj = Unit.f71706a;
        } else {
            c0 c0Var = fVar.f96793d;
            if (y70.g.f(c0Var, context)) {
                fVar.f96795f = Unit.f71706a;
                fVar.f88870c = 1;
                c0Var.d0(context, fVar);
            } else {
                v2 v2Var = new v2();
                CoroutineContext coroutineContextPlus = context.plus(v2Var);
                Unit unit = Unit.f71706a;
                fVar.f96795f = unit;
                fVar.f88870c = 1;
                c0Var.d0(coroutineContextPlus, fVar);
                if (v2Var.f88876b) {
                    i1 i1VarA = k2.a();
                    ArrayDeque arrayDeque = i1VarA.f88808e;
                    if (arrayDeque != null ? arrayDeque.isEmpty() : true) {
                        obj = Unit.f71706a;
                    } else {
                        if (i1VarA.f88806c >= 4294967296L) {
                            fVar.f96795f = unit;
                            fVar.f88870c = 1;
                            i1VarA.h0(fVar);
                            obj = CoroutineSingletons.f71806a;
                        } else {
                            i1VarA.j0(true);
                            try {
                                fVar.run();
                                do {
                                } while (i1VarA.l0());
                            } finally {
                                try {
                                } finally {
                                }
                            }
                            obj = Unit.f71706a;
                        }
                    }
                }
            }
            obj = CoroutineSingletons.f71806a;
        }
        return obj == CoroutineSingletons.f71806a ? obj : Unit.f71706a;
    }
}
