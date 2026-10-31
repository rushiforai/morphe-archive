package com.stripe.android.paymentsheet.model;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class o {
    public static final String a(PaymentSelection paymentSelection) {
        String str;
        Intrinsics.g(paymentSelection, "<this>");
        if (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) {
            return ((PaymentSelection.ExternalPaymentMethod) paymentSelection).f44804a;
        }
        if (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) {
            return ((PaymentSelection.CustomPaymentMethod) paymentSelection).f44799a;
        }
        if (paymentSelection.equals(PaymentSelection.GooglePay.f44810a)) {
            return "google_pay";
        }
        if (paymentSelection instanceof PaymentSelection.Link) {
            return "link";
        }
        if (paymentSelection instanceof PaymentSelection.New) {
            return ((PaymentSelection.New) paymentSelection).getF44835f().f43680a;
        }
        if (paymentSelection instanceof PaymentSelection.Saved) {
            PaymentMethod.Type type = ((PaymentSelection.Saved) paymentSelection).f44846a.f43573e;
            return (type == null || (str = type.f43655a) == null) ? "card" : str;
        }
        if (paymentSelection instanceof PaymentSelection.ShopPay) {
            return "shop_pay";
        }
        throw new NoWhenBranchMatchedException();
    }

    public static final boolean b(PaymentSelection paymentSelection) {
        Intrinsics.g(paymentSelection, "<this>");
        if (paymentSelection instanceof PaymentSelection.GooglePay) {
            return false;
        }
        if (paymentSelection instanceof PaymentSelection.Link) {
            return true;
        }
        if (paymentSelection instanceof PaymentSelection.New.Card) {
            return ((PaymentSelection.New.Card) paymentSelection).f44819f != null;
        }
        if (paymentSelection instanceof PaymentSelection.New) {
            return false;
        }
        if (paymentSelection instanceof PaymentSelection.Saved) {
            return ((PaymentSelection.Saved) paymentSelection).f44847b == k.f44856b;
        }
        if ((paymentSelection instanceof PaymentSelection.CustomPaymentMethod) || (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) || (paymentSelection instanceof PaymentSelection.ShopPay)) {
            return false;
        }
        throw new NoWhenBranchMatchedException();
    }
}
