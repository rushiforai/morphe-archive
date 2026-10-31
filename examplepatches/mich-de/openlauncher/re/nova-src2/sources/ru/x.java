package ru;

import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import ft.d0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class x {
    public static final String a(PaymentSelection paymentSelection) {
        String str;
        Intrinsics.g(paymentSelection, "<this>");
        if (paymentSelection instanceof PaymentSelection.GooglePay) {
            return "google_pay";
        }
        if (paymentSelection instanceof PaymentSelection.Link) {
            return "link";
        }
        if (paymentSelection instanceof PaymentSelection.ShopPay) {
            return "shop_pay";
        }
        if (paymentSelection instanceof PaymentSelection.New) {
            return ((PaymentSelection.New) paymentSelection).getF44835f().f43680a;
        }
        if (paymentSelection instanceof PaymentSelection.Saved) {
            PaymentMethod.Type type = ((PaymentSelection.Saved) paymentSelection).f44846a.f43573e;
            return (type == null || (str = type.f43655a) == null) ? "saved" : str;
        }
        if (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) {
            return ((PaymentSelection.ExternalPaymentMethod) paymentSelection).f44804a;
        }
        if (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) {
            return ((PaymentSelection.CustomPaymentMethod) paymentSelection).f44799a;
        }
        throw new NoWhenBranchMatchedException();
    }

    public static final String b(PaymentSelection paymentSelection) {
        if (paymentSelection instanceof PaymentSelection.Link) {
            return "wallet";
        }
        if (paymentSelection instanceof PaymentSelection.New.USBankAccount) {
            PaymentSelection.New.USBankAccount.InstantDebitsInfo instantDebitsInfo = ((PaymentSelection.New.USBankAccount) paymentSelection).f44834e;
            if (instantDebitsInfo != null) {
                return instantDebitsInfo.f44845b == d0.f55931b ? "link_card_brand" : "instant_debits";
            }
            return null;
        }
        if ((paymentSelection instanceof PaymentSelection.GooglePay) || (paymentSelection instanceof PaymentSelection.New) || (paymentSelection instanceof PaymentSelection.Saved) || (paymentSelection instanceof PaymentSelection.CustomPaymentMethod) || (paymentSelection instanceof PaymentSelection.ExternalPaymentMethod) || (paymentSelection instanceof PaymentSelection.ShopPay)) {
            return null;
        }
        throw new NoWhenBranchMatchedException();
    }
}
