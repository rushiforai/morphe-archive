package l1;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class p3 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f73776t;

    /* renamed from: u, reason: collision with root package name */
    public int f73777u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c0.e f73778v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ p3(c0.e eVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f73776t = i5;
        this.f73778v = eVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f73776t) {
            case 0:
                return new p3(this.f73778v, continuation, 0);
            default:
                return new p3(this.f73778v, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f73776t) {
        }
        return ((p3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f73776t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f73777u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    Float f11 = new Float(0.0f);
                    this.f73777u = 1;
                    if (c0.e.d(this.f73778v, f11, null, null, this, 14) == coroutineSingletons) {
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
                int i11 = this.f73777u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Float f12 = new Float(0.0f);
                    this.f73777u = 1;
                    if (c0.e.d(this.f73778v, f12, null, null, this, 14) == coroutineSingletons2) {
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
