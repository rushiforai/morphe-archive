package ads_mobile_sdk;

import b.b0;
import b.r5;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class y9 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f11966a;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f11967c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f11968d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ qo3 f11969e;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f11970t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y9(String str, Object obj, Continuation continuation, qo3 qo3Var, int i5) {
        super(2, continuation);
        this.f11970t = i5;
        this.f11967c = str;
        this.f11968d = obj;
        this.f11969e = qo3Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f11970t) {
            case 0:
                return new y9(this.f11967c, this.f11968d, continuation, this.f11969e, 0);
            default:
                return new y9(this.f11967c, this.f11968d, continuation, this.f11969e, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f11970t) {
        }
        return ((y9) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f11970t;
        qo3 qo3Var = this.f11969e;
        Object obj2 = this.f11968d;
        String str = this.f11967c;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f11966a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar = mu0.f7335a;
                    a80.m.r("Invoking function [onViewabilityEvent] on listener [", str, "]", null);
                    this.f11966a = 1;
                    if (((b0) obj2).a(qo3Var, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f11966a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    cz.b bVar2 = mu0.f7335a;
                    a80.m.r("Invoking function [onViewabilityEvent] on listener [", str, "]", null);
                    this.f11966a = 1;
                    if (((r5) obj2).b(qo3Var, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
