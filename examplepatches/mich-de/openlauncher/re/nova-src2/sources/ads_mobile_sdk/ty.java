package ads_mobile_sdk;

import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class ty extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f10145a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ fz f10146b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f10147t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ty(fz fzVar, Continuation continuation, int i5) {
        super(2, continuation);
        this.f10147t = i5;
        this.f10146b = fzVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f10147t) {
            case 0:
                return new ty(this.f10146b, continuation, 0);
            case 1:
                return new ty(this.f10146b, continuation, 1);
            default:
                return new ty(this.f10146b, continuation, 2);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f10147t) {
            case 0:
                return new ty(this.f10146b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new ty(this.f10146b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            default:
                return new ty(this.f10146b, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f10147t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f10145a;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f10145a = 1;
                    if (fz.a(this.f10146b, this) == coroutineSingletons) {
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
                int i11 = this.f10145a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f10145a = 1;
                    obj = this.f10146b.y(this);
                    if (obj == coroutineSingletons2) {
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
                int i12 = this.f10145a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f10145a = 1;
                    obj = fz.i(this.f10146b, this);
                    if (obj == coroutineSingletons3) {
                        return coroutineSingletons3;
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
