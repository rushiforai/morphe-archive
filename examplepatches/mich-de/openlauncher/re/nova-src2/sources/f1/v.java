package f1;

import ads_mobile_sdk.lo2;
import b.fb;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;

/* loaded from: classes2.dex */
public final class v extends SuspendLambda implements Function3 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f54034t = 0;

    /* renamed from: u, reason: collision with root package name */
    public int f54035u;

    /* renamed from: v, reason: collision with root package name */
    public /* synthetic */ Object f54036v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Object f54037w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public v(x xVar, Function2 function2, Continuation continuation) {
        super(3, continuation);
        this.f54036v = xVar;
        this.f54037w = (SuspendLambda) function2;
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r0v6, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        switch (this.f54034t) {
            case 0:
                return new v((x) this.f54036v, (Function2) this.f54037w, (Continuation) obj3).invokeSuspend(Unit.f71706a);
            case 1:
                return new v((CoroutineContext) this.f54036v, (fb) this.f54037w, (Continuation) obj3).invokeSuspend(Unit.f71706a);
            case 2:
                return new v((x) this.f54036v, (SuspendLambda) this.f54037w, (Continuation) obj3, (byte) 0).invokeSuspend(Unit.f71706a);
            default:
                v vVar = new v((Function2) this.f54037w, (Continuation) obj3);
                vVar.f54036v = (ou.a) obj2;
                return vVar.invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Type inference failed for: r1v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    /* JADX WARN: Type inference failed for: r1v7, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function2] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f54034t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f54035u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    w wVar = ((x) this.f54036v).f54081b;
                    ?? r12 = (SuspendLambda) this.f54037w;
                    this.f54035u = 1;
                    if (r12.invoke(wVar, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f54035u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    CoroutineContext coroutineContext = (CoroutineContext) this.f54036v;
                    lo2 lo2Var = new lo2((fb) this.f54037w, null, 1);
                    this.f54035u = 1;
                    if (t70.m0.y(coroutineContext, lo2Var, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f54035u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    w wVar2 = ((x) this.f54036v).f54081b;
                    ?? r13 = (SuspendLambda) this.f54037w;
                    this.f54035u = 1;
                    if (r13.invoke(wVar2, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f54035u;
                if (i13 != 0) {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                ou.a aVar = (ou.a) this.f54036v;
                Function2 function2 = (Function2) this.f54037w;
                this.f54035u = 1;
                Object objInvoke = function2.invoke(aVar, this);
                return objInvoke == coroutineSingletons4 ? coroutineSingletons4 : objInvoke;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public v(x xVar, Function2 function2, Continuation continuation, byte b11) {
        super(3, continuation);
        this.f54036v = xVar;
        this.f54037w = (SuspendLambda) function2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(Function2 function2, Continuation continuation) {
        super(3, continuation);
        this.f54037w = function2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v(CoroutineContext coroutineContext, fb fbVar, Continuation continuation) {
        super(3, continuation);
        this.f54036v = coroutineContext;
        this.f54037w = fbVar;
    }
}
