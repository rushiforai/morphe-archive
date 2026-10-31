package com.stripe.android.payments.paymentlauncher;

import com.stripe.android.model.StripeIntent;
import com.stripe.android.payments.paymentlauncher.InternalPaymentResult;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import t70.j0;

/* loaded from: classes4.dex */
public final class j extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ n f44393t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ StripeIntent f44394u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public j(n nVar, StripeIntent stripeIntent, Continuation continuation) {
        super(2, continuation);
        this.f44393t = nVar;
        this.f44394u = stripeIntent;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new j(this.f44393t, this.f44394u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((j) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        StripeIntent stripeIntent = this.f44394u;
        n.g(this.f44393t, new InternalPaymentResult.Completed(stripeIntent), stripeIntent, null, 4);
        return Unit.f71706a;
    }
}
