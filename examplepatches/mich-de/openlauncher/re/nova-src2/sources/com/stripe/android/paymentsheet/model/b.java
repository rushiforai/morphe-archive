package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.ExternalPaymentMethod(parcel.readString(), (PaymentMethod.BillingDetails) parcel.readParcelable(PaymentSelection.ExternalPaymentMethod.class.getClassLoader()), (ResolvableString) parcel.readParcelable(PaymentSelection.ExternalPaymentMethod.class.getClassLoader()), parcel.readInt(), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.ExternalPaymentMethod[i5];
    }
}
