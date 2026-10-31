package ys;

import com.stripe.android.model.ConsumerPaymentDetails;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class i0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f97485t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Function1 f97486u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function1 f97487v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ ConsumerPaymentDetails.PaymentDetails f97488w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i0(Function1 function1, Function1 function12, ConsumerPaymentDetails.PaymentDetails paymentDetails, Continuation continuation) {
        super(2, continuation);
        this.f97486u = function1;
        this.f97487v = function12;
        this.f97488w = paymentDetails;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new i0(this.f97486u, this.f97487v, this.f97488w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((i0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f97485t;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f97485t = 1;
            if (this.f97486u.invoke(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f97487v.invoke(this.f97488w);
        return Unit.f71706a;
    }
}
