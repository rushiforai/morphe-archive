package com.stripe.android.paymentsheet.paymentdatacollection.polling;

import android.content.Intent;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.paymentsheet.paymentdatacollection.polling.PollingContract;
import dv.m;
import dv.n;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import lw.l;
import p1.e1;
import t70.j0;

/* loaded from: classes4.dex */
public final class a extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public PaymentFlowResult$Unvalidated f44945t;

    /* renamed from: u, reason: collision with root package name */
    public int f44946u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ PollingActivity f44947v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ l f44948w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ e1 f44949x;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(PollingActivity pollingActivity, l lVar, e1 e1Var, Continuation continuation) {
        super(2, continuation);
        this.f44947v = pollingActivity;
        this.f44948w = lVar;
        this.f44949x = e1Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new a(this.f44947v, this.f44948w, this.f44949x, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((a) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i5 = this.f44946u;
        PollingActivity pollingActivity = this.f44947v;
        if (i5 == 0) {
            ResultKt.b(obj);
            m mVar = ((n) this.f44949x.getValue()).f49623c;
            int i11 = PollingActivity.f44935r;
            PollingContract.Args args = pollingActivity.Z();
            Intrinsics.g(mVar, "<this>");
            Intrinsics.g(args, "args");
            int iOrdinal = mVar.ordinal();
            PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated2 = null;
            if (iOrdinal != 0) {
                if (iOrdinal == 1) {
                    paymentFlowResult$Unvalidated2 = new PaymentFlowResult$Unvalidated(args.f44938a, 1, (StripeException) null, false, (String) null, args.f44943f, 60);
                } else if (iOrdinal != 2) {
                    if (iOrdinal != 3) {
                        throw new NoWhenBranchMatchedException();
                    }
                    paymentFlowResult$Unvalidated2 = new PaymentFlowResult$Unvalidated(args.f44938a, 3, (StripeException) null, false, (String) null, args.f44943f, 52);
                }
            }
            if (paymentFlowResult$Unvalidated2 != null) {
                this.f44945t = paymentFlowResult$Unvalidated2;
                this.f44946u = 1;
                if (this.f44948w.b(this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                paymentFlowResult$Unvalidated = paymentFlowResult$Unvalidated2;
            }
            return Unit.f71706a;
        }
        if (i5 != 1) {
            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        paymentFlowResult$Unvalidated = this.f44945t;
        ResultKt.b(obj);
        int i12 = PollingActivity.f44935r;
        pollingActivity.setResult(-1, new Intent().putExtras(paymentFlowResult$Unvalidated.b()));
        pollingActivity.finish();
        return Unit.f71706a;
    }
}
