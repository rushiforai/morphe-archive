package com.stripe.android.view;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.payments.PaymentFlowResult$Unvalidated;
import com.vungle.ads.internal.protos.Sdk;
import kotlin.Metadata;
import m.m;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/view/PaymentRelayActivity;", "Lm/m;", "<init>", "()V", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class PaymentRelayActivity extends m {
    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        PaymentFlowResult$Unvalidated paymentFlowResult$Unvalidated;
        super.onCreate(bundle);
        Intent intent = getIntent();
        if (intent == null || (paymentFlowResult$Unvalidated = (PaymentFlowResult$Unvalidated) intent.getParcelableExtra("extra_args")) == null) {
            paymentFlowResult$Unvalidated = new PaymentFlowResult$Unvalidated((String) null, 0, (StripeException) null, false, (String) null, (String) null, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
        }
        setResult(-1, new Intent().putExtras(paymentFlowResult$Unvalidated.b()));
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        super.onResume();
        finish();
    }
}
