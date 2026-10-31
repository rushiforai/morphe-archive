package m1;

import e0.f1;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.q1;
import t70.r1;

/* loaded from: classes2.dex */
public final class x extends SuspendLambda implements Function2 {
    public final /* synthetic */ SuspendLambda A;

    /* renamed from: t, reason: collision with root package name */
    public c80.a f75787t;

    /* renamed from: u, reason: collision with root package name */
    public Object f75788u;

    /* renamed from: v, reason: collision with root package name */
    public y f75789v;

    /* renamed from: w, reason: collision with root package name */
    public int f75790w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f75791x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ f1 f75792y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ y f75793z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public x(f1 f1Var, y yVar, Function1 function1, Continuation continuation) {
        super(2, continuation);
        this.f75792y = f1Var;
        this.f75793z = yVar;
        this.A = (SuspendLambda) function1;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        x xVar = new x(this.f75792y, this.f75793z, this.A, continuation);
        xVar.f75791x = obj;
        return xVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((x) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r5v6, types: [c80.a] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        y yVar;
        ?? r32;
        w wVar;
        c80.d dVar;
        c80.a aVar;
        y yVar2;
        Throwable th2;
        w wVar2;
        AtomicReference atomicReference;
        AtomicReference atomicReference2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f75790w;
        try {
            try {
                if (r12 == 0) {
                    ResultKt.b(obj);
                    CoroutineContext.Element element = ((t70.j0) this.f75791x).getCoroutineContext().get(q1.f88853a);
                    Intrinsics.d(element);
                    w wVar3 = new w(this.f75792y, (r1) element);
                    yVar = this.f75793z;
                    AtomicReference atomicReference3 = yVar.f75794a;
                    while (true) {
                        w wVar4 = (w) atomicReference3.get();
                        if (wVar4 != null && wVar3.f75785a.compareTo(wVar4.f75785a) < 0) {
                            throw new CancellationException("Current mutation had a higher priority");
                        }
                        while (!atomicReference3.compareAndSet(wVar4, wVar3)) {
                            if (atomicReference3.get() != wVar4) {
                                break;
                            }
                        }
                        if (wVar4 != null) {
                            wVar4.f75786b.c(null);
                        }
                        c80.d dVar2 = yVar.f75795b;
                        this.f75791x = wVar3;
                        this.f75787t = dVar2;
                        SuspendLambda suspendLambda = this.A;
                        this.f75788u = suspendLambda;
                        this.f75789v = yVar;
                        this.f75790w = 1;
                        if (dVar2.e(this) != coroutineSingletons) {
                            r32 = suspendLambda;
                            wVar = wVar3;
                            dVar = dVar2;
                        }
                    }
                    return coroutineSingletons;
                }
                if (r12 != 1) {
                    if (r12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    yVar2 = (y) this.f75788u;
                    aVar = this.f75787t;
                    wVar2 = (w) this.f75791x;
                    try {
                        ResultKt.b(obj);
                        atomicReference2 = yVar2.f75794a;
                        while (!atomicReference2.compareAndSet(wVar2, null) && atomicReference2.get() == wVar2) {
                        }
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        atomicReference = yVar2.f75794a;
                        while (!atomicReference.compareAndSet(wVar2, null)) {
                        }
                        throw th2;
                    }
                }
                y yVar3 = this.f75789v;
                Function1 function1 = (Function1) this.f75788u;
                ?? r52 = this.f75787t;
                wVar = (w) this.f75791x;
                ResultKt.b(obj);
                yVar = yVar3;
                r32 = function1;
                dVar = r52;
                this.f75791x = wVar;
                this.f75787t = aVar;
                this.f75788u = yVar;
                this.f75789v = null;
                this.f75790w = 2;
                Object objInvoke = r32.invoke(this);
                if (objInvoke != coroutineSingletons) {
                    yVar2 = yVar;
                    obj = objInvoke;
                    wVar2 = wVar;
                    atomicReference2 = yVar2.f75794a;
                    while (!atomicReference2.compareAndSet(wVar2, null)) {
                    }
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                yVar2 = yVar;
                th2 = th4;
                wVar2 = wVar;
                atomicReference = yVar2.f75794a;
                while (!atomicReference.compareAndSet(wVar2, null) && atomicReference.get() == wVar2) {
                }
                throw th2;
            }
            aVar = dVar;
        } catch (Throwable th5) {
            ((c80.d) r12).g(null);
            throw th5;
        }
    }
}
