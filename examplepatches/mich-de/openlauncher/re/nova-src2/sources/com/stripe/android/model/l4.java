package com.stripe.android.model;

import com.stripe.android.model.PaymentMethodOptionsParams;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class l4 {
    public static final ft.d a(PaymentMethodOptionsParams paymentMethodOptionsParams) {
        Intrinsics.g(paymentMethodOptionsParams, "<this>");
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.Blik) {
            return ((PaymentMethodOptionsParams.Blik) paymentMethodOptionsParams).f43735c;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.Card) {
            return ((PaymentMethodOptionsParams.Card) paymentMethodOptionsParams).f43738d;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.SepaDebit) {
            return ((PaymentMethodOptionsParams.SepaDebit) paymentMethodOptionsParams).f43743b;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.Konbini) {
            return ((PaymentMethodOptionsParams.Konbini) paymentMethodOptionsParams).f43741c;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.Link) {
            return ((PaymentMethodOptionsParams.Link) paymentMethodOptionsParams).f43742b;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.USBankAccount) {
            return ((PaymentMethodOptionsParams.USBankAccount) paymentMethodOptionsParams).f43746b;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.WeChatPay) {
            return ((PaymentMethodOptionsParams.WeChatPay) paymentMethodOptionsParams).f43748c;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.WeChatPayH5) {
            return ((PaymentMethodOptionsParams.WeChatPayH5) paymentMethodOptionsParams).f43749b;
        }
        if (paymentMethodOptionsParams instanceof PaymentMethodOptionsParams.SetupFutureUsage) {
            return ((PaymentMethodOptionsParams.SetupFutureUsage) paymentMethodOptionsParams).f43745c;
        }
        throw new NoWhenBranchMatchedException();
    }
}
