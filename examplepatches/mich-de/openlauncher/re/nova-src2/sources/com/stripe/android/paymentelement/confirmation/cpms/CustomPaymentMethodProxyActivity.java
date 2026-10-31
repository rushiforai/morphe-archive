package com.stripe.android.paymentelement.confirmation.cpms;

import android.content.Intent;
import android.os.Bundle;
import com.stripe.android.core.exception.LocalStripeException;
import com.stripe.android.paymentelement.CustomPaymentMethodResult;
import com.stripe.android.paymentelement.confirmation.cpms.InternalCustomPaymentMethodResult;
import com.stripe.android.paymentsheet.PaymentSheet$CustomPaymentMethod;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import m.m;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/paymentelement/confirmation/cpms/CustomPaymentMethodProxyActivity;", "Lm/m;", "<init>", "()V", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class CustomPaymentMethodProxyActivity extends m {
    public boolean o;

    @Override // androidx.fragment.app.m0, g.o, n4.i, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.o = bundle.getBoolean("has_confirm_started");
        }
        Bundle extras = getIntent().getExtras();
        PaymentSheet$CustomPaymentMethod paymentSheet$CustomPaymentMethod = extras != null ? (PaymentSheet$CustomPaymentMethod) vm.d.i(extras, "extra_custom_method_type", PaymentSheet$CustomPaymentMethod.class) : null;
        String stringExtra = getIntent().getStringExtra("payment_element_identifier");
        if (extras != null) {
        }
        if (paymentSheet$CustomPaymentMethod == null || this.o || stringExtra == null) {
            return;
        }
        this.o = true;
        lt.a.a(stringExtra);
    }

    @Override // g.o, android.app.Activity
    public final void onNewIntent(Intent intent) {
        Intrinsics.g(intent, "intent");
        super.onNewIntent(intent);
        setIntent(intent);
    }

    @Override // androidx.fragment.app.m0, android.app.Activity
    public final void onResume() {
        Object failed;
        super.onResume();
        Bundle extras = getIntent().getExtras();
        if (extras == null) {
            finish();
            return;
        }
        PaymentSheet$CustomPaymentMethod paymentSheet$CustomPaymentMethod = (PaymentSheet$CustomPaymentMethod) vm.d.i(extras, "extra_custom_method_type", PaymentSheet$CustomPaymentMethod.class);
        CustomPaymentMethodResult customPaymentMethodResult = (CustomPaymentMethodResult) vm.d.i(extras, "custom_payment_method_result", CustomPaymentMethodResult.class);
        if (paymentSheet$CustomPaymentMethod == null && customPaymentMethodResult == null) {
            finish();
            return;
        }
        if (customPaymentMethodResult != null) {
            if (customPaymentMethodResult instanceof CustomPaymentMethodResult.Completed) {
                failed = InternalCustomPaymentMethodResult.Completed.f44154a;
            } else if (customPaymentMethodResult instanceof CustomPaymentMethodResult.Canceled) {
                failed = InternalCustomPaymentMethodResult.Canceled.f44153a;
            } else {
                if (!(customPaymentMethodResult instanceof CustomPaymentMethodResult.Failed)) {
                    throw new NoWhenBranchMatchedException();
                }
                failed = new InternalCustomPaymentMethodResult.Failed(new LocalStripeException(((CustomPaymentMethodResult.Failed) customPaymentMethodResult).f44106a, "customPaymentMethodFailure"));
            }
            setResult(-1, new Intent().putExtras(w.b.a(new Pair("CUSTOM_PAYMENT_METHOD_RESULT", failed))));
            finish();
        }
    }

    @Override // g.o, n4.i, android.app.Activity
    public final void onSaveInstanceState(Bundle outState) {
        Intrinsics.g(outState, "outState");
        outState.putBoolean("has_confirm_started", this.o);
        super.onSaveInstanceState(outState);
    }
}
