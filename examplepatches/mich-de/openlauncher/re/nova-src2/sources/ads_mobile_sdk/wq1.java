package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class wq1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f11363a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ zq1 f11364b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ tx0 f11365c;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f11366t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wq1(zq1 zq1Var, tx0 tx0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f11366t = i5;
        this.f11364b = zq1Var;
        this.f11365c = tx0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f11366t) {
            case 0:
                return new wq1(this.f11364b, this.f11365c, continuation, 0);
            default:
                return new wq1(this.f11364b, this.f11365c, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f11366t) {
            case 0:
                tx0 tx0Var = this.f11365c;
                return new wq1(this.f11364b, tx0Var, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                tx0 tx0Var2 = this.f11365c;
                return new wq1(this.f11364b, tx0Var2, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws Throwable {
        switch (this.f11366t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f11363a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    bq1 bq1Var = this.f11364b.f12627c;
                    this.f11363a = 1;
                    if (bq1Var.a(this.f11365c) == coroutineSingletons) {
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
                int i11 = this.f11363a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    zq1 zq1Var = this.f11364b;
                    bq1 bq1Var2 = zq1Var.f12627c;
                    String str = zq1Var.f12628d;
                    this.f11363a = 1;
                    bq1Var2.getClass();
                    com.google.gson.r rVar = new com.google.gson.r();
                    rVar.s("js", str);
                    Object objA = this.f11365c.a(rVar, "onReadyEventReceived", this);
                    if (objA != coroutineSingletons2) {
                        objA = Unit.f71706a;
                    }
                    if (objA == coroutineSingletons2) {
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
