package c0;

import androidx.compose.animation.core.MutationInterruptedException;
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

/* loaded from: classes.dex */
public final class u0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public c80.a f18974t;

    /* renamed from: u, reason: collision with root package name */
    public Object f18975u;

    /* renamed from: v, reason: collision with root package name */
    public v0 f18976v;

    /* renamed from: w, reason: collision with root package name */
    public int f18977w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f18978x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ v0 f18979y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f18980z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public u0(v0 v0Var, Function1 function1, Continuation continuation) {
        super(2, continuation);
        s0 s0Var = s0.f18946a;
        this.f18979y = v0Var;
        this.f18980z = (SuspendLambda) function1;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        s0 s0Var = s0.f18946a;
        u0 u0Var = new u0(this.f18979y, this.f18980z, continuation);
        u0Var.f18978x = obj;
        return u0Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((u0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r5v6, types: [c80.a] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        v0 v0Var;
        ?? r32;
        t0 t0Var;
        c80.d dVar;
        c80.a aVar;
        v0 v0Var2;
        Throwable th2;
        t0 t0Var2;
        AtomicReference atomicReference;
        AtomicReference atomicReference2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f18977w;
        try {
            try {
                if (r12 == 0) {
                    ResultKt.b(obj);
                    t70.j0 j0Var = (t70.j0) this.f18978x;
                    s0 s0Var = s0.f18946a;
                    CoroutineContext.Element element = j0Var.getCoroutineContext().get(t70.q1.f88853a);
                    Intrinsics.d(element);
                    t0 t0Var3 = new t0((t70.r1) element);
                    v0Var = this.f18979y;
                    AtomicReference atomicReference3 = v0Var.f18986a;
                    while (true) {
                        t0 t0Var4 = (t0) atomicReference3.get();
                        if (t0Var4 != null) {
                            s0 s0Var2 = s0.f18946a;
                            if (s0Var2.compareTo(s0Var2) < 0) {
                                throw new CancellationException("Current mutation had a higher priority");
                            }
                        }
                        while (!atomicReference3.compareAndSet(t0Var4, t0Var3)) {
                            if (atomicReference3.get() != t0Var4) {
                                break;
                            }
                        }
                        if (t0Var4 != null) {
                            t0Var4.f18948a.c(new MutationInterruptedException());
                        }
                        c80.d dVar2 = v0Var.f18987b;
                        this.f18978x = t0Var3;
                        this.f18974t = dVar2;
                        SuspendLambda suspendLambda = this.f18980z;
                        this.f18975u = suspendLambda;
                        this.f18976v = v0Var;
                        this.f18977w = 1;
                        if (dVar2.e(this) != coroutineSingletons) {
                            r32 = suspendLambda;
                            t0Var = t0Var3;
                            dVar = dVar2;
                        }
                    }
                    return coroutineSingletons;
                }
                if (r12 != 1) {
                    if (r12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    v0Var2 = (v0) this.f18975u;
                    aVar = this.f18974t;
                    t0Var2 = (t0) this.f18978x;
                    try {
                        ResultKt.b(obj);
                        atomicReference2 = v0Var2.f18986a;
                        while (!atomicReference2.compareAndSet(t0Var2, null) && atomicReference2.get() == t0Var2) {
                        }
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        atomicReference = v0Var2.f18986a;
                        while (!atomicReference.compareAndSet(t0Var2, null)) {
                        }
                        throw th2;
                    }
                }
                v0 v0Var3 = this.f18976v;
                Function1 function1 = (Function1) this.f18975u;
                ?? r52 = this.f18974t;
                t0Var = (t0) this.f18978x;
                ResultKt.b(obj);
                v0Var = v0Var3;
                r32 = function1;
                dVar = r52;
                this.f18978x = t0Var;
                this.f18974t = aVar;
                this.f18975u = v0Var;
                this.f18976v = null;
                this.f18977w = 2;
                Object objInvoke = r32.invoke(this);
                if (objInvoke != coroutineSingletons) {
                    v0Var2 = v0Var;
                    obj = objInvoke;
                    t0Var2 = t0Var;
                    atomicReference2 = v0Var2.f18986a;
                    while (!atomicReference2.compareAndSet(t0Var2, null)) {
                    }
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                v0Var2 = v0Var;
                th2 = th4;
                t0Var2 = t0Var;
                atomicReference = v0Var2.f18986a;
                while (!atomicReference.compareAndSet(t0Var2, null) && atomicReference.get() == t0Var2) {
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
