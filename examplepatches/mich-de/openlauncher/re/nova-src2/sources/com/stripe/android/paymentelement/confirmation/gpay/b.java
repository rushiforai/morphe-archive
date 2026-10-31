package com.stripe.android.paymentelement.confirmation.gpay;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.CardBrandFilter;
import com.stripe.android.CardFundingFilter;
import com.stripe.android.paymentelement.confirmation.gpay.GooglePayConfirmationOption;
import com.stripe.android.paymentsheet.PaymentSheet$BillingDetailsCollectionConfiguration;
import kotlin.jvm.internal.Intrinsics;
import ou.q0;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new GooglePayConfirmationOption.Config(parcel.readInt() == 0 ? null : q0.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString(), parcel.readInt() != 0 ? Long.valueOf(parcel.readLong()) : null, parcel.readString(), PaymentSheet$BillingDetailsCollectionConfiguration.CREATOR.createFromParcel(parcel), (CardBrandFilter) parcel.readParcelable(GooglePayConfirmationOption.Config.class.getClassLoader()), (CardFundingFilter) parcel.readParcelable(GooglePayConfirmationOption.Config.class.getClassLoader()), parcel.createStringArrayList());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new GooglePayConfirmationOption.Config[i5];
    }
}
