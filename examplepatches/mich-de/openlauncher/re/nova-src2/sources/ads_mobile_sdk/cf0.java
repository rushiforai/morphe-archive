package ads_mobile_sdk;

import android.app.AlertDialog;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class cf0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AlertDialog.Builder f1849a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f1850t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cf0(AlertDialog.Builder builder, Continuation continuation, int i5) {
        super(2, continuation);
        this.f1850t = i5;
        this.f1849a = builder;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f1850t) {
            case 0:
                return new cf0(this.f1849a, continuation, 0);
            default:
                return new cf0(this.f1849a, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f1850t) {
            case 0:
                return new cf0(this.f1849a, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new cf0(this.f1849a, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f1850t;
        AlertDialog.Builder builder = this.f1849a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                builder.create().show();
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                builder.create().show();
                break;
        }
        return Unit.f71706a;
    }
}
