package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class h implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Boolean boolValueOf;
        Intrinsics.g(parcel, "parcel");
        String string = parcel.readString();
        PaymentMethodCreateParams paymentMethodCreateParamsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.CREATOR.createFromParcel(parcel);
        String string2 = parcel.readString();
        ft.d dVarValueOf = parcel.readInt() == 0 ? null : ft.d.valueOf(parcel.readString());
        ConfirmPaymentIntentParams.Shipping shippingCreateFromParcel = parcel.readInt() == 0 ? null : ConfirmPaymentIntentParams.Shipping.CREATOR.createFromParcel(parcel);
        MandateDataParams mandateDataParamsCreateFromParcel = parcel.readInt() == 0 ? null : MandateDataParams.CREATOR.createFromParcel(parcel);
        if (parcel.readInt() == 0) {
            boolValueOf = null;
        } else {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        return new ConfirmationTokenParams(string, paymentMethodCreateParamsCreateFromParcel, string2, dVarValueOf, shippingCreateFromParcel, mandateDataParamsCreateFromParcel, boolValueOf, parcel.readString(), parcel.readInt() == 0 ? null : ConfirmationTokenClientContextParams.CREATOR.createFromParcel(parcel), parcel.readInt() != 0 ? ClientAttributionMetadata.CREATOR.createFromParcel(parcel) : null);
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConfirmationTokenParams[i5];
    }
}
