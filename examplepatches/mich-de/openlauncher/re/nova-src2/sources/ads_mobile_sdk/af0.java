package ads_mobile_sdk;

import android.app.AlertDialog;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes2.dex */
public final class af0 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AlertDialog.Builder f948a;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f949t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ af0(AlertDialog.Builder builder, Continuation continuation, int i5) {
        super(2, continuation);
        this.f949t = i5;
        this.f948a = builder;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f949t) {
            case 0:
                return new af0(this.f948a, continuation, 0);
            default:
                return new af0(this.f948a, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f949t) {
            case 0:
                return new af0(this.f948a, (Continuation) obj2, 0).invokeSuspend(Unit.f71706a);
            default:
                return new af0(this.f948a, (Continuation) obj2, 1).invokeSuspend(Unit.f71706a);
        }
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f949t;
        AlertDialog.Builder builder = this.f948a;
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
