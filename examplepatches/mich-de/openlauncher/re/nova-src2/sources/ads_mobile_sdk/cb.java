package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import t70.q0;

/* loaded from: classes.dex */
public final class cb extends SuspendLambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public int f1759a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ q0 f1760b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cb(q0 q0Var, Continuation continuation) {
        super(1, continuation);
        this.f1760b = q0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        return new cb(this.f1760b, continuation);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return new cb(this.f1760b, (Continuation) obj).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f1759a;
        if (i5 != 0) {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return obj;
        }
        ResultKt.b(obj);
        this.f1759a = 1;
        Object objY = this.f1760b.y(this);
        return objY == coroutineSingletons ? coroutineSingletons : objY;
    }
}
