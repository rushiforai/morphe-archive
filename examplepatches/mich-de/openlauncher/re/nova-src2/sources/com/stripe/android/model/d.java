package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConfirmPaymentIntentParams;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class d implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Boolean boolValueOf;
        boolean z11;
        Boolean boolValueOf2;
        PaymentMethodCreateParams paymentMethodCreateParams;
        RadarOptions radarOptionsCreateFromParcel;
        Intrinsics.g(parcel, "parcel");
        PaymentMethodCreateParams paymentMethodCreateParamsCreateFromParcel = parcel.readInt() == 0 ? null : PaymentMethodCreateParams.CREATOR.createFromParcel(parcel);
        String string = parcel.readString();
        SourceParams sourceParamsCreateFromParcel = parcel.readInt() == 0 ? null : SourceParams.CREATOR.createFromParcel(parcel);
        String string2 = parcel.readString();
        String string3 = parcel.readString();
        String string4 = parcel.readString();
        boolean z12 = false;
        if (parcel.readInt() == 0) {
            boolValueOf = null;
        } else {
            boolValueOf = Boolean.valueOf(parcel.readInt() != 0);
        }
        if (parcel.readInt() != 0) {
            z11 = false;
            z12 = true;
        } else {
            z11 = false;
        }
        PaymentMethodOptionsParams paymentMethodOptionsParams = (PaymentMethodOptionsParams) parcel.readParcelable(ConfirmPaymentIntentParams.class.getClassLoader());
        boolean z13 = z11;
        String string5 = parcel.readString();
        MandateDataParams mandateDataParamsCreateFromParcel = parcel.readInt() == 0 ? null : MandateDataParams.CREATOR.createFromParcel(parcel);
        ft.d dVarValueOf = parcel.readInt() == 0 ? null : ft.d.valueOf(parcel.readString());
        ConfirmPaymentIntentParams.Shipping shippingCreateFromParcel = parcel.readInt() == 0 ? null : ConfirmPaymentIntentParams.Shipping.CREATOR.createFromParcel(parcel);
        boolean z14 = z13;
        ft.d dVar = dVarValueOf;
        String string6 = parcel.readString();
        if (parcel.readInt() == 0) {
            boolValueOf2 = null;
        } else {
            if (parcel.readInt() != 0) {
                z14 = true;
            }
            boolValueOf2 = Boolean.valueOf(z14);
        }
        String string7 = parcel.readString();
        if (parcel.readInt() == 0) {
            paymentMethodCreateParams = paymentMethodCreateParamsCreateFromParcel;
            radarOptionsCreateFromParcel = null;
        } else {
            paymentMethodCreateParams = paymentMethodCreateParamsCreateFromParcel;
            radarOptionsCreateFromParcel = RadarOptions.CREATOR.createFromParcel(parcel);
        }
        return new ConfirmPaymentIntentParams(paymentMethodCreateParams, string, sourceParamsCreateFromParcel, string2, string3, string4, boolValueOf, z12, paymentMethodOptionsParams, string5, mandateDataParamsCreateFromParcel, dVar, shippingCreateFromParcel, string6, boolValueOf2, string7, radarOptionsCreateFromParcel, parcel.readInt() == 0 ? null : ClientAttributionMetadata.CREATOR.createFromParcel(parcel), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new ConfirmPaymentIntentParams[i5];
    }
}
