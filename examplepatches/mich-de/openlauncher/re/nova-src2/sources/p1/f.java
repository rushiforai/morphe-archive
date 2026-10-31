package p1;

import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class f implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final a7.f f81402a;

    /* renamed from: c, reason: collision with root package name */
    public Throwable f81404c;

    /* renamed from: b, reason: collision with root package name */
    public final Object f81403b = new Object();

    /* renamed from: d, reason: collision with root package name */
    public final x1.a f81405d = p7.u.I();

    /* renamed from: e, reason: collision with root package name */
    public z.j0 f81406e = new z.j0();

    /* renamed from: f, reason: collision with root package name */
    public z.j0 f81407f = new z.j0();

    public f(a7.f fVar) {
        this.f81402a = fVar;
    }

    public final void a(long j11) {
        int i5;
        t70.m mVar;
        Object objA;
        synchronized (this.f81403b) {
            try {
                z.j0 j0Var = this.f81406e;
                this.f81406e = this.f81407f;
                this.f81407f = j0Var;
                x1.a aVar = this.f81405d;
                do {
                    i5 = aVar.get();
                } while (!aVar.compareAndSet(i5, p7.u.C(((i5 >>> 27) & 15) + 1)));
                int i11 = j0Var.f97841b;
                for (int i12 = 0; i12 < i11; i12++) {
                    d dVar = (d) j0Var.b(i12);
                    Function1 function1 = dVar.f81394a;
                    if (function1 != null && (mVar = dVar.f81395b) != null) {
                        try {
                            int i13 = Result.f71687b;
                            objA = function1.invoke(Long.valueOf(j11));
                        } catch (Throwable th2) {
                            int i14 = Result.f71687b;
                            objA = ResultKt.a(th2);
                        }
                        mVar.resumeWith(objA);
                    }
                }
                j0Var.i();
                Unit unit = Unit.f71706a;
            } catch (Throwable th3) {
                throw th3;
            }
        }
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final Object fold(Object obj, Function2 function2) {
        return function2.invoke(obj, this);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext.Element get(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.b(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext minusKey(CoroutineContext.Key key) {
        return CoroutineContext.Element.DefaultImpls.c(this, key);
    }

    @Override // kotlin.coroutines.CoroutineContext
    public final CoroutineContext plus(CoroutineContext coroutineContext) {
        return CoroutineContext.Element.DefaultImpls.d(this, coroutineContext);
    }

    @Override // p1.a1
    public final Object s(Function1 function1, Continuation continuation) {
        int i5;
        int i11;
        int i12;
        t70.m mVar = new t70.m(1, IntrinsicsKt.b(continuation));
        mVar.t();
        d dVar = new d();
        dVar.f81394a = function1;
        dVar.f81395b = mVar;
        Ref.IntRef intRef = new Ref.IntRef();
        intRef.f71861a = -1;
        synchronized (this.f81403b) {
            Throwable th2 = this.f81404c;
            if (th2 != null) {
                int i13 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(th2));
            } else {
                x1.a aVar = this.f81405d;
                do {
                    i5 = aVar.get();
                    i11 = i5 + 1;
                } while (!aVar.compareAndSet(i5, i11));
                boolean z11 = (134217727 & i11) == 1;
                intRef.f71861a = (i11 >>> 27) & 15;
                this.f81406e.g(dVar);
                mVar.v(new e(dVar, this, intRef));
                if (z11) {
                    try {
                        this.f81402a.invoke();
                    } catch (Throwable th3) {
                        synchronized (this.f81403b) {
                            try {
                                if (this.f81404c == null) {
                                    this.f81404c = th3;
                                    z.j0 j0Var = this.f81406e;
                                    Object[] objArr = j0Var.f97840a;
                                    int i14 = j0Var.f97841b;
                                    for (int i15 = 0; i15 < i14; i15++) {
                                        t70.m mVar2 = ((d) objArr[i15]).f81395b;
                                        if (mVar2 != null) {
                                            int i16 = Result.f71687b;
                                            mVar2.resumeWith(ResultKt.a(th3));
                                        }
                                    }
                                    this.f81406e.i();
                                    x1.a aVar2 = this.f81405d;
                                    do {
                                        i12 = aVar2.get();
                                    } while (!aVar2.compareAndSet(i12, p7.u.C(((i12 >>> 27) & 15) + 1)));
                                    Unit unit = Unit.f71706a;
                                }
                            } catch (Throwable th4) {
                                throw th4;
                            }
                        }
                    }
                }
            }
        }
        Object objS = mVar.s();
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        return objS;
    }
}
