package ads_mobile_sdk;

import b.r1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class xo0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f11788a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ jp0 f11789b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f11790t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xo0(jp0 jp0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f11790t = i5;
        this.f11789b = jp0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f11790t) {
            case 0:
                return new xo0(this.f11789b, continuation, 0);
            default:
                return new xo0(this.f11789b, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f11790t) {
            case 0:
                return new xo0(this.f11789b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new xo0(this.f11789b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f11790t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f11788a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    jp0 jp0Var = this.f11789b;
                    r1 r1Var = (r1) jp0Var.f12654c.get();
                    if (r1Var != null) {
                        this.f11788a = 1;
                        if (jp0.b(jp0Var, r1Var, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
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
                int i11 = this.f11788a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    jp0 jp0Var2 = this.f11789b;
                    r1 r1Var2 = (r1) jp0Var2.f12654c.get();
                    if (r1Var2 != null) {
                        this.f11788a = 1;
                        if (jp0.a(jp0Var2, r1Var2, this) == coroutineSingletons2) {
                            return coroutineSingletons2;
                        }
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
