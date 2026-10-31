package e0;

import java.util.concurrent.atomic.AtomicReference;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class i1 extends SuspendLambda implements Function2 {
    public final /* synthetic */ j1 A;
    public final /* synthetic */ SuspendLambda B;
    public final /* synthetic */ Object C;

    /* renamed from: t, reason: collision with root package name */
    public c80.a f50021t;

    /* renamed from: u, reason: collision with root package name */
    public Object f50022u;

    /* renamed from: v, reason: collision with root package name */
    public Object f50023v;

    /* renamed from: w, reason: collision with root package name */
    public j1 f50024w;

    /* renamed from: x, reason: collision with root package name */
    public int f50025x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f50026y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ f1 f50027z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public i1(f1 f1Var, j1 j1Var, Function2 function2, Object obj, Continuation continuation) {
        super(2, continuation);
        this.f50027z = f1Var;
        this.A = j1Var;
        this.B = (SuspendLambda) function2;
        this.C = obj;
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        i1 i1Var = new i1(this.f50027z, this.A, this.B, this.C, continuation);
        i1Var.f50026y = obj;
        return i1Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r5v3 */
    /* JADX WARN: Type inference failed for: r5v4, types: [kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r5v7 */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        j1 j1Var;
        Object obj2;
        g1 g1Var;
        c80.a aVar;
        ?? r52;
        j1 j1Var2;
        Throwable th2;
        g1 g1Var2;
        AtomicReference atomicReference;
        AtomicReference atomicReference2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f50025x;
        try {
            try {
                if (r12 == 0) {
                    ResultKt.b(obj);
                    CoroutineContext.Element element = ((t70.j0) this.f50026y).getCoroutineContext().get(t70.q1.f88853a);
                    Intrinsics.d(element);
                    g1 g1Var3 = new g1(this.f50027z, (t70.r1) element);
                    j1Var = this.A;
                    j1.a(j1Var, g1Var3);
                    c80.d dVar = j1Var.f50034b;
                    this.f50026y = g1Var3;
                    this.f50021t = dVar;
                    SuspendLambda suspendLambda = this.B;
                    this.f50022u = suspendLambda;
                    Object obj3 = this.C;
                    this.f50023v = obj3;
                    this.f50024w = j1Var;
                    this.f50025x = 1;
                    if (dVar.e(this) != coroutineSingletons) {
                        obj2 = obj3;
                        g1Var = g1Var3;
                        aVar = dVar;
                        r52 = suspendLambda;
                    }
                    return coroutineSingletons;
                }
                if (r12 != 1) {
                    if (r12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j1Var2 = (j1) this.f50022u;
                    aVar = this.f50021t;
                    g1Var2 = (g1) this.f50026y;
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
                        while (!atomicReference.compareAndSet(g1Var2, null)) {
                        }
                        throw th2;
                    }
                }
                j1 j1Var3 = this.f50024w;
                obj2 = this.f50023v;
                Function2 function2 = (Function2) this.f50022u;
                c80.a aVar2 = this.f50021t;
                g1Var = (g1) this.f50026y;
                ResultKt.b(obj);
                j1Var = j1Var3;
                aVar = aVar2;
                r52 = function2;
                this.f50026y = g1Var;
                this.f50021t = aVar;
                this.f50022u = j1Var;
                this.f50023v = null;
                this.f50024w = null;
                this.f50025x = 2;
                Object objInvoke = r52.invoke(obj2, this);
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
                while (!atomicReference.compareAndSet(g1Var2, null) && atomicReference.get() == g1Var2) {
                }
                throw th2;
            }
        } catch (Throwable th5) {
            ((c80.d) r12).g(null);
            throw th5;
        }
    }
}
