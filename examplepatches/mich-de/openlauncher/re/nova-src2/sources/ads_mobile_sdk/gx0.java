package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class gx0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ tx0 f4114a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f4115b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f4116t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gx0(tx0 tx0Var, String str, Continuation continuation, int i5) {
        super(2, continuation);
        this.f4116t = i5;
        this.f4114a = tx0Var;
        this.f4115b = str;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f4116t) {
            case 0:
                return new gx0(this.f4114a, this.f4115b, continuation, 0);
            case 1:
                return new gx0(this.f4114a, this.f4115b, continuation, 1);
            default:
                return new gx0(this.f4114a, this.f4115b, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f4116t) {
            case 0:
                String str = this.f4115b;
                return new gx0(this.f4114a, str, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                String str2 = this.f4115b;
                return new gx0(this.f4114a, str2, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            default:
                String str3 = this.f4115b;
                return new gx0(this.f4114a, str3, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f4116t;
        String str = this.f4115b;
        tx0 tx0Var = this.f4114a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.evaluateJavascript(str, null);
                break;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.loadUrl(str);
                break;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                tx0Var.f10125e.a(str, (Throwable) new Exception(str));
                break;
        }
        return Unit.f71706a;
    }
}
