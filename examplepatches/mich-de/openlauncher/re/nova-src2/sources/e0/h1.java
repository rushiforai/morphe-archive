package e0;

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

/* loaded from: classes2.dex */
public final class h1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public c80.a f50009t;

    /* renamed from: u, reason: collision with root package name */
    public Object f50010u;

    /* renamed from: v, reason: collision with root package name */
    public j1 f50011v;

    /* renamed from: w, reason: collision with root package name */
    public int f50012w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f50013x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ j1 f50014y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f50015z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public h1(j1 j1Var, Function1 function1, Continuation continuation) {
        super(2, continuation);
        f1 f1Var = f1.f49976a;
        this.f50014y = j1Var;
        this.f50015z = (SuspendLambda) function1;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        f1 f1Var = f1.f49976a;
        h1 h1Var = new h1(this.f50014y, this.f50015z, continuation);
        h1Var.f50013x = obj;
        return h1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((h1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r5v3, types: [c80.a] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        j1 j1Var;
        ?? r32;
        g1 g1Var;
        c80.d dVar;
        c80.a aVar;
        j1 j1Var2;
        Throwable th2;
        g1 g1Var2;
        AtomicReference atomicReference;
        AtomicReference atomicReference2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f50012w;
        try {
            try {
                if (r12 == 0) {
                    ResultKt.b(obj);
                    t70.j0 j0Var = (t70.j0) this.f50013x;
                    f1 f1Var = f1.f49976a;
                    CoroutineContext.Element element = j0Var.getCoroutineContext().get(t70.q1.f88853a);
                    Intrinsics.d(element);
                    g1 g1Var3 = new g1(f1Var, (t70.r1) element);
                    j1Var = this.f50014y;
                    j1.a(j1Var, g1Var3);
                    c80.d dVar2 = j1Var.f50034b;
                    this.f50013x = g1Var3;
                    this.f50009t = dVar2;
                    SuspendLambda suspendLambda = this.f50015z;
                    this.f50010u = suspendLambda;
                    this.f50011v = j1Var;
                    this.f50012w = 1;
                    if (dVar2.e(this) != coroutineSingletons) {
                        r32 = suspendLambda;
                        g1Var = g1Var3;
                        dVar = dVar2;
                    }
                    return coroutineSingletons;
                }
                if (r12 != 1) {
                    if (r12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j1Var2 = (j1) this.f50010u;
                    aVar = this.f50009t;
                    g1Var2 = (g1) this.f50013x;
                    try {
                        ResultKt.b(obj);
                        atomicReference2 = j1Var2.f50033a;
                        while (!atomicReference2.compareAndSet(g1Var2, null) && atomicReference2.get() == g1Var2) {
                        }
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        atomicReference = j1Var2.f50033a;
                        while (!atomicReference.compareAndSet(g1Var2, null) && atomicReference.get() == g1Var2) {
                        }
                        throw th2;
                    }
                }
                j1 j1Var3 = this.f50011v;
                Function1 function1 = (Function1) this.f50010u;
                ?? r52 = this.f50009t;
                g1Var = (g1) this.f50013x;
                ResultKt.b(obj);
                j1Var = j1Var3;
                r32 = function1;
                dVar = r52;
                this.f50013x = g1Var;
                this.f50009t = aVar;
                this.f50010u = j1Var;
                this.f50011v = null;
                this.f50012w = 2;
                Object objInvoke = r32.invoke(this);
                if (objInvoke != coroutineSingletons) {
                    j1Var2 = j1Var;
                    obj = objInvoke;
                    g1Var2 = g1Var;
                    atomicReference2 = j1Var2.f50033a;
                    while (!atomicReference2.compareAndSet(g1Var2, null)) {
                    }
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                j1Var2 = j1Var;
                th2 = th4;
                g1Var2 = g1Var;
                atomicReference = j1Var2.f50033a;
                while (!atomicReference.compareAndSet(g1Var2, null)) {
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
