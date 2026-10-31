package ads_mobile_sdk;

import android.view.View;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class r62 extends SuspendLambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ w62 f8934a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b.v3 f8935b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f8936c;

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f8937t;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r62(w62 w62Var, b.v3 v3Var, View view, Continuation continuation, int i5) {
        super(1, continuation);
        this.f8937t = i5;
        this.f8934a = w62Var;
        this.f8935b = v3Var;
        this.f8936c = view;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Continuation continuation) {
        switch (this.f8937t) {
            case 0:
                return new r62(this.f8934a, this.f8935b, this.f8936c, continuation, 0);
            default:
                return new r62(this.f8934a, this.f8935b, this.f8936c, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f8937t) {
        }
        return ((r62) create((Continuation) obj)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        int i5 = this.f8937t;
        View view = this.f8936c;
        b.v3 v3Var = this.f8935b;
        w62 w62Var = this.f8934a;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                w62Var.f11072e.a(v3Var, view);
                return Unit.f71706a;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                return w62Var.f11072e.a(v3Var, view);
        }
    }
}
