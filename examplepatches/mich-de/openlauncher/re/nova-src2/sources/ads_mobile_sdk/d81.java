package ads_mobile_sdk;

import b.d1;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class d81 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f2207a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ w81 f2208b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f2209t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d81(w81 w81Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f2209t = i5;
        this.f2208b = w81Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f2209t) {
            case 0:
                return new d81(this.f2208b, continuation, 0);
            case 1:
                return new d81(this.f2208b, continuation, 1);
            default:
                return new d81(this.f2208b, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f2209t) {
            case 0:
                return new d81(this.f2208b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new d81(this.f2208b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            default:
                return new d81(this.f2208b, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f2209t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f2207a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    p71 p71Var = p71.f8119c;
                    d1 d1Var = new d1();
                    this.f2207a = 1;
                    w81 w81Var = this.f2208b;
                    w81Var.getClass();
                    if (w81.a(w81Var, p71Var, d1Var, this) == coroutineSingletons) {
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
                int i11 = this.f2207a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    p71 p71Var2 = p71.f8119c;
                    d1 d1Var2 = new d1();
                    this.f2207a = 1;
                    w81 w81Var2 = this.f2208b;
                    w81Var2.getClass();
                    if (w81.a(w81Var2, p71Var2, d1Var2, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f2207a;
                w81 w81Var3 = this.f2208b;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f2207a = 1;
                    obj = w81.b(w81Var3, this);
                    if (obj == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                        }
                        ResultKt.b(obj);
                        return Unit.f71706a;
                    }
                    ResultKt.b(obj);
                }
                ba1 ba1Var = (ba1) obj;
                if (ba1Var.t()) {
                    String strO = ba1Var.o();
                    this.f2207a = 2;
                    if (w81.a(w81Var3, strO, (com.google.gson.r) null, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                }
                return Unit.f71706a;
        }
    }
}
