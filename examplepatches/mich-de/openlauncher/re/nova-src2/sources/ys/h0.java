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
public final class h0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public int f97480t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Function1 f97481u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Function1 f97482v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ ConsumerPaymentDetails.PaymentDetails f97483w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(Function1 function1, Function1 function12, ConsumerPaymentDetails.PaymentDetails paymentDetails, Continuation continuation) {
        super(2, continuation);
        this.f97481u = function1;
        this.f97482v = function12;
        this.f97483w = paymentDetails;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new h0(this.f97481u, this.f97482v, this.f97483w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((h0) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f97480t;
        if (i5 == 0) {
            ResultKt.b(obj);
            this.f97480t = 1;
            if (this.f97481u.invoke(this) == coroutineSingletons) {
                return coroutineSingletons;
            }
        } else {
            if (i5 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
        }
        this.f97482v.invoke(this.f97483w);
        return Unit.f71706a;
    }
}
