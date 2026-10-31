package ads_mobile_sdk;

import android.app.Activity;
import android.net.Uri;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class df0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public int f2490a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ rf0 f2491b;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f2492t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ df0(rf0 rf0Var, Continuation continuation, int i5) {
        super(2, continuation);
        this.f2492t = i5;
        this.f2491b = rf0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f2492t) {
            case 0:
                return new df0(this.f2491b, continuation, 0);
            case 1:
                return new df0(this.f2491b, continuation, 1);
            case 2:
                return new df0(this.f2491b, continuation, 2);
            case 3:
                return new df0(this.f2491b, continuation, 3);
            default:
                return new df0(this.f2491b, continuation, 4);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f2492t) {
            case 0:
                return new df0(this.f2491b, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            case 1:
                return new df0(this.f2491b, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
            case 2:
                return new df0(this.f2491b, (Continuation) obj2, 2).invokeSuspend(Unit.f71706a);
            case 3:
                return new df0(this.f2491b, (Continuation) obj2, 3).invokeSuspend(Unit.f71706a);
            default:
                return new df0(this.f2491b, (Continuation) obj2, 4).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f2492t;
        rf0 rf0Var = this.f2491b;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i11 = this.f2490a;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f2490a = 1;
                    Uri uri = rf0.f9150q;
                    if (rf0Var.a((Activity) null, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 1:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                int i12 = this.f2490a;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f2490a = 1;
                    Uri uri2 = rf0.f9150q;
                    if (rf0Var.a((Activity) null, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i13 = this.f2490a;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f2490a = 1;
                    if (rf0.b(rf0Var, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i14 = this.f2490a;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    this.f2490a = 1;
                    if (rf0.a(rf0Var, this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i15 = this.f2490a;
                if (i15 == 0) {
                    ResultKt.b(obj);
                    this.f2490a = 1;
                    Uri uri3 = rf0.f9150q;
                    if (rf0Var.a((Activity) null, this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i15 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }
}
