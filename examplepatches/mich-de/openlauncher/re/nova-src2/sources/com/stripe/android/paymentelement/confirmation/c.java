package com.stripe.android.paymentelement.confirmation;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.PaymentMethodCreateParams;
import com.stripe.android.model.PaymentMethodExtraParams;
import com.stripe.android.model.PaymentMethodOptionsParams;
import com.stripe.android.paymentelement.confirmation.PaymentMethodConfirmationOption;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        boolean z11;
        boolean z12;
        Intrinsics.g(parcel, "parcel");
        PaymentMethodCreateParams paymentMethodCreateParams = (PaymentMethodCreateParams) parcel.readParcelable(PaymentMethodConfirmationOption.New.class.getClassLoader());
        PaymentMethodOptionsParams paymentMethodOptionsParams = (PaymentMethodOptionsParams) parcel.readParcelable(PaymentMethodConfirmationOption.New.class.getClassLoader());
        PaymentMethodExtraParams paymentMethodExtraParams = (PaymentMethodExtraParams) parcel.readParcelable(PaymentMethodConfirmationOption.New.class.getClassLoader());
        boolean z13 = false;
        boolean z14 = true;
        if (parcel.readInt() != 0) {
            z11 = false;
            z13 = true;
        } else {
            z11 = false;
        }
        if (parcel.readInt() != 0) {
            z12 = true;
        } else {
            z12 = true;
            z14 = z11;
        }
        if (parcel.readInt() == 0) {
            z12 = z11;
        }
        return new PaymentMethodConfirmationOption.New(paymentMethodCreateParams, paymentMethodOptionsParams, paymentMethodExtraParams, z13, z14, z12);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentMethodConfirmationOption.New[i5];
    }
}
