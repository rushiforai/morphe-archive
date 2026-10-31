package f1;

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

/* loaded from: classes2.dex */
public final class i2 extends SuspendLambda implements Function2 {
    public final /* synthetic */ SuspendLambda A;

    /* renamed from: t, reason: collision with root package name */
    public c80.a f53647t;

    /* renamed from: u, reason: collision with root package name */
    public Object f53648u;

    /* renamed from: v, reason: collision with root package name */
    public j2 f53649v;

    /* renamed from: w, reason: collision with root package name */
    public int f53650w;

    /* renamed from: x, reason: collision with root package name */
    public /* synthetic */ Object f53651x;

    /* renamed from: y, reason: collision with root package name */
    public final /* synthetic */ e0.f1 f53652y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ j2 f53653z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public i2(e0.f1 f1Var, j2 j2Var, Function1 function1, Continuation continuation) {
        super(2, continuation);
        this.f53652y = f1Var;
        this.f53653z = j2Var;
        this.A = (SuspendLambda) function1;
    }

    /* JADX WARN: Type inference failed for: r2v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        i2 i2Var = new i2(this.f53652y, this.f53653z, this.A, continuation);
        i2Var.f53651x = obj;
        return i2Var;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i2) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v0, types: [int] */
    /* JADX WARN: Type inference failed for: r3v10 */
    /* JADX WARN: Type inference failed for: r3v2 */
    /* JADX WARN: Type inference failed for: r3v3, types: [kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r5v6, types: [c80.a] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        j2 j2Var;
        ?? r32;
        h2 h2Var;
        c80.d dVar;
        c80.a aVar;
        j2 j2Var2;
        Throwable th2;
        h2 h2Var2;
        AtomicReference atomicReference;
        AtomicReference atomicReference2;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ?? r12 = this.f53650w;
        try {
            try {
                if (r12 == 0) {
                    ResultKt.b(obj);
                    CoroutineContext.Element element = ((t70.j0) this.f53651x).getCoroutineContext().get(t70.q1.f88853a);
                    Intrinsics.d(element);
                    h2 h2Var3 = new h2(this.f53652y, (t70.r1) element);
                    j2Var = this.f53653z;
                    AtomicReference atomicReference3 = j2Var.f53680a;
                    while (true) {
                        h2 h2Var4 = (h2) atomicReference3.get();
                        if (h2Var4 != null && h2Var3.f53594a.compareTo(h2Var4.f53594a) < 0) {
                            throw new CancellationException("Current mutation had a higher priority");
                        }
                        while (!atomicReference3.compareAndSet(h2Var4, h2Var3)) {
                            if (atomicReference3.get() != h2Var4) {
                                break;
                            }
                        }
                        if (h2Var4 != null) {
                            h2Var4.f53595b.c(null);
                        }
                        c80.d dVar2 = j2Var.f53681b;
                        this.f53651x = h2Var3;
                        this.f53647t = dVar2;
                        SuspendLambda suspendLambda = this.A;
                        this.f53648u = suspendLambda;
                        this.f53649v = j2Var;
                        this.f53650w = 1;
                        if (dVar2.e(this) != coroutineSingletons) {
                            r32 = suspendLambda;
                            h2Var = h2Var3;
                            dVar = dVar2;
                        }
                    }
                    return coroutineSingletons;
                }
                if (r12 != 1) {
                    if (r12 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    j2Var2 = (j2) this.f53648u;
                    aVar = this.f53647t;
                    h2Var2 = (h2) this.f53651x;
                    try {
                        ResultKt.b(obj);
                        atomicReference2 = j2Var2.f53680a;
                        while (!atomicReference2.compareAndSet(h2Var2, null) && atomicReference2.get() == h2Var2) {
                        }
                        ((c80.d) aVar).g(null);
                        return obj;
                    } catch (Throwable th3) {
                        th2 = th3;
                        atomicReference = j2Var2.f53680a;
                        while (!atomicReference.compareAndSet(h2Var2, null)) {
                        }
                        throw th2;
                    }
                }
                j2 j2Var3 = this.f53649v;
                Function1 function1 = (Function1) this.f53648u;
                ?? r52 = this.f53647t;
                h2Var = (h2) this.f53651x;
                ResultKt.b(obj);
                j2Var = j2Var3;
                r32 = function1;
                dVar = r52;
                this.f53651x = h2Var;
                this.f53647t = aVar;
                this.f53648u = j2Var;
                this.f53649v = null;
                this.f53650w = 2;
                Object objInvoke = r32.invoke(this);
                if (objInvoke != coroutineSingletons) {
                    j2Var2 = j2Var;
                    obj = objInvoke;
                    h2Var2 = h2Var;
                    atomicReference2 = j2Var2.f53680a;
                    while (!atomicReference2.compareAndSet(h2Var2, null)) {
                    }
                    ((c80.d) aVar).g(null);
                    return obj;
                }
                return coroutineSingletons;
            } catch (Throwable th4) {
                j2Var2 = j2Var;
                th2 = th4;
                h2Var2 = h2Var;
                atomicReference = j2Var2.f53680a;
                while (!atomicReference.compareAndSet(h2Var2, null) && atomicReference.get() == h2Var2) {
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
