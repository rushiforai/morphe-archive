package com.stripe.android;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.stripe.android.view.PaymentRelayActivity;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/PaymentRelayContract;", "Lk/b;", "Lcom/stripe/android/PaymentRelayStarter$Args;", "Lcom/stripe/android/payments/PaymentFlowResult$Unvalidated;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentRelayContract extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        PaymentRelayStarter$Args input = (PaymentRelayStarter$Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtras = new Intent(context, (Class<?>) PaymentRelayActivity.class).putExtras(input.d().b());
        Intrinsics.f(intentPutExtras, "putExtras(...)");
        return intentPutExtras;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        return (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) ? new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) : paymentFlowResult$Unvalidated;
    }
}
