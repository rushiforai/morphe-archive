package com.stripe.android.paymentsheet.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethod;
import com.stripe.android.paymentsheet.model.PaymentSelection;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Parcelable.Creator {
    @Override // android.os.Parcelable.Creator
    public final Object createFromParcel(Parcel parcel) {
        Intrinsics.g(parcel, "parcel");
        return new PaymentSelection.CustomPaymentMethod(parcel.readString(), (PaymentMethod.BillingDetails) parcel.readParcelable(PaymentSelection.CustomPaymentMethod.class.getClassLoader()), (ResolvableString) parcel.readParcelable(PaymentSelection.CustomPaymentMethod.class.getClassLoader()), parcel.readString(), parcel.readString());
    }

    @Override // android.os.Parcelable.Creator
    public final Object[] newArray(int i5) {
        return new PaymentSelection.CustomPaymentMethod[i5];
    }
}
