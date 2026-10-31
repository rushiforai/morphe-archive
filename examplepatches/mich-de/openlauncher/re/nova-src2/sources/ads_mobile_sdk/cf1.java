package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class cf1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f1851a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d61 f1852b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1853t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cf1(d61 d61Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1853t = i5;
        this.f1852b = d61Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1853t) {
            case 0:
                return new cf1(this.f1852b, continuation, 0);
            default:
                return new cf1(this.f1852b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1853t) {
            case 0:
                return new cf1(this.f1852b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new cf1(this.f1852b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f1853t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f1851a;
                if (i5 != 0) {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f1851a = 1;
                Object objF = ((c61) this.f1852b.f2190a.get()).f(this);
                return objF == coroutineSingletons ? coroutineSingletons : objF;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f1851a;
                if (i11 != 0) {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                    return obj;
                }
                ResultKt.b(obj);
                this.f1851a = 1;
                Object objF2 = ((c61) this.f1852b.f2190a.get()).f(this);
                return objF2 == coroutineSingletons2 ? coroutineSingletons2 : objF2;
        }
    }
}
