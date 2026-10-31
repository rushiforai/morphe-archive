package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class jr1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f5364a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ rr1 f5365b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f5366c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public jr1(rr1 rr1Var, boolean z11, Continuation continuation) {
        super(2, continuation);
        this.f5365b = rr1Var;
        this.f5366c = z11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new jr1(this.f5365b, this.f5366c, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return new jr1(this.f5365b, this.f5366c, (Continuation) obj2).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f5364a;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f5364a = 1;
            if (rr1.a(this.f5365b, this.f5366c, this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        return Unit.f71706a;
    }
}
