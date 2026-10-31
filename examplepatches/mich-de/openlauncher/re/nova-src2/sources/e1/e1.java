package e1;

import ads_mobile_sdk.ji3;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class e1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51290t;

    /* renamed from: u, reason: collision with root package name */
    public int f51291u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ SuspendLambda f51292v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    public e1(Function1 function1, Continuation continuation, int i5) {
        super(2, continuation);
        this.f51290t = i5;
        switch (i5) {
            case 1:
                this.f51292v = (SuspendLambda) function1;
                super(2, continuation);
                break;
            case 2:
                this.f51292v = (SuspendLambda) function1;
                super(2, continuation);
                break;
            default:
                this.f51292v = (SuspendLambda) function1;
                break;
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51290t) {
            case 0:
                return new e1(this.f51292v, continuation, 0);
            case 1:
                return new e1(this.f51292v, continuation, 1);
            default:
                return new e1(this.f51292v, continuation, 2);
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r0v2, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f51290t) {
            case 0:
                return ((e1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
            case 1:
                return new e1(this.f51292v, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            default:
                return new e1(this.f51292v, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Type inference failed for: r4v1, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r4v4, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    /* JADX WARN: Type inference failed for: r4v9, types: [kotlin.coroutines.jvm.internal.SuspendLambda, kotlin.jvm.functions.Function1] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f51290t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f51291u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f51291u = 1;
                    if (this.f51292v.invoke(this) == coroutineSingletons) {
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
                int i11 = this.f51291u;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f51291u = 1;
                Object objInvoke = this.f51292v.invoke(this);
                return objInvoke == coroutineSingletons2 ? coroutineSingletons2 : objInvoke;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f51291u;
                if (i12 != 0) {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                ji3.a(ji3.b(), null);
                this.f51291u = 1;
                Object objInvoke2 = this.f51292v.invoke(this);
                return objInvoke2 == coroutineSingletons3 ? coroutineSingletons3 : objInvoke2;
        }
    }
}
