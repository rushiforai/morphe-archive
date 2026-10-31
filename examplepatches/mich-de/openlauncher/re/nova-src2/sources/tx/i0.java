package tx;

import android.content.Context;
import com.instabridge.ai.context.AiContextManager;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class i0 extends SuspendLambda implements Function1 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f89798t;

    /* renamed from: u, reason: collision with root package name */
    public int f89799u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ AiContextManager f89800v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ Context f89801w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(Context context, AiContextManager aiContextManager, Continuation continuation) {
        super(1, continuation);
        this.f89798t = 4;
        this.f89801w = context;
        this.f89800v = aiContextManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f89798t) {
            case 0:
                return new i0(this.f89800v, this.f89801w, continuation, 0);
            case 1:
                return new i0(this.f89800v, this.f89801w, continuation, 1);
            case 2:
                return new i0(this.f89800v, this.f89801w, continuation, 2);
            case 3:
                return new i0(this.f89800v, this.f89801w, continuation, 3);
            default:
                return new i0(this.f89801w, this.f89800v, continuation);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        Continuation continuation = (Continuation) obj;
        switch (this.f89798t) {
        }
        return ((i0) create(continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        switch (this.f89798t) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                int i5 = this.f89799u;
                if (i5 == 0) {
                    ResultKt.b(obj);
                    this.f89799u = 1;
                    if (this.f89800v.syncInstalledApps(this.f89801w, this) == coroutineSingletons) {
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
                int i11 = this.f89799u;
                if (i11 == 0) {
                    ResultKt.b(obj);
                    this.f89799u = 1;
                    if (this.f89800v.syncAppUsage(this.f89801w, this) == coroutineSingletons2) {
                        return coroutineSingletons2;
                    }
                } else {
                    if (i11 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 2:
                CoroutineSingletons coroutineSingletons3 = CoroutineSingletons.f71806a;
                int i12 = this.f89799u;
                if (i12 == 0) {
                    ResultKt.b(obj);
                    this.f89799u = 1;
                    if (this.f89800v.syncCalendarEvents(this.f89801w, this) == coroutineSingletons3) {
                        return coroutineSingletons3;
                    }
                } else {
                    if (i12 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            case 3:
                CoroutineSingletons coroutineSingletons4 = CoroutineSingletons.f71806a;
                int i13 = this.f89799u;
                if (i13 == 0) {
                    ResultKt.b(obj);
                    this.f89799u = 1;
                    if (this.f89800v.syncContacts(this.f89801w, this) == coroutineSingletons4) {
                        return coroutineSingletons4;
                    }
                } else {
                    if (i13 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons5 = CoroutineSingletons.f71806a;
                int i14 = this.f89799u;
                if (i14 == 0) {
                    ResultKt.b(obj);
                    this.f89799u = 1;
                    if (this.f89800v.syncLocationFromDevice(this.f89801w, this) == coroutineSingletons5) {
                        return coroutineSingletons5;
                    }
                } else {
                    if (i14 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
                return Unit.f71706a;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ i0(AiContextManager aiContextManager, Context context, Continuation continuation, int i5) {
        super(1, continuation);
        this.f89798t = i5;
        this.f89800v = aiContextManager;
        this.f89801w = context;
    }
}
