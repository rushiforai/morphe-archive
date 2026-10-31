package com.stripe.android.paymentelement.confirmation.cpms;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.paymentelement.confirmation.cpms.InternalCustomPaymentMethodResult;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/CustomPaymentMethodContract;", "Lk/b;", "Lqt/b;", "Lcom/stripe/android/paymentelement/confirmation/cpms/InternalCustomPaymentMethodResult;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CustomPaymentMethodContract extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        qt.b input = (qt.b) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent().setClass(context, CustomPaymentMethodProxyActivity.class).putExtra("payment_element_identifier", input.f84318a).putExtra("extra_custom_method_type", input.f84319b).putExtra("extra_payment_method_billing_details", input.f84320c);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Bundle extras;
        InternalCustomPaymentMethodResult internalCustomPaymentMethodResult;
        return (intent == null || (extras = intent.getExtras()) == null || (internalCustomPaymentMethodResult = (InternalCustomPaymentMethodResult) vm.d.i(extras, "CUSTOM_PAYMENT_METHOD_RESULT", InternalCustomPaymentMethodResult.class)) == null) ? new InternalCustomPaymentMethodResult.Failed(new IllegalStateException("Failed to find custom payment method result!")) : internalCustomPaymentMethodResult;
    }
}
