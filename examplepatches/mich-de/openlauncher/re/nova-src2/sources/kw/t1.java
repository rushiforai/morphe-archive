package kw;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class t1 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f72631t;

    /* renamed from: u, reason: collision with root package name */
    public int f72632u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ q0.b f72633v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ t1(q0.b bVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f72631t = i5;
        this.f72633v = bVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f72631t) {
            case 0:
                return new t1(this.f72633v, continuation, 0);
            default:
                return new t1(this.f72633v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f72631t) {
        }
        return ((t1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f72631t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f72632u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f72632u = 1;
                    if (this.f72633v.a(null, this) == coroutineSingletons) {
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
                int i11 = this.f72632u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f72632u = 1;
                    if (this.f72633v.a(null, this) == coroutineSingletons2) {
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
