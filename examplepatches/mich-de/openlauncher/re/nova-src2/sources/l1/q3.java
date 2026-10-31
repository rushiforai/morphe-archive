package l1;

import android.window.BackEvent;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class q3 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f73826t;

    /* renamed from: u, reason: collision with root package name */
    public int f73827u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ c0.e f73828v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ BackEvent f73829w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q3(c0.e eVar, BackEvent backEvent, Continuation continuation, int i5) {
        super(2, continuation);
        this.f73826t = i5;
        this.f73828v = eVar;
        this.f73829w = backEvent;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f73826t) {
            case 0:
                return new q3(this.f73828v, this.f73829w, continuation, 0);
            default:
                return new q3(this.f73828v, this.f73829w, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f73826t) {
        }
        return ((q3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f73826t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f73827u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    Float f11 = new Float(m1.h0.f75692a.b(this.f73829w.getProgress()));
                    this.f73827u = 1;
                    if (this.f73828v.g(f11, this) == coroutineSingletons) {
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
                int i11 = this.f73827u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    Float f12 = new Float(m1.h0.f75692a.b(this.f73829w.getProgress()));
                    this.f73827u = 1;
                    if (this.f73828v.g(f12, this) == coroutineSingletons2) {
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
