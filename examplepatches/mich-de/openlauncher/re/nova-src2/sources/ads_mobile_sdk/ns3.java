package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class ns3 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f7671a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tx0 f7672b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ com.google.gson.r f7673c;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f7674t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ns3(tx0 tx0Var, com.google.gson.r rVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f7674t = i5;
        this.f7672b = tx0Var;
        this.f7673c = rVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f7674t) {
            case 0:
                return new ns3(this.f7672b, this.f7673c, continuation, 0);
            default:
                return new ns3(this.f7672b, this.f7673c, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f7674t) {
            case 0:
                com.google.gson.r rVar = this.f7673c;
                return new ns3(this.f7672b, rVar, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                com.google.gson.r rVar2 = this.f7673c;
                return new ns3(this.f7672b, rVar2, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f7674t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f7671a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f7671a = 1;
                    if (this.f7672b.a(this.f7673c, "onAdVisibilityChanged", this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i11 = this.f7671a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f7671a = 1;
                    if (this.f7672b.b(this.f7673c, "google.afma.nativeAds.renderVideo", this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
