package ads_mobile_sdk;

import android.view.WindowManager;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class xl1 extends SuspendLambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WindowManager f11764a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ tx0 f11765b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ WindowManager.LayoutParams f11766c;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f11767t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ xl1(WindowManager windowManager, tx0 tx0Var, WindowManager.LayoutParams layoutParams, Continuation continuation, int i5) {
        super(2, continuation);
        this.f11767t = i5;
        this.f11764a = windowManager;
        this.f11765b = tx0Var;
        this.f11766c = layoutParams;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f11767t) {
            case 0:
                return new xl1(this.f11764a, this.f11765b, this.f11766c, continuation, 0);
            default:
                return new xl1(this.f11764a, this.f11765b, this.f11766c, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f11767t) {
        }
        return ((xl1) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f11767t;
        WindowManager.LayoutParams layoutParams = this.f11766c;
        tx0 tx0Var = this.f11765b;
        WindowManager windowManager = this.f11764a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                windowManager.updateViewLayout(tx0Var, layoutParams);
                break;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                windowManager.updateViewLayout(tx0Var, layoutParams);
                break;
        }
        return Unit.f71706a;
    }
}
