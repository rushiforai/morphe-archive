package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class i1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public /* synthetic */ Object f4607a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f4608b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f4609t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i1(Function1 function1, Continuation continuation, int i5) {
        super(2, continuation);
        this.f4609t = i5;
        this.f4608b = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f4609t) {
            case 0:
                i1 i1Var = new i1(this.f4608b, continuation, 0);
                i1Var.f4607a = obj;
                return i1Var;
            default:
                i1 i1Var2 = new i1(this.f4608b, continuation, 1);
                i1Var2.f4607a = obj;
                return i1Var2;
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f4609t) {
            case 0:
                i1 i1Var = new i1(this.f4608b, (Continuation) obj2, 0);
                i1Var.f4607a = (g1) obj;
                return i1Var.invokeSuspend(Unit.f71706a);
            default:
                i1 i1Var2 = new i1(this.f4608b, (Continuation) obj2, 1);
                i1Var2.f4607a = (k43) obj;
                return i1Var2.invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f4609t;
        Function1 function1 = this.f4608b;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return function1.invoke((g1) this.f4607a);
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                b.q4 q4Var = (b.q4) ((k43) this.f4607a).n();
                function1.invoke(new s43(q4Var));
                return (k43) q4Var.a();
        }
    }
}
